Profile: OperativeNoteFluidsSection
Parent: $Section
Id: OperativeNoteFluidsSection
Title: "Operative Note Fluids Section"
Description: "The Operative Note Fluids Section may be used to record fluids administered during the surgical procedure."
* insert LogicalModelNA
* ^identifier.value = "urn:oid:2.16.840.1.113883.10.20.7.12"
* obeys 81-8052
* templateId ^slicing.discriminator.type = #value
  * ^slicing.discriminator.path = "root"
  * ^slicing.rules = #open
* templateId contains primary 1..1
* templateId[primary] ^comment = "SHALL contain exactly one [1..1] templateId (CONF:81-8030) such that it, SHALL not contain [0..0] extension."
  * root 1..1
  * root = "2.16.840.1.113883.10.20.7.12"
    * ^comment = "SHALL contain exactly one [1..1] @root=\"2.16.840.1.113883.10.20.7.12\" (CONF:81-10463)."
  * extension 0..0
* code 1..1
  * ^comment = "SHALL contain exactly one [1..1] code (CONF:81-15391)."
  * code 1..1
  * code = #10216-0
    * ^comment = "This code SHALL contain exactly one [1..1] @code=\"10216-0\" Operative Note Fluids (CONF:81-15392)."
  * codeSystem 1..1
  * codeSystem = "2.16.840.1.113883.6.1"
    * ^comment = "This code SHALL contain exactly one [1..1] @codeSystem=\"2.16.840.1.113883.6.1\" (CodeSystem: LOINC urn:oid:2.16.840.1.113883.6.1) (CONF:81-26486)."
* title 1..1
  * ^comment = "SHALL contain exactly one [1..1] title (CONF:81-8032)."
* text 1..1
  * ^comment = "SHALL contain exactly one [1..1] text (CONF:81-8033)."

Invariant: 81-8052
Description: "If the Operative Note Fluids section is present, there SHALL be a statement providing details of the fluids administered or SHALL explicitly state there were no fluids administered (CONF:81-8052)."
Severity: #warning