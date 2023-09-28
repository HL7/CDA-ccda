Profile: ProcedureEstimatedBloodLossSection
Parent: $Section
Id: ProcedureEstimatedBloodLossSection
Title: "Procedure Estimated Blood Loss Section"
Description: "The Procedure Estimated Blood Loss Section may be a subsection of another section such as the Procedure Description Section. The Procedure Estimated Blood Loss Section records the approximate amount of blood that the patient lost during the procedure or surgery. It may be an accurate quantitative amount, e.g., 250 milliliters, or it may be descriptive, e.g., minimal or none."
* insert LogicalModelNA
* ^identifier.value = "urn:oid:2.16.840.1.113883.10.20.18.2.9"
* obeys 81-8741
* templateId ^slicing.discriminator.type = #value
  * ^slicing.discriminator.path = "root"
  * ^slicing.rules = #open
* templateId contains primary 1..1
* templateId[primary] ^comment = "SHALL contain exactly one [1..1] templateId (CONF:81-8074) such that it, SHALL not contain [0..0] extension."
  * root 1..1
  * root = "2.16.840.1.113883.10.20.18.2.9"
    * ^comment = "SHALL contain exactly one [1..1] @root=\"2.16.840.1.113883.10.20.18.2.9\" (CONF:81-10467)."
  * extension 0..0
* code 1..1
  * ^comment = "SHALL contain exactly one [1..1] code (CONF:81-15415)."
  * code 1..1
  * code = #59770-8
    * ^comment = "This code SHALL contain exactly one [1..1] @code=\"59770-8\" Procedure Estimated Blood Loss (CONF:81-15416)."
  * codeSystem 1..1
  * codeSystem = "2.16.840.1.113883.6.1"
    * ^comment = "This code SHALL contain exactly one [1..1] @codeSystem=\"2.16.840.1.113883.6.1\" (CodeSystem: LOINC urn:oid:2.16.840.1.113883.6.1) (CONF:81-26491)."
* title 1..1
  * ^comment = "SHALL contain exactly one [1..1] title (CONF:81-8076)."
* text 1..1
  * ^comment = "SHALL contain exactly one [1..1] text (CONF:81-8077)."

Invariant: 81-8741
Description: "The Estimated Blood Loss section SHALL include a statement providing an estimate of the amount of blood lost during the procedure, even if the estimate is text, such as \"minimal\" or \"none\" (CONF:81-8741)."
Severity: #warning