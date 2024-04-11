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