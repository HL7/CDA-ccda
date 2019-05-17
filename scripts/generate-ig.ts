import * as fs from 'fs';
import * as path from 'path';
import * as vkbeautify from 'vkbeautify';
import {Fhir} from 'fhir';

const fhir = new Fhir();
const strucDefDir = 'resources\\structuredefinition';
const strucDefFiles = fs.readdirSync('resources\\structuredefinition');
const valueSetDir = 'resources\\valueset';
const valueSetFiles = fs.readdirSync('resources\\valueset');

const strucDefs = strucDefFiles.map((file) => {
    const content = fs.readFileSync(path.join(strucDefDir, file));
    const resource = fhir.xmlToObj(content);
    return resource;
});
const valueSets = valueSetFiles.map((file) => {
    const content = fs.readFileSync(path.join(valueSetDir, file));
    const resource = fhir.xmlToObj(content);
    return resource;
});

const ig = {
    resourceType: 'ImplementationGuide',
    id: 'ccda',
    url: 'http://hl7.org/cda/us/ccda',
    name: 'ccda',
    title: 'Consolidated CDA Templates for Clinical Notes (US Realm) DSTU R2.1',
    packageId: 'hl7.cda.us.ccda',
    version: '2.1.0',
    status: 'active',
    experimental: false,
    publisher: 'Health Level 7',
    //contact: [],
    fhirVersion: ['3.0.1'],           // Not really needed... but required by ImplementationGuide
    //global: []                    // Should be profiles like US-Realm-Header, US-Realm-Patient, etc.
    definition: {
        resource: strucDefs.concat(valueSets).map((resource) => {
            return {
                reference: {
                    reference: resource.resourceType + '/' + resource.id
                },
                example: resource.resourceType !== 'StructureDefinition' && resource.resourceType !== 'ValueSet'
            };
        })
    }
};

const igXml = vkbeautify.xml(fhir.objToXml(ig));
fs.writeFileSync('resources/implementationguide/ccda.xml', igXml);