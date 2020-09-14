import * as request from 'request';
import * as fs from 'fs';
import {Fhir} from "fhir/fhir";

const fhir = new Fhir();
const igContent = fs.readFileSync('input/cda-ccda.xml').toString();
const ig = fhir.xmlToObj(igContent);

const resourceIds = ig.definition.resource
    .filter(r => r.reference && r.reference.reference && r.reference.reference.startsWith('StructureDefinition/'))
    .map(r => r.reference.reference.substring('StructureDefinition/'.length));

const updateResource = async(id, resource) => {
    console.log(`Updating resource with id ${id}`);
    return new Promise((resolve, reject) => {
        const options = {
            method: 'PUT',
            url: `https://hapi4.lantanagroup.com/fhir/StructureDefinition/${id}`,
            headers: {
                'Content-Type': 'application/xml',
                'Accept': 'application/json'
            },
            data: resource
        };

        request(options, (err, response, body) => {
            if (err) {
                reject();
            } else {
                resolve();
            }
        });
    });
};

const updateNext = async () => {
    if (resourceIds.length === 0) return;

    const nextResourceId = resourceIds.pop();
    const fileContent = fs.readFileSync(`input/resources/structuredefinition/${nextResourceId}.xml`).toString();

    if (fileContent) {
        await updateResource(nextResourceId, fileContent);
        await updateNext();
    }
}

updateNext()
    .then(() => {
        console.log('done');
    })
    .catch((err) => {
        console.error(err);
    });