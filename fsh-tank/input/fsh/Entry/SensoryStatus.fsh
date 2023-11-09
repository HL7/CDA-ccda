Profile: SensoryStatus
Parent: $Observation
Id: SensoryStatus
Title: "Sensory Status"
Description: "This template represents a patient's sensory or speech ability. It may contain an assessment scale observations related to the sensory or speech ability."

* insert LogicalModelTemplateRootOnly(sensory-status, 2.16.840.1.113883.10.20.22.4.127)
* insert NarrativeLink

* classCode 1..1
* classCode = #OBS (exactly)
  * ^comment = "SHALL contain exactly one [1..1] @classCode=\"OBS\" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:1098-31017)."
* moodCode 1..1
* moodCode = #EVN (exactly)
  * ^comment = "SHALL contain exactly one [1..1] @moodCode=\"EVN\" (CodeSystem: HL7ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:1098-31018)."
* code 1..1
* code from $2.16.840.1.113883.11.20.9.50 (preferred)
  * ^comment = "SHALL contain exactly one [1..1] code, which SHOULD be selected from ValueSet Sensory Status Problem Type urn:oid:2.16.840.1.113883.11.20.9.50 DYNAMIC (CONF:1098-27962)."
* statusCode 1..1
  * ^comment = "SHALL contain exactly one [1..1] statusCode (CONF:1098-31437)."
  * code 1..1
  * code = #completed (exactly)
    * ^comment = "This statusCode SHALL contain exactly one [1..1] @code=\"completed\" (CodeSystem: HL7ActStatus urn:oid:2.16.840.1.113883.5.14) (CONF:1098-31438)."
* effectiveTime 1..1
  * ^comment = "SHALL contain exactly one [1..1] effectiveTime (CONF:1098-31441)."
  * low 1..1
    * ^short = "The effectiveTime/low (a.k.a. \"onset date\") asserts when the condition became biologically active."
    * ^comment = "This effectiveTime SHALL contain exactly one [1..1] low (CONF:1098-32630)."
  * high 0..1
    * ^short = "The effectiveTime/high (a.k.a. \"resolution date\") asserts when the condition became biologically resolved."
    * ^comment = "This effectiveTime MAY contain zero or one [0..1] high (CONF:1098-32631)."
* value 1..1
* value only $CD
* value from $2.16.840.1.113883.11.20.9.44 (preferred)
  * ^comment = "SHALL contain exactly one [1..1] value with @xsi:type=\"CD\", where the code SHOULD be selected from ValueSet Mental and Functional Status Response urn:oid:2.16.840.1.113883.11.20.9.44 DYNAMIC (CONF:1098-27974)."
* author 0..*
* author only AuthorParticipation
  * ^comment = "SHOULD contain zero or more [0..*] Author Participation (identifier: urn:oid:2.16.840.1.113883.10.20.22.4.119) (CONF:1098-31439)."
* entryRelationship ^slicing.discriminator.type = #profile
  * ^slicing.discriminator.path = "observation"
  * ^slicing.rules = #open
* entryRelationship contains assessmentScaleObservation 0..*
* entryRelationship[assessmentScaleObservation] ^comment = "MAY contain zero or more [0..*] entryRelationship (CONF:1098-27984) such that it"
  * typeCode 1..1
  * typeCode = #COMP (exactly)
    * ^comment = "SHALL contain exactly one [1..1] @typeCode=\"COMP\" has component (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002 STATIC) (CONF:1098-27985)."
  * observation 1..1
  * observation only AssessmentScaleObservation
    * ^comment = "SHALL contain exactly one [1..1] Assessment Scale Observation (identifier: urn:oid:2.16.840.1.113883.10.20.22.4.69) (CONF:1098-27986)."