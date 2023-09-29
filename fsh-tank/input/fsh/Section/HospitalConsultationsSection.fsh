Profile: HospitalConsultationsSection
Parent: $Section
Id: HospitalConsultationsSection
Title: "Hospital Consultations Section"
Description: "The Hospital Consultations Section records consultations that occurred during the admission."
* insert LogicalModelNA
* ^identifier.value = "urn:oid:2.16.840.1.113883.10.20.22.2.42"
* templateId ^slicing.discriminator.type = #value
  * ^slicing.discriminator.path = "root"
  * ^slicing.rules = #open
* templateId contains primary 1..1
* templateId[primary] ^comment = "SHALL contain exactly one [1..1] templateId (CONF:81-9915) such that it, SHALL not contain [0..0] extension."
  * root 1..1
  * root = "2.16.840.1.113883.10.20.22.2.42"
    * ^comment = "SHALL contain exactly one [1..1] @root=\"2.16.840.1.113883.10.20.22.2.42\" (CONF:81-10393)."
  * extension 0..0
* code 1..1
  * ^comment = "SHALL contain exactly one [1..1] code (CONF:81-15485)."
  * code 1..1
  * code = #18841-7
    * ^comment = "This code SHALL contain exactly one [1..1] @code=\"18841-7\" Hospital Consultations Section (CONF:81-15486)."
  * codeSystem 1..1
  * codeSystem = "2.16.840.1.113883.6.1"
    * ^comment = "This code SHALL contain exactly one [1..1] @codeSystem=\"2.16.840.1.113883.6.1\" (CodeSystem: LOINC urn:oid:2.16.840.1.113883.6.1) (CONF:81-26479)."
* title 1..1
  * ^comment = "SHALL contain exactly one [1..1] title (CONF:81-9917)."
* text 1..1
  * ^comment = "SHALL contain exactly one [1..1] text (CONF:81-9918)."