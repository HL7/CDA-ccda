import * as fs from 'fs';
import * as path from 'path';
import * as vkbeautify from 'vkbeautify';
import {Fhir} from 'fhir/fhir';

const sdFileNames = fs.readdirSync('resources/structuredefinition');
const fhir = new Fhir();

sdFileNames.forEach((sdFileName) => {
    const absSdFileName = path.join('resources/structuredefinition', sdFileName);
    let xmlContent = fs.readFileSync(absSdFileName).toString();
    const resource: any = fhir.xmlToObj(xmlContent);

    // TODO

    xmlContent = vkbeautify.xml(fhir.objToXml(resource));
    fs.writeFileSync(absSdFileName, xmlContent);
});