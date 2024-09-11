Profile: HighestPressureUlcerStage
Parent: $Observation
Id: HighestPressureUlcerStage
Title: "Highest Pressure Ulcer Stage"
Description: "This observation contains a description of the wound tissue of the most severe or highest staged pressure ulcer observed on a patient."

* insert LogicalModelTemplateRootOnly(highest-pressure-ulcer-stage, 2.16.840.1.113883.10.20.22.4.77)
* insert NarrativeLink

* classCode 1..1
* classCode = #OBS (exactly)
  * ^comment = "SHALL contain exactly one [1..1] @classCode=\"OBS\" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:81-14726)."
* moodCode 1..1
* moodCode = #EVN (exactly)
  * ^comment = "SHALL contain exactly one [1..1] @moodCode=\"EVN\" (CodeSystem: HL7ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:81-14727)."
* id 1..*
  * ^comment = "SHALL contain at least one [1..*] id (CONF:81-14730)."
* code 1..1
  * insert CodedSnomed(420905001, Highest pressure injury stage)
  * ^comment = "This code SHALL contain exactly one [1..1] @code=\"420905001\" Highest Pressure Ulcer Stage (CodeSystem: SNOMED CT urn:oid:2.16.840.1.113883.6.96 STATIC) (CONF:81-14732)."
* value 1..1
  * ^comment = "SHALL contain exactly one [1..1] value (CONF:81-14733)."