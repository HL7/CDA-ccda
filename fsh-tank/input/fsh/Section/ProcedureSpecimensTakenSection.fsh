Profile: ProcedureSpecimensTakenSection
Parent: $Section
Id: ProcedureSpecimensTakenSection
Title: "Procedure Specimens Taken Section"
Description: "The Procedure Specimens Taken Section records the tissues, objects, or samples taken from the patient during the procedure including biopsies, aspiration fluid, or other samples sent for pathological analysis. The narrative may include a description of the specimens."
* insert LogicalModelNA
* ^identifier.value = "urn:oid:2.16.840.1.113883.10.20.22.2.31"
* obeys 81-8742
* templateId ^slicing.discriminator.type = #value
  * ^slicing.discriminator.path = "root"
  * ^slicing.rules = #open
* templateId contains primary 1..1
* templateId[primary] ^comment = "SHALL contain exactly one [1..1] templateId (CONF:81-8086) such that it, SHALL not contain [0..0] extension."
  * root 1..1
  * root = "2.16.840.1.113883.10.20.22.2.31"
    * ^comment = "SHALL contain exactly one [1..1] @root=\"2.16.840.1.113883.10.20.22.2.31\" (CONF:81-10446)."
  * extension 0..0
* code 1..1
  * ^comment = "SHALL contain exactly one [1..1] code (CONF:81-15421)."
  * code 1..1
  * code = #59773-2
    * ^comment = "This code SHALL contain exactly one [1..1] @code=\"59773-2\" Procedure Specimens Taken (CONF:81-15422)."
  * codeSystem 1..1
  * codeSystem = "2.16.840.1.113883.6.1"
    * ^comment = "This code SHALL contain exactly one [1..1] @codeSystem=\"2.16.840.1.113883.6.1\" (CodeSystem: LOINC urn:oid:2.16.840.1.113883.6.1) (CONF:81-26493)."
* title 1..1
  * ^comment = "SHALL contain exactly one [1..1] title (CONF:81-8088)."
* text 1..1
  * ^comment = "SHALL contain exactly one [1..1] text (CONF:81-8089)."

Invariant: 81-8742
Description: "The Procedure Specimens Taken section SHALL list all specimens removed or SHALL explicitly state that no specimens were taken (CONF:81-8742)."
Severity: #warning