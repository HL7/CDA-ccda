"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const fs = require("fs");
const path = require("path");
const vkbeautify = require("vkbeautify");
const fhir_1 = require("fhir/fhir");
const sdFileNames = fs.readdirSync('resources/structuredefinition');
const fhir = new fhir_1.Fhir();
sdFileNames.forEach((sdFileName) => {
    const absSdFileName = path.join('resources/structuredefinition', sdFileName);
    let xmlContent = fs.readFileSync(absSdFileName).toString();
    const resource = fhir.xmlToObj(xmlContent);
    // TODO
    xmlContent = vkbeautify.xml(fhir.objToXml(resource));
    fs.writeFileSync(absSdFileName, xmlContent);
});
//# sourceMappingURL=fix-structuredefinitions.js.map