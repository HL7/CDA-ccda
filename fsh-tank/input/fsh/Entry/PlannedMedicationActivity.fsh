Profile: PlannedMedicationActivity
Parent: $SubstanceAdministration
Id: PlannedMedicationActivity
Title: "Planned Medication Activity"
Description: "This template represents planned medication activities. The priority of the medication activity to the patient and provider is communicated through Priority Preference. The effectiveTime indicates the time when the medication activity is intended to take place. The authorTime indicates when the documentation of the plan occurred."

* insert LogicalModelTemplate(planned-med-activity, 2.16.840.1.113883.10.20.22.4.42, 2014-06-09)
* insert NarrativeLink

* classCode 1..1
* classCode = #SBADM (exactly)
  * ^comment = "SHALL contain exactly one [1..1] @classCode=\"SBADM\" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:1098-8572)."
* moodCode 1..1
* moodCode from $2.16.840.1.113883.11.20.9.24 (required)
  * ^comment = "SHALL contain exactly one [1..1] @moodCode, which SHALL be selected from ValueSet Planned moodCode (SubstanceAdministration/Supply) urn:oid:2.16.840.1.113883.11.20.9.24 STATIC 2011-09-30 (CONF:1098-8573)."
* id 1..*
  * ^comment = "SHALL contain at least one [1..*] id (CONF:1098-8575)."
* statusCode 1..1
  * ^comment = "SHALL contain exactly one [1..1] statusCode (CONF:1098-32087)."
  * code 1..1
  * code = #active (exactly)
    * ^comment = "This statusCode SHALL contain exactly one [1..1] @code=\"active\" Active (CodeSystem: HL7ActStatus urn:oid:2.16.840.1.113883.5.14) (CONF:1098-32088)."
* effectiveTime 1..1
* effectiveTime only $IVL-TS
  * ^short = "The effectiveTime in a planned medication activity represents the time that the medication activity should occur."
  * ^comment = "SHALL contain exactly one [1..1] effectiveTime (CONF:1098-30468) such that it"
* repeatNumber 0..1
  * ^short = "In a Planned Medication Activity, repeatNumber defines the number of allowed administrations. For example, a repeatNumber of \"3\" means that the substance can be administered up to 3 times."
  * ^comment = "MAY contain zero or one [0..1] repeatNumber (CONF:1098-32066)."
* routeCode 0..1
* routeCode from $2.16.840.1.113883.3.88.12.3221.8.7 (required)
  * ^comment = "MAY contain zero or one [0..1] routeCode, which SHALL be selected from ValueSet SPL Drug Route of Administration Terminology urn:oid:2.16.840.1.113883.3.88.12.3221.8.7 DYNAMIC (CONF:1098-32067)."
  * obeys should-translation
  * translation 0..*
  * translation from $2.16.840.1.113762.1.4.1099.12 (preferred)
    * ^comment = "The routeCode, if present, SHOULD contain zero or more [0..*] translation, which SHOULD be selected from ValueSet Medication Route urn:oid:2.16.840.1.113762.1.4.1099.12 DYNAMIC (CONF:1098-32952)." // man-should
* approachSiteCode 0..*
* approachSiteCode from $2.16.840.1.113883.3.88.12.3221.8.9 (required)
  * ^comment = "MAY contain zero or more [0..*] approachSiteCode, which SHALL be selected from ValueSet Body Site Value Set urn:oid:2.16.840.1.113883.3.88.12.3221.8.9 DYNAMIC (CONF:1098-32078)."
* obeys dose-unit-or-admin-unit
* doseQuantity 0..1
  * ^comment = "MAY contain zero or one [0..1] doseQuantity (CONF:1098-32068)."
  * obeys should-unit
  * unit 0..1
  * unit from UnitsOfMeasureCaseSensitive (preferred)
    * ^short = "NOTE: The base CDA R2.0 standard requires @unit to be drawn from UCUM, and best practice is to use case sensitive UCUM units"
    * ^comment = "The doseQuantity, if present, SHOULD contain zero or one [0..1] @unit, which SHOULD be selected from ValueSet UnitsOfMeasureCaseSensitive urn:oid:2.16.840.1.113883.1.11.12839 DYNAMIC (CONF:1098-32133)." // man-should
* rateQuantity 0..1
  * ^comment = "MAY contain zero or one [0..1] rateQuantity (CONF:1098-32079)."
  * obeys should-unit
  * unit 0..1
  * unit from UnitsOfMeasureCaseSensitive (required)
    * ^short = "NOTE: The base CDA R2.0 standard requires @unit to be drawn from UCUM, and best practice is to use case sensitive UCUM units"
    * ^comment = "The rateQuantity, if present, SHOULD contain zero or one [0..1] @unit, which SHALL be selected from ValueSet UnitsOfMeasureCaseSensitive urn:oid:2.16.840.1.113883.1.11.12839 DYNAMIC (CONF:1098-32134)." // man-should
* maxDoseQuantity 0..1
  * ^comment = "MAY contain zero or one [0..1] maxDoseQuantity (CONF:1098-32080)."
* administrationUnitCode 0..1
* administrationUnitCode from AdministrationUnitDoseForm (required)
  * ^comment = "MAY contain zero or one [0..1] administrationUnitCode, which SHALL be selected from ValueSet AdministrationUnitDoseForm urn:oid:2.16.840.1.113762.1.4.1021.30 DYNAMIC (CONF:1098-32081)."
* consumable 1..1
  * ^comment = "SHALL contain exactly one [1..1] consumable (CONF:1098-32082)."
  * manufacturedProduct 1..1
  * manufacturedProduct only MedicationInformation
    * ^comment = "This consumable SHALL contain exactly one [1..1] Medication Information (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.4.23:2014-06-09) (CONF:1098-32083)."
* performer 0..*
  * ^short = "The clinician who is expected to perform the medication activity could be identified using substanceAdministration/performer."
  * ^comment = "MAY contain zero or more [0..*] performer (CONF:1098-30470)."
* obeys should-author
* author 0..1
* author only AuthorParticipation
  * ^short = "The author in a planned medication activity represents the clinician who is requesting or planning the medication activity."
  * ^comment = "SHOULD contain zero or one [0..1] Author Participation (identifier: urn:oid:2.16.840.1.113883.10.20.22.4.119) (CONF:1098-32046)." // man-should
* entryRelationship ^slicing.discriminator[0].type = #profile
  * ^slicing.discriminator[=].path = "act"
  * ^slicing.discriminator[+].type = #profile
  * ^slicing.discriminator[=].path = "observation"
  * ^slicing.rules = #open
  * ^short = "The following entryRelationship captures any instructions associated with the planned medication activity."
* entryRelationship contains
    priorityPreference 0..* and
    indication 0..* and
    instruction 0..*
* entryRelationship[priorityPreference] ^short = "The following entryRelationship represents the priority that a patient or a provider places on the planned medication activity."
  * ^comment = "MAY contain zero or more [0..*] entryRelationship (CONF:1098-31104) such that it"
  * typeCode 1..1
  * typeCode = #REFR (exactly)
    * ^comment = "SHALL contain exactly one [1..1] @typeCode=\"REFR\" Refers to (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:1098-31105)."
  * observation 1..1
  * observation only PriorityPreference
    * ^comment = "SHALL contain exactly one [1..1] Priority Preference (identifier: urn:oid:2.16.840.1.113883.10.20.22.4.143) (CONF:1098-31106)."
* entryRelationship[indication] ^short = "The following entryRelationship represents the indication for the planned medication activity."
  * ^comment = "MAY contain zero or more [0..*] entryRelationship (CONF:1098-32069) such that it"
  * typeCode 1..1
  * typeCode = #RSON (exactly)
    * ^comment = "SHALL contain exactly one [1..1] @typeCode=\"RSON\" Has Reason (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:1098-32070)."
  * observation 1..1
  * observation only Indication
    * ^comment = "SHALL contain exactly one [1..1] Indication (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.4.19:2014-06-09) (CONF:1098-32071)."
* entryRelationship[instruction] ^short = "The following entryRelationship captures any instructions associated with the planned medication activity."
  * ^comment = "MAY contain zero or more [0..*] entryRelationship (CONF:1098-32072) such that it"
  * typeCode 1..1
  * typeCode = #SUBJ (exactly)
    * ^comment = "SHALL contain exactly one [1..1] @typeCode=\"SUBJ\" Has Subject (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:1098-32073)."
  * act 1..1
  * act only Instruction
    * ^comment = "SHALL contain exactly one [1..1] Instruction (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.4.20:2014-06-09) (CONF:1098-32074)."
* precondition 0..*
  * ^comment = "MAY contain zero or more [0..*] precondition (CONF:1098-32084)."
  * typeCode 1..1
  * typeCode = #PRCN (exactly)
    * ^comment = "The precondition, if present, SHALL contain exactly one [1..1] @typeCode=\"PRCN\" Precondition (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:1098-32085)."
  * criterion 1..1
  * criterion only PreconditionforSubstanceAdministration
    * ^comment = "The precondition, if present, SHALL contain exactly one [1..1] Precondition for Substance Administration (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.4.25:2014-06-09) (CONF:1098-32086)."