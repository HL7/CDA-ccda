Profile: HospitalDischargePhysicalSection
Parent: $Section
Id: HospitalDischargePhysicalSection
Title: "Hospital Discharge Physical Section"
Description: "The Hospital Discharge Physical Section records a narrative description of the patient's physical findings."
* insert LogicalModelNA
* ^identifier.value = "urn:oid:1.3.6.1.4.1.19376.1.5.3.1.3.26"
* templateId ^slicing.discriminator.type = #value
  * ^slicing.discriminator.path = "root"
  * ^slicing.rules = #open
* templateId contains primary 1..1
* templateId[primary] ^comment = "SHALL contain exactly one [1..1] templateId (CONF:81-7971) such that it, SHALL not contain [0..0] extension."
  * root 1..1
  * root = "1.3.6.1.4.1.19376.1.5.3.1.3.26"
    * ^comment = "SHALL contain exactly one [1..1] @root=\"1.3.6.1.4.1.19376.1.5.3.1.3.26\" (CONF:81-10460)."
  * extension 0..0
* code 1..1
  * ^comment = "SHALL contain exactly one [1..1] code (CONF:81-15363)."
  * code 1..1
  * code = #10184-0
    * ^comment = "This code SHALL contain exactly one [1..1] @code=\"10184-0\" Hospital Discharge Physical (CONF:81-15364)."
  * codeSystem 1..1
  * codeSystem = "2.16.840.1.113883.6.1"
    * ^comment = "This code SHALL contain exactly one [1..1] @codeSystem=\"2.16.840.1.113883.6.1\" (CodeSystem: LOINC urn:oid:2.16.840.1.113883.6.1) (CONF:81-26482)."
* title 1..1
  * ^comment = "SHALL contain exactly one [1..1] title (CONF:81-7973)."
* text 1..1
  * ^comment = "SHALL contain exactly one [1..1] text (CONF:81-7974)."