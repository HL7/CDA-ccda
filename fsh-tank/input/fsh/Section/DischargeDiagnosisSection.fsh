Profile: DischargeDiagnosisSection
Parent: $Section
Id: DischargeDiagnosisSection
Title: "Discharge Diagnosis Section"
Description: "This template represents problems or diagnoses present at the time of discharge which occurred during the hospitalization. This section includes an optional entry to record patient diagnoses specific to this visit. Problems that need ongoing tracking should also be included in the Problem Section."
* insert LogicalModelNA
* ^identifier.value = "urn:hl7ii:2.16.840.1.113883.10.20.22.2.24:2015-08-01"
* ^version = "2015-08-01"
* templateId ^slicing.discriminator[0].type = #value
  * ^slicing.discriminator[=].path = "root"
  * ^slicing.discriminator[+].type = #value
  * ^slicing.discriminator[=].path = "extension"
  * ^slicing.rules = #open
* templateId contains primary 1..1
* templateId[primary] ^comment = "SHALL contain exactly one [1..1] templateId (CONF:1198-7979) such that it"
  * root 1..1
  * root = "2.16.840.1.113883.10.20.22.2.24"
    * ^comment = "SHALL contain exactly one [1..1] @root=\"2.16.840.1.113883.10.20.22.2.24\" (CONF:1198-10394)."
  * extension 1..1
  * extension = "2015-08-01"
    * ^comment = "SHALL contain exactly one [1..1] @extension=\"2015-08-01\" (CONF:1198-32549)."
* code 1..1
  * ^comment = "SHALL contain exactly one [1..1] code (CONF:1198-15355)."
  * code 1..1
  * code = #11535-2
    * ^comment = "This code SHALL contain exactly one [1..1] @code=\"11535-2\" Hospital Discharge Diagnosis (CodeSystem: LOINC urn:oid:2.16.840.1.113883.6.1 STATIC) (CONF:1198-15356)."
  * codeSystem 1..1
  * codeSystem = "2.16.840.1.113883.6.1"
    * ^comment = "This code SHALL contain exactly one [1..1] @codeSystem=\"2.16.840.1.113883.6.1\" (CodeSystem: LOINC urn:oid:2.16.840.1.113883.6.1) (CONF:1198-30861)."
  * translation ^slicing.discriminator[0].type = #value
    * ^slicing.discriminator[=].path = "code"
    * ^slicing.discriminator[+].type = #value
    * ^slicing.discriminator[=].path = "codeSystem"
    * ^slicing.rules = #open
  * translation contains translation1 1..1
  * translation[translation1] ^comment = "This code SHALL contain exactly one [1..1] translation (CONF:1198-32834) such that it"
    * code 1..1
    * code = #78375-3
      * ^comment = "SHALL contain exactly one [1..1] @code=\"78375-3\" Discharge Diagnosis (CONF:1198-32835)."
    * codeSystem 1..1
    * codeSystem = "2.16.840.1.113883.6.1"
      * ^comment = "SHALL contain exactly one [1..1] @codeSystem=\"2.16.840.1.113883.6.1\" (CodeSystem: LOINC urn:oid:2.16.840.1.113883.6.1) (CONF:1198-32836)."
* title 1..1
  * ^comment = "SHALL contain exactly one [1..1] title (CONF:1198-7981)."
* text 1..1
  * ^comment = "SHALL contain exactly one [1..1] text (CONF:1198-7982)."
* entry 0..1
  * ^comment = "SHOULD contain zero or one [0..1] entry (CONF:1198-7983)."
  * act 1..1
  * act only HospitalDischargeDiagnosis
    * ^comment = "The entry, if present, SHALL contain exactly one [1..1] Hospital Discharge Diagnosis (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.4.33:2015-08-01) (CONF:1198-15489)."