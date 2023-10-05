Profile: DischargeMedication
Parent: $Act
Id: DischargeMedication
Title: "Discharge Medication"
Description: "This template represents medications that the patient is intended to take (or stop) after discharge."

* insert LogicalModelTemplate(dischargeMedication, 2.16.840.1.113883.10.20.22.4.35, 2016-03-01)

* classCode 1..1
* classCode = #ACT (exactly)
  * ^comment = "SHALL contain exactly one [1..1] @classCode=\"ACT\" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:1198-7689)."
* moodCode 1..1
* moodCode = #EVN (exactly)
  * ^comment = "SHALL contain exactly one [1..1] @moodCode=\"EVN\" (CodeSystem: HL7ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:1198-7690)."
* code 1..1
  * ^comment = "SHALL contain exactly one [1..1] code (CONF:1198-7691)."
  * code 1..1
  * code = #10183-2
    * ^comment = "This code SHALL contain exactly one [1..1] @code=\"10183-2\" Hospital discharge medication (CONF:1198-19161)."
  * codeSystem 1..1
  * codeSystem = "2.16.840.1.113883.6.1"
    * ^comment = "This code SHALL contain exactly one [1..1] @codeSystem=\"2.16.840.1.113883.6.1\" (CodeSystem: LOINC urn:oid:2.16.840.1.113883.6.1) (CONF:1198-32159)."
  * translation 1..1
    * ^comment = "This code SHALL contain exactly one [1..1] translation (CONF:1198-32952)."
    * code 1..1
    * code = #75311-1
      * ^comment = "This translation SHALL contain exactly one [1..1] @code=\"75311-1\" Discharge Medication (CONF:1198-32953)."
    * codeSystem 1..1
    * codeSystem = "2.16.840.1.113883.6.1"
      * ^comment = "This translation SHALL contain exactly one [1..1] @codeSystem=\"2.16.840.1.113883.6.1\" (CodeSystem: LOINC urn:oid:2.16.840.1.113883.6.1) (CONF:1198-32954)."
* statusCode 1..1
  * ^comment = "SHALL contain exactly one [1..1] statusCode (CONF:1198-32779)."
  * code 1..1
  * code = #completed (exactly)
    * ^comment = "This statusCode SHALL contain exactly one [1..1] @code=\"completed\" Completed (CodeSystem: HL7ActStatus urn:oid:2.16.840.1.113883.5.14 STATIC) (CONF:1198-32780)."
* entryRelationship ^slicing.discriminator[0].type = #profile
  * ^slicing.discriminator[=].path = "substanceAdministration"
  * ^slicing.rules = #open
* entryRelationship contains medicationActivity 1..*
* entryRelationship[medicationActivity] ^comment = "SHALL contain at least one [1..*] entryRelationship (CONF:1198-7692) such that it"
  * typeCode 1..1
  * typeCode = #SUBJ (exactly)
    * ^comment = "SHALL contain exactly one [1..1] @typeCode=\"SUBJ\" Has Subject (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002 STATIC) (CONF:1198-7693)."
  * substanceAdministration 1..1
  * substanceAdministration only MedicationActivity
    * ^comment = "SHALL contain exactly one [1..1] Medication Activity (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.4.16:2014-06-09) (CONF:1198-15525)."