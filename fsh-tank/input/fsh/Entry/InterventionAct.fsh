Profile: InterventionAct
Parent: $Act
Id: InterventionAct
Title: "Intervention Act"
Description: """This template represents an Intervention Act. It is a wrapper for intervention-type activities considered to be parts of the same intervention. For example, an activity such as "elevate head of bed" combined with "provide humidified O2 per nasal cannula" may be the interventions performed for a health concern of "respiratory insufficiency" to achieve a goal of "pulse oximetry greater than 92%". These intervention activities may be newly described or derived from a variety of sources within an EHR.

Interventions are actions taken to increase the likelihood of achieving the patient's or providers' goals. An Intervention Act should contain a reference to a Goal Observation representing the reason for the intervention.

Intervention Acts can be related to each other, or to Planned Intervention Acts. (E.g., a Planned Intervention Act with moodCode of INT could be related to a series of Intervention Acts with moodCode of EVN, each having an effectiveTime containing the time of the intervention.) 

All interventions referenced in an Intervention Act must have a moodCode of EVN, indicating that they have occurred."""

// !!! This templateId is referenced in an invariant below. If it changes (including the date), update that invariant's expression!!!
* insert LogicalModelTemplate(intervention-act, 2.16.840.1.113883.10.20.22.4.131, 2015-08-01)
* insert NarrativeLink

* classCode 1..1
* classCode = #ACT (exactly)
  * ^comment = "SHALL contain exactly one [1..1] @classCode=\"ACT\" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:1198-30971)."
* moodCode 1..1
* moodCode = #EVN (exactly)
  * ^comment = "SHALL contain exactly one [1..1] @moodCode=\"EVN\" Event (CodeSystem: HL7ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:1198-30972)."
* id 1..*
  * ^comment = "SHALL contain at least one [1..*] id (CONF:1198-30975)."
* code 1..1
  * ^comment = "SHALL contain exactly one [1..1] code (CONF:1198-30976)."
  * code 1..1
  * code = #362956003
    * ^comment = "This code SHALL contain exactly one [1..1] @code=\"362956003\" procedure / intervention (navigational concept) (CONF:1198-30977)."
  * codeSystem 1..1
  * codeSystem = "2.16.840.1.113883.6.96"
    * ^comment = "This code SHALL contain exactly one [1..1] @codeSystem=\"2.16.840.1.113883.6.96\" (CodeSystem: SNOMED CT urn:oid:2.16.840.1.113883.6.96) (CONF:1198-30978)."
* statusCode 1..1
  * ^comment = "SHALL contain exactly one [1..1] statusCode (CONF:1198-30979)."
  * code 1..1
  * code = #completed (exactly)
    * ^comment = "This statusCode SHALL contain exactly one [1..1] @code=\"completed\" Completed (CodeSystem: HL7ActStatus urn:oid:2.16.840.1.113883.5.14 STATIC) (CONF:1198-32316)."
* obeys should-effectiveTime
* effectiveTime 0..1
  * ^comment = "SHOULD contain zero or one [0..1] effectiveTime (CONF:1198-31624)." // auto-should
* insert ShouldElement(author)
* author 0..*
* author only AuthorParticipation
  * ^comment = "SHOULD contain zero or more [0..*] Author Participation (identifier: urn:oid:2.16.840.1.113883.10.20.22.4.119) (CONF:1198-31552)." // man-should
* entryRelationship ^slicing.discriminator[0].type = #value
  * ^slicing.discriminator[=].path = "typeCode"
  * ^slicing.discriminator[+].type = #profile
  * ^slicing.discriminator[=].path = "observation"
  * ^slicing.discriminator[+].type = #profile
  * ^slicing.discriminator[=].path = "substanceAdministration"
  * ^slicing.discriminator[+].type = #profile
  * ^slicing.discriminator[=].path = "act"
  * ^slicing.discriminator[+].type = #profile
  * ^slicing.discriminator[=].path = "procedure"
  * ^slicing.discriminator[+].type = #profile
  * ^slicing.discriminator[=].path = "encounter"
  * ^slicing.discriminator[+].type = #profile
  * ^slicing.discriminator[=].path = "supply"
  * ^slicing.rules = #open
* entryRelationship contains
    advanceDirectiveObservation 0..* and
    immunizationActivity 0..* and
    medicationActivity 0..* and
    interventionAct 0..* and
    procedureActivityProcedure 0..* and
    encounterActivity 0..* and
    instruction 0..* and
    nonMedSupply 0..* and
    nutritionRecommendation 0..* and
    entryReferenceRefr 0..* and
    entryReferenceRson 0..* and
    handoffCommunicationParticipants 0..* and
    plannedInterventionAct 0..*
* entryRelationship[advanceDirectiveObservation] ^comment = "MAY contain zero or more [0..*] entryRelationship (CONF:1198-30980) such that it"
  * typeCode 1..1
  * typeCode = #REFR (exactly)
    * ^comment = "SHALL contain exactly one [1..1] @typeCode=\"REFR\" Refers to (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:1198-30981)."
  * observation 1..1
  * observation only AdvanceDirectiveObservation
    * ^comment = "SHALL contain exactly one [1..1] Advance Directive Observation (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.4.48:2015-08-01) (CONF:1198-30982)."
* entryRelationship[immunizationActivity] ^comment = "MAY contain zero or more [0..*] entryRelationship (CONF:1198-30984) such that it"
  * typeCode 1..1
  * typeCode = #REFR (exactly)
    * ^comment = "SHALL contain exactly one [1..1] @typeCode=\"REFR\" Refers to (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:1198-30985)."
  * substanceAdministration 1..1
  * substanceAdministration only ImmunizationActivity
    * ^comment = "SHALL contain exactly one [1..1] Immunization Activity (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.4.52:2015-08-01) (CONF:1198-30986)."
* entryRelationship[medicationActivity] ^comment = "MAY contain zero or more [0..*] entryRelationship (CONF:1198-30988) such that it"
  * typeCode 1..1
  * typeCode = #REFR (exactly)
    * ^comment = "SHALL contain exactly one [1..1] @typeCode=\"REFR\" Refers to (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:1198-30989)."
  * substanceAdministration 1..1
  * substanceAdministration only MedicationActivity
    * ^comment = "SHALL contain exactly one [1..1] Medication Activity (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.4.16:2014-06-09) (CONF:1198-30990)."
* entryRelationship[interventionAct] ^short = "The following entryRelationship represents the relationship between two Intervention Acts (Intervention RELATES TO Intervention)."
  * ^comment = "MAY contain zero or more [0..*] entryRelationship (CONF:1198-31154) such that it"
  * typeCode 1..1
  * typeCode = #REFR (exactly)
    * ^comment = "SHALL contain exactly one [1..1] @typeCode=\"REFR\" Refers to (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:1198-31155)."
  * act 1..1
  * act only InterventionAct
    * ^comment = "SHALL contain exactly one [1..1] Intervention Act (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.4.131:2015-08-01) (CONF:1198-32460)."
* entryRelationship[procedureActivityProcedure] ^comment = "MAY contain zero or more [0..*] entryRelationship (CONF:1198-31168) such that it"
  * typeCode 1..1
  * typeCode = #REFR (exactly)
    * ^comment = "SHALL contain exactly one [1..1] @typeCode=\"REFR\" Refers to (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:1198-31169)."
  * procedure 1..1
  * procedure only ProcedureActivityProcedure
    * ^comment = "SHALL contain exactly one [1..1] Procedure Activity Procedure (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.4.14:2014-06-09) (CONF:1198-31170)."
* entryRelationship[encounterActivity] ^comment = "MAY contain zero or more [0..*] entryRelationship (CONF:1198-31171) such that it"
  * typeCode 1..1
  * typeCode = #REFR (exactly)
    * ^comment = "SHALL contain exactly one [1..1] @typeCode=\"REFR\" Refers to (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:1198-31172)."
  * encounter 1..1
  * encounter only EncounterActivity
    * ^comment = "SHALL contain exactly one [1..1] Encounter Activity (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.4.49:2015-08-01) (CONF:1198-31173)."
* entryRelationship[instruction] ^comment = "MAY contain zero or more [0..*] entryRelationship (CONF:1198-31174) such that it"
  * typeCode 1..1
  * typeCode = #REFR (exactly)
    * ^comment = "SHALL contain exactly one [1..1] @typeCode=\"REFR\" Refers to (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:1198-32956)."
  * observation 1..1
  * observation only InstructionObservation
* entryRelationship[nonMedSupply] ^comment = "MAY contain zero or more [0..*] entryRelationship (CONF:1198-31177) such that it"
  * typeCode 1..1
  * typeCode = #REFR (exactly)
    * ^comment = "SHALL contain exactly one [1..1] @typeCode=\"REFR\" Refers to (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:1198-31178)."
  * supply 1..1
  * supply only NonMedicinalSupplyActivity
    * ^comment = "SHALL contain exactly one [1..1] Non-Medicinal Supply Activity (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.4.50:2014-06-09) (CONF:1198-31179)."
* entryRelationship[nutritionRecommendation] ^comment = "MAY contain zero or more [0..*] entryRelationship (CONF:1198-31413) such that it"
  * typeCode 1..1
  * typeCode = #REFR (exactly)
  * act 1..1
  * act only NutritionRecommendation
    * ^comment = "SHALL contain exactly one [1..1] Nutrition Recommendation (identifier: urn:oid:2.16.840.1.113883.10.20.22.4.130) (CONF:1198-31414)."
* entryRelationship[entryReferenceRefr] ^short = "Where an Intervention needs to reference another entry already described in the CDA document instance, rather than repeating the full content of the entry, the Entry Reference template may be used to reference this entry."
  * ^comment = "MAY contain zero or more [0..*] entryRelationship (CONF:1198-31545) such that it"
  * typeCode 1..1
  * typeCode = #REFR (exactly)
    * ^comment = "SHALL contain exactly one [1..1] @typeCode=\"REFR\" Refers to (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:1198-31554)."
  * act 1..1
  * act only EntryReference
    * ^comment = "SHALL contain exactly one [1..1] Entry Reference (identifier: urn:oid:2.16.840.1.113883.10.20.22.4.122) (CONF:1198-31555)."
* entryRelationship[entryReferenceRson] obeys entry-ref-goal
  * ^short = "An Intervention Act should reference a Goal Observation. Because the Goal Observation is already described in the CDA document instance's Goals section, rather than repeating the full content of the Goal Observation, the Entry Reference template can be used to reference this entry. The following entryRelationship represents an Entry Reference to Goal Observation."
  * ^comment = "SHOULD contain zero or more [0..*] entryRelationship (CONF:1198-31621) such that it"
  * typeCode 1..1
  * typeCode = #RSON (exactly)
    * ^comment = "SHALL contain exactly one [1..1] @typeCode=\"RSON\" Has reason (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:1198-31622)."
  * act 1..1
  * act only EntryReference
    * ^comment = "SHALL contain exactly one [1..1] Entry Reference (identifier: urn:oid:2.16.840.1.113883.10.20.22.4.122) (CONF:1198-31623)."
* entryRelationship[handoffCommunicationParticipants] ^comment = "MAY contain zero or more [0..*] entryRelationship (CONF:1198-32317) such that it"
  * typeCode 1..1
  * typeCode = #REFR (exactly)
    * ^comment = "SHALL contain exactly one [1..1] @typeCode=\"REFR\" Refers to (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:1198-32318)."
  * act 1..1
  * act only HandoffCommunicationParticipants
    * ^comment = "SHALL contain exactly one [1..1] Handoff Communication Participants (identifier: urn:oid:2.16.840.1.113883.10.20.22.4.141) (CONF:1198-32319)."
* entryRelationship[plannedInterventionAct] ^comment = "MAY contain zero or more [0..*] entryRelationship (CONF:1198-32914) such that it"
  * typeCode 1..1
  * typeCode = #REFR (exactly)
    * ^comment = "SHALL contain exactly one [1..1] @typeCode=\"REFR\" Refers to (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:1198-32773)."
  * act 1..1
  * act only PlannedInterventionAct
    * ^comment = "SHALL contain exactly one [1..1] Planned Intervention Act (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.4.146:2015-08-01) (CONF:1198-32915)."
* reference 0..*
  * ^comment = "MAY contain zero or more [0..*] reference (CONF:1198-32760)."
  * typeCode 1..1
  * typeCode = #REFR (exactly)
    * ^comment = "The reference, if present, SHALL contain exactly one [1..1] @typeCode=\"REFR\" Refers to (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:1198-32761)."
  * externalDocument 1..1
  * externalDocument only ExternalDocumentReference
    * ^comment = "The reference, if present, SHALL contain exactly one [1..1] External Document Reference (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.4.115:2014-06-09) (CONF:1198-32762)."

// Add on any entry/entryRelationship/component containing an EntryReference that must be a reference to an Intervention Act (see OutcomeObservation)
Invariant: entry-ref-intervention
Description: "This entryReference template **SHALL** reference an instance of a Goal Observation template."
Severity: #error
Expression: "%resource.descendants().ofType(CDA.Observation).where(templateId.exists($this.root = '2.16.840.1.113883.10.20.22.4.131' and $this.extension = '2015-08-01') and id.exists($this.root = %context.act.id.first().root and $this.extension ~ %context.act.id.first().extension))"
/*
%resource.descendants().ofType(CDA.Observation).where(
  templateId.exists(
    $this.root = '2.16.840.1.113883.10.20.22.4.131' and
    $this.extension = '2015-08-01'
  ) and
  id.exists(
    $this.root = %context.act.id.first().root and
    $this.extension ~ %context.act.id.first().extension
  )
)*/
