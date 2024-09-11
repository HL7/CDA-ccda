Profile: AssessmentScaleSupportingObservation
Parent: $Observation
Id: AssessmentScaleSupportingObservation
Title: "Assessment Scale Supporting Observation"
Description: "An Assessment Scale Supporting Observation represents the components of a scale used in an Assessment Scale Observation. The individual parts that make up the component may be a group of physical, cognitive, functional status, social observations or answers to questions.

The calculated score derived from the integers in observation.value.translationCode, if a calculated score and integer values exists in the originating questionaire or scale, is present in the containing Assessment Scale Observation."

* insert LogicalModelTemplate(assessment-scale-supporting-obs, 2.16.840.1.113883.10.20.22.4.86, 2022-06-01)
* insert NarrativeLink

* classCode 1..1
* classCode = #OBS (exactly)
  * ^comment = "SHALL contain exactly one [1..1] @classCode=\"OBS\" Observation (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:4515-16715)."
* moodCode 1..1
* moodCode = #EVN (exactly)
  * ^comment = "SHALL contain exactly one [1..1] @moodCode=\"EVN\" Event (CodeSystem: HL7ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:4515-16716)."
* id 1..*
  * ^comment = "SHALL contain at least one [1..*] id (CONF:4515-16724)."
* code 1..1
  * ^comment = "SHALL contain exactly one [1..1] code, which SHALL be selected from CodeSystem LOINC (urn:oid:2.16.840.1.113883.6.1) DYNAMIC (CONF:4515-19178)."
* statusCode 1..1
  * ^comment = "SHALL contain exactly one [1..1] statusCode (CONF:4515-16720)."
  * code 1..1
  * code = #completed (exactly)
    * ^comment = "This statusCode SHALL contain exactly one [1..1] @code=\"completed\" Completed (CodeSystem: HL7ActStatus urn:oid:2.16.840.1.113883.5.14 STATIC) (CONF:4515-19089)."
* value 1..*
  * ^comment = "SHALL contain at least one [1..*] value (CONF:4515-16754)."
  * ^short = "If xsi:type=\"CD\", MAY have a translation code to further specify the source if the instrument has an applicable code system and value set for the integer (CONF:14639) (CONF:4515-16755)."