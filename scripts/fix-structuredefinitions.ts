import * as fs from 'fs';
import * as path from 'path';
import * as vkbeautify from 'vkbeautify';
import {Fhir} from 'fhir/fhir';

const sdFileNames = fs.readdirSync('resources/structuredefinition');
const fhir = new Fhir();

let profilesTemplate = fs.readFileSync(path.join(__dirname, 'profiles.md')).toString();
let profilesTemplateRows = '';

sdFileNames.forEach((sdFileName) => {
    const absSdFileName = path.join('resources/structuredefinition', sdFileName);
    let xmlContent = fs.readFileSync(absSdFileName).toString();
    const resource: any = fhir.xmlToObj(xmlContent);

    // TODO

    xmlContent = vkbeautify.xml(fhir.objToXml(resource));
    fs.writeFileSync(absSdFileName, xmlContent);

    const nameValue = `<a href="StructureDefinition-${resource.id}.html">${resource.name}</a>`;
    profilesTemplateRows += `    <tr><td>${nameValue}</td><td>${resource.id}</td></tr>\r\n`;
});

profilesTemplate = profilesTemplate.replace('<!-- rows here -->', profilesTemplateRows);
fs.writeFileSync(path.join(__dirname, '../source/pages/profiles.md'), profilesTemplate);