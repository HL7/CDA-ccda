Profile: ProcedureFindingsSection
Parent: $Section
Id: ProcedureFindingsSection
Title: "Procedure Findings Section"
Description: "The Procedure Findings Section records clinically significant observations confirmed or discovered during a procedure or surgery."
* insert LogicalModelNA
* ^identifier.value = "urn:hl7ii:2.16.840.1.113883.10.20.22.2.28:2015-08-01"
* ^version = "2015-08-01"
* templateId ^slicing.discriminator[0].type = #value
  * ^slicing.discriminator[=].path = "root"
  * ^slicing.discriminator[+].type = #value
  * ^slicing.discriminator[=].path = "extension"
  * ^slicing.rules = #open
* templateId contains primary 1..1
* templateId[primary] ^comment = "SHALL contain exactly one [1..1] templateId (CONF:1198-8078) such that it"
  * root 1..1
  * root = "2.16.840.1.113883.10.20.22.2.28"
    * ^comment = "SHALL contain exactly one [1..1] @root=\"2.16.840.1.113883.10.20.22.2.28\" (CONF:1198-10443)."
  * extension 1..1
  * extension = "2015-08-01"
    * ^comment = "SHALL contain exactly one [1..1] @extension=\"2015-08-01\" (CONF:1198-32537)."
* code 1..1
  * ^comment = "SHALL contain exactly one [1..1] code (CONF:1198-15417)."
  * code 1..1
  * code = #59776-5
    * ^comment = "This code SHALL contain exactly one [1..1] @code=\"59776-5\" Procedure Findings (CONF:1198-15418)."
  * codeSystem 1..1
  * codeSystem = "2.16.840.1.113883.6.1"
    * ^comment = "This code SHALL contain exactly one [1..1] @codeSystem=\"2.16.840.1.113883.6.1\" (CodeSystem: LOINC urn:oid:2.16.840.1.113883.6.1) (CONF:1198-30859)."
* title 1..1
  * ^comment = "SHALL contain exactly one [1..1] title (CONF:1198-8080)."
* text 1..1
  * ^comment = "SHALL contain exactly one [1..1] text (CONF:1198-8081)."
* entry ^slicing.discriminator[0].type = #value
  * ^slicing.discriminator[=].path = "observation"
  * ^slicing.rules = #open
* entry contains problem 0..*
* entry[problem] ^comment = "MAY contain zero or more [0..*] entry (CONF:1198-8090) such that it"
  * observation 1..1
  * observation only ProblemObservation
    * ^comment = "SHALL contain exactly one [1..1] Problem Observation (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.4.4:2015-08-01) (CONF:1198-15507)."