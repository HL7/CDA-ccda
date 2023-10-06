Profile: EncounterActivity
Parent: $Encounter
Id: EncounterActivity
Title: "Encounter Activity"
Description: "This clinical statement describes an interaction between a patient and clinician. Interactions may include in-person encounters, telephone conversations, and email exchanges."

* insert LogicalModelTemplate(encounter-activity, 2.16.840.1.113883.10.20.22.4.49, 2015-08-01)

* classCode 1..1
* classCode = #ENC (exactly)
  * ^comment = "SHALL contain exactly one [1..1] @classCode=\"ENC\" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:1198-8710)."
* moodCode 1..1
* moodCode = #EVN (exactly)
  * ^comment = "SHALL contain exactly one [1..1] @moodCode=\"EVN\" (CodeSystem: HL7ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:1198-8711)."
* id 1..*
  * ^comment = "SHALL contain at least one [1..*] id (CONF:1198-8713)."
* code 1..1
* code from EncounterTypeCode (preferred)
  * ^comment = "SHALL contain exactly one [1..1] code, which SHOULD be selected from ValueSet EncounterTypeCode urn:oid:2.16.840.1.113883.3.88.12.80.32 DYNAMIC (CONF:1198-8714)."
  * obeys should-originalText
  * originalText 0..1
    * ^comment = "This code SHOULD contain zero or one [0..1] originalText (CONF:1198-8719)." // auto-should
    * obeys should-reference
    * reference 0..1
      * ^comment = "The originalText, if present, SHOULD contain zero or one [0..1] reference (CONF:1198-15970)." // auto-should
      * value 0..1
        * obeys 1198-15972
        * ^comment = "The reference, if present, SHOULD contain zero or one [0..1] @value (CONF:1198-15971)."
  * translation 0..1
    * ^short = "The translation may exist to map the code of EncounterTypeCode (2.16.840.1.113883.3.88.12.80.32) value set to the code of Encounter Planned (2.16.840.1.113883.11.20.9.52) value set."
    * ^comment = "This code MAY contain zero or one [0..1] translation (CONF:1198-32323)."
* effectiveTime 1..1
  * ^comment = "SHALL contain exactly one [1..1] effectiveTime (CONF:1198-8715)."
* sdtcDischargeDispositionCode 0..1
  * obeys 1198-32177 and 1198-32377
  * ^extension[0].url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-namespace"
  * ^extension[=].valueUri = "urn:hl7-org:sdtc"
  * ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-xml-name"
  * ^extension[=].valueUri = "dischargeDispositionCode"
  * ^short = "The prefix sdtc: SHALL be bound to the namespace “urn:hl7-org:sdtc”. The use of the namespace provides a necessary extension to CDA R2 for the use of the dischargeDispositionCode element"
  * ^comment = "MAY contain zero or one [0..1] sdtc:dischargeDispositionCode (CONF:1198-32176)."
* sdtcDischargeDispositionCode from $2.16.840.1.113883.3.88.12.80.33 (preferred)
* performer 0..*
  * ^comment = "MAY contain zero or more [0..*] performer (CONF:1198-8725)."
  * assignedEntity 1..1
    * ^comment = "The performer, if present, SHALL contain exactly one [1..1] assignedEntity (CONF:1198-8726)."
    * code 0..1
    * code from $2.16.840.1.114222.4.11.1066 (preferred)
      * ^comment = "This assignedEntity MAY contain zero or one [0..1] code, which SHOULD be selected from ValueSet Healthcare Provider Taxonomy urn:oid:2.16.840.1.114222.4.11.1066 DYNAMIC (CONF:1198-8727)."
* participant ^slicing.discriminator[0].type = #value
  * ^slicing.discriminator[=].path = "participantRole"
  * ^slicing.discriminator[+].type = #value
  * ^slicing.discriminator[=].path = "typeCode"
  * ^slicing.rules = #open
* participant contains location 0..*
* participant[location] ^comment = "SHOULD contain zero or more [0..*] participant (CONF:1198-8738) such that it"
  * typeCode 1..1
  * typeCode = #LOC (exactly)
    * ^comment = "SHALL contain exactly one [1..1] @typeCode=\"LOC\" Location (CodeSystem: HL7ParticipationType urn:oid:2.16.840.1.113883.5.90 STATIC) (CONF:1198-8740)."
  * participantRole 1..1
  * participantRole only ServiceDeliveryLocation
    * ^comment = "SHALL contain exactly one [1..1] Service Delivery Location (identifier: urn:oid:2.16.840.1.113883.10.20.22.4.32) (CONF:1198-14903)."
* entryRelationship ^slicing.discriminator[0].type = #value
  * ^slicing.discriminator[=].path = "act"
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

Invariant: 1198-15972
Description: "This reference/@value **SHALL** begin with a '#' and **SHALL** point to its corresponding narrative (using the approach defined in CDA Release 2, section 4.3.5.1) (CONF:1198-15972)."
Severity: #error

Invariant: 1198-32177
Description: "This sdtc:dischargeDispositionCode **SHOULD** contain exactly [0..1] *code*, which **SHOULD** be selected from ValueSet 2.16.840.1.113883.3.88.12.80.33 NUBC UB-04 FL17-Patient Status (code system 2.16.840.1.113883.6.301.5) *DYNAMIC*.  NOTE: This requires a license from the AHA to access these codes."
Severity: #warning

Invariant: 1198-32377
Description: "This sdtc:dischargeDispositionCode **SHOULD** contain exactly [0..1] *codeSystem*, which **SHOULD** be CodeSystem: NUBC 2.16.840.1.113883.6.301.5."
Severity: #warning