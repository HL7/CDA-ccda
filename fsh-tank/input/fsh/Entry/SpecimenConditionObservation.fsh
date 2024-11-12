Profile: SpecimenConditionObservation
Parent: $Observation
Id: SpecimenConditionObservation
Title: "Specimen Condition Observation"
Description: """This template conveys the condition (mode or state of being) that describes the nature of the specimen.  A specimen may have multiple condition codes associated with it, in which case multiple instances of this template should be used. Values should be drawn from the HL7 V2 table 0493."""

* insert LogicalModelTemplate(specimen-condition-obs, 2.16.840.1.113883.10.20.22.4.421, 2018-06-12)
* insert NarrativeLink

* classCode 1..1
* classCode = #OBS (exactly)
* moodCode 1..1
* moodCode = #EVN (exactly)
* code 1..1
  * insert CodedLoinc(93047-7, [[Specimen condition]])
* value 1..1
* value only CD
* value from http://hl7.org/fhir/us/core/ValueSet/us-core-specimen-condition (preferred)
