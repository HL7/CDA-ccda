Profile: EntryReference
Parent: $Act
Id: EntryReference
Title: "Entry Reference"
Description: """This template represents the act of referencing another entry in the same CDA document instance. Its purpose is to remove the need to repeat the complete XML representation of the referred entry when relating one entry to another. This template can be used to reference many types of Act class derivations, such as encounters, observations, procedures etc., as it is often necessary when authoring CDA documents to repeatedly reference other Acts of these types. For example, in a Care Plan it is necessary to repeatedly relate Health Concerns, Goals, Activities and Outcomes.

The id is required and must be the same id as the entry/id it is referencing. The id cannot be a null value. Act/Code is set to nullFlavor="NP" (Not Present). This means the value is not present in the message (in act/Code)."""

* insert LogicalModelTemplateRootOnly(entryReference, 2.16.840.1.113883.10.20.22.4.122)

* classCode 1..1
* classCode = #ACT (exactly)
  * ^comment = "SHALL contain exactly one [1..1] @classCode=\"ACT\" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:1098-31485)."
* moodCode 1..1
* moodCode = #EVN (exactly)
  * ^comment = "SHALL contain exactly one [1..1] @moodCode=\"EVN\" (CodeSystem: HL7ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:1098-31486)."
* id 1..*
  * ^short = "The ID must equal another entry/id in the same document instance. Application Software must be responsible for resolving the identifier back to its original object and then rendering the information in the correct place in the containing section's narrative text. The ID cannot have Null value (e.g., nullFlavor is not allowed)."
  * ^comment = "SHALL contain at least one [1..*] id (CONF:1098-31489)."
* code 1..1
  * ^comment = "SHALL contain exactly one [1..1] code (CONF:1098-31490)."
  * nullFlavor 1..1
  * nullFlavor = #NP (exactly)
    * ^comment = "This code SHALL contain exactly one [1..1] @nullFlavor=\"NP\" Not Present (CodeSystem: HL7NullFlavor urn:oid:2.16.840.1.113883.5.1008) (CONF:1098-31491)."
* statusCode 1..1
  * ^comment = "SHALL contain exactly one [1..1] statusCode (CONF:1098-31498)."
  * code 0..1
  * code = #completed (exactly)
    * ^comment = "This statusCode MAY contain zero or one [0..1] @code=\"completed\" (CodeSystem: HL7ActStatus urn:oid:2.16.840.1.113883.5.14) (CONF:1098-31499)."