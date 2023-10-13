Profile: PostprocedureDiagnosisSection
Parent: $Section
Id: PostprocedureDiagnosisSection
Title: "Postprocedure Diagnosis Section"
Description: "The Postprocedure Diagnosis Section records the diagnosis or diagnoses discovered or confirmed during the procedure. Often it is the same as the preprocedure diagnosis or indication."

* insert Section(#59769-0, Postprocedure Diagnosis, 2.16.840.1.113883.10.20.22.2.36, 2015-08-01)
* entry ^slicing.discriminator[0].type = #value
  * ^slicing.discriminator[=].path = "act"
  * ^slicing.rules = #open
* entry contains postopDiagnosis 0..1
* entry[postopDiagnosis] ^comment = "SHOULD contain zero or one [0..1] entry (CONF:1198-8762) such that it"
  * act 1..1
  * act only PostprocedureDiagnosis
    * ^comment = "SHALL contain exactly one [1..1] Postprocedure Diagnosis (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.4.51:2015-08-01) (CONF:1198-15503)."