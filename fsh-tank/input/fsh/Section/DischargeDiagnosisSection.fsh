Profile: DischargeDiagnosisSection
Parent: $Section
Id: DischargeDiagnosisSection
Title: "Discharge Diagnosis Section"
Description: "This template represents problems or diagnoses present at the time of discharge which occurred during the hospitalization. This section includes an optional entry to record patient diagnoses specific to this visit. Problems that need ongoing tracking should also be included in the Problem Section."

* insert Section(#11535-2, Hospital Discharge Diagnosis, 2.16.840.1.113883.10.20.22.2.24, 2015-08-01)

* code
  * translation ^slicing.discriminator[0].type = #value
    * ^slicing.discriminator[=].path = "code"
    * ^slicing.discriminator[+].type = #value
    * ^slicing.discriminator[=].path = "codeSystem"
    * ^slicing.rules = #open
  * translation contains translation1 1..1
  * translation[translation1] ^comment = "This code SHALL contain exactly one [1..1] translation (CONF:1198-32834) such that it"
    * insert CodedLoinc(78375-3, Hospital discharge Dx Narrative)
    * ^comment = "SHALL contain exactly one [1..1] @code=\"78375-3\" Discharge Diagnosis (CONF:1198-32835)."
* obeys should-entry
* entry 0..1
  * ^comment = "SHOULD contain zero or one [0..1] entry (CONF:1198-7983)." // auto-should
  * act 1..1
  * act only HospitalDischargeDiagnosis
    * ^comment = "The entry, if present, SHALL contain exactly one [1..1] Hospital Discharge Diagnosis (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.4.33:2015-08-01) (CONF:1198-15489)."