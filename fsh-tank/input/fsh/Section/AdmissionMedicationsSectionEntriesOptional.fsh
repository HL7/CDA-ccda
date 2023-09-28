Profile: AdmissionMedicationsSectionEntriesOptional
Parent: $Section
Id: AdmissionMedicationsSectionEntriesOptional
Title: "Admission Medications Section (entries optional)"
Description: "The section contains the medications taken by the patient prior to and at the time of admission to the facility."
* insert LogicalModelNA
* ^identifier.value = "urn:hl7ii:2.16.840.1.113883.10.20.22.2.44:2015-08-01"
* ^version = "2015-08-01"
* templateId ^slicing.discriminator[0].type = #value
  * ^slicing.discriminator[=].path = "root"
  * ^slicing.discriminator[+].type = #value
  * ^slicing.discriminator[=].path = "extension"
  * ^slicing.rules = #open
* templateId contains primary 1..1
* templateId[primary] ^comment = "SHALL contain exactly one [1..1] templateId (CONF:1198-10098) such that it"
  * root 1..1
  * root = "2.16.840.1.113883.10.20.22.2.44"
    * ^comment = "SHALL contain exactly one [1..1] @root=\"2.16.840.1.113883.10.20.22.2.44\" (CONF:1198-10392)."
  * extension 1..1
  * extension = "2015-08-01"
    * ^comment = "SHALL contain exactly one [1..1] @extension=\"2015-08-01\" (CONF:1198-32560)."
* code 1..1
  * ^comment = "SHALL contain exactly one [1..1] code (CONF:1198-15482)."
  * code 1..1
  * code = #42346-7
    * ^comment = "This code SHALL contain exactly one [1..1] @code=\"42346-7\" Medications on Admission (CONF:1198-15483)."
  * codeSystem 1..1
  * codeSystem = "2.16.840.1.113883.6.1"
    * ^comment = "This code SHALL contain exactly one [1..1] @codeSystem=\"2.16.840.1.113883.6.1\" (CodeSystem: LOINC urn:oid:2.16.840.1.113883.6.1) (CONF:1198-32142)."
* title 1..1
  * ^comment = "SHALL contain exactly one [1..1] title (CONF:1198-10100)."
* text 1..1
  * ^comment = "SHALL contain exactly one [1..1] text (CONF:1198-10101)."
* entry ^slicing.discriminator[0].type = #profile
  * ^slicing.discriminator[=].path = "act"
  * ^slicing.rules = #open
* entry contains admissionMedication 0..*
* entry[admissionMedication] ^comment = "SHOULD contain zero or more [0..*] entry (CONF:1198-10102) such that it"
  * act 1..1
  * act only AdmissionMedication
    * ^comment = "SHALL contain exactly one [1..1] Admission Medication (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.4.36:2014-06-09) (CONF:1198-15484)."