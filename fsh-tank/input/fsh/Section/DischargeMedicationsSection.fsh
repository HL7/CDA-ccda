Profile: DischargeMedicationsSection
Parent: $Section
Id: DischargeMedicationsSection
Title: "Discharge Medications Section"
Description: "This section contains the medications the patient is intended to take or stop after discharge. Current, active medications must be listed. The section may also include a patient's prescription history and indicate the source of the medication list."
* nullFlavor ^short = "If a required section contains no information, the @nullFlavor MAY be set to NI"

* insert Section(#10183-2, Hospital Discharge Medications, 2.16.840.1.113883.10.20.22.2.11.1, 2015-08-01)

* code
  * translation ^slicing.discriminator[0].type = #value
    * ^slicing.discriminator[=].path = "code"
    * ^slicing.discriminator[+].type = #value
    * ^slicing.discriminator[=].path = "codeSystem"
    * ^slicing.rules = #open
  * translation contains translation1 1..1
  * translation[translation1] ^comment = "This code SHALL contain exactly one [1..1] translation (CONF:1198-32857) such that it"
    * code 1..1
    * code = #75311-1
      * ^comment = "SHALL contain exactly one [1..1] @code=\"75311-1\" Discharge Medications (CONF:1198-32858)."
    * codeSystem 1..1
    * codeSystem = "2.16.840.1.113883.6.1"
      * ^comment = "SHALL contain exactly one [1..1] @codeSystem=\"2.16.840.1.113883.6.1\" (CodeSystem: LOINC urn:oid:2.16.840.1.113883.6.1) (CONF:1198-32859)."
* entry ^slicing.discriminator[0].type = #value
  * ^slicing.discriminator[=].path = "act"
  * ^slicing.rules = #open
  * ^short = "If section/@nullFlavor is not present:"
* entry contains dischargeMed 0..*
* entry[dischargeMed] ^comment = "SHALL contain at least one [1..*] entry (CONF:1198-7826) such that it"
  * act 1..1
  * act only DischargeMedication
    * ^comment = "SHALL contain exactly one [1..1] Discharge Medication (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.4.35:2016-03-01) (CONF:1198-15491)."
* obeys shall-discharge-med