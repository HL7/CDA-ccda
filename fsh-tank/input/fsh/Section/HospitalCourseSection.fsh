Profile: HospitalCourseSection
Parent: $Section
Id: HospitalCourseSection
Title: "Hospital Course Section"
Description: "The Hospital Course Section describes the sequence of events from admission to discharge in a hospital facility."
* insert LogicalModelNA
* ^identifier.value = "urn:oid:1.3.6.1.4.1.19376.1.5.3.1.3.5"
* templateId ^slicing.discriminator.type = #value
  * ^slicing.discriminator.path = "root"
  * ^slicing.rules = #open
* templateId contains primary 1..1
* templateId[primary] ^comment = "SHALL contain exactly one [1..1] templateId (CONF:81-7852) such that it, SHALL not contain [0..0] extension."
  * root 1..1
  * root = "1.3.6.1.4.1.19376.1.5.3.1.3.5"
    * ^comment = "SHALL contain exactly one [1..1] @root=\"1.3.6.1.4.1.19376.1.5.3.1.3.5\" (CONF:81-10459)."
  * extension 0..0
* code 1..1
  * ^comment = "SHALL contain exactly one [1..1] code (CONF:81-15487)."
  * code 1..1
  * code = #8648-8
    * ^comment = "This code SHALL contain exactly one [1..1] @code=\"8648-8\" Hospital Course (CONF:81-15488)."
  * codeSystem 1..1
  * codeSystem = "2.16.840.1.113883.6.1"
    * ^comment = "This code SHALL contain exactly one [1..1] @codeSystem=\"2.16.840.1.113883.6.1\" (CodeSystem: LOINC urn:oid:2.16.840.1.113883.6.1) (CONF:81-26480)."
* title 1..1
  * ^comment = "SHALL contain exactly one [1..1] title (CONF:81-7854)."
* text 1..1
  * ^comment = "SHALL contain exactly one [1..1] text (CONF:81-7855)."