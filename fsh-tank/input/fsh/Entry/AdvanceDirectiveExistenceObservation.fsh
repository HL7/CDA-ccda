Profile: AdvanceDirectiveExistenceObservation
Parent: $Observation
Id: AdvanceDirectiveExistenceObservation
Title: "Advance Directive Existence Observation"
Description: """ This observation represents a simple observation indicating whether a person has an advance directive document. When available, a system can nest the references to the advance directive documents inside this observation. """

* insert LogicalModelTemplate(advance-directive-exist-obs, 2.16.840.1.113883.10.20.22.4.513, 2025-05-01)
* insert NarrativeLink

* classCode 1..1
* classCode = #OBS (exactly)
  * ^comment = "SHALL contain exactly one [1..1] @classCode=\"OBS\" Observation (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC)."
* moodCode 1..1
* moodCode = #EVN (exactly)
  * ^comment = "SHALL contain exactly one [1..1] @moodCode=\"EVN\" Event (CodeSystem: HL7ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC)."
* id 1..*
  * ^comment = "SHALL contain at least one [1..*] id."
* code 1..1
  * insert CodedLoinc(45473-6, [[Advance directive/living will completed]])
* text 1..1
* statusCode 1..1
  * ^comment = "SHALL contain exactly one [1..1] statusCode."
  * code 1..1
  * code = #completed (exactly)
    * ^comment = "This statusCode SHALL contain exactly one [1..1] @code=\"completed\" Completed (CodeSystem: HL7ActStatus urn:oid:2.16.840.1.113883.5.14 STATIC)."
* effectiveTime 1..1
  * ^short = "Note: This template represents a \"snapshot in time\" observation. As a result, the effectiveTime is constrained to just a time stamp."
  * ^comment = "SHALL contain exactly one [1..1] effectiveTime."
  * insert IntervalValueOnly
* value 1..1
* value only $CD
* value from $2.16.840.1.113762.1.4.1267.16 (required)
* author 1..1
* author only ProvenanceAuthorParticipation
  * ^comment = "SHALL contain exactly [1..1] Author Participation (identifier: urn:oid:2.16.840.1.113883.10.20.22.4.119)."
* informant 0..1
  * ^short = "MAY contain zero or one [0..1] informant"
* entryRelationship 0..*
  * ^comment = "MAY contain zero or more [0..*] entryRelationship."
  * observation 1..1
  * observation only AdvanceDirectiveObservation
    * ^comment = "SHALL contain exactly one [1..1] Advance Directive Observation (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.4.48:2025-05-01)."