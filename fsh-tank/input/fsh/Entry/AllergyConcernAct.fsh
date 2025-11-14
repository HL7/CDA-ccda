Profile: AllergyConcernAct
Parent: $Act
Id: AllergyConcernAct
Title: "Allergy Concern Act"
Description: """This template reflects an ongoing concern on behalf of the provider that placed the allergy on a patient's allergy list. As long as the underlying condition is of concern to the provider (i.e., as long as the allergy, whether active or resolved, is of ongoing concern and interest to the provider), the statusCode is "active". Only when the underlying allergy is no longer of concern is the statusCode set to "completed". The effectiveTime reflects the time that the underlying allergy was felt to be a concern.

The statusCode of the Allergy Concern Act is the definitive indication of the status of the concern, whereas the effectiveTime of the nested Allergy - Intolerance Observation is the definitive indication of whether or not the underlying allergy is resolved. 

The effectiveTime/low of the Allergy Concern Act asserts when the concern became active. This equates to the time the concern was authored in the patient's chart. The effectiveTime/high asserts when the concern was completed (e.g., when the clinician deemed there is no longer any need to track the underlying condition).

An Allergy Concern Act **SHALL** contain one Allergy Intolerance Observation (templateId 2.16.840.1.113883.10.20.22.4.7). The Allergy Intolerance Observation is a discrete observation of a patient's allergy or intolerance, and therefore will have a statusCode of "completed"."""

* insert LogicalModelTemplate(allergy-concern-act, 2.16.840.1.113883.10.20.22.4.30, 2015-08-01)
* insert NarrativeLink

* classCode 1..1
* classCode = #ACT (exactly)
  * ^comment = "SHALL contain exactly one [1..1] @classCode=\"ACT\" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:1198-7469)."
* moodCode 1..1
* moodCode = #EVN (exactly)
  * ^comment = "SHALL contain exactly one [1..1] @moodCode=\"EVN\" Event (CodeSystem: HL7ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:1198-7470)."
* id 1..*
  * ^comment = "SHALL contain at least one [1..*] id (CONF:1198-7472)."
* code 1..1
  * ^comment = "SHALL contain exactly one [1..1] code (CONF:1198-7477)."
  * code 1..1
  * code = #CONC
    * ^comment = "This code SHALL contain exactly one [1..1] @code=\"CONC\" Concern (CONF:1198-19158)."
  * codeSystem 1..1
  * codeSystem = "2.16.840.1.113883.5.6"
    * ^comment = "This code SHALL contain exactly one [1..1] @codeSystem=\"2.16.840.1.113883.5.6\" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:1198-32154)."
* statusCode 1..1
  * ^comment = "SHALL contain exactly one [1..1] statusCode (CONF:1198-7485)."
  * insert BindAtCode($2.16.840.1.113883.11.20.9.19, required)
* obeys 1198-10085 and 1198-7504
* effectiveTime 1..1
  * ^comment = "SHALL contain exactly one [1..1] effectiveTime (CONF:1198-7498)."
  * low 0..1
    * ^short = "Required if statusCode = 'active'"
  * high 0..1
    * ^short = "Required if statusCode = 'completed'"
* obeys should-author
* author 0..*
* author only AuthorParticipation
  * ^comment = "SHOULD contain zero or more [0..*] Author Participation (identifier: urn:oid:2.16.840.1.113883.10.20.22.4.119) (CONF:1198-31145)." // man-should
* entryRelationship ^slicing.discriminator[0].type = #profile
  * ^slicing.discriminator[=].path = "observation"
  * ^slicing.rules = #open
* entryRelationship contains allergyObs 1..1
* entryRelationship[allergyObs] ^comment = "SHALL contain exactly one [1..1] entryRelationship (CONF:1198-7509) such that it"
  * typeCode 1..1
  * typeCode = #SUBJ (exactly)
    * ^comment = "SHALL contain exactly one [1..1] @typeCode=\"SUBJ\" Has subject (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002 STATIC) (CONF:1198-7915)."
  * observation 1..1
  * observation only AllergyIntoleranceObservation
    * ^comment = "SHALL contain exactly one [1..1] Allergy - Intolerance Observation (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.4.7:2014-06-09) (CONF:1198-14925)."

Invariant: 1198-10085
Description: "If statusCode/@code=\"completed\" Completed, then effectiveTime **SHALL** contain [1..1] high (CONF:1198-10085)."
Severity: #error
Expression: "(statusCode.code = 'completed') implies effectiveTime.high.exists()"

Invariant: 1198-7504
Description: "If statusCode/@code=\"active\" Active, then effectiveTime **SHALL** contain [1..1] low (CONF:1198-7504)."
Severity: #error
Expression: "(statusCode.code = 'active') implies effectiveTime.low.exists()"