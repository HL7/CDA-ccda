Profile: OperativeNoteSurgicalProcedureSection
Parent: $Section
Id: OperativeNoteSurgicalProcedureSection
Title: "Operative Note Surgical Procedure Section"
Description: "The Operative Note Surgical Procedure Section can be used to restate the procedures performed if appropriate for an enterprise workflow. The procedure(s) performed associated with the Operative Note are formally modeled in the header using serviceEvent."
* insert LogicalModelNA
* ^identifier.value = "urn:oid:2.16.840.1.113883.10.20.7.14"
* obeys 81-8054
* templateId ^slicing.discriminator.type = #value
  * ^slicing.discriminator.path = "root"
  * ^slicing.rules = #open
* templateId contains primary 1..1
* templateId[primary] ^comment = "SHALL contain exactly one [1..1] templateId (CONF:81-8034) such that it, SHALL not contain [0..0] extension."
  * root 1..1
  * root = "2.16.840.1.113883.10.20.7.14"
    * ^comment = "SHALL contain exactly one [1..1] @root=\"2.16.840.1.113883.10.20.7.14\" (CONF:81-10464)."
  * extension 0..0
* code 1..1
  * ^comment = "SHALL contain exactly one [1..1] code (CONF:81-15393)."
  * code 1..1
  * code = #10223-6
    * ^comment = "This code SHALL contain exactly one [1..1] @code=\"10223-6\" Operative Note Surgical Procedure (CONF:81-15394)."
  * codeSystem 1..1
  * codeSystem = "2.16.840.1.113883.6.1"
    * ^comment = "This code SHALL contain exactly one [1..1] @codeSystem=\"2.16.840.1.113883.6.1\" (CodeSystem: LOINC urn:oid:2.16.840.1.113883.6.1) (CONF:81-26487)."
* title 1..1
  * ^comment = "SHALL contain exactly one [1..1] title (CONF:81-8036)."
* text 1..1
  * ^comment = "SHALL contain exactly one [1..1] text (CONF:81-8037)."

Invariant: 81-8054
Description: "If the surgical procedure section is present there SHALL be text indicating the procedure performed (CONF:81-8054)."
Severity: #warning