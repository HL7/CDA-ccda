const Fhir = require('fhir').Fhir;
const ParseConformance = require('fhir').ParseConformance;
const FhirVersions = require('fhir').Versions;
const fs = require('fs');
const path = require('path');
const xmlFormat = require('xml-formatter');


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

// Read the files in the directory
fs.readdir(fshDirectory, (err, files) => {
  if (err) {
    console.error('Error reading directory:', err);
    return;
  }

  let tempCnt = 0;
  // Iterate through each file
  files.forEach(async (file) => {
    if (path.extname(file) === '.json') {
      const filePath = path.join(fshDirectory, file);

      const data = fs.readFileSync(filePath, 'utf8');
      const json = JSON.parse(data);

      // Add the logical-target extension
      // if (!json.extension) json.extension = [];
      // json.extension.push({
      //   url: 'http://hl7.org/fhir/tools/StructureDefinition/logical-target',
      //   _valueBoolean: {
      //     extension: [{
      //       url: 'http://hl7.org/fhir/StructureDefinition/data-absent-reason',
      //       valueCode: 'not-applicable'
      //     }]
      //   }
      // })

      const xml = fhir.jsonToXml(JSON.stringify(json));
      if (!xml) {
        console.error(`Failed to convert ${filePath}`);
        return;
      }
      const pretty = xmlFormat(xml, {});

      // console.log(pretty);
      // return;


      const newPath = path.join(xmlDirectory, file.replace('.json', '.xml'));
      fs.writeFileSync(newPath, pretty, 'utf8');
    }
  });

});
