Profile: PlannedObservation
Parent: $Observation
Id: PlannedObservation
Title: "Planned Observation"
Description: """This template represents planned observations that result in new information about the patient which cannot be classified as a procedure according to the HL7 RIM, i.e., procedures alter the patient's body. Examples of these observations are laboratory tests, diagnostic imaging tests, EEGs, and EKGs.

The importance of the planned observation to the patient and provider is communicated through Priority Preference. The effectiveTime indicates the time when the observation is intended to take place and authorTime indicates when the documentation of the plan occurred. 
The Planned Observation template may also indicate the potential insurance coverage for the observation.

"""

* insert LogicalModelTemplate(planned-obs, 2.16.840.1.113883.10.20.22.4.44, 2014-06-09)

* classCode 1..1
* classCode = #OBS (exactly)
  * ^comment = "SHALL contain exactly one [1..1] @classCode=\"OBS\" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:1098-8581)."
* moodCode 1..1
* moodCode from $2.16.840.1.113883.11.20.9.25 (required)
  * ^comment = "SHALL contain exactly one [1..1] @moodCode, which SHALL be selected from ValueSet Planned moodCode (Observation) urn:oid:2.16.840.1.113883.11.20.9.25 STATIC 2011-09-30 (CONF:1098-8582)."
* id 1..*
  * ^comment = "SHALL contain at least one [1..*] id (CONF:1098-8584)."
* code 1..1
  * ^comment = "SHALL contain exactly one [1..1] code, which SHOULD be selected from CodeSystem LOINC (urn:oid:2.16.840.1.113883.6.1) (CONF:1098-31030)."
* statusCode 1..1
  * ^comment = "SHALL contain exactly one [1..1] statusCode (CONF:1098-30453)."
  * code 1..1
  * code = #active (exactly)
    * ^comment = "This statusCode SHALL contain exactly one [1..1] @code=\"active\" Active (CodeSystem: HL7ActStatus urn:oid:2.16.840.1.113883.5.14) (CONF:1098-32032)."
* obeys should-effectiveTime
* effectiveTime 0..1
  * ^short = "The effectiveTime in a planned observation represents the time that the observation should occur."
  * ^comment = "SHOULD contain zero or one [0..1] effectiveTime (CONF:1098-30454)." // auto-should
* value 0..1
  * ^comment = "MAY contain zero or one [0..1] value (CONF:1098-31031)."
* methodCode 0..1
  * ^short = "In a planned observation the provider may suggest that an observation should be performed using a particular method."
  * ^comment = "MAY contain zero or one [0..1] methodCode (CONF:1098-32043)."
* targetSiteCode 0..*
* targetSiteCode from $2.16.840.1.113883.3.88.12.3221.8.9 (required)
  * ^short = "The targetSiteCode is used to identify the part of the body of concern for the planned observation."
  * ^comment = "SHOULD contain zero or more [0..*] targetSiteCode, which SHALL be selected from ValueSet Body Site Value Set urn:oid:2.16.840.1.113883.3.88.12.3221.8.9 DYNAMIC (CONF:1098-32044)."
* performer 0..*
  * ^short = "The clinician who is expected to perform the observation could be identified using procedure/performer."
  * ^comment = "MAY contain zero or more [0..*] performer (CONF:1098-30456)."
* author 0..*
* author only AuthorParticipation
  * ^short = "The author in a planned observation represents the clinician who is requesting or planning the observation."
  * ^comment = "SHOULD contain zero or more [0..*] Author Participation (identifier: urn:oid:2.16.840.1.113883.10.20.22.4.119) (CONF:1098-32033)."
* entryRelationship ^slicing.discriminator[0].type = #profile
  * ^slicing.discriminator[=].path = "observation"
  * ^slicing.discriminator[+].type = #profile
  * ^slicing.discriminator[=].path = "act"
  * ^slicing.rules = #open
  * ^short = "The following entryRelationship represents the insurance coverage the patient may have for the observation."
* entryRelationship contains
    priorityPreference 0..* and
    indication 0..* and
    instruction 0..* and
    plannedCoverage 0..*
* entryRelationship[priorityPreference] ^short = "The following entryRelationship represents the priority that a patient or a provider places on the observation."
  * ^comment = "MAY contain zero or more [0..*] entryRelationship (CONF:1098-31073) such that it"
  * typeCode 1..1
  * typeCode = #REFR (exactly)
    * ^comment = "SHALL contain exactly one [1..1] @typeCode=\"REFR\" Refers to (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:1098-31074)."
  * observation 1..1
  * observation only PriorityPreference
    * ^comment = "SHALL contain exactly one [1..1] Priority Preference (identifier: urn:oid:2.16.840.1.113883.10.20.22.4.143) (CONF:1098-31075)."
* entryRelationship[indication] ^short = "The following entryRelationship represents the indication for the observation."
  * ^comment = "MAY contain zero or more [0..*] entryRelationship (CONF:1098-32034) such that it"
  * typeCode 1..1
  * typeCode = #RSON (exactly)
    * ^comment = "SHALL contain exactly one [1..1] @typeCode=\"RSON\" Has Reason (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:1098-32035)."
  * observation 1..1
  * observation only Indication
    * ^comment = "SHALL contain exactly one [1..1] Indication (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.4.19:2014-06-09) (CONF:1098-32036)."
* entryRelationship[instruction] ^short = "The following entryRelationship captures any instructions associated with the planned observation."
  * ^comment = "MAY contain zero or more [0..*] entryRelationship (CONF:1098-32037) such that it"
  * typeCode 1..1
  * typeCode = #SUBJ (exactly)
    * ^comment = "SHALL contain exactly one [1..1] @typeCode=\"SUBJ\" Has subject (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:1098-32038)."
  * act 1..1
  * act only Instruction
    * ^comment = "SHALL contain exactly one [1..1] Instruction (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.4.20:2014-06-09) (CONF:1098-32039)."
* entryRelationship[plannedCoverage] ^short = "The following entryRelationship represents the insurance coverage the patient may have for the observation."
  * ^comment = "MAY contain zero or more [0..*] entryRelationship (CONF:1098-32040) such that it"
  * typeCode 1..1
  * typeCode = #COMP (exactly)
    * ^comment = "SHALL contain exactly one [1..1] @typeCode=\"COMP\" Has Component (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:1098-32041)."
  * act 1..1
  * act only PlannedCoverage
    * ^comment = "SHALL contain exactly one [1..1] Planned Coverage (identifier: urn:oid:2.16.840.1.113883.10.20.22.4.129) (CONF:1098-32042)."