Profile: AdmissionMedication
Parent: $Act
Id: AdmissionMedication
Title: "Admission Medication"
Description: "This template represents the medications taken by the patient prior to and at the time of admission."

* insert LogicalModelTemplate(admission-med, 2.16.840.1.113883.10.20.22.4.36, 2014-06-09)

* classCode 1..1
* classCode = #ACT (exactly)
  * ^comment = "SHALL contain exactly one [1..1] @classCode=\"ACT\" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:1098-7698)."
* moodCode 1..1
* moodCode = #EVN (exactly)
  * ^comment = "SHALL contain exactly one [1..1] @moodCode=\"EVN\" (CodeSystem: HL7ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:1098-7699)."
* code 1..1
  * ^comment = "SHALL contain exactly one [1..1] code (CONF:1098-15518)."
  * code 1..1
  * code = #42346-7
    * ^comment = "This code SHALL contain exactly one [1..1] @code=\"42346-7\" Medications on Admission (CONF:1098-15519)."
  * codeSystem 1..1
  * codeSystem = "2.16.840.1.113883.6.1"
    * ^comment = "This code SHALL contain exactly one [1..1] @codeSystem=\"2.16.840.1.113883.6.1\" (CodeSystem: LOINC urn:oid:2.16.840.1.113883.6.1) (CONF:1098-32152)."
* entryRelationship ^slicing.discriminator[0].type = #profile
  * ^slicing.discriminator[=].path = "substanceAdministration"
  * ^slicing.rules = #open
* entryRelationship contains medicationActivity 1..*
* entryRelationship[medicationActivity] ^comment = "SHALL contain at least one [1..*] entryRelationship (CONF:1098-7701) such that it"
  * typeCode 1..1
  * typeCode = #SUBJ (exactly)
    * ^comment = "SHALL contain exactly one [1..1] @typeCode=\"SUBJ\" (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002 STATIC) (CONF:1098-7702)."
  * substanceAdministration 1..1
  * substanceAdministration only MedicationActivity
    * ^comment = "SHALL contain exactly one [1..1] Medication Activity (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.4.16:2014-06-09) (CONF:1098-15520)."