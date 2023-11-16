### What happened to the Schematron?
With the change to using the FHIR StructureDefinition, schematrons are not being produced for new version of the C-CDA specification.  The CDA schema is still appropriate for validating the structure of the C-CDA document.  Instead of using schematron for testing the constraints, C-CDA documents should be validated using the FHIR validator.

### Validate C-CDA Documents Using FHIR Tooling
The FHIR validator can be used to validate C-CDA documents.  There are three ways of using the FHIR validator.

#### Web version of the FHIR Validator
There is a web version of the FHIR validator available at [validator.fhir.org](https://validator.fhir.org).  Simply select "US CCDA Document" from the "Common Validation Options", paste in your document, and validate.

#### Run FHIR validator locally
There is a Java version of the FHIR validator that can be run locally.  Information is available on how to do this at [Using the FHIR Validator](https://confluence.hl7.org/display/FHIR/Using+the+FHIR+Validator).  An example command line for running it is:

java -jar validator_cli.jar -ig hl7.cda.us.ccda#current -profile http://hl7.org/cda/us/ccda/StructureDefinition/specific-document-template document-file-name

#### Incorporate the FHIR validator into your code

There is a [Confluence page](https://confluence.hl7.org/pages/viewpage.action?pageId=35718864#ProfileTooling-ValidatingResourcesagainstthespecificationandProfiles) that addresses how to incorporate the FHIR validator into your code.