Profile: HealthConcernAct
Parent: $Act
Id: HealthConcernAct
Title: "Health Concern Act"
Description: """This template represents a health concern. 

It is a wrapper for a single health concern which may be derived from a variety of sources within an EHR (such as Problem List, Family History, Social History, Social Worker Note, etc.). 

A Health Concern Act is used to track non-optimal physical or psychological situations drawing the patient to the healthcare system. These may be from the perspective of the care team or from the perspective of the patient. 
When the underlying condition is of concern (i.e., as long as the condition, whether active or resolved, is of ongoing concern and interest), the statusCode is active. Only when the underlying condition is no longer of concern is the statusCode set to completed. The effectiveTime reflects the time that the underlying condition was felt to be a concern; it may or may not correspond to the effectiveTime of the condition (e.g., even five years later, a prior heart attack may remain a concern).
Health concerns require intervention(s) to increase the likelihood of achieving the goals of care for the patient and they specify the condition oriented reasons for creating the plan."""

* insert LogicalModelTemplate(health-concern-act, 2.16.840.1.113883.10.20.22.4.132, 2022-06-01)
* insert NarrativeLink

* classCode 1..1
* classCode = #ACT (exactly)
  * ^comment = "SHALL contain exactly one [1..1] @classCode=\"ACT\" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:4515-30750)."
* moodCode 1..1
* moodCode = #EVN (exactly)
  * ^comment = "SHALL contain exactly one [1..1] @moodCode=\"EVN\" (CodeSystem: HL7ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:4515-30751)."
* id 1..*
  * ^comment = "SHALL contain at least one [1..*] id (CONF:4515-30754)."
* code 1..1
  * ^comment = "SHALL contain exactly one [1..1] code (CONF:4515-32310)."
  * code 1..1
  * insert CodedLoinc(75310-3, Functional status assessment note)
* statusCode 1..1
  * ^comment = "SHALL contain exactly one [1..1] statusCode (CONF:4515-30758)."
  * insert BindAtCode($2.16.840.1.113883.11.20.9.19, required)
* effectiveTime 0..1
  * ^comment = "MAY contain zero or one [0..1] effectiveTime (CONF:4515-30759)."
* obeys should-author
* author 0..*
* author only AuthorParticipation
  * ^short = "A health concern may be a patient or provider concern. If the author is set to the recordTarget (patient), this is a patient concern. If the author is set to a provider, this is a provider concern. If both patient and provider are set as authors, this is a concern of both the patient and the provider."
  * ^comment = "SHOULD contain zero or more [0..*] Author Participation (identifier: urn:oid:2.16.840.1.113883.10.20.22.4.119) (CONF:4515-31546)." // man-should
* entryRelationship ^slicing.discriminator[0].type = #profile
  * ^slicing.discriminator[=].path = "act"
  * ^slicing.discriminator[+].type = #profile
  * ^slicing.discriminator[=].path = "observation"
  * ^slicing.discriminator[+].type = #profile
  * ^slicing.discriminator[=].path = "organizer"
  * ^slicing.discriminator[+].type = #value
  * ^slicing.discriminator[=].path = "typeCode"
  * ^slicing.rules = #open
  * ^short = "When this Health Concern Act is a Social Determinant of Health Health Concern it **SHOULD** contain zero or more [0..*] entryRelationship subentries such that it contains an observation with an observation/value selected from ValueSet [Social Determinant of Health Conditions 2.16.840.1.113762.1.4.1196.788](https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1196.788/expansion) **DYNAMIC** (CONF:4515-32962)."
  * ^comment = "MAY contain zero or more [0..*] entryRelationship (CONF:4515-31549) such that it"
* entryRelationship contains
    observations 0..* and
    acts 0..* and
    organizers 0..* and
    related-entries 0..* and
    component-health-concern-acts 0..*
* entryRelationship[observations] 
  * typeCode 1..1
  * typeCode = #REFR (exactly)
  * observation 1..1
  * observation only ProblemObservation or AllergyIntoleranceObservation or AssessmentScaleObservation or SelfCareActivitiesADLandIADL or MentalStatusObservation or SmokingStatusMeaningfulUse or FunctionalStatusObservation or NutritionAssessment or PregnancyStatusObservation or ReactionObservation or ResultObservation or SensoryStatus or SocialHistoryObservation or SubstanceOrDeviceAllergyIntoleranceObservation or TobaccoUse or VitalSignObservation or LongitudinalCareWoundObservation or ProblemObservation or CaregiverCharacteristics or CulturalandReligiousObservation or CharacteristicsofHomeEnvironment or NutritionalStatusObservation or PriorityPreference
* entryRelationship[acts]
  * typeCode 1..1
  * typeCode = #REFR (exactly)
  * act 1..1
  * act only EncounterDiagnosis or HospitalAdmissionDiagnosis or PostprocedureDiagnosis or PreoperativeDiagnosis
* entryRelationship[organizers]
  * typeCode 1..1
  * typeCode = #REFR (exactly)
  * organizer 1..1
  * organizer only FamilyHistoryOrganizer or ResultOrganizer

* entryRelationship[related-entries] ^short = "Where a Health Concern needs to reference another entry already described in the CDA document instance, rather than repeating the full content of the entry, the Entry Reference template may be used to reference this entry. This may also be used to refer to other Health Concern Acts where there is a general relationship between the source and the target (Health Concern REFERS TO Health Concern). For example, a patient has 2 health concerns identified in a CARE Plan: Failure to Thrive and Poor Feeding; while it could be that one may have caused the other, at the time of care planning and documentation it is not necessary, nor desirable to have to assert what caused what. The Entry Reference template is used here because the target Health Concern Act will be defined elsewhere in the Health Concerns Section and thus a reference to that template is all that is required."
  * ^comment = "MAY contain zero or more [0..*] entryRelationship (CONF:4515-31157) such that it"
  * typeCode 1..1
  * typeCode = #REFR (exactly)
    * ^comment = "SHALL contain exactly one [1..1] @typeCode=\"REFR\" Refers to (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:4515-31158)."
  * act 1..1
  * act only EntryReference
    * ^comment = "SHALL contain exactly one [1..1] Entry Reference (identifier: urn:oid:2.16.840.1.113883.10.20.22.4.122) (CONF:4515-32106)."
* entryRelationship[component-health-concern-acts] ^short = "The following entryRelationship represents the relationship between two Health Concern Acts where the target is a component of the source (Health Concern HAS COMPONENT Health Concern). For example, a patient has an Impaired Mobility Health Concern. There may then be the need to document several component health concerns, such as \"Unable to Transfer Bed to Chair\",\"Unable to Rise from Commode\", \"Short of Breath Walking with Walker\". The Entry Reference template is used here because the target Health Concern Act will be defined elsewhere in the Health Concerns Section and thus a reference to that template is all that is required."
  * ^comment = "MAY contain zero or more [0..*] entryRelationship (CONF:4515-31160) such that it"
  * typeCode 1..1
  * typeCode = #COMP (exactly)
    * ^comment = "SHALL contain exactly one [1..1] @typeCode=\"COMP\" Has component (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:4515-31161)."
  * obeys 4515-32745
  * act 1..1
  * act only EntryReference
    * ^comment = "SHALL contain exactly one [1..1] Entry Reference (identifier: urn:oid:2.16.840.1.113883.10.20.22.4.122) (CONF:4515-32107)."

* reference 0..*
  * ^short = "Where it is necessary to reference an external clinical document such as a Referral document, Discharge Summary document etc., the External Document Reference template can be used to reference this document.  However, if this Care Plan document is replacing or appending another Care Plan document in the same set, that relationship is set in the header, using ClinicalDocument/relatedDocument."
  * ^comment = "MAY contain zero or more [0..*] reference (CONF:4515-32757)."
  * typeCode 1..1
  * typeCode = #REFR (exactly)
    * ^comment = "The reference, if present, SHALL contain exactly one [1..1] @typeCode=\"REFR\" Refers to (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:4515-32758)."
  * externalDocument 1..1
  * externalDocument only ExternalDocumentReference
    * ^comment = "The reference, if present, SHALL contain exactly one [1..1] External Document Reference (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.4.115:2014-06-09) (CONF:4515-32759)."

Invariant: 4515-32745
Description: "The Entry Reference template **SHALL** contain an id that references a Health Concern Act (CONF:4515-32745)."
Severity: #error
Expression: "%resource.descendants().ofType(CDA.Act).where(templateId.exists($this.root = '2.16.840.1.113883.10.20.22.4.132' and $this.extension = '2022-06-01') and id.exists($this.root = %context.act.id.first().root and $this.extension ~ %context.act.id.first().extension))"
/*
%resource.descendants().ofType(CDA.Act).where(
  templateId.exists(
    $this.root = '2.16.840.1.113883.10.20.22.4.132' and
    $this.extension = '2022-06-01'
  ) and
  id.exists(
    $this.root = %context.act.id.first().root and
    $this.extension ~ %context.act.id.first().extension
  )
)*/
