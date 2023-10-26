const fs = require('fs');

/**
 * Modify sushi with fixes to support CDA logical model development
 *  x Allow binding on code (and ADXP) elements (no longer needed!)
 *  x Disable binding strength checks (to be removed once all profiles are fixed up - which is now!)
 *  - Fix sushi's logical-model-type-matching to be based on url rather than type
 */

const filePath = 'node_modules/fsh-sushi/dist/fhirtypes/ElementDefinition.js';

if (fs.existsSync(filePath + '.orig')) {
  fs.copyFileSync(filePath + '.orig', filePath);
} else {
  fs.copyFileSync(filePath, filePath + '.orig');
}

// Pick one to test against
const searchString = new RegExp('matchesLogicalType = t2.code && t2.code === md.sdType;');

fs.readFile(filePath, 'utf8', (err, data) => {
  if (err) {
    console.error(err);
    return;
  }

  if (!searchString.test(data)) {
    console.error('Sushi could not be modified for C-CDA. Are you sure the correct version (3.5.0) is installed?');
    return;
  }

  // Magical expression interpolation (testing)
  newData = data.replace(new RegExp('expression: invariant.expression'), 'expression: invariant.expression.replace(new RegExp("{%thisSDUrl}"), this.structDef.url)');

  // Bug with how Sushi reconciles logical-model definitions based on .type instead of .url
  newData = newData.replace(searchString, 'matchesLogicalType = t2.code && (t2.code === md.sdType || t2.code === md.url);')
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