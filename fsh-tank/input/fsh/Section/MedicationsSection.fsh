Profile: MedicationsSection
Parent: $Section
Id: MedicationsSection
Title: "Medications Section"
Description: """The Medications Section contains a patient's current medications and pertinent medication history. At a minimum, the currently active medications are listed. An entire medication history is an option. The section can describe a patient's prescription and dispense history and information about intended drug monitoring. 

This section requires either an entry indicating the subject is not known to be on any medications or entries summarizing the subject's medications."""
* insert LogicalModelNA
* ^identifier.value = "urn:hl7ii:2.16.840.1.113883.10.20.22.2.1.1:2014-06-09"
* ^version = "2014-06-09"
* nullFlavor ^short = "If a required section contains no information, the @nullFlavor MAY be set to NI"
* templateId 2..
  * ^slicing.discriminator[0].type = #value
  * ^slicing.discriminator[=].path = "root"
  * ^slicing.discriminator[+].type = #value
  * ^slicing.discriminator[=].path = "extension"
  * ^slicing.rules = #open
* templateId contains secondary 1..1
* templateId[secondary] ^comment = "SHALL contain exactly one [1..1] templateId (CONF:1098-7568) such that it"
  * root 1..1
  * root = "2.16.840.1.113883.10.20.22.2.1.1"
    * ^comment = "SHALL contain exactly one [1..1] @root=\"2.16.840.1.113883.10.20.22.2.1.1\" (CONF:1098-10433)."
  * extension 1..1
  * extension = "2014-06-09"
    * ^comment = "SHALL contain exactly one [1..1] @extension=\"2014-06-09\" (CONF:1098-32499)."
* code 1..1
  * ^comment = "SHALL contain exactly one [1..1] code (CONF:1098-15387)."
  * code 1..1
  * code = #10160-0
    * ^comment = "This code SHALL contain exactly one [1..1] @code=\"10160-0\" History of medication use (CONF:1098-15388)."
  * codeSystem 1..1
  * codeSystem = "2.16.840.1.113883.6.1"
    * ^comment = "This code SHALL contain exactly one [1..1] @codeSystem=\"2.16.840.1.113883.6.1\" (CodeSystem: LOINC urn:oid:2.16.840.1.113883.6.1) (CONF:1098-30825)."
* title 1..1
  * ^comment = "SHALL contain exactly one [1..1] title (CONF:1098-7570)."
* text 1..1
  * ^comment = "SHALL contain exactly one [1..1] text (CONF:1098-7571)."
* entry ^slicing.discriminator[0].type = #value
  * ^slicing.discriminator[=].path = "substanceAdministration"
  * ^slicing.rules = #open
  * ^short = "If section/@nullFlavor is not present:"
* entry contains medActivity 1..*
* entry[medActivity] ^comment = "SHALL contain at least one [1..*] entry (CONF:1098-7572) such that it"
  * substanceAdministration 1..1
  * substanceAdministration only MedicationActivity
    * ^comment = "SHALL contain exactly one [1..1] Medication Activity (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.4.16:2014-06-09) (CONF:1098-10076)."