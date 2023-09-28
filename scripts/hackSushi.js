const fs = require('fs');

/**
 * Modify sushi with fixes to support CDA logical model development
 *  - Allow binding on code (and ADXP) elements
 *  - Disable binding strength checks (to be removed once all profiles are fixed up)
 *  - Fix sushi's logical-model-type-matching to be based on url rather than type
 */

const filePath = 'node_modules/fsh-sushi/dist/fhirtypes/ElementDefinition.js';

if (fs.existsSync(filePath + '.orig')) {
  fs.copyFileSync(filePath + '.orig', filePath);
} else {
  fs.copyFileSync(filePath, filePath + '.orig');
}


const cdaCodeTypes = ['CD', 'CE', 'CS', 'cs', 'ADXP'].map((type) => `'http://hl7.org/cda/stds/core/StructureDefinition/${type}'`);

const searchString = new RegExp("'code', 'Coding', 'CodeableConcept', 'CodeableReference', 'Quantity', 'string', 'uri'\\);", 'g');
const replaceString = `'code', 'Coding', 'CodeableConcept', 'CodeableReference', 'Quantity', 'string', 'uri', ${cdaCodeTypes.join(', ')});`;

fs.readFile(filePath, 'utf8', (err, data) => {
  if (err) {
    console.error(err);
    return;
  }

  if (!searchString.test(data)) {
    console.error('Sushi could not be modified for C-CDA. Are you sure the correct version is installed?');
    return;
  }

  // Support binding on CDA elements - waiting on https://github.com/FHIR/sushi/issues/1347
  let newData = data.replace(new RegExp(searchString, 'g'), replaceString);

  // Ignore the binding strength error - waiting on actually FIXING these in Sushi rather than in XML
  newData = newData.replace(new RegExp('throw new errors_1.BindingStrengthError', 'g'), '//throw new errors_1.BindingStrengthError');

  // Bug with how Sushi reconciles logical-model definitions based on .type instead of .url
  newData = newData.replace(new RegExp('matchesLogicalType = t2.code && t2.code === md.sdType;'), 'matchesLogicalType = t2.code && (t2.code === md.sdType || t2.code === md.url);')
    .replace(new RegExp(': match.metadata.sdType;'), ": (this.structDef.kind == 'logical' ? match.code : match.metadata.sdType);")
    .replace(/match\.metadata\.sdType &&\n\s+match\.metadata\.sdType === /g, '');

  fs.writeFile(filePath, newData, 'utf8', (err) => {
    if (err) {
      console.error(err);
      return;
    }

    console.log('File has been modified and saved.');
  });
});