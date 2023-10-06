Profile: PlannedEncounter
Parent: $Encounter
Id: PlannedEncounter
Title: "Planned Encounter"
Description: "This template represents a planned or ordered encounter. The type of encounter (e.g., comprehensive outpatient visit) is represented. Clinicians participating in the encounter and the location of the planned encounter may be captured. The priority that the patient and providers place on the encounter may be represented."

* insert LogicalModelTemplate(planned-enc, 2.16.840.1.113883.10.20.22.4.40, 2014-06-09)

* classCode 1..1
* classCode = #ENC (exactly)
  * ^comment = "SHALL contain exactly one [1..1] @classCode=\"ENC\" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:1098-8564)."
* moodCode 1..1
* moodCode from $2.16.840.1.113883.11.20.9.23 (required)
  * ^comment = "SHALL contain exactly one [1..1] @moodCode, which SHALL be selected from ValueSet Planned moodCode (Act/Encounter/Procedure) urn:oid:2.16.840.1.113883.11.20.9.23 STATIC 2014-09-01 (CONF:1098-8565)."
* id 1..*
  * ^comment = "SHALL contain at least one [1..*] id (CONF:1098-8567)."
* code 0..1
* code from $2.16.840.1.113883.11.20.9.52 (preferred)
  * ^short = "Records the type of encounter ordered or recommended."
  * ^comment = "SHOULD contain zero or one [0..1] code, which SHOULD be selected from ValueSet Encounter Planned urn:oid:2.16.840.1.113883.11.20.9.52 DYNAMIC (CONF:1098-31032)."
* statusCode 1..1
  * ^comment = "SHALL contain exactly one [1..1] statusCode (CONF:1098-30439)."
  * code 1..1
  * code = #active (exactly)
    * ^comment = "This statusCode SHALL contain exactly one [1..1] @code=\"active\" Active (CodeSystem: HL7ActStatus urn:oid:2.16.840.1.113883.5.14) (CONF:1098-31880)."
* effectiveTime 0..1
  * ^comment = "SHOULD contain zero or one [0..1] effectiveTime (CONF:1098-30440)."
* performer ^slicing.discriminator[0].type = #value
  * ^slicing.discriminator[=].path = "Encounter.assignedEntity"
  * ^slicing.rules = #open
  * ^short = "Performers represent clinicians who are responsible for assessing and treating the patient."
* performer contains performer 0..*
* performer[performer] ^comment = "MAY contain zero or more [0..*] performer (CONF:1098-30442) such that it"
  * assignedEntity 1..1
    * ^comment = "SHALL contain exactly one [1..1] assignedEntity (CONF:1098-31874)."
* author 0..*
* author only AuthorParticipation
  * ^short = "The author in a planned encounter represents the clinician who is requesting or planning the encounter."
  * ^comment = "SHOULD contain zero or more [0..*] Author Participation (identifier: urn:oid:2.16.840.1.113883.10.20.22.4.119) (CONF:1098-32045)."
* participant ^slicing.discriminator[0].type = #value
  * ^slicing.discriminator[=].path = "typeCode"
  * ^slicing.discriminator[+].type = #value
  * ^slicing.discriminator[=].path = "participantRole"
  * ^slicing.rules = #open
  * ^short = "This location participation captures where the planned or ordered encounter may take place."
* participant contains location 0..*
* participant[location] ^comment = "MAY contain zero or more [0..*] participant (CONF:1098-30443) such that it"
  * typeCode 1..1
  * typeCode = #LOC (exactly)
    * ^comment = "SHALL contain exactly one [1..1] @typeCode=\"LOC\" Location (CodeSystem: HL7ParticipationType urn:oid:2.16.840.1.113883.5.90) (CONF:1098-31875)."
  * participantRole 1..1
  * participantRole only ServiceDeliveryLocation
    * ^comment = "SHALL contain exactly one [1..1] Service Delivery Location (identifier: urn:oid:2.16.840.1.113883.10.20.22.4.32) (CONF:1098-31876)."
* entryRelationship ^slicing.discriminator[0].type = #profile
  * ^slicing.discriminator[=].path = "observation"
  * ^slicing.rules = #open
  * ^short = "The following entryRelationship captures the reason for the planned or ordered encounter"
* entryRelationship contains
    priorityPreference 0..1 and
    indication 0..*
* entryRelationship[priorityPreference] ^short = "The following entryRelationship represents the priority that a patient or a provider places on the encounter."
  * ^comment = "MAY contain zero or one [0..1] entryRelationship (CONF:1098-31033) such that it"
  * typeCode 1..1
  * typeCode = #REFR (exactly)
    * ^comment = "SHALL contain exactly one [1..1] @typeCode=\"REFR\" Refers to (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:1098-31034)."
  * observation 1..1
  * observation only PriorityPreference
    * ^comment = "SHALL contain exactly one [1..1] Priority Preference (identifier: urn:oid:2.16.840.1.113883.10.20.22.4.143) (CONF:1098-31035)."
* entryRelationship[indication] ^comment = "MAY contain zero or more [0..*] entryRelationship (CONF:1098-31877) such that it"
  * typeCode 1..1
  * typeCode = #RSON (exactly)
    * ^comment = "SHALL contain exactly one [1..1] @typeCode=\"RSON\" Has Reason (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:1098-31878)."
  * observation 1..1
  * observation only Indication
    * ^comment = "SHALL contain exactly one [1..1] Indication (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.4.19:2014-06-09) (CONF:1098-31879)."