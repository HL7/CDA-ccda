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

  const ig = fs.readFileSync('input/hl7.cda.us.ccda.xml');
  const xmlParser = new xml2js.Parser({ explicitArray: false });

  const ccdaIg = await xmlParser.parseStringPromise(ig);
  const resources = ccdaIg.ImplementationGuide.definition.resource;

  const files = fs.readdirSync(fshDirectory);

  const identifiers = [];

  function saveIdentifier(sd) {
    const value = sd.identifier?.[0].value;
    if (!value) return null;
    identifiers[sd.name] = value;
    return value;
  }
  function getIdentifierForSD(name) {
    if (identifiers[name]) return identifiers[name];
    try {
      const data = fs.readFileSync(path.join(fshDirectory, `StructureDefinition-${name}.json`));
      const json = JSON.parse(data);
      return saveIdentifier(json);
    } catch (e) {
      console.error(`Error looking up identifier for ${name}: ${e.message}`);
    }
  }
  function buildTemplateIdWhere(name) {
    const identifier = getIdentifierForSD(name);
    if (!identifier) {
      console.error(`Could not load identifier for ${name}`);
      return;
    }
    const rootExt = identifier.match(/^urn:hl7ii:(\d(?:\.\d+)+):(\d{4}-\d{2}-\d{2})$/);
    if (rootExt) {
      return `root = '${rootExt[1]}' and extension = '${rootExt[2]}'`;
    }
    const rootOnly = identifier.match(/^urn:oid:(\d(?:\.\d+)+)$/);
    if (rootOnly) {
      return `root = '${rootOnly[1]}' and extension.empty()`;
    }
    console.error(`Unrecognized identifier format: ${identifier}`);
  }

  // Iterate through each file
  files.forEach(async (file) => {
    if (path.extname(file) === '.json') {
      const filePath = path.join(fshDirectory, file);

      let data = fs.readFileSync(filePath, 'utf8');

      // Implement custom hasTemplateIdOf(SDName) function!
      data = data.replace(/hasTemplateIdOf\((\w+)\)/g, (match, capture) => {
        const rootExt = buildTemplateIdWhere(capture);
        return rootExt ? `templateId.where(${rootExt})` : 'not()';
      });

      const json = JSON.parse(data);
      saveIdentifier(json);

      // Make sure the description in the IG matches the description from the SD
      const sdId = json.id;
      const resourceType = json.resourceType;
      const igResource = resources.find(r => r.reference.reference.$.value == `${resourceType}/${sdId}`);
      if (!igResource) {
        console.warn(`${resourceType} ${sdId} is not in the IG!`);
      } else {
        const period = json.description.indexOf('.');
        igResource.description.$.value = period > 0 ? json.description.substring(0, period + 1) : json.description.substring(0, 100);
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

})();