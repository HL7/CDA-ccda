Profile: CourseofCareSection
Parent: $Section
Id: CourseofCareSection
Title: "Course of Care Section"
Description: "The Course of Care section describes what happened during the course of an encounter."
* insert LogicalModelNA
* ^identifier.value = "urn:oid:2.16.840.1.113883.10.20.22.2.64"
* templateId ^slicing.discriminator.type = #value
  * ^slicing.discriminator.path = "root"
  * ^slicing.rules = #open
* templateId contains primary 1..1
* templateId[primary] ^comment = "SHALL contain exactly one [1..1] templateId (CONF:1098-32640) such that it, SHALL not contain [0..0] extension."
  * root 1..1
  * root = "2.16.840.1.113883.10.20.22.2.64"
    * ^comment = "SHALL contain exactly one [1..1] @root=\"2.16.840.1.113883.10.20.22.2.64\" (CONF:1098-32642)."
  * extension 0..0
* code 1..1
  * ^comment = "SHALL contain exactly one [1..1] code (CONF:1098-32641)."
  * code 1..1
  * code = #8648-8
    * ^comment = "This code SHALL contain exactly one [1..1] @code=\"8648-8\" Hospital Course Narrative (CONF:1098-32645)."
  * codeSystem 1..1
  * codeSystem = "2.16.840.1.113883.6.1"
    * ^comment = "This code SHALL contain exactly one [1..1] @codeSystem=\"2.16.840.1.113883.6.1\" (CodeSystem: LOINC urn:oid:2.16.840.1.113883.6.1) (CONF:1098-32646)."
* title 1..1
  * ^comment = "SHALL contain exactly one [1..1] title (CONF:1098-32643)."
* text 1..1
  * ^comment = "SHALL contain exactly one [1..1] text (CONF:1098-32644)."