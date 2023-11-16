Profile: AdmissionDiagnosisSection
Parent: $Section
Id: AdmissionDiagnosisSection
Title: "Admission Diagnosis Section"
Description: "This section contains a narrative description of the problems or diagnoses identified by the clinician at the time of the patient's admission. This section may contain a coded entry which represents the admitting diagnoses."

* insert Section(#46241-6, Hospital Admission diagnosis, 2.16.840.1.113883.10.20.22.2.43, 2015-08-01)

* code
  * translation ^slicing.discriminator[0].type = #value
    * ^slicing.discriminator[=].path = "code"
    * ^slicing.discriminator[+].type = #value
    * ^slicing.discriminator[=].path = "codeSystem"
    * ^slicing.rules = #open
  * translation contains admissionDiag 1..1
  * translation[admissionDiag] ^comment = "This code SHALL contain exactly one [1..1] translation (CONF:1198-32749) such that it"
    * insert CodedLoinc(42347-5, Admission Diagnosis)
    * ^comment = "SHALL contain exactly one [1..1] @code=\"42347-5\" Admission Diagnosis (CONF:1198-32750)."
* obeys should-entry
* entry 0..1
  * ^comment = "SHOULD contain zero or one [0..1] entry (CONF:1198-9934)." // auto-should
  * act 1..1
  * act only HospitalAdmissionDiagnosis
    * ^comment = "The entry, if present, SHALL contain exactly one [1..1] Hospital Admission Diagnosis (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.4.34:2015-08-01) (CONF:1198-15481)."