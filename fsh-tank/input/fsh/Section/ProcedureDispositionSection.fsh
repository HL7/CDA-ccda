Profile: ProcedureDispositionSection
Parent: $Section
Id: ProcedureDispositionSection
Title: "Procedure Disposition Section"
Description: "The Procedure Disposition Section records the status and condition of the patient at the completion of the procedure or surgery. It often also states where the patient was transferred to for the next level of care."
* insert LogicalModelNA
* ^identifier.value = "urn:oid:2.16.840.1.113883.10.20.18.2.12"
* templateId ^slicing.discriminator.type = #value
  * ^slicing.discriminator.path = "root"
  * ^slicing.rules = #open
* templateId contains primary 1..1
* templateId[primary] ^comment = "SHALL contain exactly one [1..1] templateId (CONF:81-8070) such that it, SHALL not contain [0..0] extension."
  * root 1..1
  * root = "2.16.840.1.113883.10.20.18.2.12"
    * ^comment = "SHALL contain exactly one [1..1] @root=\"2.16.840.1.113883.10.20.18.2.12\" (CONF:81-10466)."
  * extension 0..0
* code 1..1
  * ^comment = "SHALL contain exactly one [1..1] code (CONF:81-15413)."
  * code 1..1
  * code = #59775-7
    * ^comment = "This code SHALL contain exactly one [1..1] @code=\"59775-7\" Procedure Disposition (CONF:81-15414)."
  * codeSystem 1..1
  * codeSystem = "2.16.840.1.113883.6.1"
    * ^comment = "This code SHALL contain exactly one [1..1] @codeSystem=\"2.16.840.1.113883.6.1\" (CodeSystem: LOINC urn:oid:2.16.840.1.113883.6.1) (CONF:81-26490)."
* title 1..1
  * ^comment = "SHALL contain exactly one [1..1] title (CONF:81-8072)."
* text 1..1
  * ^comment = "SHALL contain exactly one [1..1] text (CONF:81-8073)."