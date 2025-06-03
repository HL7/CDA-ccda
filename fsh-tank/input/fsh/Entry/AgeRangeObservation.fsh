Profile: AgeRangeObservation
Parent: $Observation
Id: AgeRangeObservation
Title: "Age Range Observation"
Description: """This Age Range Observation captures an estimated age range when the subject's exact age is unknown. It is used in cases where only an approximate age, expressed as a range within specific age units (e.g., years), is available. For example, a person might report, "My father was between 50 and 55 years old when he developed Parkinson's disease." """

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
* value only $IVL-PQ
  * ^short = "Indicates the age range during which the event or observation occured"
  * low 1..1
    * ^comment = "This value SHALL contain exactly one [1..1] low."
    * unit 1..1
    * unit from AgePQ_UCUM (required)
  * high 0..1
    * ^comment = "This value MAY contain exactly one [0..1] high."
    * unit 1..1
    * unit from AgePQ_UCUM (required)
