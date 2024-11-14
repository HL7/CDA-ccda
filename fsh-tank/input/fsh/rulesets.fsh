////////////////////////////////////////////////////////////
//                                                        //
//                  USCDI extension                       //
//                                                        //
////////////////////////////////////////////////////////////

// Flag an element as meeting a USCDI requirement. If label contains, or ), surround the text witn [[ ]]
RuleSet: USCDI(label)
* ^short = "\ud835\udde8\ud835\udde6\ud835\uddd6\ud835\uddd7\ud835\udddc: {label}"
* ^extension[http://hl7.org/fhir/us/core/StructureDefinition/uscdi-requirement].valueBoolean = true


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

// Assign a fixed LOINC code
RuleSet: CodedLoinc(code, display)
* ^short = "{display}"
* code 1..1
* code = #{code}
* codeSystem 1..1
* codeSystem = "2.16.840.1.113883.6.1"
  * ^short = "LOINC"

// Assign a fixed SNOMED code
RuleSet: CodedSnomed(code, display)
* ^short = "{display}"
* code 1..1
* code = #{code}
* codeSystem 1..1
* codeSystem = "2.16.840.1.113883.6.96"
  * ^short = "SNOMED CT"

// Equivalent to the old SHALL contain @code
RuleSet: BindAtCode(valueSet, strength)
* code 1..1
* nullFlavor 0..0
* code from {valueSet} ({strength})

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


// Inserts a "SHOULD" on the <text> element down to @value, and then requires that @value starts with #
RuleSet: NarrativeLink
* obeys should-text-ref-value
* text 0..1
  * ^short = "SHOULD reference the portion of section narrative text corresponding to this entry"
  * reference 0..1
    * obeys value-starts-octothorpe
Invariant: should-text-ref-value
Severity: #warning
Description: "SHOULD contain text/reference/@value"
Expression: "text.reference.value.exists()"
Invariant: value-starts-octothorpe
Severity: #error
Description: "If reference/@value is present, it SHALL begin with a '#' and SHALL point to its corresponding narrative"
Expression: "value.exists() implies value.startsWith('#')"

// Similar to NarrativeLink, but for <originalText> elements
RuleSet: NarrativeOriginalText
* obeys should-otext-ref-value
* originalText 0..1
  * ^short = "SHOULD reference the portion of narrative corresponding to this code"
  * reference 0..1
    * obeys value-starts-octothorpe
Invariant: should-otext-ref-value
Severity: #warning
Description: "SHOULD contain originalText/reference/@value"
Expression: "originalText.reference.value.exists()"

// Similar to NarrativeLink, but for <originalText> elements
RuleSet: NarrativeLinkOrganizer
* obeys should-sdtctext-ref-value
* sdtcText 0..1
  * ^short = "SHOULD reference the portion of section narrative text corresponding to this entry"
  * reference 0..1
    * obeys value-starts-octothorpe
Invariant: should-sdtctext-ref-value
Severity: #warning
Description: "SHOULD contain text/reference/@value"
Expression: "sdtcText.reference.value.exists()"

// Use on IVL_TS / IVL_INT / etc when you want to only allow the value (cleaner than a bunch of 0..0's)
RuleSet: IntervalValueOnly
* obeys value-only
* value 0..1
  * ^short = "value should be used instead of low/high"
Invariant: value-only
Severity: #error
Description: "Interval fields SHALL NOT be present"
Expression: "(low | high | width | center).empty()"

RuleSet: IdentifierURI(value)
* ^identifier[+].value = "{value}"
* ^identifier[=].system = "urn:ietf:rfc:3986"

////////////////////////////////////////////////////////////
//                                                        //
//              Common Rules for all Models               //
//                                                        //
////////////////////////////////////////////////////////////

// Common rules for basically every LogicalModel
RuleSet: LogicalModelTemplate(sliceName, root, extension)
* insert LogicalModelNA
* insert IdentifierURI(urn:hl7ii:{root}:{extension})
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
* insert IdentifierURI(urn:oid:{root})
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

RuleSet: DocumentCategory(title, loinc, loincName)
* sdtcCategory 0..*
  * insert DocCatShort({title}, {loinc}, {loincName}, a)
* obeys category-{loinc}

RuleSet: DocCatShort(title, loinc, loincName, aORan)
* ^short = "Used to categorize the document as {aORan} {title}. If present, there SHALL be a category of {loinc} ({loincName})."



Alias: $LogicalTarget = http://hl7.org/fhir/tools/StructureDefinition/logical-target
Alias: $DAR = http://hl7.org/fhir/StructureDefinition/data-absent-reason
// Insert the logical-target extension with DAR = NA to hide the "This logical model cannot be the target of a reference"
RuleSet: LogicalModelNA
* ^extension[$LogicalTarget].valueBoolean.extension[$DAR].valueCode = #not-applicable