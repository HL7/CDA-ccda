Profile: ReasonforVisitSection
Parent: $Section
Id: ReasonforVisitSection
Title: "Reason for Visit Section"
Description: "This section records the patient's reason for the patient's visit (as documented by the provider). Local policy determines whether Reason for Visit and Chief Complaint are in separate or combined sections."
* insert LogicalModelNA
* ^identifier.value = "urn:oid:2.16.840.1.113883.10.20.22.2.12"
* templateId ^slicing.discriminator.type = #value
  * ^slicing.discriminator.path = "root"
  * ^slicing.rules = #open
* templateId contains primary 1..1
* templateId[primary] ^comment = "SHALL contain exactly one [1..1] templateId (CONF:81-7836) such that it, SHALL not contain [0..0] extension."
  * root 1..1
  * root = "2.16.840.1.113883.10.20.22.2.12"
    * ^comment = "SHALL contain exactly one [1..1] @root=\"2.16.840.1.113883.10.20.22.2.12\" (CONF:81-10448)."
  * extension 0..0
* code 1..1
  * ^comment = "SHALL contain exactly one [1..1] code (CONF:81-15429)."
  * code 1..1
  * code = #29299-5
    * ^comment = "This code SHALL contain exactly one [1..1] @code=\"29299-5\" Reason for Visit (CONF:81-15430)."
  * codeSystem 1..1
  * codeSystem = "2.16.840.1.113883.6.1"
    * ^comment = "This code SHALL contain exactly one [1..1] @codeSystem=\"2.16.840.1.113883.6.1\" (CodeSystem: LOINC urn:oid:2.16.840.1.113883.6.1) (CONF:81-26494)."
* title 1..1
  * ^comment = "SHALL contain exactly one [1..1] title (CONF:81-7838)."
* text 1..1
  * ^comment = "SHALL contain exactly one [1..1] text (CONF:81-7839)."