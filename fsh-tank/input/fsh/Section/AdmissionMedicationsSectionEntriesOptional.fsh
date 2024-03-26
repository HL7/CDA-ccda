Profile: AdmissionMedicationsSectionEntriesOptional
Parent: $Section
Id: AdmissionMedicationsSectionEntriesOptional
Title: "Admission Medications Section (entries optional)"
Description: "The section contains the medications taken by the patient prior to and at the time of admission to the facility."

* insert Section(#42346-7, [[Medications on admission (narrative)]], 2.16.840.1.113883.10.20.22.2.44, 2015-08-01)
* entry ^slicing.discriminator[0].type = #profile
  * ^slicing.discriminator[=].path = "act"
  * ^slicing.rules = #open
* entry contains admissionMedication 0..*
* entry[admissionMedication] ^comment = "SHOULD contain zero or more [0..*] entry (CONF:1198-10102) such that it"
  * act 1..1
  * act only AdmissionMedication
    * ^comment = "SHALL contain exactly one [1..1] Admission Medication (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.4.36:2014-06-09) (CONF:1198-15484)."
* obeys should-admission-medication