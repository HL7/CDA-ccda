# C-CDA Validation
The files in this folder are provided to support validation of C-CDA using Schematron, a common validation method used before the IG was written using FHIR tooling. They were created using an open-source HL7 tool which converts StructureDefinition resources into Schematron and other files.

- `CCDA-{version}.sch` - the primary schematron validation - includes validation of value sets with fewer than 1000 concepts
- `CCDA-{version}-Bindings.json` - contains ALL value set bindings, strengths, and XPaths - for use by developers in ongoing terminology validation
- `CCDA-{version}-Results.json` - technical details about the conversion results from StructureDefinition to Schematron

## Further Reading
More information about the conversion and validation of C-CDA documents may be found at the following locations:

- https://github.com/HL7/fhir-cda-validation - Open-source conversion utility used to create this schematron
- [CDA in FHIR StructureDefinition (SD) Format](https://confluence.hl7.org/x/CwZCDg) - Description of C-CDA's migration from PDF to SD
