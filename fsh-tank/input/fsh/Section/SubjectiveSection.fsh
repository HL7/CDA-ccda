Profile: SubjectiveSection
Parent: $Section
Id: SubjectiveSection
Title: "Subjective Section"
Description: "The Subjective Section describes in a narrative format the patient's current condition and/or interval changes as reported by the patient or by the patient's guardian or another informant."
* insert LogicalModelNA
* ^identifier.value = "urn:oid:2.16.840.1.113883.10.20.21.2.2"
* templateId ^slicing.discriminator.type = #value
  * ^slicing.discriminator.path = "root"
  * ^slicing.rules = #open
* templateId contains primary 1..1
* templateId[primary] ^comment = "SHALL contain exactly one [1..1] templateId (CONF:81-7873) such that it, SHALL not contain [0..0] extension."
  * root 1..1
  * root = "2.16.840.1.113883.10.20.21.2.2"
    * ^comment = "SHALL contain exactly one [1..1] @root=\"2.16.840.1.113883.10.20.21.2.2\" (CONF:81-10470)."
  * extension 0..0
* code 1..1
  * ^comment = "SHALL contain exactly one [1..1] code (CONF:81-15437)."
  * code 1..1
  * code = #61150-9
    * ^comment = "This code SHALL contain exactly one [1..1] @code=\"61150-9\" Subjective (CONF:81-15438)."
  * codeSystem 1..1
  * codeSystem = "2.16.840.1.113883.6.1"
    * ^comment = "This code SHALL contain exactly one [1..1] @codeSystem=\"2.16.840.1.113883.6.1\" (CodeSystem: LOINC urn:oid:2.16.840.1.113883.6.1) (CONF:81-26496)."
* title 1..1
  * ^comment = "SHALL contain exactly one [1..1] title (CONF:81-7875)."
* text 1..1
  * ^comment = "SHALL contain exactly one [1..1] text (CONF:81-7876)."