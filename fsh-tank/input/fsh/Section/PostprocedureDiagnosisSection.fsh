Profile: PostprocedureDiagnosisSection
Parent: $Section
Id: PostprocedureDiagnosisSection
Title: "Postprocedure Diagnosis Section"
Description: "The Postprocedure Diagnosis Section records the diagnosis or diagnoses discovered or confirmed during the procedure. Often it is the same as the preprocedure diagnosis or indication."
* insert LogicalModelNA
* ^identifier.value = "urn:hl7ii:2.16.840.1.113883.10.20.22.2.36:2015-08-01"
* ^version = "2015-08-01"
* templateId ^slicing.discriminator[0].type = #value
  * ^slicing.discriminator[=].path = "root"
  * ^slicing.discriminator[+].type = #value
  * ^slicing.discriminator[=].path = "extension"
  * ^slicing.rules = #open
* templateId contains primary 1..1
* templateId[primary] ^comment = "SHALL contain exactly one [1..1] templateId (CONF:1198-8167) such that it"
  * root 1..1
  * root = "2.16.840.1.113883.10.20.22.2.36"
    * ^comment = "SHALL contain exactly one [1..1] @root=\"2.16.840.1.113883.10.20.22.2.36\" (CONF:1198-10438)."
  * extension 1..1
  * extension = "2015-08-01"
    * ^comment = "SHALL contain exactly one [1..1] @extension=\"2015-08-01\" (CONF:1198-32550)."
* code 1..1
  * ^comment = "SHALL contain exactly one [1..1] code (CONF:1198-15403)."
  * code 1..1
  * code = #59769-0
    * ^comment = "This code SHALL contain exactly one [1..1] @code=\"59769-0\" Postprocedure Diagnosis (CONF:1198-15404)."
  * codeSystem 1..1
  * codeSystem = "2.16.840.1.113883.6.1"
    * ^comment = "This code SHALL contain exactly one [1..1] @codeSystem=\"2.16.840.1.113883.6.1\" (CodeSystem: LOINC urn:oid:2.16.840.1.113883.6.1) (CONF:1198-30862)."
* title 1..1
  * ^comment = "SHALL contain exactly one [1..1] title (CONF:1198-8170)."
* text 1..1
  * ^comment = "SHALL contain exactly one [1..1] text (CONF:1198-8171)."
* entry ^slicing.discriminator[0].type = #value
  * ^slicing.discriminator[=].path = "act"
  * ^slicing.rules = #open
* entry contains postopDiagnosis 0..1
* entry[postopDiagnosis] ^comment = "SHOULD contain zero or one [0..1] entry (CONF:1198-8762) such that it"
  * act 1..1
  * act only PostprocedureDiagnosis
    * ^comment = "SHALL contain exactly one [1..1] Postprocedure Diagnosis (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.4.51:2015-08-01) (CONF:1198-15503)."