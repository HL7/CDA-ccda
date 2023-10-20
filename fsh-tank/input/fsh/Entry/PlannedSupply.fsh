Profile: PlannedSupply
Parent: $Supply
Id: PlannedSupply
Title: "Planned Supply"
Description: """This template represents both medicinal and non-medicinal supplies ordered, requested, or intended for the patient (e.g., medication prescription, order for wheelchair). The importance of the supply order or request to the patient and provider may be indicated in the Priority Preference. 
The effective time indicates the time when the supply is intended to take place and author time indicates when the documentation of the plan occurred. The Planned Supply template may also indicate the potential insurance coverage for the procedure. 
Depending on the type of supply, the product or participant will be either a Medication Information product (medication), an Immunization Medication Information product (immunization), or a Product Instance participant (device/equipment)."""

* insert LogicalModelTemplate(planned-supply, 2.16.840.1.113883.10.20.22.4.43, 2014-06-09)

* classCode 1..1
* classCode = #SPLY (exactly)
  * ^comment = "SHALL contain exactly one [1..1] @classCode=\"SPLY\" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:1098-8577)."
* moodCode 1..1
* moodCode from $2.16.840.1.113883.11.20.9.24 (required)
  * ^comment = "SHALL contain exactly one [1..1] @moodCode, which SHALL be selected from ValueSet Planned moodCode (SubstanceAdministration/Supply) urn:oid:2.16.840.1.113883.11.20.9.24 STATIC 2011-09-30 (CONF:1098-8578)."
* id 1..*
  * ^comment = "SHALL contain at least one [1..*] id (CONF:1098-8580)."
* statusCode 1..1
  * ^comment = "SHALL contain exactly one [1..1] statusCode (CONF:1098-30458)."
  * code 1..1
  * code = #active (exactly)
    * ^comment = "This statusCode SHALL contain exactly one [1..1] @code=\"active\" Active (CodeSystem: HL7ActStatus urn:oid:2.16.840.1.113883.5.14) (CONF:1098-32047)."
* obeys should-effectiveTime
* effectiveTime 0..1
  * ^short = "The effectiveTime in a planned supply represents the time that the supply should occur."
  * ^comment = "SHOULD contain zero or one [0..1] effectiveTime (CONF:1098-30459)." // auto-should
* repeatNumber 0..1
  * ^short = "In a Planned Supply, repeatNumber indicates the number of times the supply event can occur. For example, if a medication is filled at a pharmacy and the prescription may be refilled 3 more times, the supply RepeatNumber equals 4."
  * ^comment = "MAY contain zero or one [0..1] repeatNumber (CONF:1098-32063)."
* quantity 0..1
  * ^comment = "MAY contain zero or one [0..1] quantity (CONF:1098-32064)."
* obeys should-product
* product 0..1
  * obeys 1098-32092
  * ^short = "A product is recommended or even required under certain implementations. This IG makes product as recommended (SHOULD). "
  * ^comment = "MAY contain zero or one [0..1] product (CONF:1098-32049 and CONF:1098-32051 and CONF:1098-32325)."
  * manufacturedProduct 1..1
  * manufacturedProduct only MedicationInformation or ImmunizationMedicationInformation or $ManufacturedProduct
* performer 0..*
  * ^short = "The clinician who is expected to perform the supply could be identified using supply/performer."
  * ^comment = "MAY contain zero or more [0..*] performer (CONF:1098-32048)."
* author 0..1
* author only AuthorParticipation
  * ^short = "The author in a supply represents the clinician who is requesting or planning the supply."
  * ^comment = "SHOULD contain zero or one [0..1] Author Participation (identifier: urn:oid:2.16.840.1.113883.10.20.22.4.119) (CONF:1098-31129)."
* participant ^slicing.discriminator[0].type = #profile
  * ^slicing.discriminator[=].path = "participantRole"
  * ^slicing.rules = #open
  * ^short = "This participant represents a device that is ordered, requested or intended for the patient."
* participant contains productInstance 0..1
* participant[productInstance] obeys 1098-32096
  * ^short = "This participant represents a device that is ordered, requested or intended for the patient."
  * ^comment = "MAY contain zero or one [0..1] participant (CONF:1098-32094) such that it"
  * participantRole 1..1
  * participantRole only ProductInstance
    * ^comment = "SHALL contain exactly one [1..1] Product Instance (identifier: urn:oid:2.16.840.1.113883.10.20.22.4.37) (CONF:1098-32095)."
* entryRelationship ^slicing.discriminator[0].type = #profile
  * ^slicing.discriminator[=].path = "act"
  * ^slicing.discriminator[+].type = #profile
  * ^slicing.discriminator[=].path = "observation"
  * ^slicing.rules = #open
  * ^short = "The following entryRelationship represents the insurance coverage the patient may have for the supply."
* entryRelationship contains
    priorityPreference 0..* and
    indication 0..* and
    instruction 0..* and
    plannedCoverage 0..*
* entryRelationship[priorityPreference] ^short = "The following entryRelationship represents the priority that a patient or a provider places on the supply."
  * ^comment = "MAY contain zero or more [0..*] entryRelationship (CONF:1098-31110) such that it"
  * typeCode 1..1
  * typeCode = #REFR (exactly)
    * ^comment = "SHALL contain exactly one [1..1] @typeCode=\"REFR\" Refers to (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:1098-31111)."
  * observation 1..1
  * observation only PriorityPreference
    * ^comment = "SHALL contain exactly one [1..1] Priority Preference (identifier: urn:oid:2.16.840.1.113883.10.20.22.4.143) (CONF:1098-31112)."
* entryRelationship[indication] ^short = "The following entryRelationship represents the indication for the supply."
  * ^comment = "MAY contain zero or more [0..*] entryRelationship (CONF:1098-32054) such that it"
  * typeCode 1..1
  * typeCode = #RSON (exactly)
    * ^comment = "SHALL contain exactly one [1..1] @typeCode=\"RSON\" Has Reason (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:1098-32055)."
  * observation 1..1
  * observation only Indication
    * ^comment = "SHALL contain exactly one [1..1] Indication (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.4.19:2014-06-09) (CONF:1098-32056)."
* entryRelationship[instruction] ^short = "The following entryRelationship captures any instructions associated with the planned supply."
  * ^comment = "MAY contain zero or more [0..*] entryRelationship (CONF:1098-32057) such that it"
  * typeCode 1..1
  * typeCode = #SUBJ (exactly)
    * ^comment = "SHALL contain exactly one [1..1] @typeCode=\"SUBJ\" Has Subject (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:1098-32058)."
  * act 1..1
  * act only Instruction
    * ^comment = "SHALL contain exactly one [1..1] Instruction (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.4.20:2014-06-09) (CONF:1098-32059)."
* entryRelationship[plannedCoverage] ^short = "The following entryRelationship represents the insurance coverage the patient may have for the supply."
  * ^comment = "MAY contain zero or more [0..*] entryRelationship (CONF:1098-32060) such that it"
  * typeCode 1..1
  * typeCode = #COMP (exactly)
    * ^comment = "SHALL contain exactly one [1..1] @typeCode=\"COMP\" Has Component (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:1098-32061)."
  * act 1..1
  * act only PlannedCoverage
    * ^comment = "SHALL contain exactly one [1..1] Planned Coverage (identifier: urn:oid:2.16.840.1.113883.10.20.22.4.129) (CONF:1098-32062)."

Invariant: 1098-32092
Description: "If the product is Medication Information (2.16.840.1.113883.10.20.22.4.23.2) or Immunization Medication Information (2.16.840.1.113883.10.20.22.4.54.2) then the participant **SHALL NOT** be Product Instance (CONF:1098-32092 and CONF:1098-32093)."
Severity: #error

Invariant: 1098-32096
Description: "If the participant is Product Instance then the product **SHALL NOT** be Medication Information (2.16.840.1.113883.10.20.22.4.23.2) and the product **SHALL NOT** be Immunization Medication Information (2.16.840.1.113883.10.20.22.4.54.2) (CONF:1098-32096)."
Severity: #error