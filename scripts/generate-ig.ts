import * as fs from 'fs';
import * as path from 'path';
import * as vkbeautify from 'vkbeautify';
import {Fhir} from 'fhir';

const fhir = new Fhir();
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