import * as fs from 'fs';
import * as path from 'path';
import * as vkbeautify from 'vkbeautify';
import {Fhir} from 'fhir/fhir';

const sdFileNames = fs.readdirSync('input/resources/structuredefinition');
const fhir = new Fhir();

sdFileNames.forEach((sdFileName) => {
    const absSdFileName = path.join('input/resources/structuredefinition', sdFileName);
    let xmlContent = fs.readFileSync(absSdFileName).toString();
    const resource: any = fhir.xmlToObj(xmlContent);

    resource.differential.element.forEach(element => {
        if (element.sliceName && !element.id.endsWith(element.sliceName)) {
            console.log(`Removing sliceName from ${element.id} in ${sdFileName}`);
            delete element.sliceName;
        }
    });

    xmlContent = vkbeautify.xml(fhir.objToXml(resource));
    fs.writeFileSync(absSdFileName, xmlContent);
});