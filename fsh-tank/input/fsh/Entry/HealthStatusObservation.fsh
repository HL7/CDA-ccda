Profile: HealthStatusObservation
Parent: $Observation
Id: HealthStatusObservation
Title: "Health Status Observation"
Description: "This template represents information about the overall health status of the patient. To represent the impact of a specific problem or concern related to the patient's expected health outcome use the Prognosis Observation template 2.16.840.1.113883.10.20.22.4.113."

* insert LogicalModelTemplate(health-status-obs, 2.16.840.1.113883.10.20.22.4.5, 2014-06-09)

* classCode 1..1
* classCode = #OBS (exactly)
  * ^comment = "SHALL contain exactly one [1..1] @classCode=\"OBS\" Observation (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:1098-9057)."
* moodCode 1..1
* moodCode = #EVN (exactly)
  * ^comment = "SHALL contain exactly one [1..1] @moodCode=\"EVN\" Event (CodeSystem: HL7ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:1098-9072)."
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