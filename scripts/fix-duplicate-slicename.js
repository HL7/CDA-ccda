"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const fs = require("fs");
const path = require("path");
const vkbeautify = require("vkbeautify");
const fhir_1 = require("fhir/fhir");
const sdFileNames = fs.readdirSync('input/resources/structuredefinition');
const fhir = new fhir_1.Fhir();
sdFileNames.forEach((sdFileName) => {
    const absSdFileName = path.join('input/resources/structuredefinition', sdFileName);
    let xmlContent = fs.readFileSync(absSdFileName).toString();
    const resource = fhir.xmlToObj(xmlContent);
    resource.differential.element.forEach(element => {
        if (element.sliceName && !element.id.endsWith(element.sliceName)) {
            console.log(`Removing sliceName from ${element.id} in ${sdFileName}`);
            delete element.sliceName;
        }
    });
    xmlContent = vkbeautify.xml(fhir.objToXml(resource));
    fs.writeFileSync(absSdFileName, xmlContent);
});
//# sourceMappingURL=fix-duplicate-slicename.js.map