Profile: SpecimenConditionObservation
Parent: $Observation
Id: SpecimenConditionObservation
Title: "Specimen Condition Observation"
Description: """This template captures the condition or state of the specimen as identified by the laboratory upon receipt or during processing—such as hemolysis, clotting, or contamination. These conditions provide critical context for interpreting results or determining whether the specimen is suitable for testing. If multiple conditions apply, each should be represented using a separate instance of this template."""

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
