Profile: MedicationsAdministeredSection
Parent: $Section
Id: MedicationsAdministeredSection
Title: "Medications Administered Section"
Description: """The Medications Administered Section usually resides inside a Procedure Note describing a procedure. This section defines medications and fluids administered during the procedure, its related encounter, or other procedure related activity excluding anesthetic medications. Anesthesia medications should be documented as described in the Anesthesia Section
templateId 2.16.840.1.113883.10.20.22.2.25."""
* insert LogicalModelNA
* ^identifier.value = "urn:hl7ii:2.16.840.1.113883.10.20.22.2.38:2014-06-09"
* ^version = "2014-06-09"
* templateId ^slicing.discriminator[0].type = #value
  * ^slicing.discriminator[=].path = "root"
  * ^slicing.discriminator[+].type = #value
  * ^slicing.discriminator[=].path = "extension"
  * ^slicing.rules = #open
* templateId contains primary 1..1
* templateId[primary] ^comment = "SHALL contain exactly one [1..1] templateId (CONF:1098-8152) such that it"
  * root 1..1
  * root = "2.16.840.1.113883.10.20.22.2.38"
    * ^comment = "SHALL contain exactly one [1..1] @root=\"2.16.840.1.113883.10.20.22.2.38\" (CONF:1098-10405)."
  * extension 1..1
  * extension = "2014-06-09"
    * ^comment = "SHALL contain exactly one [1..1] @extension=\"2014-06-09\" (CONF:1098-32525)."
* code 1..1
  * ^comment = "SHALL contain exactly one [1..1] code (CONF:1098-15383)."
  * code 1..1
  * code = #29549-3
    * ^comment = "This code SHALL contain exactly one [1..1] @code=\"29549-3\" Medications Administered (CONF:1098-15384)."
  * codeSystem 1..1
  * codeSystem = "2.16.840.1.113883.6.1"
    * ^comment = "This code SHALL contain exactly one [1..1] @codeSystem=\"2.16.840.1.113883.6.1\" (CodeSystem: LOINC urn:oid:2.16.840.1.113883.6.1) (CONF:1098-30829)."
* title 1..1
  * ^comment = "SHALL contain exactly one [1..1] title (CONF:1098-8154)."
* text 1..1
  * ^comment = "SHALL contain exactly one [1..1] text (CONF:1098-8155)."
* entry 0..*
  * ^comment = "MAY contain zero or more [0..*] entry (CONF:1098-8156)."
  * substanceAdministration 1..1
  * substanceAdministration only MedicationActivity
    * ^comment = "The entry, if present, SHALL contain exactly one [1..1] Medication Activity (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.4.16:2014-06-09) (CONF:1098-15499)."