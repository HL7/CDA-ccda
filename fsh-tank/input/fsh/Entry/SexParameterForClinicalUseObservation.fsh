Profile: SexParameterForClinicalUseObservation
Parent: $Observation
Id: SexParameterForClinicalUseObservation
Title: "Sex Parameter For Clinical Use Observation"
Description: """The Sex Parameter for Clinical Use (SPCU) observation is a clinical classification indicating which sex-related information is needed to evaluate how a patient's body may respond or has responded to treatments or diagnostic tests. Rather than relying solely on a patient's gender identity or assigned sex at birth, SPCU considers observable physiological characteristics (such as hormone levels, organ inventories, or genetic data) or medical interventions (such as hormone therapy). This template may be included in, referenced by, or contain a reference to, the relevant template."""

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
  * insert CodedLoinc(99501-9, [[Sex parameter for clinical use]])
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
  * insert BindAtCode(http://terminology.hl7.org/ValueSet/sex-parameter-for-clinical-use, required)
* author 1..1
* author only ProvenanceAuthorParticipation
  * ^comment = "SHALL contain exactly [1..1] Author Participation (identifier: urn:oid:2.16.840.1.113883.10.20.22.4.119)."
* entryRelationship 0..*
  * ^short = "This Entry Reference links the Sex Parameter for Clinical Use Observation to the template containing the relevant clinical data, such as Observations, Procedures, Substance Administrations, or Orders (Planned Procedures)."
  * ^comment = "MAY contain zero or more [0..*] entryRelationship (CONF:4515-32996) such that it"
  * typeCode 1..1
  * typeCode = #SPRT (exactly)
    * ^comment = "SHALL contain exactly one [1..1] @typeCode=\"SPRT\" Has support."
  * act 1..1
  * act only EntryReference
    * ^comment = "SHALL contain exactly one [1..1] Entry Reference (identifier: urn:oid:2.16.840.1.113883.10.20.22.4.122) (CONF:4515-32997)."

    