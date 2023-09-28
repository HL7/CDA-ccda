Profile: ImmunizationActivity
Parent: $SubstanceAdministration
Id: ImmunizationActivity
Title: "Immunization Activity"
Description: """An Immunization Activity describes immunization substance administrations that have actually occurred or are intended to occur. Immunization Activities in "INT" mood are reflections of immunizations a clinician intends a patient to receive. Immunization Activities in "EVN" mood reflect immunizations actually received.

An Immunization Activity is very similar to a Medication Activity with some key differentiators. The drug code system is constrained to CVX codes. Administration timing is less complex. Patient refusal reasons should be captured. All vaccines administered should be fully documented in the patient's permanent medical record. Healthcare providers who administer vaccines covered by the National Childhood Vaccine Injury Act are required to ensure that the permanent medical record of the recipient indicates: 

1. Date of administration
2. Vaccine manufacturer
3. Vaccine lot number
4. Name and title of the person who administered the vaccine and the address of the clinic or facility where the permanent record will reside
5. Vaccine information statement (VIS)

a. Date printed on the VIS
b. Date VIS given to patient or parent/guardian.

This information should be included in an Immunization Activity when available. (Reference: [https://www.cdc.gov/vaccines/pubs/pinkbook/downloads/appendices/c/vis-instruct.pdf])"""
* insert LogicalModelNA
* ^identifier.value = "urn:hl7ii:2.16.840.1.113883.10.20.22.4.52:2015-08-01"
* ^version = "2015-08-01"
* classCode 1..1
  * ^comment = "SHALL contain exactly one [1..1] @classCode=\"SBADM\" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:1198-8826)."
* moodCode 1..1
* moodCode from MoodCodeEvnInt (required)
  * ^comment = "SHALL contain exactly one [1..1] @moodCode, which SHALL be selected from ValueSet MoodCodeEvnInt urn:oid:2.16.840.1.113883.11.20.9.18 STATIC (CONF:1198-8827)."
* templateId ^slicing.discriminator[0].type = #value
  * ^slicing.discriminator[=].path = "root"
  * ^slicing.discriminator[+].type = #value
  * ^slicing.discriminator[=].path = "extension"
  * ^slicing.rules = #open
* templateId contains primary 1..1
* templateId[primary] ^comment = "SHALL contain exactly one [1..1] templateId (CONF:1198-8828) such that it"
  * root 1..1
  * root = "2.16.840.1.113883.10.20.22.4.52"
    * ^comment = "SHALL contain exactly one [1..1] @root=\"2.16.840.1.113883.10.20.22.4.52\" (CONF:1198-10498)."
  * extension 1..1
  * extension = "2015-08-01"
    * ^comment = "SHALL contain exactly one [1..1] @extension=\"2015-08-01\" (CONF:1198-32528)."
* id 1..*
  * ^comment = "SHALL contain at least one [1..*] id (CONF:1198-8829)."
* code 0..1
  * ^short = "SubstanceAdministration.code is an optional field. Per HL7 Pharmacy Committee, \"this is intended to further specify the nature of the substance administration act. To date the committee has made no use of this attribute\". Because the type of substance administration is generally implicit in the routeCode, in the consumable participant, etc., the field is generally not used and there is no defined value set."
  * ^comment = "MAY contain zero or one [0..1] code (CONF:1198-8830)."
* negationInd 1..1
  * ^short = "Use negationInd=\"true\" to indicate that the immunization was not given."
  * ^comment = "SHALL contain exactly one [1..1] @negationInd (CONF:1198-8985)."
* statusCode 1..1
  * ^comment = "SHALL contain exactly one [1..1] statusCode (CONF:1198-8833)."
  * code 1..1
  * code from ActStatus (required)
    * ^comment = "This statusCode SHALL contain exactly one [1..1] @code, which SHALL be selected from ValueSet ActStatus urn:oid:2.16.840.1.113883.1.11.15933 DYNAMIC (CONF:1198-32359)."
* effectiveTime 1..1
  * ^comment = "SHALL contain exactly one [1..1] effectiveTime (CONF:1198-8834)."
* repeatNumber 0..1
  * ^short = "In \"INT\" (intent) mood, the repeatNumber defines the number of allowed administrations. For example, a repeatNumber of \"3\" means that the substance can be administered up to 3 times. In \"EVN\" (event) mood, the repeatNumber is the number of occurrences. For example, a repeatNumber of \"3\" in a substance administration event means that the current administration is the 3rd in a series."
  * ^comment = "MAY contain zero or one [0..1] repeatNumber (CONF:1198-8838)."
* routeCode 0..1
* routeCode from $2.16.840.1.113883.3.88.12.3221.8.7 (required)
  * ^comment = "MAY contain zero or one [0..1] routeCode, which SHALL be selected from ValueSet SPL Drug Route of Administration Terminology urn:oid:2.16.840.1.113883.3.88.12.3221.8.7 DYNAMIC (CONF:1198-8839)."
  * translation 0..*
  * translation from $2.16.840.1.113762.1.4.1099.12 (required)
    * ^comment = "The routeCode, if present, SHOULD contain zero or more [0..*] translation, which SHALL be selected from ValueSet Medication Route urn:oid:2.16.840.1.113762.1.4.1099.12 DYNAMIC (CONF:1198-32960)."
* approachSiteCode 0..1
* approachSiteCode from $2.16.840.1.113883.3.88.12.3221.8.9 (required)
  * ^comment = "MAY contain zero or one [0..1] approachSiteCode, where the code SHALL be selected from ValueSet Body Site Value Set urn:oid:2.16.840.1.113883.3.88.12.3221.8.9 DYNAMIC (CONF:1198-8840)."
* doseQuantity 0..1
  * ^comment = "SHOULD contain zero or one [0..1] doseQuantity (CONF:1198-8841)."
  * unit 0..1
  * unit from UnitsOfMeasureCaseSensitive (required)
    * ^comment = "The doseQuantity, if present, SHOULD contain zero or one [0..1] @unit, which SHALL be selected from ValueSet UnitsOfMeasureCaseSensitive urn:oid:2.16.840.1.113883.1.11.12839 DYNAMIC (CONF:1198-8842)."
* administrationUnitCode 0..1
* administrationUnitCode from AdministrationUnitDoseForm (required)
  * ^comment = "MAY contain zero or one [0..1] administrationUnitCode, which SHALL be selected from ValueSet AdministrationUnitDoseForm urn:oid:2.16.840.1.113762.1.4.1021.30 DYNAMIC (CONF:1198-8846)."
* consumable 1..1
  * ^comment = "SHALL contain exactly one [1..1] consumable (CONF:1198-8847)."
  * manufacturedProduct 1..1
  * manufacturedProduct only ImmunizationMedicationInformation
    * ^comment = "This consumable SHALL contain exactly one [1..1] Immunization Medication Information (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.4.54:2014-06-09) (CONF:1198-15546)."
* performer 0..1
  * ^comment = "SHOULD contain zero or one [0..1] performer (CONF:1198-8849)."
* author 0..*
* author only AuthorParticipation
  * ^comment = "SHOULD contain zero or more [0..*] Author Participation (identifier: urn:oid:2.16.840.1.113883.10.20.22.4.119) (CONF:1198-31151)."
* participant ^slicing.discriminator[0].type = #value
  * ^slicing.discriminator[=].path = "typeCode"
  * ^slicing.discriminator[+].type = #profile
  * ^slicing.discriminator[=].path = "participantRole"
  * ^slicing.rules = #open
* participant contains drugVehicle 0..*
* participant[drugVehicle] ^comment = "MAY contain zero or more [0..*] participant (CONF:1198-8850) such that it"
  * typeCode 1..1
  * typeCode = #CSM (exactly)
    * ^comment = "SHALL contain exactly one [1..1] @typeCode=\"CSM\" (CodeSystem: HL7ParticipationType urn:oid:2.16.840.1.113883.5.90 STATIC) (CONF:1198-8851)."
  * participantRole 1..1
  * participantRole only DrugVehicle
    * ^comment = "SHALL contain exactly one [1..1] Drug Vehicle (identifier: urn:oid:2.16.840.1.113883.10.20.22.4.24) (CONF:1198-15547)."
* entryRelationship ^slicing.discriminator[0].type = #profile
  * ^slicing.discriminator[=].path = "act"
  * ^slicing.discriminator[+].type = #profile
  * ^slicing.discriminator[=].path = "observation"
  * ^slicing.discriminator[+].type = #profile
  * ^slicing.discriminator[=].path = "supply"
  * ^slicing.rules = #open
* entryRelationship contains
    indication 0..* and
    instruction 0..1 and
    medSupplyOrder 0..1 and
    medDispense 0..1 and
    reactionObs 0..1 and
    immunizationRefusal 0..1 and
    substanceAdmin 0..*
* entryRelationship[indication] ^comment = "MAY contain zero or more [0..*] entryRelationship (CONF:1198-8853) such that it"
  * typeCode 1..1
  * typeCode = #RSON (exactly)
    * ^comment = "SHALL contain exactly one [1..1] @typeCode=\"RSON\" (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002 STATIC) (CONF:1198-8854)."
  * observation 1..1
  * observation only Indication
    * ^comment = "SHALL contain exactly one [1..1] Indication (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.4.19:2014-06-09) (CONF:1198-15537)."
* entryRelationship[instruction] ^comment = "MAY contain zero or one [0..1] entryRelationship (CONF:1198-8856) such that it"
  * typeCode 1..1
  * typeCode = #SUBJ (exactly)
    * ^comment = "SHALL contain exactly one [1..1] @typeCode=\"SUBJ\" (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002 STATIC) (CONF:1198-8857)."
  * inversionInd 1..1
  * inversionInd = true (exactly)
    * ^comment = "SHALL contain exactly one [1..1] @inversionInd=\"true\" True (CONF:1198-8858)."
  * act 1..1
  * act only Instruction
    * ^comment = "SHALL contain exactly one [1..1] Instruction (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.4.20:2014-06-09) (CONF:1198-31392)."
* entryRelationship[medSupplyOrder] ^comment = "MAY contain zero or one [0..1] entryRelationship (CONF:1198-8860) such that it"
  * typeCode 1..1
  * typeCode = #REFR (exactly)
    * ^comment = "SHALL contain exactly one [1..1] @typeCode=\"REFR\" (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002 STATIC) (CONF:1198-8861)."
  * supply 1..1
  * supply only MedicationSupplyOrder
    * ^comment = "SHALL contain exactly one [1..1] Medication Supply Order (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.4.17:2014-06-09) (CONF:1198-15539)."
* entryRelationship[medDispense] ^comment = "MAY contain zero or one [0..1] entryRelationship (CONF:1198-8863) such that it"
  * typeCode 1..1
  * typeCode = #REFR (exactly)
    * ^comment = "SHALL contain exactly one [1..1] @typeCode=\"REFR\" (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002 STATIC) (CONF:1198-8864)."
  * supply 1..1
  * supply only MedicationDispense
    * ^comment = "SHALL contain exactly one [1..1] Medication Dispense (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.4.18:2014-06-09) (CONF:1198-15540)."
* entryRelationship[reactionObs] ^comment = "MAY contain zero or one [0..1] entryRelationship (CONF:1198-8866) such that it"
  * typeCode 1..1
  * typeCode = #CAUS (exactly)
    * ^comment = "SHALL contain exactly one [1..1] @typeCode=\"CAUS\" (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002 STATIC) (CONF:1198-8867)."
  * observation 1..1
  * observation only ReactionObservation
    * ^comment = "SHALL contain exactly one [1..1] Reaction Observation (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.4.9:2014-06-09) (CONF:1198-15541)."
* entryRelationship[immunizationRefusal] ^comment = "MAY contain zero or one [0..1] entryRelationship (CONF:1198-8988) such that it"
  * typeCode 1..1
  * typeCode = #RSON (exactly)
    * ^comment = "SHALL contain exactly one [1..1] @typeCode=\"RSON\" (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002 STATIC) (CONF:1198-8989)."
  * observation 1..1
  * observation only ImmunizationRefusalReason
    * ^comment = "SHALL contain exactly one [1..1] Immunization Refusal Reason (identifier: urn:oid:2.16.840.1.113883.10.20.22.4.53) (CONF:1198-15542)."
* entryRelationship[substanceAdmin] ^short = "The following entryRelationship is used to indicate a given immunization's order in a series. The nested Substance Administered Act identifies an administration in the series. The entryRelationship/sequenceNumber shows the order of this particular administration in that series."
  * ^comment = "SHOULD contain zero or more [0..*] entryRelationship (CONF:1198-31510) such that it"
  * typeCode 1..1
  * typeCode = #COMP (exactly)
    * ^comment = "SHALL contain exactly one [1..1] @typeCode=\"COMP\" Component (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:1198-31511)."
  * inversionInd 1..1
  * inversionInd = true (exactly)
    * ^comment = "SHALL contain exactly one [1..1] @inversionInd=\"true\" (CONF:1198-31512)."
  * sequenceNumber 0..1
    * ^comment = "MAY contain zero or one [0..1] sequenceNumber (CONF:1198-31513)."
  * act 1..1
  * act only SubstanceAdministeredAct
    * ^comment = "SHALL contain exactly one [1..1] Substance Administered Act (identifier: urn:oid:2.16.840.1.113883.10.20.22.4.118) (CONF:1198-31514)."
* precondition ^slicing.discriminator[0].type = #profile
  * ^slicing.discriminator[=].path = "criterion"
  * ^slicing.rules = #open
* precondition contains substanceAdmin 0..*
* precondition[substanceAdmin] ^comment = "MAY contain zero or more [0..*] precondition (CONF:1198-8869) such that it"
  * typeCode 1..1
  * typeCode = #PRCN (exactly)
    * ^comment = "SHALL contain exactly one [1..1] @typeCode=\"PRCN\" (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002 STATIC) (CONF:1198-8870)."
  * criterion 1..1
  * criterion only PreconditionforSubstanceAdministration
    * ^comment = "SHALL contain exactly one [1..1] Precondition for Substance Administration (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.4.25:2014-06-09) (CONF:1198-15548)."