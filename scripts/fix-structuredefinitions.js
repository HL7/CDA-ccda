"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const fs = require("fs");
const path = require("path");
const vkbeautify = require("vkbeautify");
const fhir_1 = require("fhir/fhir");
const sdFileNames = fs.readdirSync('input/resources/structuredefinition');
const fhir = new fhir_1.Fhir();
sdFileNames
    .map(sdFileName => {
    try {
        const absSdFileName = path.join('input/resources/structuredefinition', sdFileName);
        const xmlContent = fs.readFileSync(absSdFileName).toString();
        const resource = fhir.xmlToObj(xmlContent);
        return {
            sdFileName,
            resource
        };
    }
    catch (ex) {
        return null;
    }
})
    .filter(info => {
    return info;
})
    .forEach(info => {
    info.resource.differential.element
        .filter(e => e.sliceName && e.sliceName.startsWith('entry'))
        .forEach(slice => {
        const sliceElements = info.resource.differential.element
            .filter(e => e.id.startsWith(slice.id + '.') && e.id.split('.').length === slice.id.split('.').length + 1);
        const statementElements = sliceElements.filter(s => {
            const leafPath = s.id.substring(s.id.lastIndexOf('.') + 1);
            return ['observation', 'observationMedia', 'act', 'encounter', 'substanceAdministration', 'procedure'].indexOf(leafPath) >= 0;
        });
        if (statementElements.length === 1) {
            if (!statementElements[0].type || statementElements[0].type.length === 0) {
                console.log('nope');
                return;
            }
            const profile = statementElements[0].type[0].profile[0];
            const profileId = profile.substring(profile.lastIndexOf('/') + 1);
            const profilePath = path.join(__dirname, '../input/resources/structuredefinition/', profileId + '.xml');
            const profileXmlContent = fs.readFileSync(profilePath).toString();
            const profileResource = fhir.xmlToObj(profileXmlContent);
            const title = profileResource.title.replace(/\s/g, '');
            const oldSliceName = slice.sliceName;
            const newSliceName = title.substring(0, 1).toLowerCase() + title.substring(1);
            slice.sliceName = newSliceName;
            slice.id = slice.id.replace(oldSliceName, newSliceName);
            sliceElements.forEach(next => {
                next.id = next.id.replace(oldSliceName, newSliceName);
            });
        }
    });
    const xmlContent = vkbeautify.xml(fhir.objToXml(info.resource));
    const absSdFileName = path.join('input/resources/structuredefinition', info.sdFileName);
    fs.writeFileSync(absSdFileName, xmlContent);
    //const nameValue = `<a href="StructureDefinition-${resource.id}.html">${resource.name}</a>`;
    //profilesTemplateRows += `    <tr><td>${nameValue}</td><td>${resource.id}</td></tr>\r\n`;
});
//profilesTemplate = profilesTemplate.replace('<!-- rows here -->', profilesTemplateRows);
//fs.writeFileSync(path.join(__dirname, '../input/pagecontent/profiles.md'), profilesTemplate);
//# sourceMappingURL=fix-structuredefinitions.js.map