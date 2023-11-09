Profile: PrognosisObservation
Parent: $Observation
Id: PrognosisObservation
Title: "Prognosis Observation"
Description: """This template represents the patient's prognosis, which must be associated with a problem observation. It may serve as an alert to scope intervention plans. 
The effectiveTime represents the clinically relevant time of the observation. The observation/value is not constrained and can represent the expected life duration in PQ, an anticipated course of the disease in text, or coded term."""

* insert LogicalModelTemplateRootOnly(prognosis-obs, 2.16.840.1.113883.10.20.22.4.113)
* insert NarrativeLink

* classCode 1..1
* classCode = #OBS (exactly)
  * ^comment = "SHALL contain exactly one [1..1] @classCode=\"OBS\" Observation (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:1098-29035)."
* moodCode 1..1
* moodCode = #EVN (exactly)
  * ^comment = "SHALL contain exactly one [1..1] @moodCode=\"EVN\" Event (CodeSystem: HL7ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:1098-29036)."
* code 1..1
  * ^comment = "SHALL contain exactly one [1..1] code (CONF:1098-29039)."
  * code 1..1
  * code = #75328-5
    * ^comment = "This code SHALL contain exactly one [1..1] @code=\"75328-5\" Prognosis (CONF:1098-29468)."
  * codeSystem 1..1
  * codeSystem = "2.16.840.1.113883.6.1"
    * ^comment = "This code SHALL contain exactly one [1..1] @codeSystem=\"2.16.840.1.113883.6.1\" (CodeSystem: LOINC urn:oid:2.16.840.1.113883.6.1) (CONF:1098-31349)."
* statusCode 1..1
  * ^comment = "SHALL contain exactly one [1..1] statusCode (CONF:1098-31350)."
  * code 1..1
  * code = #completed (exactly)
    * ^comment = "This statusCode SHALL contain exactly one [1..1] @code=\"completed\" (CodeSystem: HL7ActStatus urn:oid:2.16.840.1.113883.5.14) (CONF:1098-31351)."
* effectiveTime 1..1
  * ^comment = "SHALL contain exactly one [1..1] effectiveTime (CONF:1098-31123)."
* value 1..1
  * ^comment = "SHALL contain exactly one [1..1] value (CONF:1098-29469)."