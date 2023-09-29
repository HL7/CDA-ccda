/**
 * pre/post processing for gofsh - removes and restores the logical-target extension 
 * since gofsh cannot handle the valueBoolean with an extension
 */


const logicalTargetExt = `    <extension url="http://hl7.org/fhir/tools/StructureDefinition/logical-target">
      <valueBoolean>
        <extension url="http://hl7.org/fhir/StructureDefinition/data-absent-reason">
          <valueCode value="not-applicable"/>
        </extension>
      </valueBoolean>
    </extension>
`;

const reInsertSrch = '    <url value="http://hl7.org/cda/us/ccda/StructureDefinition/';

const [search, replace] = process.argv?.length > 2 && process.argv[2] == 'undo' ?
  [new RegExp(reInsertSrch), logicalTargetExt + reInsertSrch] :
  [new RegExp(logicalTargetExt), ''];

const fs = require('fs');
const path = require('path');

const xmlDirectory = 'input/resources';
let tempCount = 0;
fs.readdir(xmlDirectory, (err, files) => {
  if (err) {
    console.error('Error reading directory:', err);
    return;
  }

  files.forEach(async (file) => {
    if (path.extname(file) === '.xml') {
      const filePath = path.join(xmlDirectory, file);

      const data = fs.readFileSync(filePath, 'utf8');

      const replacedString = data.replace(search, replace);

      if (replacedString != data) {
        fs.writeFileSync(filePath, replacedString, 'utf8');
      } else {
        console.log(`Data not found in ${file} ${search}`)
      }
    }
  });

});
