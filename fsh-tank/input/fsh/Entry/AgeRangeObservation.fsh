Profile: AgeRangeObservation
Parent: $Observation
Id: AgeRangeObservation
Title: "Age Range Observation"
Description: "This Age Range Observation represents the subject's age during an event or observation when the precise age is unknown. This is to be used when the onset of an event, condition, or observation occurs over a range of time."

* insert LogicalModelTemplateRootOnly(age-obs, 2.16.840.1.113883.10.20.22.4.31)
* insert NarrativeLink

* classCode 1..1
* classCode = #OBS (exactly)
  * ^comment = "SHALL contain exactly one [1..1] @classCode=\"OBS\" Observation (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:81-7613)."
* moodCode 1..1
* moodCode = #EVN (exactly)
  * ^comment = "SHALL contain exactly one [1..1] @moodCode=\"EVN\" Event (CodeSystem: HL7ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:81-7614)."
* code 1..1
  * insert CodedSnomed(445518008, Age at onset of clinical finding)
  * ^comment = "This code SHALL contain exactly one [1..1] @code=\"445518008\" Age At Onset (CONF:81-16776)."
* statusCode 1..1
  * ^comment = "SHALL contain exactly one [1..1] statusCode (CONF:81-15965)."
  * code 1..1
  * code = #completed (exactly)
    * ^comment = "This statusCode SHALL contain exactly one [1..1] @code=\"completed\" Completed (CodeSystem: HL7ActStatus urn:oid:2.16.840.1.113883.5.14 STATIC) (CONF:81-15966)."
* value 1..1
* value only $IVL-TS
  * ^short = "Indicates the time during which the condition or event occured"
  * ^comment = "SHALL contain exactly one [1..1] value with @xsi:type=\"IVL_TS\" (CONF:4515-14)."
  * low 1..1
    * ^comment = "This value SHALL contain exactly one [1..1] low (CONF:4515-33030)."