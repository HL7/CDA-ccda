Profile: IndividualPronounObservation
Parent: $Observation
Id: IndividualPronounObservation
Title: "Individual Pronoun Observation"
Description: "The Individual Personal Pronoun Observation represents words specified by a person to replace their name when referring to them in speech, clinical notes, and written instructions."

* insert LogicalModelTemplate(individual-pronoun-obs, 2.16.840.1.113883.10.15.2, 2025-05-01)
* insert NarrativeLink

* classCode 1..1
* classCode = #OBS (exactly)
  * ^comment = "SHALL contain exactly one [1..1] @classCode=\"OBS\" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC)."
* moodCode 1..1
* moodCode = #EVN (exactly)
  * ^comment = "SHALL contain exactly one [1..1] @moodCode=\"EVN\" (CodeSystem: HL7ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC)."
* code 1..1
  * insert CodedLoinc(90778-2, [[Personal pronouns reported]])
* text 0..1
* statusCode 1..1
  * ^comment = "SHALL contain exactly one [1..1] statusCode."
  * code 1..1
  * code = #completed (exactly)
    * ^comment = "This statusCode SHALL contain exactly one [1..1] @code=\"completed\" Completed (CodeSystem: HL7ActStatus urn:oid:2.16.840.1.113883.5.14 STATIC)."
* effectiveTime 1..1
  * ^comment = "This observation SHALL contain exactly one [1..1] effectiveTime."
  * obeys should-high
  * low 1..1
    * ^comment = "This effectiveTime SHALL contain exactly one [1..1] low."
  * high 0..1
    * ^comment = "This effectiveTime SHOULD contain zero or one [0..1] high."
    * ^short = "SHOULD contain high"
* value 1..1
* value only $CD
* value from http://terminology.hl7.org/ValueSet/pronouns (preferred)