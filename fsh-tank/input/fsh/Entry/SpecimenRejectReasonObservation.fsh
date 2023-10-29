Profile: SpecimenRejectReasonObservation
Parent: $Observation
Id: SpecimenRejectReasonObservation
Title: "Specimen Reject Reason Observation"
Description: """This template describes a reason the specimen was rejected for the specified observation/result/analysis. A specimen may be rejected due to multiple reasons, in which case, multiple instances of this template should be used."""

* insert LogicalModelTemplate(specimen-reject-reason-obs, 2.16.840.1.113883.10.20.22.4.420, 2018-09-01)
* insert NarrativeLink

* classCode 1..1
* classCode = #OBS (exactly)
* moodCode 1..1
* moodCode = #EVN (exactly)
* code 1..1
  * insert CodedLoinc(93048-7, [[Reason for specimen rejection]])
* value 1..1
* value only CD
* value from http://terminology.hl7.org/ValueSet/v2-0490 (preferred)
