const fs = require('fs');
const path = require('path');

/**
 * Post-processing for running gofsh
 *  - sorts the FSH files into categorized directories
 *  - add the logical-model extension to every profile
 */

const fshDirectory = 'fsh-tank/input/fsh';

// Manually-created FSH supporting file
const extensions = `Alias: $LogicalTarget = http://hl7.org/fhir/tools/StructureDefinition/logical-target
Alias: $DAR = http://hl7.org/fhir/StructureDefinition/data-absent-reason

RuleSet: LogicalModelNA
* ^extension[$LogicalTarget].valueBoolean.extension[$DAR].valueCode = #not-applicable
`;
fs.writeFileSync(path.join(fshDirectory, 'extensions.fsh'), extensions, 'utf8');

fs.readdir(fshDirectory, (err, files) => {
  if (err) {
    console.error('Error reading directory:', err);
    return;
  }

  for (const subDir of ['Document', 'Section', 'Entry', 'Other']) {
    const newDir = path.join(fshDirectory, subDir);
    if (!fs.existsSync(newDir)) {
      fs.mkdirSync(newDir);
    }
  }

  files.forEach(async (file) => {
    if (path.extname(file) === '.fsh') {
      const filePath = path.join(fshDirectory, file);

      const data = fs.readFileSync(filePath, 'utf8');

      // GoFSH still creates .fhir_comment fields; preserve them as just FSH comments
      const replacedString = data.replace(/(\s+).*fhir_comments[^=]+=\s/g, "$1//")
        .replace('* ^identifier', '* insert LogicalModelNA\n* ^identifier');

      if (replacedString != data) {
        fs.writeFileSync(filePath, replacedString, 'utf8');
      }

      // Organize files automagically
      const directory = data.includes('Parent: $Section') ? 'Section' :
        file.includes('USRealmHeader') || data.includes('Parent: USRealmHeader') ? 'Document' :
          file.includes('AuthorPart') || file.includes('USRealm') ? 'Other' :
            file.includes('alias') || file.includes('extensions') ? '' :
              'Entry';

      if (directory) {
        fs.renameSync(filePath, path.join(fshDirectory, directory, file));
      }
    }
  });

});
