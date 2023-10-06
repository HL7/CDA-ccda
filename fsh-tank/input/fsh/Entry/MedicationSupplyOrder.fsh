Profile: MedicationSupplyOrder
Parent: $Supply
Id: MedicationSupplyOrder
Title: "Medication Supply Order"
Description: "This template records the intent to supply a patient with medications."

* insert LogicalModelTemplate(med-supplyOrder, 2.16.840.1.113883.10.20.22.4.17, 2014-06-09)

* classCode 1..1
  * ^comment = "SHALL contain exactly one [1..1] @classCode=\"SPLY\" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:1098-7427)."
* moodCode 1..1
* moodCode = #INT (exactly)
  * ^comment = "SHALL contain exactly one [1..1] @moodCode=\"INT\" (CodeSystem: HL7ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:1098-7428)."
* id 1..*
  * ^comment = "SHALL contain at least one [1..*] id (CONF:1098-7430)."
* statusCode 1..1
  * ^comment = "SHALL contain exactly one [1..1] statusCode (CONF:1098-7432)."
  * code 1..1
  * code from ActStatus (required)
    * ^comment = "This statusCode SHALL contain exactly one [1..1] @code, which SHALL be selected from ValueSet ActStatus urn:oid:2.16.840.1.113883.1.11.15933 DYNAMIC (CONF:1098-32362)."
* effectiveTime ^slicing.discriminator[0].type = #value
  * ^slicing.discriminator[=].path = "high"
  * ^slicing.rules = #open
* effectiveTime contains when 0..1
* effectiveTime[when] only $IVL-TS
  * ^comment = "SHOULD contain zero or one [0..1] effectiveTime (CONF:1098-15143) such that it"
  * high 1..1
    * ^comment = "SHALL contain exactly one [1..1] high (CONF:1098-15144)."
* repeatNumber 0..1
  * ^short = "In \"INT\" (intent) mood, the repeatNumber defines the number of allowed supplies. For example, a repeatNumber of \"3\" means that the substance can be supplied up to 3 times."
  * ^comment = "SHOULD contain zero or one [0..1] repeatNumber (CONF:1098-7434)."
* quantity 0..1
  * ^comment = "SHOULD contain zero or one [0..1] quantity (CONF:1098-7436)."
* product 0..1
  * ^comment = "MAY contain zero or one [0..1] product (CONF:1098-7439)."
  * manufacturedProduct 1..1
  * manufacturedProduct only MedicationInformation or ImmunizationMedicationInformation
    * ^comment = "The product, if present, SHALL contain exactly one [1..1] Medication Information (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.4.23:2014-06-09) (CONF:1098-16093)."
* author 0..1
  * ^comment = "MAY contain zero or one [0..1] author (CONF:1098-7438)."
* entryRelationship 0..1
  * ^comment = "MAY contain zero or one [0..1] entryRelationship (CONF:1098-7442)."
  * typeCode 1..1
  * typeCode = #SUBJ (exactly)
    * ^comment = "The entryRelationship, if present, SHALL contain exactly one [1..1] @typeCode=\"SUBJ\" (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002 STATIC) (CONF:1098-7444)."
  * inversionInd 1..1
  * inversionInd = true (exactly)
    * ^comment = "The entryRelationship, if present, SHALL contain exactly one [1..1] @inversionInd=\"true\" True (CONF:1098-7445)."
  * act 1..1
  * act only Instruction
    * ^comment = "The entryRelationship, if present, SHALL contain exactly one [1..1] Instruction (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.4.20:2014-06-09) (CONF:1098-31391)."