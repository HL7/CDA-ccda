Profile: VitalSignsSection
Parent: $Section
Id: VitalSignsSection
Title: "Vital Signs Section"
Description: """The Vital Signs Section contains relevant vital signs for the context and use case of the document type, such as blood pressure, heart rate, respiratory rate, height, weight, body mass index, head circumference, pulse oximetry, temperature, and body surface area. The section should include notable vital signs such as the most recent, maximum and/or minimum, baseline, or relevant trends.
Vital signs are represented in the same way as other results, but are aggregated into their own section to follow clinical conventions."""
* insert LogicalModelNA
* ^identifier.value = "urn:hl7ii:2.16.840.1.113883.10.20.22.2.4.1:2015-08-01"
* ^version = "2015-08-01"
* nullFlavor ^short = "If a required section contains no information, the @nullFlavor MAY be set to NI"
* templateId 2..
  * ^slicing.discriminator[0].type = #value
  * ^slicing.discriminator[=].path = "root"
  * ^slicing.discriminator[+].type = #value
  * ^slicing.discriminator[=].path = "extension"
  * ^slicing.rules = #open
* templateId contains secondary 1..1
* templateId[secondary] ^comment = "SHALL contain exactly one [1..1] templateId (CONF:1198-7273) such that it"
  * root 1..1
  * root = "2.16.840.1.113883.10.20.22.2.4.1"
    * ^comment = "SHALL contain exactly one [1..1] @root=\"2.16.840.1.113883.10.20.22.2.4.1\" (CONF:1198-10452)."
  * extension 1..1
  * extension = "2015-08-01"
    * ^comment = "SHALL contain exactly one [1..1] @extension=\"2015-08-01\" (CONF:1198-32585)."
* code 1..1
  * ^comment = "SHALL contain exactly one [1..1] code (CONF:1198-15962)."
  * code 1..1
  * code = #8716-3
    * ^comment = "This code SHALL contain exactly one [1..1] @code=\"8716-3\" Vital Signs (CONF:1198-15963)."
  * codeSystem 1..1
  * codeSystem = "2.16.840.1.113883.6.1"
    * ^comment = "This code SHALL contain exactly one [1..1] @codeSystem=\"2.16.840.1.113883.6.1\" (CodeSystem: LOINC urn:oid:2.16.840.1.113883.6.1) (CONF:1198-30903)."
* title 1..1
  * ^comment = "SHALL contain exactly one [1..1] title (CONF:1198-9967)."
* text 1..1
  * ^comment = "SHALL contain exactly one [1..1] text (CONF:1198-7275)."
* entry ^slicing.discriminator[0].type = #value
  * ^slicing.discriminator[=].path = "organizer"
  * ^slicing.rules = #open
  * ^short = "If section/@nullFlavor is not present:"
* entry contains organizer 1..*
* entry[organizer] ^comment = "SHALL contain at least one [1..*] entry (CONF:1198-7276) such that it"
  * organizer 1..1
  * organizer only VitalSignsOrganizer
    * ^comment = "SHALL contain exactly one [1..1] Vital Signs Organizer (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.4.26:2015-08-01) (CONF:1198-15964)."