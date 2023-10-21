////////////////////////////////////////////////////////////
//                                                        //
//                  USCDI extension                       //
//                                                        //
////////////////////////////////////////////////////////////

// Flag an element as meeting a USCDI requirement. If label contains, or ), surround the text witn [[ ]]
RuleSet: USCDI(label)
* ^short = "(USCDI) {label}"
* ^extension[+].url = "http://hl7.org/fhir/us/core/StructureDefinition/uscdi-requirement"
* ^extension[=].valueBoolean = true


////////////////////////////////////////////////////////////
//                                                        //
//                      Misc Rulesets                     //
//                                                        //
////////////////////////////////////////////////////////////

// Add an additional binding to a bindable element. short must be text; documentation can be markdown. If either contain , or ) surround with [[ ]]
RuleSet: AdditionalBinding(purpose, valueSet, short, documentation)
* ^binding.additional[+].purpose = #{purpose}
* ^binding.additional[=].valueSet = {valueSet}
* ^binding.additional[=].shortDoco = "{short}"
* ^binding.additional[=].documentation = "{documentation}"

// Flag an element as meeting a USCDI requirement. If label contains, or ), surround the text witn [[ ]]
RuleSet: CodedLoinc(code, display)
* ^short = "{display}"
* code = #{code}
* codeSystem = "2.16.840.1.113883.6.1"

RuleSet: CodedSnomed(code, display)
* ^short = "{display}"
* code = #{code}
* codeSystem = "2.16.840.1.113883.6.96"

// Use to require code or nullFlavor on an element - makes the display look nice
RuleSet: ShallCodeOrNullFlavor
* code 0..1
  * ^comment = "Either code or nullFlavor MUST be present"
* nullFlavor 0..1
  * ^comment = "Either code or nullFlavor MUST be present"
* obeys shall-code-or-nullflavor
Invariant: shall-code-or-nullflavor
Severity: #error
Description: "SHALL contain either a @code attribute or a @nullFlavor attribute, but not both."
Expression: "(code | nullFlavor).count() = 1"

////////////////////////////////////////////////////////////
//                                                        //
//          Constrinat (Invariant) Generation             //
//                                                        //
////////////////////////////////////////////////////////////

// Creates an error-level constraint. Pass strings unquoted. If they contain , or ) surround the string with [[ ]] 
RuleSet: ConstraintError(key, human, expression)
* ^constraint[+].key = "{key}"
* ^constraint[=].severity = #error
* ^constraint[=].human = "{human}"
* ^constraint[=].expression = "{expression}"

// Creates a warning-level constraint. Pass strings unquoted. If they contain , or ) surround the string with [[ ]] 
RuleSet: ConstraintWarning(key, human, expression)
* ^constraint[+].key = "{key}"
* ^constraint[=].severity = #warning
* ^constraint[=].human = "{human}"
* ^constraint[=].expression = "{expression}"


////////////////////////////////////////////////////////////
//                                                        //
//              Common Rules for all Models               //
//                                                        //
////////////////////////////////////////////////////////////

// Common rules for basically every LogicalModel
RuleSet: LogicalModelTemplate(sliceName, root, extension)
* insert LogicalModelNA
* ^identifier.value = "urn:hl7ii:{root}:{extension}"
* ^version = "{extension}"
* templateId ^slicing.discriminator[0].type = #value
  * ^slicing.discriminator[=].path = "root"
  * ^slicing.discriminator[+].type = #value
  * ^slicing.discriminator[=].path = "extension"
  * ^slicing.rules = #open
* templateId contains {sliceName} 1..1
* templateId[{sliceName}]
  * root 1..1
  * root = "{root}"
  * extension 1..1
  * extension = "{extension}"

// Variant for old models with no extension (Gradually phase out and replace with above)
RuleSet: LogicalModelTemplateRootOnly(sliceName, root)
* insert LogicalModelNA
* ^identifier.value = "urn:oid:{root}"
* templateId ^slicing.discriminator[0].type = #value
  * ^slicing.discriminator[=].path = "root"
  * ^slicing.rules = #open
* templateId contains {sliceName} 1..1
* templateId[{sliceName}]
  * root 1..1
  * root = "{root}"
  * extension 0..0

// CDA Section common constraints - this is the most-likely-appropriate RuleSet
RuleSet: Section(loinc, title, templateId, extension)
* insert LogicalModelTemplate(section, {templateId}, {extension})
* insert _SectionCommon
* code ^short = "{title}"
  * code = {loinc}

RuleSet: _SectionNoCode(templateId, extension)
* insert LogicalModelTemplate(section, {templateId}, {extension})
* insert _SectionCommon

// Copy of Section - but with no extension! (Gradually phase out, probably, by replacing with a call to Section and including an extension)
RuleSet: OldSection(loinc, title, templateId)
* insert LogicalModelTemplateRootOnly(section, {templateId})
* insert _SectionCommon
* code ^short = "{title}"
  * code = {loinc}

// Common rules for each of the above RuleSets - don't call directly
RuleSet: _SectionCommon
* code 1..1
  * code 1..1
  * codeSystem 1..1
  * codeSystem = "2.16.840.1.113883.6.1"
* title 1..1
* text 1..1




Alias: $LogicalTarget = http://hl7.org/fhir/tools/StructureDefinition/logical-target
Alias: $DAR = http://hl7.org/fhir/StructureDefinition/data-absent-reason
// Insert the logical-target extension with DAR = NA to hide the "This logical model cannot be the target of a reference"
RuleSet: LogicalModelNA
* ^extension[$LogicalTarget].valueBoolean.extension[$DAR].valueCode = #not-applicable