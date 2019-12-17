import * as fs from 'fs';
import * as path from 'path';
import * as vkbeautify from 'vkbeautify';
import {Fhir} from 'fhir/fhir';

const sdFileNames = fs.readdirSync('input/resources/structuredefinition');
const fhir = new Fhir();

let profilesTemplate = fs.readFileSync(path.join(__dirname, 'profiles.md')).toString();
let profilesTemplateRows = '';

sdFileNames.forEach((sdFileName) => {
    const absSdFileName = path.join('input/resources/structuredefinition', sdFileName);
    let xmlContent = fs.readFileSync(absSdFileName).toString();
    const resource: any = fhir.xmlToObj(xmlContent);

    if (!resource.title && resource.name) {
        resource.title = resource.name;
        resource.name = resource.name
            .replace(' (V2)', '')
            .replace(' (V3)', '')
            .replace(' (DEPRECATED)', '')
            .replace(/ /g, '')
            .replace(/[^0-9a-zA-Z]+/g, '');
    }

    if (resource.title && resource.title.indexOf(' (V2)') > 0) {
        resource.version = '2.0.0';
        resource.title = resource.title.substring(0, resource.title.indexOf(' (V2)'));
    } else if (resource.title && resource.title.indexOf(' (V3)') > 0) {
        resource.version = '3.0.0';
        resource.title = resource.title.substring(0, resource.title.indexOf(' (V3)'));
    }

    xmlContent = vkbeautify.xml(fhir.objToXml(resource));
    fs.writeFileSync(absSdFileName, xmlContent);

    const nameValue = `<a href="StructureDefinition-${resource.id}.html">${resource.name}</a>`;
    profilesTemplateRows += `    <tr><td>${nameValue}</td><td>${resource.id}</td></tr>\r\n`;
});

profilesTemplate = profilesTemplate.replace('<!-- rows here -->', profilesTemplateRows);
fs.writeFileSync(path.join(__dirname, '../input/pagecontent/profiles.md'), profilesTemplate);