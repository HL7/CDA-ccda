Profile: HospitalDischargeInstructionsSection
Parent: $Section
Id: HospitalDischargeInstructionsSection
Title: "Hospital Discharge Instructions Section"
Description: "The Hospital Discharge Instructions Section records instructions at discharge."
* insert LogicalModelNA
* ^identifier.value = "urn:oid:2.16.840.1.113883.10.20.22.2.41"
* templateId ^slicing.discriminator.type = #value
  * ^slicing.discriminator.path = "root"
  * ^slicing.rules = #open
* templateId contains primary 1..1
* templateId[primary] ^comment = "SHALL contain exactly one [1..1] templateId (CONF:81-9919) such that it, SHALL not contain [0..0] extension."
  * root 1..1
  * root = "2.16.840.1.113883.10.20.22.2.41"
    * ^comment = "SHALL contain exactly one [1..1] @root=\"2.16.840.1.113883.10.20.22.2.41\" (CONF:81-10395)."
  * extension 0..0
* code 1..1
  * ^comment = "SHALL contain exactly one [1..1] code (CONF:81-15357)."
  * code 1..1
  * code = #8653-8
    * ^comment = "This code SHALL contain exactly one [1..1] @code=\"8653-8\" Hospital Discharge Instructions (CONF:81-15358)."
  * codeSystem 1..1
  * codeSystem = "2.16.840.1.113883.6.1"
    * ^comment = "This code SHALL contain exactly one [1..1] @codeSystem=\"2.16.840.1.113883.6.1\" (CodeSystem: LOINC urn:oid:2.16.840.1.113883.6.1) (CONF:81-26481)."
* title 1..1
  * ^comment = "SHALL contain exactly one [1..1] title (CONF:81-9921)."
* text 1..1
  * ^comment = "SHALL contain exactly one [1..1] text (CONF:81-9922)."