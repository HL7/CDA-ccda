Profile: PastMedicalHistory
Parent: $Section
Id: PastMedicalHistory
Title: "Past Medical History"
Description: "This section contains a record of the patient's past complaints, problems, and diagnoses. It contains data from the patient's past up to the patient's current complaint or reason for seeking medical care."
* insert LogicalModelNA
* ^identifier.value = "urn:hl7ii:2.16.840.1.113883.10.20.22.2.20:2015-08-01"
* ^version = "2015-08-01"
* templateId ^slicing.discriminator[0].type = #value
  * ^slicing.discriminator[=].path = "root"
  * ^slicing.discriminator[+].type = #value
  * ^slicing.discriminator[=].path = "extension"
  * ^slicing.rules = #open
* templateId contains primary 1..1
* templateId[primary] ^comment = "SHALL contain exactly one [1..1] templateId (CONF:1198-7828) such that it"
  * root 1..1
  * root = "2.16.840.1.113883.10.20.22.2.20"
    * ^comment = "SHALL contain exactly one [1..1] @root=\"2.16.840.1.113883.10.20.22.2.20\" (CONF:1198-10390)."
  * extension 1..1
  * extension = "2015-08-01"
    * ^comment = "SHALL contain exactly one [1..1] @extension=\"2015-08-01\" (CONF:1198-32536)."
* code 1..1
  * ^comment = "SHALL contain exactly one [1..1] code (CONF:1198-15474)."
  * code 1..1
  * code = #11348-0
    * ^comment = "This code SHALL contain exactly one [1..1] @code=\"11348-0\" History of Past Illness (CONF:1198-15475)."
  * codeSystem 1..1
  * codeSystem = "2.16.840.1.113883.6.1"
    * ^comment = "This code SHALL contain exactly one [1..1] @codeSystem=\"2.16.840.1.113883.6.1\" (CodeSystem: LOINC urn:oid:2.16.840.1.113883.6.1) (CONF:1198-30831)."
* title 1..1
  * ^comment = "SHALL contain exactly one [1..1] title (CONF:1198-7830)."
* text 1..1
  * ^comment = "SHALL contain exactly one [1..1] text (CONF:1198-7831)."
* entry ^slicing.discriminator[0].type = #value
  * ^slicing.discriminator[=].path = "observation"
  * ^slicing.rules = #open
* entry contains problem 0..*
* entry[problem] ^comment = "MAY contain zero or more [0..*] entry (CONF:1198-8791) such that it"
  * observation 1..1
  * observation only ProblemObservation
    * ^comment = "SHALL contain exactly one [1..1] Problem Observation (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.4.4:2015-08-01) (CONF:1198-15476)."