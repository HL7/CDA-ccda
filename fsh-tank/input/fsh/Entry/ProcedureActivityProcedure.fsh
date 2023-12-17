Profile: ProcedureActivityProcedure
Parent: $Procedure
Id: ProcedureActivityProcedure
Title: "Procedure Activity Procedure"
Description: "This template is used to represent the details of current and historical procedures performed on or for a patient. A procedure is an activity that is performed on, with, or for a patient as part of the provision of care. Examples include surgical procedures, diagnostic procedures, endoscopic procedures, biopsies, counseling, physiotherapy, personal support services, adult day care services, non-emergency transportation, home modification, exercise, etc. Procedures may be performed by a healthcare professional, a service provider, a friend or relative or in some cases by the patient themselves."

* insert LogicalModelTemplate(procedure, 2.16.840.1.113883.10.20.22.4.14, 2024-05-01)
* insert NarrativeLink

* classCode 1..1
* classCode = #PROC (exactly)
  * ^comment = "SHALL contain exactly one [1..1] @classCode=\"PROC\" Procedure (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:4515-7652)."
* moodCode 1..1
* moodCode = #EVN (exactly)
  * ^comment = "SHALL contain exactly one [1..1] @moodCode=\"EVN\" Event (CodeSystem: HL7ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:4515-7653)."
* id 1..*
  * ^comment = "SHALL contain at least one [1..*] id (CONF:4515-7655)."
* code 1..1
* code from http://hl7.org/fhir/us/core/ValueSet/us-core-procedure-code (preferred)
  * insert AdditionalBinding(preferred, $SDoHProcedures, For Social Determinant of Health Interventions, [[If the Intervention Procedure is a Social Determinant of Health Intervention, the procedure code **SHOULD** be selected from ValueSet [Social Determinant of Health Procedures](https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1196.789/expansion) **DYNAMIC** (CONF:4515-32984).]])
  * ^comment = "SHALL contain exactly one [1..1] code (CONF:4515-7656)."
  * insert NarrativeOriginalText
* statusCode 1..1
  * ^comment = "SHALL contain exactly one [1..1] statusCode (CONF:4515-7661)."
  * code 1..1
  * code from $2.16.840.1.113883.11.20.9.22 (required)
    * ^comment = "This statusCode SHALL contain exactly one [1..1] @code, which SHALL be selected from ValueSet ProcedureAct statusCode urn:oid:2.16.840.1.113883.11.20.9.22 STATIC 2014-04-23 (CONF:4515-32366)."
* obeys active-high-ts-after-document
* effectiveTime 1..1
* effectiveTime only USRealmDateTimeInterval
  * insert USCDI([[Performance Time]])
  * obeys should-value and ts-value-before-document
  * value ^short = "Indicates historical procedure or an instance of a procedure where precision may be only a date or even a year."
  * low
    * obeys ts-value-before-document
    * ^short = "Indicates when a procedure started"
    * ^comment = "MAY contain zero or one [0..1] low"
  * high
    * ^short = "Indicates when a procedure ended. If the statusCode='active', this must be after the ClinicalDcument/effectiveTime"
    * ^comment = "MAY contain zero or one [0..1] high"
* priorityCode 0..1
* priorityCode from ActPriority (required)
  * ^comment = "MAY contain zero or one [0..1] priorityCode, which SHALL be selected from ValueSet ActPriority urn:oid:2.16.840.1.113883.1.11.16866 DYNAMIC (CONF:4515-7668)."
* methodCode 0..1
  * ^short = "MethodCode **SHALL NOT** conflict with the method inherent in Procedure / code (CONF:4515-7890)."
  * ^comment = "MAY contain zero or one [0..1] methodCode (CONF:4515-7670)."
* obeys should-targetSiteCode
* targetSiteCode 0..*
* targetSiteCode from $2.16.840.1.113883.3.88.12.3221.8.9 (required)
  * ^short = "In the case of an implanted medical device, targetSiteCode is used to record the location of the device, in or on the patient's body."
  * ^comment = "SHOULD contain zero or more [0..*] targetSiteCode, which SHALL be selected from ValueSet Body Site Value Set urn:oid:2.16.840.1.113883.3.88.12.3221.8.9 DYNAMIC (CONF:4515-7683)." // man-should
* specimen 0..*
  * ^short = "This specimen is for representing specimens obtained from a procedure (CONF:4515-16842)."
  * ^comment = "MAY contain zero or more [0..*] specimen (CONF:4515-7697)."
  * specimenRole 1..1
    * ^comment = "The specimen, if present, SHALL contain exactly one [1..1] specimenRole (CONF:4515-7704)."
    * obeys should-id
    * id 0..*
      * ^short = "If you want to indicate that the Procedure and the Results are referring to the same specimen, the Procedure/specimen/specimenRole/id **SHOULD** be set to equal an Organizer/specimen/specimenRole/id (CONF:4515-29744)."
      * ^comment = "This specimenRole SHOULD contain zero or more [0..*] id (CONF:4515-7716)." // auto-should
* obeys should-performer
* performer 0..*
  * ^comment = "SHOULD contain zero or more [0..*] performer (CONF:4515-7718) such that it"
  * assignedEntity 1..1
    * ^comment = "SHALL contain exactly one [1..1] assignedEntity (CONF:4515-7720)."
    * id 1..*
      * ^comment = "This assignedEntity SHALL contain at least one [1..*] id (CONF:4515-7722)."
    * addr 1..*
    * addr only USRealmAddress
      * ^comment = "This assignedEntity SHALL contain at least one [1..*] addr (CONF:4515-7731)."
    * telecom 1..*
      * ^comment = "This assignedEntity SHALL contain at least one [1..*] telecom (CONF:4515-7732)."
    * obeys should-assignedPerson
    * assignedPerson 0..1
      * ^comment = "This assignedEntity SHOULD contain zero or one [0..1] assignedPerson." // man-should
      * name 1..*
      * name only USRealmPersonNamePNUSFIELDED
        * ^comment = "This assignedPerson SHALL contain at least one [1..*] US Realm Person Name (PN.US.FIELDED)."
    * obeys should-representedOrganization
    * representedOrganization 0..1
      * ^comment = "This assignedEntity SHOULD contain zero or one [0..1] representedOrganization (CONF:4515-7733)." // auto-should
      * obeys should-id
      * id 0..*
        * ^comment = "The representedOrganization, if present, SHOULD contain zero or more [0..*] id (CONF:4515-7734)." // auto-should
      * name 0..*
        * ^comment = "The representedOrganization, if present, MAY contain zero or more [0..*] name (CONF:4515-7735)."
      * telecom 1..*
        * ^comment = "The representedOrganization, if present, SHALL contain at least one [1..*] telecom (CONF:4515-7737)."
      * addr 1..*
      * addr only USRealmAddress
        * ^comment = "The representedOrganization, if present, SHALL contain at least one [1..*] addr (CONF:4515-7736)."
* obeys should-author
* author 0..*
* author only AuthorParticipation
  * ^comment = "SHOULD contain zero or more [0..*] Author Participation (identifier: urn:oid:2.16.840.1.113883.10.20.22.4.119) (CONF:4515-32479)." // man-should
* participant ^slicing.discriminator[0].type = #value
  * ^slicing.discriminator[=].path = "typeCode"
  * ^slicing.rules = #open
  * ^comment = "MAY contain zero or more [0..*] participant (CONF:4515-7765) such that it"
* participant contains
    participant1 0..* and
    participant2 0..*
* participant[participant1] ^short = "participant"
  * ^comment = "MAY contain zero or more [0..*] participant (CONF:4515-7751) such that it"
  * typeCode 1..1
  * typeCode = #DEV (exactly)
    * ^comment = "SHALL contain exactly one [1..1] @typeCode=\"DEV\" Device (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002 STATIC) (CONF:4515-7752)."
  * participantRole 1..1
  * participantRole only ProductInstance
    * ^comment = "SHALL contain exactly one [1..1] Product Instance (identifier: urn:oid:2.16.840.1.113883.10.20.22.4.37) (CONF:4515-15911)."
* participant[participant2] ^short = "participant"
  * ^comment = "MAY contain zero or more [0..*] participant (CONF:4515-7765) such that it"
  * typeCode 1..1
  * typeCode = #LOC (exactly)
    * ^comment = "SHALL contain exactly one [1..1] @typeCode=\"LOC\" Location (CodeSystem: HL7ParticipationType urn:oid:2.16.840.1.113883.5.90 STATIC) (CONF:4515-7766)."
  * participantRole 1..1
  * participantRole only ServiceDeliveryLocation
    * ^comment = "SHALL contain exactly one [1..1] Service Delivery Location (identifier: urn:oid:2.16.840.1.113883.10.20.22.4.32) (CONF:4515-15912)."
* entryRelationship ^slicing.discriminator[0].type = #profile
  * ^slicing.discriminator[=].path = "act"
  * ^slicing.discriminator[+].type = #profile
  * ^slicing.discriminator[=].path = "observation"
  * ^slicing.discriminator[+].type = #exists
  * ^slicing.discriminator[=].path = "encounter"
  * ^slicing.rules = #open
  * ^comment = "MAY contain zero or more [0..*] entryRelationship (CONF:4515-32988) such that it"
* entryRelationship contains
    entryRelationship1 0..* and
    entryRelationship2 0..1 and
    entryRelationship3 0..* and
    entryRelationship4 0..* and
    entryRelationship5 0..* and
    entryRelationship6 0..* and
    entryRelationship7 0..*
* entryRelationship[entryRelationship1] ^short = "entryRelationship"
  * ^comment = "MAY contain zero or more [0..*] entryRelationship (CONF:4515-7768) such that it"
  * typeCode 1..1
  * typeCode = #COMP (exactly)
    * ^comment = "SHALL contain exactly one [1..1] @typeCode=\"COMP\" Has Component (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002 STATIC) (CONF:4515-7769)."
  * inversionInd 1..1
  * inversionInd = true (exactly)
    * ^comment = "SHALL contain exactly one [1..1] @inversionInd=\"true\" true (CONF:4515-8009)."
  * encounter 1..1
    * ^comment = "SHALL contain exactly one [1..1] encounter (CONF:4515-7770)."
    * classCode 1..1
    * classCode = #ENC (exactly)
      * ^comment = "This encounter SHALL contain exactly one [1..1] @classCode=\"ENC\" Encounter (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:4515-7771)."
    * moodCode 1..1
    * moodCode = #EVN (exactly)
      * ^comment = "This encounter SHALL contain exactly one [1..1] @moodCode=\"EVN\" Event (CodeSystem: HL7ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:4515-7772)."
    * id 1..1
      * ^short = "Set the encounter ID to the ID of an encounter in another section to signify they are the same encounter (CONF:4515-16843)."
      * ^comment = "This encounter SHALL contain exactly one [1..1] id (CONF:4515-7773)."
* entryRelationship[entryRelationship2] ^short = "entryRelationship"
  * ^comment = "MAY contain zero or one [0..1] entryRelationship (CONF:4515-7775) such that it"
  * typeCode 1..1
  * typeCode = #SUBJ (exactly)
    * ^comment = "SHALL contain exactly one [1..1] @typeCode=\"SUBJ\" Has Subject (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002 STATIC) (CONF:4515-7776)."
  * inversionInd 1..1
  * inversionInd = true (exactly)
    * ^comment = "SHALL contain exactly one [1..1] @inversionInd=\"true\" true (CONF:4515-7777)."
  * act 1..1
  * act only Instruction
    * ^comment = "SHALL contain exactly one [1..1] Instruction (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.4.20:2014-06-09) (CONF:4515-31395)."
* entryRelationship[entryRelationship3] ^short = "entryRelationship"
  * ^comment = "MAY contain zero or more [0..*] entryRelationship (CONF:4515-7779) such that it"
  * typeCode 1..1
  * typeCode = #RSON (exactly)
    * ^comment = "SHALL contain exactly one [1..1] @typeCode=\"RSON\" Has Reason (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002 STATIC) (CONF:4515-7780)."
  * observation 1..1
  * observation only Indication
    * ^comment = "SHALL contain exactly one [1..1] Indication (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.4.19:2014-06-09) (CONF:4515-15914)."
* entryRelationship[entryRelationship4] ^short = "entryRelationship"
  * ^comment = "MAY contain zero or more [0..*] entryRelationship (CONF:4515-7886) such that it"
  * typeCode 1..1
  * typeCode = #COMP (exactly)
    * ^comment = "SHALL contain exactly one [1..1] @typeCode=\"COMP\" Has Component (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002 STATIC) (CONF:4515-7887)."
  * substanceAdministration 1..1
  * substanceAdministration only MedicationActivity
    * ^comment = "SHALL contain exactly one [1..1] Medication Activity (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.4.16:2014-06-09) (CONF:4515-15915)."
* entryRelationship[entryRelationship5] ^short = "entryRelationship"
  * ^comment = "MAY contain zero or more [0..*] entryRelationship (CONF:4515-32473) such that it"
  * typeCode 1..1
  * typeCode = #COMP (exactly)
    * ^comment = "SHALL contain exactly one [1..1] @typeCode=\"COMP\" Has Component (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:4515-32474)."
  * observation 1..1
  * observation only ReactionObservation
    * ^comment = "SHALL contain exactly one [1..1] Reaction Observation (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.4.9:2014-06-09) (CONF:4515-32475)."
* entryRelationship[entryRelationship6] ^short = "When an Assessment Scale Observation is contained in a Procedure Template instance that is a Social Determinant of Health intervention procedure, that Assessment scale **MAY** contain Assessment Scale observations that represent LOINC question and answer pairs from SDOH screening instruments."
  * ^comment = "MAY contain zero or more [0..*] entryRelationship (CONF:4515-32985) such that it"
  * typeCode 1..1
  * typeCode = #RSON (exactly)
    * ^comment = "SHALL contain exactly one [1..1] @typeCode=\"RSON\" Has reason (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:4515-32987)."
  * observation 1..1
  * observation only AssessmentScaleObservation
    * ^comment = "SHALL contain exactly one [1..1] Assessment Scale Observation (identifier: urn:oid:2.16.840.1.113883.10.20.22.4.69) (CONF:4515-32986)."
* entryRelationship[entryRelationship7] ^short = "When an Entry Reference Template is contained in a Procedure Template instance that is a Social Determinant of Health procedure, that Entry Reference **MAY** refer to Assessment Scale Observation in the same document that represent LOINC question and answer pairs from SDOH screening instruments."
  * ^comment = "MAY contain zero or more [0..*] entryRelationship (CONF:4515-32988) such that it"
  * typeCode 1..1
  * typeCode = #RSON (exactly)
    * ^comment = "SHALL contain exactly one [1..1] @typeCode=\"RSON\" Has reason (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:4515-32990)."
  * act 1..1
  * act only EntryReference
    * ^comment = "SHALL contain exactly one [1..1] Entry Reference (identifier: urn:oid:2.16.840.1.113883.10.20.22.4.122) (CONF:4515-32989)."

Invariant: active-high-ts-after-document
Severity: #error
Description: "If the procedure is active and contains a high effectiveTime, this time SHALL be after the ClinicalDocument/effectiveTime"
Expression: "(statusCode.code = 'active' and effectiveTime.high.value.exists()) implies effectiveTime.high.value > %resource.effectiveTime.value"