Profile: EncounterActivity
Parent: $Encounter
Id: EncounterActivity
Title: "Encounter Activity"
Description: "This clinical statement describes an interaction between a patient and clinician. Interactions may include in-person encounters, telephone conversations, and email exchanges."

* insert LogicalModelTemplate(encounter-activity, 2.16.840.1.113883.10.20.22.4.49, 2015-08-01)
* insert NarrativeLink

* classCode 1..1
* classCode = #ENC (exactly)
  * ^comment = "SHALL contain exactly one [1..1] @classCode=\"ENC\" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:1198-8710)."
* moodCode 1..1
* moodCode = #EVN (exactly)
  * ^comment = "SHALL contain exactly one [1..1] @moodCode=\"EVN\" (CodeSystem: HL7ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:1198-8711)."
* id 1..*
  * ^comment = "SHALL contain at least one [1..*] id (CONF:1198-8713)."
* code 1..1
* code from $2.16.840.1.113762.1.4.1267.1 (preferred)
  * ^comment = "In Encounter Summaries the Encounter Type will also be present in the document header at componentOf/encompassingEncounter/code, but for Patient Summaries, componentOf/encompassingEncounter SHALL NOT be present.  Implementers should note that only conveying Encounter Type in the document header at componentOf/encompassingEncounter/code is insufficient."
  * insert NarrativeOriginalText 
* effectiveTime 1..1
  * ^comment = "In Encounter Summaries the Encounter Time will also be present in the document header at componentOf/encompassingEncounter/effectiveTime, but for Patient Summaries, componentOf/encompassingEncounter SHALL NOT be present."
* sdtcDischargeDispositionCode from $2.16.840.1.113883.3.88.12.80.33 (preferred)
  * ^comment = """Implementers should note that a Discharge Disposition is not appropriate for all document types. Hospital Discharge Summary documents SHOULD have a discharge disposition. Progress Notes, or H&P, typically won’t have a discharge disposition. In Encounter Summaries, the Encounter Disposition will also be present in the document header at componentOf/encompassingEncounter/dischargeDispositionCode, but in Patient Summaries, componentOf/encompassingEncounter SHALL NOT be present. While an Encounter Summary provides a snapshot of the patient’s condition at the time of the encounter as authored by the clinician, a Patient summary provides the most current information available from the sending system across multiple encounters."""
* performer 0..*
  * ^comment = "MAY contain zero or more [0..*] performer (CONF:1198-8725)."
  * assignedEntity 1..1
    * ^comment = "The performer, if present, SHALL contain exactly one [1..1] assignedEntity (CONF:1198-8726)."
    * code 0..1
    * code from $2.16.840.1.114222.4.11.1066 (preferred)
      * ^comment = "This assignedEntity MAY contain zero or one [0..1] code, which SHOULD be selected from ValueSet Healthcare Provider Taxonomy urn:oid:2.16.840.1.114222.4.11.1066 DYNAMIC (CONF:1198-8727)."
* participant ^slicing.discriminator[0].type = #profile
  * ^slicing.discriminator[=].path = "participantRole"
  * ^slicing.discriminator[+].type = #value
  * ^slicing.discriminator[=].path = "typeCode"
  * ^slicing.rules = #open
* participant contains location 0..*
* participant[location] ^comment = "SHOULD contain zero or more [0..*] participant (CONF:1198-8738) such that it"
  * ^comment = "In Encounter Summaries the Encounter Location will also be present in the document header at componentOf/encompassingEncounter/location, but in Patient Summaries, componentOf/encompassingEncounter SHALL NOT be present."
  * typeCode 1..1
  * typeCode = #LOC (exactly)
    * ^comment = "SHALL contain exactly one [1..1] @typeCode=\"LOC\" Location (CodeSystem: HL7ParticipationType urn:oid:2.16.840.1.113883.5.90 STATIC) (CONF:1198-8740)."
  * participantRole 1..1
  * participantRole only ServiceDeliveryLocation
    * ^comment = "SHALL contain exactly one [1..1] Service Delivery Location (identifier: urn:oid:2.16.840.1.113883.10.20.22.4.32) (CONF:1198-14903)."
* entryRelationship ^slicing.discriminator[0].type = #profile
  * ^slicing.discriminator[=].path = "act"
  * ^slicing.discriminator[+].type = #profile
  * ^slicing.discriminator[=].path = "observation"
  * ^slicing.rules = #open
* entryRelationship contains
    indication 0..* and
    diagnosis 0..*
* entryRelationship[indication] ^comment = "MAY contain zero or more [0..*] entryRelationship (CONF:1198-8722) such that it"
  * typeCode 1..1
  * typeCode = #RSON (exactly)
    * ^comment = "SHALL contain exactly one [1..1] @typeCode=\"RSON\" Has Reason (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002 STATIC) (CONF:1198-8723)."
  * observation 1..1
  * observation only Indication
    * ^comment = "SHALL contain exactly one [1..1] Indication (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.4.19:2014-06-09) (CONF:1198-14899)."
* entryRelationship[diagnosis] ^comment = "MAY contain zero or more [0..*] entryRelationship (CONF:1198-15492) such that it"
  * act 1..1
  * act only EncounterDiagnosis
    * ^comment = "SHALL contain exactly one [1..1] Encounter Diagnosis (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.4.80:2015-08-01) (CONF:1198-15973)."
