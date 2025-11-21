const Fhir = require('fhir').Fhir;
const ParseConformance = require('fhir').ParseConformance;
const FhirVersions = require('fhir').Versions;
const fs = require('fs');
const path = require('path');
const xmlFormat = require('xml-formatter');
const xml2js = require('xml2js');
const parse = require('csv-parse/sync').parse;

(async function () {
  // Need to load R5 for this to work....for now
  // Get the data
  const newValueSets = JSON.parse(fs.readFileSync(path.resolve(__dirname, 'r5.valuesets.json')).toString());
  const newTypes = JSON.parse(fs.readFileSync(path.resolve(__dirname, 'r5.profiles-types.json')).toString());
  const newResources = JSON.parse(fs.readFileSync(path.resolve(__dirname, 'r5.profiles-resources.json')).toString());
  // Create a parser and parse it using the parser
  var parser = new ParseConformance(false, FhirVersions.R5);           // don't load pre-parsed data
  parser.parseBundle(newValueSets);
  parser.parseBundle(newTypes);
  parser.parseBundle(newResources);

  /**
   * Convert Sushi's JSON output to XML and move into the input directory
   */

  const fhir = new Fhir(parser);

  const fshDirectory = 'fsh-tank/fsh-generated/resources';
  const xmlDirectory = 'input/resources';

  const sushiConfig = fs.readFileSync('fsh-tank/sushi-config.yaml', 'utf-8');
  const match = sushiConfig.match(/canonical:\s*(\S+)(\r?\n|$)/);
  const canonical = match ? match[1] : null;
  if (!canonical) {
    throw new Error('Unable to load canonical from sushi-config.yaml');
  }

  const ig = fs.readFileSync('input/hl7.cda.us.ccda.xml');
  const xmlParser = new xml2js.Parser({ explicitArray: false });

  const ccdaIg = await xmlParser.parseStringPromise(ig);
  const resources = ccdaIg.ImplementationGuide.definition.resource;

  const files = fs.readdirSync(fshDirectory);

  const valueSets = {};
  const valueSetCSV = parseTerminologyCSV('valueset');
  const codeSystemCSV = parseTerminologyCSV('codesystem');

  const templateIds = Object.fromEntries(ccdaIg.ImplementationGuide.definition.grouping.map(group => [group.$.id, {}]));
  // Weird old templates that specified templateIds in their contents rather than defining a new template
  templateIds.entry['2.16.840.1.113883.10.20.1.58'] = 'AdvanceDirectiveObservation';
  templateIds.entry['2.16.840.1.113883.10.20.22.4.87'] = 'PolicyActivity';
  templateIds.entry['2.16.840.1.113883.10.20.22.4.88'] = 'PolicyActivity';
  templateIds.entry['2.16.840.1.113883.10.20.22.4.89'] = 'PolicyActivity';
  templateIds.entry['2.16.840.1.113883.10.20.22.4.90'] = 'PolicyActivity';

  // Iterate through each file
  files.forEach(async (file) => {
    if (path.extname(file) === '.json') {
      const filePath = path.join(fshDirectory, file);

      let data = fs.readFileSync(filePath, 'utf8');

      // Shortcut to add canonical URL to each hasTemplateIdOf function
      data = data.replace(/hasTemplateIdOf\((\w+)\)/g, `hasTemplateIdOf('${canonical}/StructureDefinition/$1')`);

      const json = JSON.parse(data);

      // Make sure the description in the IG matches the description from the SD
      const sdId = json.id;
      const resourceType = json.resourceType;
      const igResource = resources.find(r => r.reference.reference.$.value == `${resourceType}/${sdId}`);
      if (!igResource) {
        console.warn(`${resourceType} ${sdId} is not in the IG!`);
      } else if (!json.description) {
        console.error(`${resourceType} ${sdId} does not have a description`);
      } else {
        const period = json.description.match(/^(.*?[.])(?:\s|\n|&#xA;|$)/);
        igResource.description.$.value = period ? period[1] : json.description.substring(0, 100);
      }

      // Sushi started re-adding version from sushi-config. 
      // We currently already set this to the templateId extension... if there was an extension.
      // So, if the version is 2.1, that means Sushi added it, and we actually want to skip it
      if (json.version === '2.1') delete json.version;

      // Build a list of required / recommended / additional sections
      appendSectionUsageToDescription(json);
      appendEntryUsageToDescription(json);

      // Save value sets used by this SD
      collectValueSets(json);

      const templateId = getProfileTemplateId(json);
      if (templateId && igResource) {
        templateIds[igResource.groupingId.$.value][templateId] = json.id;
      }

      const xml = fhir.jsonToXml(JSON.stringify(json));
      if (!xml) {
        console.error(`Failed to convert ${filePath}`);
        return;
      }
      const pretty = xmlFormat(xml, {});

      const newPath = path.join(xmlDirectory, file.replace('.json', '.xml'));
      fs.writeFileSync(newPath, pretty, 'utf8');
    }
  });

  // Write the updated IG resource
  const builder = new xml2js.Builder({
    renderOpts: {
      pretty: true,
      indent: '    ',
      newline: '\n'
    },
    xmldec: {
      version: '1.0',
      encoding: 'UTF-8',
    }
  });
  const newXml = builder.buildObject(ccdaIg);
  fs.writeFileSync('input/hl7.cda.us.ccda.xml', newXml);

  // Write filtered terminology files
  const terminologyFilePath = 'input/data/valueset-filtered.csv';
  let terminologyContent = 'URL,Title,Uses\n';

  const sortedValueSets = Object.keys(valueSets).sort((a, b) => {
    const aName = valueSetCSV.get(a)?.Name || a;
    const bName = valueSetCSV.get(b)?.Name || b;
    return aName.localeCompare(bName);
  });

  for (const vs of sortedValueSets) {
    const sds = valueSets[vs];
    let vsName = valueSetCSV.get(vs)?.Name || vs;
    if (vsName === vs) {
      // Not sure why these aren't showing up after IG Publisher run... to investigate!
      const hardCodedName = {
        'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1240.12': 'Pregnancy Status Observation',
        'http://loinc.org/vs/LL5052-7': 'CUBS_Disability',
      }[vs];
      if (hardCodedName) {
        vsName = hardCodedName;
      } else {
        console.warn(`ValueSet ${vs} not loaded yet. Re-run 'npm run sushi-post' after running the IG publisher (or just update valueset-filtered.csv manually)`);
      }
    }
    //const vsSource = valueSetCSV.get(vs)?.Sources || '';
    const vsUsed = [...new Set(sds)].sort().map(sd => `StructureDefinition/${sd}`).join(',');
    terminologyContent += `${vs},${vsName},"${vsUsed}"\n`;
  }

  fs.writeFileSync(terminologyFilePath, terminologyContent, 'utf8');

  generateTemplateIdPage(templateIds, ccdaIg.ImplementationGuide);

  // Filter code systems to only those used by ValueSets listed in Guide
  const codeSystemFilePath = 'input/data/codesystem-filtered.csv';
  terminologyContent = 'URL,Title,Used\n';

  for (const cs of codeSystemCSV.values()) {
    if (cs.URL === 'http://hl7.org/fhir/sid/icd-10-cm') {
      cs.Used = 'ValueSet/us-core-condition-code'; // Bug in IG Publisher output
    }
    if (cs.URL === 'http://loinc.org') {
      // Okay, _really_ need to fix this in the IG Publisher
      cs.Used = 'ValueSet/2.16.840.1.113883.11.20.1.1,ValueSet/2.16.840.1.113883.1.11.20.22,ValueSet/2.16.840.1.113883.11.20.6.1,ValueSet/2.16.840.1.113883.4.642.3.155,ValueSet/2.16.840.1.113883.11.20.4.1,ValueSet/2.16.840.1.113883.11.20.9.47,ValueSet/2.16.840.1.113883.3.88.12.80.62,ValueSet/2.16.840.1.113883.11.20.9.68,ValueSet/2.16.840.1.113762.1.4.1099.10,ValueSet/doc-typecodes,ValueSet/2.16.840.1.113762.1.4.1115.23,ValueSet/2.16.840.1.113762.1.4.1046.35,ValueSet/v3-DocumentSectionType,ValueSet/2.16.840.1.113883.11.20.9.65,ValueSet/2.16.840.1.113883.11.20.9.69.4,ValueSet/2.16.840.1.113883.11.20.9.31,ValueSet/2.16.840.1.113883.1.11.20.2.3,ValueSet/us-core-procedure-code,ValueSet/2.16.840.1.113883.1.11.20.2.4,ValueSet/2.16.840.1.113883.11.20.8.1,ValueSet/2.16.840.1.113883.1.11.20.2.5';
    }
    const csUsed = cs.Used
      .split(',')
      .map(vs => {
        const vsId = Object.keys(valueSets).find(k => k.includes(vs));
        return vsId ? (valueSetCSV.get(vsId)?.Name || vsId) : null;
      })
      .filter(Boolean);
    if (csUsed.length === 0) continue;
    terminologyContent += `${cs.URL},${cs.Name},"${csUsed}"\n`;
  }
  fs.writeFileSync(codeSystemFilePath, terminologyContent, 'utf8');


  function addValueSet(vs, sd) {
    if (!vs || !sd) return;

    if (!valueSets[vs]) {
      valueSets[vs] = [];
    };
    valueSets[vs].push(sd.name);
  }
  
  function collectValueSets(sd) {
    const valueSets = [];
    for (const element of sd.differential?.element || []) {
      if (element.binding?.valueSet) {
        addValueSet(element.binding.valueSet, sd);
      }
      for (const additional of element.binding?.additional || []) {
        if (additional.valueSet) {
          addValueSet(additional.valueSet, sd);
        }
      }
      // Potentially add VS in invariant code
    }
    return valueSets;
  }


})();

/**
 * Look up a templateId from the StructureDefinition's identifier
 * @param {*} sd 
 * @returns string
 */
function getProfileTemplateId(sd) {
  if (!sd.identifier?.length) return;
  const { system, value } = sd.identifier[0];
  if (system !== 'urn:ietf:rfc:3986') {
    console.error(`${sd.name} identifier system is not RFC 3986`);
  }
  if (!value.startsWith('urn:hl7ii:') && !value.startsWith('urn:oid:')) {
    console.error(`${sd.name} identifier value is not a recognized CDA templateId`);
  }
  return value.replace('urn:hl7ii:', '').replace('urn:oid:', '');
}

/**
 * Looks at every referenced template (from both invariants as well as slices) and
 * generates a list, similar to the document section usage to be added to the description
 * @returns 
 */
function appendEntryUsageToDescription(sd) {
  const root = sd.differential?.element[0]?.id;
  if (!root) return;

  const [ linkName, linkNames ] = 
    root === 'Section' ? ['entry', 'Entries'] :
    root === 'Organizer' ? ['component', 'Components'] :
    ['Act', 'Observation', 'Procedure', 'Encounter', 'SubstanceAdministration', 'Supply'].includes(root) ? ['entryRelationship', 'EntryRelationships'] :
    [];
  if (!linkName) return;

  const entries = sd.differential?.element.filter(e => e.path.startsWith(`${root}.${linkName}`));
  if (entries.length === 0) return;

  const foundProfiles = [];

  const shouldEntries = new Set();
  const shallEntries = new Set();
  const mayEntries = new Set();

  for (const constraint of sd.differential?.element[0]?.constraint || []) {
    // Ignoring everything but (entry.where / component.where / entryRelationship.where)
    if (!constraint.expression?.includes(`${linkName}.where(`)) continue;
    // TODO check for double hasTemplateIdOf in expression

    const matches = [...constraint.expression.matchAll(/hasTemplateIdOf\('([^)]+)'\)/g)].map(m => m[1]);
    if (!matches || matches.length === 0) {
      console.warn(`${sd.name}'s constraint ${constraint.key} needs to be handled manually in jsonToXml.js > appendEntryUsageToDescription`);
      continue;
    }
    foundProfiles.push(...matches);
    // SHOULD constraints
    if (constraint.severity === 'warning') {
      shouldEntries.add(matches.map(profileLink).join(' or '));
    } else {
      shallEntries.add(matches.map(profileLink).join(' or '));
    }
  }

  for (const entry of entries.filter(e => e.path === `${root}.${linkName}`)) {
    const entryId = entry.id;
    for (const clinStatement of entries.filter(e => e.id.startsWith(`${entryId}.`))) {
      for (const profile of (clinStatement.type?.[0].profile || [])) {
        if (foundProfiles.includes(profile)) continue;
        foundProfiles.push(profile);
        if (entry.min === 1) {
          shallEntries.add(profileLink(profile));
        } else {
          mayEntries.add(profileLink(profile));
        }
      }
    }
  }

  if ([...shallEntries, ...shouldEntries, ...mayEntries].length === 0) return;

  sd.description += '\n\n#### Templates Used\nAlthough open templates may contain any valid CDA content, the following templates are specifically called out by this template:';
  if (shallEntries.size > 0) {
    sd.description += `\n\n**Required ${linkNames}**: `;
    sd.description += Array.from(shallEntries).sort().join(', ');
  }
  if (shouldEntries.size > 0) {
    sd.description += `\n\n**Recommended ${linkNames}**: `;
    sd.description += Array.from(shouldEntries).sort().join(', ');
  }
  if (mayEntries.size > 0) {
    sd.description += `\n\n**Optional ${linkNames}**: `;
    sd.description += Array.from(mayEntries).sort().join(', ');
  }

}

function appendSectionUsageToDescription(sd) {
  const sBody = sd.differential?.element.find(e => e.id === 'ClinicalDocument.component.structuredBody');
  if (!sBody) return;

  const shouldSections = [];
  const shallSections = [];
  let maySections = [];

  for (const constraint of sBody.constraint || []) {
    if (constraint.key === 'ap-or-a-and-p') {
      shallSections.push(`${profileLink('AssessmentandPlanSection')} or both ${profileLink('AssessmentSection')} and ${profileLink('PlanofTreatmentSection')}`);
      continue;
    }
    if (constraint.key === 'ccrfv-or-cc-or-rfv') {
      shallSections.push(`${profileLink('ChiefComplaintandReasonforVisitSection')} or both ${profileLink('ChiefComplaintSection')} and ${profileLink('ReasonforVisitSection')}`);
      continue;
    }
    if (constraint.key === 'rfr-or-rfv') {
      shallSections.push(`${profileLink('ReasonforReferralSection')} or ${profileLink('ReasonforVisitSection')}`);
      continue;
    }
    // Ignore these
    if (['ap-combo', 'cc-rfv-combo', '1198-31044'].includes(constraint.key)) continue;
    if (constraint.expression.split('hasTemplateIdOf').length > 2) {
      console.warn(`${sd.name}'s constraint ${constraint.key} needs to be handled manually in jsonToXml.js > appendSectionUsageToDescription`);
      continue;
    }
    const match = constraint.expression.match(/hasTemplateIdOf\(\'([^)]+)\'\)/);
    if (!match) {
      console.log(`Match not found in constraint ${constraint.expression}`);
      continue;
    }
    if (constraint.severity === 'error') {
      console.warn(`constraint ${constraint.key} is an error but only one templateId. What? (${constraint.expression})`);
    } else {
      shouldSections.push(profileLink(match[1]));
    }
  }

  for (const section of sd.differential.element.filter(e => e.path === 'ClinicalDocument.component.structuredBody.component.section')) {
    const profile = section.type?.[0].profile?.[0];
    if (!profile) {
      console.error(`${sd.name} element id ${section.id} does not specify a profile...?`);
    }
    const element = sd.differential.element.find(e => e.id === section.id.split('.section')[0]);
    if (element.min === 0) {
      maySections.push(profileLink(profile));
    } else {
      shallSections.push(profileLink(profile));
    }
  }

  maySections = maySections.filter(may => ![...shallSections, ...shouldSections].find(shall => shall.includes(may)));

  if ([...shallSections, ...shouldSections, ...maySections].length === 0) return;

  sd.description += '\n\n#### Document Sections\nAlthough document templates may contain any section, the following sections are specifically called out by this template:';
  if (shallSections.length) {
    sd.description += '\n\n**Required Sections**\n';
    sd.description += shallSections.map(s => `- ${s}`).join('\n');
  }
  if (shouldSections.length) {
    sd.description += '\n\n**Recommended Sections**\n';
    sd.description += shouldSections.map(s => `- ${s}`).join('\n');
  }
  if (maySections.length) {
    sd.description += '\n\n**Additional Sections**\n';
    sd.description += maySections.map(s => `- ${s}`).join('\n');
  }
}

// Turn a profile name or URL into a Markdown link to the profile
function profileLink(profileNameOrUrl) {
  if (!profileNameOrUrl) return '';
  const profileId = profileNameOrUrl.includes('/') ? profileNameOrUrl.split('/').pop() : profileNameOrUrl;
  return `[${profileId}](StructureDefinition-${profileId}.html)`;
}

/**
 * Turn IG-generated CSVs into a Map that we can process
 */
function parseTerminologyCSV(vsORcs) {
  const csvPaths = [
    path.resolve(__dirname, `../input/data/${vsORcs}-ref-all-list.csv`),
    path.resolve(__dirname, `../temp/pages/${vsORcs}-ref-all-list.csv`),
    path.resolve(__dirname, `../temp/pages/${vsORcs}-ref-list.csv`)
    // (Contrary to popular belief, ref-list may actually contain more than ref-all-list)
  ];
  
  let termCSVMap = new Map();
  for (const csvPath of csvPaths) {
    if (fs.existsSync(csvPath)) {
      console.log(`Parsing ${csvPath}`);
      const csv = fs.readFileSync(csvPath, 'utf-8');
      const records = parse(csv, { columns: true, relax_column_count: true });
      const headers = Object.keys(records[0]);
      for (const record of records) {
        const url = record.URL;
        termCSVMap.set(url, record);
      }
    } else {
      console.log(`${csvPath} not found...`);
    }
  }
  return termCSVMap;
}

function generateTemplateIdPage(templateIds, ig) {
  let contents = `The following templateIds are used by this Implementation Guide:\n\n`;
  for (const group of Object.keys(templateIds)) {
    if (Object.keys(templateIds[group]).length === 0) continue;
    const groupName = ig.definition.grouping.find(g => g.$.id === group)?.name.$.value;
    contents += `### ${groupName}\n\n`;
    contents += `| TemplateId | Template |\n`;
    contents += `| ---------- | ------- |\n`;

    const sortedKeys = Object.keys(templateIds[group]).sort((a, b) => {
      const aOID = a.split(':')[0].split('.');
      const bOID = b.split(':')[0].split('.');
      for (let i = 0; i < Math.max(aOID.length, bOID.length); i++) {
        const aNum = parseInt(aOID[i] || 0, 10);
        const bNum = parseInt(bOID[i] || 0, 10);
        if (aNum !== bNum) {
          return aNum - bNum;
        }
      }
    });
    for (const templateId of sortedKeys) {
      const sdId = templateIds[group][templateId];
      const sdName = profileLink(sdId);
      contents += `| ${templateId} | ${sdName} |\n`;
    }
    contents += '\n\n';
  }

  fs.writeFileSync('input/pagecontent/templateids.md', contents, 'utf8');
}