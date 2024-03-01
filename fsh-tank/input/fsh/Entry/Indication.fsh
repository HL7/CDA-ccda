Profile: Indication
Parent: $Observation
Id: Indication
Title: "Indication"
Description: """This template represents the rationale for an action such as an encounter, a medication administration, or a procedure. The id element can be used to reference a problem recorded elsewhere in the document, or can be used with a code and value to record the problem. Indications for treatment are not laboratory results; rather the problem associated with the laboratory result should be cited (e.g., hypokalemia instead of a laboratory result of Potassium 2.0 mEq/L). Use the Drug Monitoring Act [templateId 2.16.840.1.113883.10.20.22.4.123] to indicate if a particular drug needs special monitoring (e.g., anticoagulant therapy). Use Precondition for Substance Administration [templateId 2.16.840.1.113883.10.20.22.4.25.2] to represent that a medication is to be administered only when the associated criteria are met.

Many templates in C-CDA R2.1 reference the Indications Template. In the next C-CDA release we will update those templates to reference the Indications template.

The Reason 2.16.840.1.113883.10.20.24.3.88:2023-05-01 should used to represent the justification for an action, or for not performing an action, such as patient, system, or non-problem/diagnosis medical-related reasons
Immunization Refusal Reason 2.16.840.1.113883.10.20.22.4.53 should be used to represent the rationale for the patient declining an immunization as the value set is crafted for the immunization use case."""

* insert LogicalModelTemplate(indication, 2.16.840.1.113883.10.20.22.4.19, 2023-05-01)
* insert NarrativeLink

* ^status = #draft
* classCode 1..1
* classCode = #OBS (exactly)
  * ^comment = "SHALL contain exactly one [1..1] @classCode=\"OBS\" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:4537-7480)."
* moodCode 1..1
* moodCode = #EVN (exactly)
  * ^comment = "SHALL contain exactly one [1..1] @moodCode=\"EVN\" (CodeSystem: HL7ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:4537-7481)."
* id 1..*
  * ^short = "If the id element is used to reference a problem recorded elsewhere in the document then this id must equal another entry/id in the same document instance. Application Software must be responsible for resolving the identifier back to its original object and then rendering the information in the correct place in the containing section's narrative text. Its purpose is to obviate the need to repeat the complete XML representation of the referred to entry when relating one entry to another."
  * ^comment = "SHALL contain at least one [1..*] id (CONF:4537-7483)."
* code 1..1
* code from $2.16.840.1.113883.3.88.12.3221.7.2 (preferred)
  * ^comment = "SHALL contain exactly one [1..1] code, which MAY be selected from ValueSet Problem Type (SNOMEDCT) urn:oid:2.16.840.1.113883.3.88.12.3221.7.2 DYNAMIC (CONF:4537-31229)."
* statusCode 1..1
  * ^comment = "SHALL contain exactly one [1..1] statusCode (CONF:4537-7487)."
  * code 1..1
  * code = #completed (exactly)
    * ^comment = "This statusCode SHALL contain exactly one [1..1] @code=\"completed\" Completed (CodeSystem: HL7ActStatus urn:oid:2.16.840.1.113883.5.14 STATIC) (CONF:4537-19105)."
* obeys should-effectiveTime
* effectiveTime 0..1
  * ^comment = "SHOULD contain zero or one [0..1] effectiveTime (CONF:4537-7488)." // auto-should
* value 0..1
* value only $CD
* value from http://hl7.org/fhir/us/core/ValueSet/us-core-condition-code (preferred)
  * ^short = "If the ID element does not reference a problem recorded elsewhere in the document, then observation/value must be populated with a coded entry."
  * ^comment = "MAY contain zero or one [0..1] value with @xsi:type=\"CD\", where the code MAY be selected from ValueSet US Core Condition Codes."