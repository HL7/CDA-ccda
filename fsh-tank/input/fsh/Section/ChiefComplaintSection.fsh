Profile: ChiefComplaintSection
Parent: $Section
Id: ChiefComplaintSection
Title: "Chief Complaint Section"
Description: "This section records the patient's chief complaint (the patient's own description)."
//"<extension url=\"http://hl7.org/fhir/StructureDefinition/elementdefinition-namespace\"><valueUri value=\"http://hl7.org/cda/stds/core/StructureDefinition\"/></extension>"
* insert LogicalModelNA
* ^identifier.value = "urn:oid:1.3.6.1.4.1.19376.1.5.3.1.1.13.2.1"
* templateId ^slicing.discriminator.type = #value
  * ^slicing.discriminator.path = "root"
  * ^slicing.rules = #open
* templateId contains primary 1..1
* templateId[primary] ^comment = "SHALL contain exactly one [1..1] templateId (CONF:81-7832) such that it, SHALL not contain [0..0] extension."
  * root 1..1
  * root = "1.3.6.1.4.1.19376.1.5.3.1.1.13.2.1"
    * ^comment = "SHALL contain exactly one [1..1] @root=\"1.3.6.1.4.1.19376.1.5.3.1.1.13.2.1\" (CONF:81-10453)."
  * extension 0..0
* code 1..1
  * ^comment = "SHALL contain exactly one [1..1] code (CONF:81-15451)."
  * code 1..1
  * code = #10154-3
    * ^comment = "This code SHALL contain exactly one [1..1] @code=\"10154-3\" Chief Complaint (CONF:81-15452)."
  * codeSystem 1..1
  * codeSystem = "2.16.840.1.113883.6.1"
    * ^comment = "This code SHALL contain exactly one [1..1] @codeSystem=\"2.16.840.1.113883.6.1\" (CodeSystem: LOINC urn:oid:2.16.840.1.113883.6.1) (CONF:81-26474)."
* title 1..1
  * ^comment = "SHALL contain exactly one [1..1] title (CONF:81-7834)."
* text 1..1
  * ^comment = "SHALL contain exactly one [1..1] text (CONF:81-7835)."