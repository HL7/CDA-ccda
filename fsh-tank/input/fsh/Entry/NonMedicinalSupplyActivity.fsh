Profile: NonMedicinalSupplyActivity
Parent: $Supply
Id: NonMedicinalSupplyActivity
Title: "Non-Medicinal Supply Activity"
Description: "This template represents equipment supplied to the patient (e.g., pumps, inhalers, wheelchairs). Devices applied to, or placed in, the patient are represented with the Product Instance entry contained within a Procedure Activity Procedure (identifier: urn:hl7ii: 2.16.840.1.113883.10.20.22.4.14)"

* insert LogicalModelTemplate(non-medicinal-supply-activity, 2.16.840.1.113883.10.20.22.4.50, 2014-06-09)
* insert NarrativeLink

* classCode 1..1
* classCode = #SPLY (exactly)
  * ^comment = "SHALL contain exactly one [1..1] @classCode=\"SPLY\" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:1098-8745)."
* moodCode 1..1
* moodCode from MoodCodeEvnInt (required)
  * ^comment = "SHALL contain exactly one [1..1] @moodCode, which SHALL be selected from ValueSet MoodCodeEvnInt urn:oid:2.16.840.1.113883.11.20.9.18 STATIC 2011-04-03 (CONF:1098-8746)."
* id 1..*
  * ^comment = "SHALL contain at least one [1..*] id (CONF:1098-8748)."
* statusCode 1..1
  * ^comment = "SHALL contain exactly one [1..1] statusCode (CONF:1098-8749)."
  * code 1..1
  * code from ActStatus (required)
    * ^comment = "This statusCode SHALL contain exactly one [1..1] @code, which SHALL be selected from ValueSet ActStatus urn:oid:2.16.840.1.113883.1.11.15933 DYNAMIC (CONF:1098-32363)."
* effectiveTime 0..1
* effectiveTime only $IVL-TS
  * obeys should-high
  * ^comment = "SHOULD contain zero or one [0..1] effectiveTime (CONF:1098-15498)."
* obeys should-quantity
* quantity 0..1
  * ^comment = "SHOULD contain zero or one [0..1] quantity (CONF:1098-8751)." // auto-should
* participant ^slicing.discriminator[0].type = #value
  * ^slicing.discriminator[=].path = "typeCode"
  * ^slicing.rules = #open
* participant contains participant1 0..1
* participant[participant1] ^comment = "MAY contain zero or one [0..1] participant (CONF:1098-8752) such that it"
  * typeCode 1..1
  * typeCode = #PRD (exactly)
    * ^comment = "SHALL contain exactly one [1..1] @typeCode=\"PRD\" Product (CodeSystem: HL7ParticipationType urn:oid:2.16.840.1.113883.5.90 STATIC) (CONF:1098-8754)."
  * participantRole 1..1
  * participantRole only ProductInstance
    * ^comment = "SHALL contain exactly one [1..1] Product Instance (identifier: urn:oid:2.16.840.1.113883.10.20.22.4.37) (CONF:1098-15900)."
* entryRelationship ^slicing.discriminator[0].type = #profile
  * ^slicing.discriminator[=].path = "act"
  * ^slicing.rules = #open
* entryRelationship contains instruction 0..1
* entryRelationship[instruction] ^comment = "MAY contain zero or one [0..1] entryRelationship (CONF:1098-30277) such that it"
  * typeCode 1..1
  * typeCode = #SUBJ (exactly)
    * ^comment = "SHALL contain exactly one [1..1] @typeCode=\"SUBJ\" (CONF:1098-30278)."
  * inversionInd 1..1
  * inversionInd = true (exactly)
    * ^comment = "SHALL contain exactly one [1..1] @inversionInd=\"true\" (CONF:1098-30279)."
  * act 1..1
  * act only Instruction
    * ^comment = "SHALL contain exactly one [1..1] Instruction (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.4.20:2014-06-09) (CONF:1098-31393)."
