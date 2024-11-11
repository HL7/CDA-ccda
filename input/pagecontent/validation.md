### Validate C-CDA Documents Using FHIR Tooling
The FHIR validator can be used to validate C-CDA documents.  There are three ways of using the FHIR validator.

#### Web version of the FHIR Validator
There is a web version of the FHIR validator available at [validator.fhir.org](https://validator.fhir.org).  Simply select "US CCDA Document" from the "Common Validation Options", paste in your document, and validate.

#### Run FHIR validator locally
There is a Java version of the FHIR validator that can be run locally.  Information is available on how to do this at [Using the FHIR Validator](https://confluence.hl7.org/display/FHIR/Using+the+FHIR+Validator).  An example command line for running it is:

java -jar validator_cli.jar -ig hl7.cda.us.ccda#current -profile http://hl7.org/cda/us/ccda/StructureDefinition/specific-document-template document-file-name

#### Incorporate the FHIR validator into your code

There is a [Confluence page](https://confluence.hl7.org/pages/viewpage.action?pageId=35718864#ProfileTooling-ValidatingResourcesagainstthespecificationandProfiles) that addresses how to incorporate the FHIR validator into your code.

### Validate C-CDA Documents Using Schematron
For those who prefer Schematron validation for C-CDA documents, HL7 created an [open-source tool](https://github.com/HL7/fhir-cda-validation) which generates Schematron and other validation files for implementation guides created with FHIR StructureDefinitions. While we plan to integrate this functionality into the IG Publisher in the future, you can currently find C-CDA Schematron in the implementation guide's [GitHub repository](https://github.com/HL7/CDA-ccda/releases/).

To learn more about how the Schematron is generated and how other CDA implementation guides using FHIR StructureDefinitions can utilize it, refer to the [Confluence Documentation](https://confluence.hl7.org/display/SD/FHIR-CDA-Validation).
