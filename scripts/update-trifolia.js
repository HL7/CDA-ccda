"use strict";
var __awaiter = (this && this.__awaiter) || function (thisArg, _arguments, P, generator) {
    function adopt(value) { return value instanceof P ? value : new P(function (resolve) { resolve(value); }); }
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : adopt(result.value).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
};
Object.defineProperty(exports, "__esModule", { value: true });
const request = require("request");
const fs = require("fs");
const fhir_1 = require("fhir/fhir");
const fhir = new fhir_1.Fhir();
const igContent = fs.readFileSync('input/cda-ccda.xml').toString();
const ig = fhir.xmlToObj(igContent);
const resourceIds = ig.definition.resource
    .filter(r => r.reference && r.reference.reference && r.reference.reference.startsWith('StructureDefinition/'))
    .map(r => r.reference.reference.substring('StructureDefinition/'.length));
const updateResource = (id, resource) => __awaiter(void 0, void 0, void 0, function* () {
    console.log(`Updating resource with id ${id}`);
    return new Promise((resolve, reject) => {
        const options = {
            method: 'PUT',
            url: `https://hapi4.lantanagroup.com/fhir/StructureDefinition/${id}`,
            headers: {
                'Content-Type': 'application/xml',
                'Accept': 'application/json'
            },
            body: resource
                .replace(/\r/g, '')
        };
        request(options, (err, response, body) => {
            if (err || response.statusCode >= 300) {
                reject(body);
            }
            else {
                resolve();
            }
        });
    });
});
const updateNext = () => __awaiter(void 0, void 0, void 0, function* () {
    if (resourceIds.length === 0)
        return;
    const nextResourceId = resourceIds.pop();
    const fileContent = fs.readFileSync(`input/resources/structuredefinition/${nextResourceId}.xml`).toString();
    if (fileContent) {
        yield updateResource(nextResourceId, fileContent);
        yield updateNext();
    }
});
updateNext()
    .then(() => {
    console.log('done');
})
    .catch((err) => {
    console.log(err);
});
//# sourceMappingURL=update-trifolia.js.map