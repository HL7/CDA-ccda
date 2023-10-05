Profile: PostprocedureDiagnosis
Parent: $Act
Id: PostprocedureDiagnosis
Title: "Postprocedure Diagnosis"
Description: "This template represents the diagnosis or diagnoses discovered or confirmed during the procedure. They may be the same as preprocedure diagnoses or indications."

* insert LogicalModelTemplate(postprocedureDiagnosis, 2.16.840.1.113883.10.20.22.4.51, 2015-08-01)

* classCode 1..1
* classCode = #ACT (exactly)
  * ^comment = "SHALL contain exactly one [1..1] @classCode=\"ACT\" (CONF:1198-8756)."
* moodCode 1..1
* moodCode = #EVN (exactly)
  * ^comment = "SHALL contain exactly one [1..1] @moodCode=\"EVN\" (CONF:1198-8757)."
* code 1..1
  * ^comment = "SHALL contain exactly one [1..1] code (CONF:1198-19151)."
  * code 1..1
  * code = #59769-0
    * ^comment = "This code SHALL contain exactly one [1..1] @code=\"59769-0\" Postprocedure diagnosis (CONF:1198-19152)."
  * codeSystem 1..1
  * codeSystem = "2.16.840.1.113883.6.1"
    * ^comment = "This code SHALL contain exactly one [1..1] @codeSystem=\"2.16.840.1.113883.6.1\" (CodeSystem: LOINC urn:oid:2.16.840.1.113883.6.1) (CONF:1198-32166)."
* entryRelationship ^slicing.discriminator[0].type = #profile
  * ^slicing.discriminator[=].path = "observation"
  * ^slicing.rules = #open
* entryRelationship contains problemObservation 1..*
* entryRelationship[problemObservation] ^comment = "SHALL contain at least one [1..*] entryRelationship (CONF:1198-8759) such that it"
  * typeCode 1..1
  * typeCode = #SUBJ (exactly)
    * ^comment = "SHALL contain exactly one [1..1] @typeCode=\"SUBJ\" Has subject (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002 STATIC) (CONF:1198-8760)."
  * observation 1..1
  * observation only ProblemObservation
    * ^comment = "SHALL contain exactly one [1..1] Problem Observation (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.4.4:2015-08-01) (CONF:1198-15583)."