"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const fs = require("fs");
const vkbeautify = require("vkbeautify");
const fhir_1 = require("fhir");
const fhir = new fhir_1.Fhir();
const strucDefFiles = fs.readdirSync('input/resources/structuredefinition');
const valueSetFiles = fs.readdirSync('input/resources/valueset');
const igContent = fs.readFileSync('input/ccda.xml').toString();
const ig = fhir.xmlToObj(igContent);
const valueSetResources = valueSetFiles.map(valueSetFile => {
    const id = valueSetFile.substring(valueSetFile.lastIndexOf('/'), valueSetFile.indexOf('.xml'));
    return {
        reference: {
            reference: `ValueSet/${id}`
        }
    };
});
const strucDefResources = strucDefFiles.map(strucDefFile => {
    const id = strucDefFile.substring(strucDefFile.lastIndexOf('/'), strucDefFile.indexOf('.xml'));
    return {
        reference: {
            reference: `StructureDefinition/${id}`
        }
    };
});
ig.definition.resource = strucDefResources.concat(valueSetResources);
const igXml = vkbeautify.xml(fhir.objToXml(ig));
fs.writeFileSync('input/ccda.xml', igXml);
//# sourceMappingURL=generate-ig.js.map