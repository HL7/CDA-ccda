"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const fs = require("fs");
const path = require("path");
const vkbeautify = require("vkbeautify");
const fhir_1 = require("fhir/fhir");
const sdFileNames = fs.readdirSync('resources/structuredefinition');
const fhir = new fhir_1.Fhir();
let profilesTemplate = fs.readFileSync(path.join(__dirname, 'profiles.md')).toString();
let profilesTemplateRows = '';
sdFileNames.forEach((sdFileName) => {
    const absSdFileName = path.join('resources/structuredefinition', sdFileName);
    let xmlContent = fs.readFileSync(absSdFileName).toString();
    const resource = fhir.xmlToObj(xmlContent);
    // TODO
    resource.title = resource.name;
    resource.name = resource.name
        .replace(' (V2)', '')
        .replace(' (V3)', '')
        .replace(' (DEPRECATED)', '')
        .replace(/ /g, '')
        .replace(/[^0-9a-zA-Z]+/g, '');
    xmlContent = vkbeautify.xml(fhir.objToXml(resource));
    fs.writeFileSync(absSdFileName, xmlContent);
    const nameValue = `<a href="StructureDefinition-${resource.id}.html">${resource.name}</a>`;
    profilesTemplateRows += `    <tr><td>${nameValue}</td><td>${resource.id}</td></tr>\r\n`;
});
profilesTemplate = profilesTemplate.replace('<!-- rows here -->', profilesTemplateRows);
fs.writeFileSync(path.join(__dirname, '../source/pages/profiles.md'), profilesTemplate);
//# sourceMappingURL=fix-structuredefinitions.js.map