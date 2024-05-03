const Fhir = require('fhir').Fhir;
const ParseConformance = require('fhir').ParseConformance;
const FhirVersions = require('fhir').Versions;
const fs = require('fs');
const path = require('path');
const xmlFormat = require('xml-formatter');
const xml2js = require('xml2js');

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

      // Build a list of required / recommended / additional sections
      appendSectionUsageToDescription(json);

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

})();

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
    if (constraint.key === '1198-9504') {
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

  maySections = maySections.filter(may => !shallSections.find(shall => shall.includes(may)));

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

function profileLink(profileNameOrUrl) {
  if (!profileNameOrUrl) return '';
  const profileId = profileNameOrUrl.includes('/') ? profileNameOrUrl.split('/').pop() : profileNameOrUrl;
  return `[${profileId}](StructureDefinition-${profileId}.html)`;
}
