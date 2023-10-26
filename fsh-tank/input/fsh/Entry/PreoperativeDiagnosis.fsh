Profile: PreoperativeDiagnosis
Parent: $Act
Id: PreoperativeDiagnosis
Title: "Preoperative Diagnosis"
Description: "This template represents the surgical diagnosis or diagnoses assigned to the patient before the surgical procedure and is the reason for the surgery. The preoperative diagnosis is, in the opinion of the surgeon, the diagnosis that will be confirmed during surgery."

* insert LogicalModelTemplate(preoperative-dx, 2.16.840.1.113883.10.20.22.4.65, 2015-08-01)
* insert NarrativeLink

* classCode 1..1
* classCode = #ACT (exactly)
  * ^comment = "SHALL contain exactly one [1..1] @classCode=\"ACT\" (CONF:1198-10090)."
* moodCode 1..1
* moodCode = #EVN (exactly)
  * ^comment = "SHALL contain exactly one [1..1] @moodCode=\"EVN\" (CONF:1198-10091)."
* code 1..1
  * ^comment = "SHALL contain exactly one [1..1] code (CONF:1198-19155)."
  * code 1..1
  * code = #10219-4
    * ^comment = "This code SHALL contain exactly one [1..1] @code=\"10219-4\" Preoperative Diagnosis (CONF:1198-19156)."
  * codeSystem 1..1
  * codeSystem = "2.16.840.1.113883.6.1"
    * ^comment = "This code SHALL contain exactly one [1..1] @codeSystem=\"2.16.840.1.113883.6.1\" (CodeSystem: LOINC urn:oid:2.16.840.1.113883.6.1) (CONF:1198-32167)."
* entryRelationship ^slicing.discriminator[0].type = #profile
  * ^slicing.discriminator[=].path = "observation"
  * ^slicing.rules = #open
* entryRelationship contains problemObservation 1..*
* entryRelationship[problemObservation] ^comment = "SHALL contain at least one [1..*] entryRelationship (CONF:1198-10093) such that it"
  * typeCode 1..1
  * typeCode = #SUBJ (exactly)
    * ^comment = "SHALL contain exactly one [1..1] @typeCode=\"SUBJ\" Has subject (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002 STATIC) (CONF:1198-10094)."
  * observation 1..1
  * observation only ProblemObservation
    * ^comment = "SHALL contain exactly one [1..1] Problem Observation (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.4.4:2015-08-01) (CONF:1198-15605)."