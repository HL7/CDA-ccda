Profile: SurgicalDrainsSection
Parent: $Section
Id: SurgicalDrainsSection
Title: "Surgical Drains Section"
Description: "The Surgical Drains Section may be used to record drains placed during the surgical procedure. Optionally, surgical drain placement may be represented with a text element in the Procedure Description Section."
* insert LogicalModelNA
* ^identifier.value = "urn:oid:2.16.840.1.113883.10.20.7.13"
* obeys 81-8056
* templateId ^slicing.discriminator.type = #value
  * ^slicing.discriminator.path = "root"
  * ^slicing.rules = #open
* templateId contains primary 1..1
* templateId[primary] ^comment = "SHALL contain exactly one [1..1] templateId (CONF:81-8038) such that it, SHALL not contain [0..0] extension."
  * root 1..1
  * root = "2.16.840.1.113883.10.20.7.13"
    * ^comment = "SHALL contain exactly one [1..1] @root=\"2.16.840.1.113883.10.20.7.13\" (CONF:81-10473)."
  * extension 0..0
* code 1..1
  * ^comment = "SHALL contain exactly one [1..1] code (CONF:81-15441)."
  * code 1..1
  * code = #11537-8
    * ^comment = "This code SHALL contain exactly one [1..1] @code=\"11537-8\" Surgical Drains (CONF:81-15442)."
  * codeSystem 1..1
  * codeSystem = "2.16.840.1.113883.6.1"
    * ^comment = "This code SHALL contain exactly one [1..1] @codeSystem=\"2.16.840.1.113883.6.1\" (CodeSystem: LOINC urn:oid:2.16.840.1.113883.6.1) (CONF:81-26498)."
* title 1..1
  * ^comment = "SHALL contain exactly one [1..1] title (CONF:81-8040)."
* text 1..1
  * ^comment = "SHALL contain exactly one [1..1] text (CONF:81-8041)."

Invariant: 81-8056
Description: "If the Surgical Drains section is present, there SHALL be a statement providing details of the drains placed or SHALL explicitly state there were no drains placed (CONF:81-8056)."
Severity: #warning