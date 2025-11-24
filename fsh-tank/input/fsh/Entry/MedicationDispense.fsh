Profile: MedicationDispense
Parent: $Supply
Id: MedicationDispense
Title: "Medication Dispense"
Description: "This template records the act of supplying medications (i.e., dispensing). The moodCode equaling \"EVN\" (Event), signals that the \"supply\" has occurred and thus has been dispensed."

* insert LogicalModelTemplate(med-dispense, 2.16.840.1.113883.10.20.22.4.18, 2023-05-01)
* insert NarrativeLink

* ^status = #draft
* classCode 1..1
* classCode = #SPLY (exactly)
  * ^comment = "SHALL contain exactly one [1..1] @classCode=\"SPLY\" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:4537-7451)."
* moodCode 1..1
* moodCode = #EVN (exactly)
  * ^comment = "SHALL contain exactly one [1..1] @moodCode=\"EVN\" (CodeSystem: HL7ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:4537-7452)."
* id 1..*
  * ^comment = "SHALL contain at least one [1..*] id (CONF:4537-7454)."
* code 1..1
* code from http://hl7.org/fhir/ValueSet/medicationdispense-status (required)
  * ^short = "The CDA base standard limits codes that can be used at CDA supply.statusCode which do not represent typical medication dispense statuses. In order to provide correct domain vocabulary and align with FHIR, CDA supply.statusCode is fixed to completed and the FHIR MedicationDispense status value set is used at supply.code."
  * ^comment = "SHALL contain exactly one [1..1] code, which SHALL be selected from ValueSet MedicationDispense Status Codes urn:oid:2.16.840.1.113883.4.642.3.1312 DYNAMIC (CONF:4537-32974)."
* statusCode 1..1
  * ^comment = "SHALL contain exactly one [1..1] statusCode (CONF:4537-7455)."
  * code 1..1
  * code = #completed (exactly)
    * ^comment = "This statusCode SHALL contain exactly one [1..1] @code=\"completed\" Completed (CodeSystem: HL7ActStatus urn:oid:2.16.840.1.113883.5.14 STATIC) (CONF:4537-32361)."
* obeys should-effectiveTime
* effectiveTime 0..1
  * ^comment = "SHOULD contain zero or one [0..1] effectiveTime (CONF:4537-7456)." // auto-should
* insert ShouldElement(repeatNumber)
* repeatNumber 0..1
  * ^short = "In \"EVN\" (event) mood, the repeatNumber is the number of dispenses. For example, a repeatNumber of \"3\" indicates the third dispense."
  * ^comment = "SHOULD contain zero or one [0..1] repeatNumber (CONF:4537-7457)." // auto-should
* insert ShouldElement(quantity)
* quantity 0..1
  * ^comment = "SHOULD contain zero or one [0..1] quantity (CONF:4537-7458)." // auto-should
* product 1..1
  * manufacturedProduct 1..1
  * manufacturedProduct only MedicationInformation or ImmunizationMedicationInformation
    * ^comment = "The product, if present, SHALL contain exactly one [1..1] Medication Information (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.4.23:2014-06-09) (CONF:4537-15607)."
* performer 0..1
  * ^comment = "MAY contain zero or one [0..1] performer (CONF:4537-7461)."
  * assignedEntity 1..1
    * ^comment = "The performer, if present, SHALL contain exactly one [1..1] assignedEntity (CONF:4537-7467)."
    * obeys should-addr
    * addr 0..1
    * addr only USRealmAddress
      * ^comment = "This assignedEntity SHOULD contain zero or one [0..1] US Realm Address (AD.US.FIELDED) (identifier: urn:oid:2.16.840.1.113883.10.20.22.5.2) (CONF:4537-7468)." // man-should
* entryRelationship ^slicing.discriminator[0].type = #profile
  * ^slicing.discriminator[=].path = "supply"
  * ^slicing.discriminator[+].type = #value
  * ^slicing.discriminator[=].path = "typeCode"
  * ^slicing.rules = #open
  * ^comment = "MAY contain zero or one [0..1] entryRelationship (CONF:4537-7473) such that it"
* entryRelationship contains entryRelationship1 0..1
* entryRelationship[entryRelationship1] ^short = "entryRelationship"
  * ^comment = "MAY contain zero or one [0..1] entryRelationship (CONF:4537-7473) such that it"
  * typeCode 1..1
  * typeCode = #REFR (exactly)
    * ^comment = "SHALL contain exactly one [1..1] @typeCode=\"REFR\" (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002 STATIC) (CONF:4537-7474)."
  * supply 1..1
  * supply only MedicationSupplyOrder
    * ^comment = "SHALL contain exactly one [1..1] Medication Supply Order (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.4.17:2014-06-09) (CONF:4537-15606)."


