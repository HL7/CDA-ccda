Profile: MentalStatusObservation
Parent: $Observation
Id: MentalStatusObservation
Title: "Mental Status Observation"
Description: "The Mental Status Observation template represents an observation about mental status that can come from a broad range of subjective and objective information (including measured data) to address those categories described in the Mental Status Section. See also Assessment Scale Observation for specific collections of observations that together yield a summary evaluation of a particular condition."

* insert LogicalModelTemplate(mentalStatusObservation, 2.16.840.1.113883.10.20.22.4.74, 2015-08-01)

* classCode 1..1
* classCode = #OBS (exactly)
  * ^comment = "SHALL contain exactly one [1..1] @classCode=\"OBS\" Observation (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:1198-14249)."
* moodCode 1..1
* moodCode = #EVN (exactly)
  * ^comment = "SHALL contain exactly one [1..1] @moodCode=\"EVN\" Event (CodeSystem: HL7ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:1198-14250)."
* id 1..*
  * ^comment = "SHALL contain at least one [1..*] id (CONF:1198-14257)."
* code 1..1
  * ^comment = "SHALL contain exactly one [1..1] code (CONF:1198-14591)."
  * code 1..1
  * code = #8693-4
    * ^comment = "This code SHALL contain exactly one [1..1] @code=\"8693-4\" Cognitive function (CONF:1198-32788)."
  * codeSystem 1..1
  * codeSystem = "2.16.840.1.113883.6.1"
    * ^comment = "This code SHALL contain exactly one [1..1] @codeSystem=\"2.16.840.1.113883.6.1\" (CodeSystem: LOINC urn:oid:2.16.840.1.113883.6.1) (CONF:1198-32789)."
* statusCode 1..1
  * ^comment = "SHALL contain exactly one [1..1] statusCode (CONF:1198-14254)."
  * code 1..1
  * code = #completed (exactly)
    * ^comment = "This statusCode SHALL contain exactly one [1..1] @code=\"completed\" Completed (CodeSystem: HL7ActStatus urn:oid:2.16.840.1.113883.5.14 STATIC) (CONF:1198-19092)."
* effectiveTime 1..1
  * ^comment = "SHALL contain exactly one [1..1] effectiveTime (CONF:1198-14261)."
* value 1..1
  * obeys 1198-14271
  * ^comment = "SHALL contain exactly one [1..1] value (CONF:1198-14263)."
* author 0..*
* author only AuthorParticipation
  * ^comment = "SHOULD contain zero or more [0..*] Author Participation (identifier: urn:oid:2.16.840.1.113883.10.20.22.4.119) (CONF:1198-14266)."
* entryRelationship ^slicing.discriminator[0].type = #profile
  * ^slicing.discriminator[=].path = "observation"
  * ^slicing.rules = #open
* entryRelationship contains assessmentScale 0..*
* entryRelationship[assessmentScale] ^comment = "MAY contain zero or more [0..*] entryRelationship (CONF:1198-14469) such that it"
  * typeCode 1..1
  * typeCode = #COMP (exactly)
    * ^comment = "SHALL contain exactly one [1..1] @typeCode=\"COMP\" has component (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002 STATIC) (CONF:1198-14595)."
  * observation 1..1
  * observation only AssessmentScaleObservation
    * ^comment = "SHALL contain exactly one [1..1] Assessment Scale Observation (identifier: urn:oid:2.16.840.1.113883.10.20.22.4.69) (CONF:1198-14470)."
* referenceRange 0..*
  * ^short = "The referenceRange could be used to represent normal or expected capability for the mental function being evaluated."
  * ^comment = "MAY contain zero or more [0..*] referenceRange (CONF:1198-14267)."

Invariant: 1198-14271
Description: "If xsi:type=“CD”, **SHOULD** contain a code from SNOMED CT (CodeSystem: 2.16.840.1.113883.6.96) (CONF:1198-14271)."
Severity: #warning