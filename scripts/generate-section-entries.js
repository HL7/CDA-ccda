"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const fs = require("fs");
const content = fs.readFileSync('e:\\igs\\cda-ccda-2.2\\scripts\\section-info.csv').toString();
const contentLines = content.replace(/\r/g, '').split('\n');
const slices = contentLines.filter((l, i) => i !== 0).map(l => {
    const cells = l.split(',');
    return {
        comment: cells[0],
        element: cells[1],
        type: cells[2],
        oid: cells[3],
        name: cells[4],
        rootMin: cells[5],
        rootMax: cells[6],
        min: cells[7],
        max: cells[8],
        rootReq: cells[9],
        req: cells[10]
    };
});
slices
    .filter(slice => slice.comment)
    .forEach(slice => {
    console.log(`        <!-- ${slice.comment} -->\n` +
        `        <element id="Section.entry:${slice.name}">\n` +
        `            <path value="Section.entry"/>\n` +
        `            <sliceName value="${slice.name}"/>\n` +
        `            <requirements value="${slice.rootReq}"/>\n` +
        `            <min value="${slice.rootMin}"/>\n` +
        `            <max value="${slice.rootMax}"/>\n` +
        `        </element>\n` +
        `        <element id="Section.entry:${slice.name}.${slice.element}">\n` +
        `            <path value="Section.entry.${slice.element}"/>\n` +
        `            <requirements value="${slice.req}"/>\n` +
        `            <min value="${slice.min}"/>\n` +
        `            <max value="${slice.max}"/>\n` +
        `            <type>\n` +
        `                <code value="http://hl7.org/fhir/cda/StructureDefinition/${slice.type}"/>\n` +
        `                <profile value="http://hl7.org/fhir/cda/ccda/StructureDefinition/${slice.oid}"/>\n` +
        `            </type>\n` +
        `        </element>\n`);
});
//# sourceMappingURL=generate-section-entries.js.map