Profile: AssessmentSection
Parent: $Section
Id: AssessmentSection
Title: "Assessment Section"
Description: "The Assessment Section (also referred to as \"impression\" or \"diagnoses\" outside of the context of CDA) represents the clinician's conclusions and working assumptions that will guide treatment of the patient. The assessment may be a list of specific disease entities or a narrative block."
* insert LogicalModelNA
* ^identifier.value = "urn:oid:2.16.840.1.113883.10.20.22.2.8"
* templateId ^slicing.discriminator.type = #value
  * ^slicing.discriminator.path = "root"
  * ^slicing.rules = #open
* templateId contains primary 1..1
* templateId[primary] ^comment = "SHALL contain exactly one [1..1] templateId (CONF:81-7711) such that it, SHALL not contain [0..0] extension."
  * root 1..1
  * root = "2.16.840.1.113883.10.20.22.2.8"
    * ^comment = "SHALL contain exactly one [1..1] @root=\"2.16.840.1.113883.10.20.22.2.8\" (CONF:81-10382)."
  * extension 0..0
* code 1..1
  * ^comment = "SHALL contain exactly one [1..1] code (CONF:81-14757)."
  * code 1..1
  * code = #51848-0
    * ^comment = "This code SHALL contain exactly one [1..1] @code=\"51848-0\" Assessments (CONF:81-14758)."
  * codeSystem 1..1
  * codeSystem = "2.16.840.1.113883.6.1"
    * ^comment = "This code SHALL contain exactly one [1..1] @codeSystem=\"2.16.840.1.113883.6.1\" (CodeSystem: LOINC urn:oid:2.16.840.1.113883.6.1) (CONF:81-26472)."
* title 1..1
  * ^comment = "SHALL contain exactly one [1..1] title (CONF:81-16774)."
* text 1..1
  * ^comment = "SHALL contain exactly one [1..1] text (CONF:81-7713)."