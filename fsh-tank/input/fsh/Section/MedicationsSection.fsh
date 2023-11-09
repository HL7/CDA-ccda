Profile: MedicationsSection
Parent: $Section
Id: MedicationsSection
Title: "Medications Section"
Description: """The Medications Section contains a patient's current medications and pertinent medication history. At a minimum, the currently active medications are listed. An entire medication history is an option. The section can describe a patient's prescription and dispense history and information about intended drug monitoring. 

This section requires either an entry indicating the subject is not known to be on any medications or entries summarizing the subject's medications."""
* nullFlavor ^short = "If a required section contains no information, the @nullFlavor MAY be set to NI"

* insert Section(#10160-0, History of medication use, 2.16.840.1.113883.10.20.22.2.1.1, 2014-06-09)
* entry ^slicing.discriminator[0].type = #value
  * ^slicing.discriminator[=].path = "substanceAdministration"
  * ^slicing.rules = #open
  * ^short = "If section/@nullFlavor is not present:"
* entry contains medActivity 0..*
* entry[medActivity] ^comment = "SHALL contain at least one [1..*] entry (CONF:1098-7572) such that it"
  * substanceAdministration 1..1
  * substanceAdministration only MedicationActivity
    * ^comment = "SHALL contain exactly one [1..1] Medication Activity (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.4.16:2014-06-09) (CONF:1098-10076)."
* obeys shall-med-activity