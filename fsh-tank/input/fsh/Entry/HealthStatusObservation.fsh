Profile: HealthStatusObservation
Parent: $Observation
Id: HealthStatusObservation
Title: "Health Status Observation"
Description: "This template represents information about the overall health status of the patient. To represent the impact of a specific problem or concern related to the patient's expected health outcome use the Prognosis Observation template 2.16.840.1.113883.10.20.22.4.113."
* insert LogicalModelNA
* ^identifier.value = "urn:hl7ii:2.16.840.1.113883.10.20.22.4.5:2014-06-09"
* ^version = "2014-06-09"
* classCode 1..1
* classCode = #OBS (exactly)
  * ^comment = "SHALL contain exactly one [1..1] @classCode=\"OBS\" Observation (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:1098-9057)."
* moodCode 1..1
* moodCode = #EVN (exactly)
  * ^comment = "SHALL contain exactly one [1..1] @moodCode=\"EVN\" Event (CodeSystem: HL7ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:1098-9072)."
* templateId ^slicing.discriminator[0].type = #value
  * ^slicing.discriminator[=].path = "root"
  * ^slicing.discriminator[+].type = #value
  * ^slicing.discriminator[=].path = "extension"
  * ^slicing.rules = #open
* templateId contains primary 1..1
* templateId[primary] ^comment = "SHALL contain exactly one [1..1] templateId (CONF:1098-16756) such that it"
  * root 1..1
  * root = "2.16.840.1.113883.10.20.22.4.5"
    * ^comment = "SHALL contain exactly one [1..1] @root=\"2.16.840.1.113883.10.20.22.4.5\" (CONF:1098-16757)."
  * extension 1..1
  * extension = "2014-06-09"
    * ^comment = "SHALL contain exactly one [1..1] @extension=\"2014-06-09\" (CONF:1098-32558)."
* id 1..*
  * ^comment = "SHALL contain at least one [1..*] id (CONF:1098-32486)."
* code 1..1
  * ^comment = "SHALL contain exactly one [1..1] code (CONF:1098-19143)."
  * code 1..1
  * code = #11323-3
    * ^comment = "This code SHALL contain exactly one [1..1] @code=\"11323-3\" Health status (CONF:1098-19144)."
  * codeSystem 1..1
  * codeSystem = "2.16.840.1.113883.6.1"
    * ^comment = "This code SHALL contain exactly one [1..1] @codeSystem=\"2.16.840.1.113883.6.1\" (CodeSystem: LOINC urn:oid:2.16.840.1.113883.6.1) (CONF:1098-32161)."
* statusCode 1..1
  * ^comment = "SHALL contain exactly one [1..1] statusCode (CONF:1098-9074)."
  * code 1..1
  * code = #completed (exactly)
    * ^comment = "This statusCode SHALL contain exactly one [1..1] @code=\"completed\" Completed (CodeSystem: HL7ActStatus urn:oid:2.16.840.1.113883.5.14 STATIC) (CONF:1098-19103)."
* value 1..1
* value only $CD
* value from HealthStatus (required)
  * ^comment = "SHALL contain exactly one [1..1] value with @xsi:type=\"CD\", where the code SHALL be selected from ValueSet HealthStatus urn:oid:2.16.840.1.113883.1.11.20.12 DYNAMIC (CONF:1098-9075)."