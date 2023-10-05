Alias: $LogicalTarget = http://hl7.org/fhir/tools/StructureDefinition/logical-target
Alias: $DAR = http://hl7.org/fhir/StructureDefinition/data-absent-reason

// Insert the logical-target extension with DAR = NA to hide the "This logical model cannot be the target of a reference"
RuleSet: LogicalModelNA
* ^extension[$LogicalTarget].valueBoolean.extension[$DAR].valueCode = #not-applicable


// Creates an error-level constraint. Pass strings unquoted. If they contain , or ) surround the string with [[ ]] 
RuleSet: ConstraintError(key, human, expression)
* insert ConstraintErrorEmpty({key}, [[{human}]])
* ^constraint[=].expression = "{expression}"

// Creates an error-level constraint with no expression
RuleSet: ConstraintErrorEmpty(key, human)
* ^constraint[+].key = "{key}"
* ^constraint[=].severity = #error
* ^constraint[=].human = "{human}"

// Creates a warning-level constraint. Pass strings unquoted. If they contain , or ) surround the string with [[ ]] 
RuleSet: ConstraintWarning(key, human, expression)
* insert ConstraintWarningEmpty({key}, [[{human}]])
* ^constraint[=].expression = "{expression}"

// Creates an error-level constraint with no expression
RuleSet: ConstraintWarningEmpty(key, human)
* ^constraint[+].key = "{key}"
* ^constraint[=].severity = #warning
* ^constraint[=].human = "{human}"


// CDA Section common constraints
RuleSet: Section(loinc, title, templateId, extension)
* insert LogicalModelNA
* ^identifier.value = "urn:hl7ii:{templateId}:{extension}"
* ^version = "{extension}"
* templateId ^slicing.discriminator[0].type = #value
  * ^slicing.discriminator[=].path = "root"
  * ^slicing.discriminator[+].type = #value
  * ^slicing.discriminator[=].path = "extension"
  * ^slicing.rules = #open
* templateId contains section 1..1
* templateId[section]
  * root 1..1
  * root = "{templateId}"
  * extension 1..1
  * extension = "{extension}"
* code 1..1
  * ^short = "{title}"
  * code 1..1
  * code = {loinc}
  * codeSystem 1..1
  * codeSystem = "2.16.840.1.113883.6.1"
* title 1..1
* text 1..1

// Copy of Section - but with no extension! (Gradually phase out, probably, by replace with a call to Section and including an extension)
RuleSet: OldSection(loinc, title, templateId)
* insert LogicalModelNA
* ^identifier.value = "urn:oid:{templateId}"
* templateId ^slicing.discriminator[0].type = #value
  * ^slicing.discriminator[=].path = "root"
  * ^slicing.rules = #open
* templateId contains section 1..1
* templateId[section]
  * root 1..1
  * root = "{templateId}"
  * extension 0..0
* code 1..1
  * ^short = "{title}"
  * code 1..1
  * code = {loinc}
  * codeSystem 1..1
  * codeSystem = "2.16.840.1.113883.6.1"
* title 1..1
* text 1..1