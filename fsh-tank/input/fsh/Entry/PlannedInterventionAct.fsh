Profile: PlannedInterventionAct
Parent: $Act
Id: PlannedInterventionAct
Title: "Planned Intervention Act"
Description: """This template represents a Planned Intervention Act. It is a wrapper for planned intervention-type activities considered to be parts of the same intervention. For example, an activity such as "elevate head of bed" combined with "provide humidified O2 per nasal cannula" may be the interventions planned for a health concern of "respiratory insufficiency" in order to attempt to achieve a goal of "pulse oximetry greater than 92%". These intervention activities may be newly described or derived from a variety of sources within an EHR.

Interventions are actions taken to increase the likelihood of achieving the patient's or providers' goals. An Intervention Act should contain a reference to a Goal Observation representing the reason for the intervention.

Planned Intervention Acts can be related to each other or to Intervention Acts. (E.g., a Planned Intervention Act with moodCode of INT could be related to a series of Intervention Acts with moodCode of EVN, each having an effectiveTime containing the time of the intervention.) 

All interventions referenced in a Planned Intervention Act must have moodCodes indicating that that are planned (have not yet occurred)."""

* insert LogicalModelTemplate(planned-intervention-act, 2.16.840.1.113883.10.20.22.4.146, 2015-08-01)
* insert NarrativeLink

* classCode 1..1
* classCode = #ACT (exactly)
  * ^comment = "SHALL contain exactly one [1..1] @classCode=\"ACT\" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:1198-32678)."
* moodCode 1..1
* moodCode from $2.16.840.1.113883.11.20.9.54 (required)
  * ^comment = "SHALL contain exactly one [1..1] @moodCode, which SHALL be selected from ValueSet Planned Intervention moodCode urn:oid:2.16.840.1.113883.11.20.9.54 DYNAMIC (CONF:1198-32679)."
* id 1..*
  * ^comment = "SHALL contain at least one [1..*] id (CONF:1198-32681)."
* code 1..1
  * ^comment = "SHALL contain exactly one [1..1] code (CONF:1198-32654)."
  * code 1..1
  * code = #362956003
    * ^comment = "This code SHALL contain exactly one [1..1] @code=\"362956003\" procedure / intervention (navigational concept) (CONF:1198-32682)."
  * codeSystem 1..1
  * codeSystem = "2.16.840.1.113883.6.96"
    * ^comment = "This code SHALL contain exactly one [1..1] @codeSystem=\"2.16.840.1.113883.6.96\" (CodeSystem: SNOMED CT urn:oid:2.16.840.1.113883.6.96) (CONF:1198-32683)."
* statusCode 1..1
  * ^comment = "SHALL contain exactly one [1..1] statusCode (CONF:1198-32655)."
  * code 1..1
  * code = #active (exactly)
    * ^comment = "This statusCode SHALL contain exactly one [1..1] @code=\"active\" Active (CodeSystem: HL7ActStatus urn:oid:2.16.840.1.113883.5.14 STATIC) (CONF:1198-32684)."
* insert ShouldElement(effectiveTime)
* effectiveTime 0..1
  * ^comment = "SHOULD contain zero or one [0..1] effectiveTime (CONF:1198-32723)." // auto-should
* insert ShouldElement(author)
* author 0..*
* author only AuthorParticipation
  * ^comment = "SHOULD contain zero or more [0..*] Author Participation (identifier: urn:oid:2.16.840.1.113883.10.20.22.4.119) (CONF:1198-32719)." // man-should
* entryRelationship ^slicing.discriminator[0].type = #profile
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
  * ^slicing.discriminator[+].type = #value
  * ^slicing.discriminator[=].path = "typeCode"
  * ^slicing.rules = #open
* entryRelationship contains
    reason 1..* and
    immunizationActivity 0..* and
    medicationActivity 0..* and
    instruction 0..* and
    nonMedSupply 0..* and
    plannedEncounter 0..* and
    plannedProcedure 0..* and
    plannedMedicationActivity 0..* and
    plannedSupply 0..* and
    nutritionRecommendation 0..* and
    entryReference 0..* and
    plannedImmunizationActivity 0..*
* entryRelationship[immunizationActivity] ^comment = "MAY contain zero or more [0..*] entryRelationship (CONF:1198-32656) such that it"
  * typeCode 1..1
  * typeCode = #REFR (exactly)
    * ^comment = "SHALL contain exactly one [1..1] @typeCode=\"REFR\" Refers to (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:1198-32686)."
  * substanceAdministration 1..1
  * substanceAdministration only ImmunizationActivity
    * ^comment = "SHALL contain exactly one [1..1] Immunization Activity (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.4.52:2015-08-01) (CONF:1198-32687)."
* entryRelationship[medicationActivity] ^comment = "MAY contain zero or more [0..*] entryRelationship (CONF:1198-32657) such that it"
  * typeCode 1..1
  * typeCode = #REFR (exactly)
    * ^comment = "SHALL contain exactly one [1..1] @typeCode=\"REFR\" Refers to (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:1198-32688)."
  * substanceAdministration 1..1
  * substanceAdministration only MedicationActivity
    * ^comment = "SHALL contain exactly one [1..1] Medication Activity (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.4.16:2014-06-09) (CONF:1198-32689)."
* entryRelationship[instruction] ^comment = "MAY contain zero or more [0..*] entryRelationship (CONF:1198-32663) such that it"
  * typeCode 1..1
  * typeCode = #REFR (exactly)
    * ^comment = "SHALL contain exactly one [1..1] @typeCode=\"REFR\" Refers to (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:1198-32957)."
  * observation 1..1
  * observation only InstructionObservation
* entryRelationship[nonMedSupply] ^comment = "MAY contain zero or more [0..*] entryRelationship (CONF:1198-32664) such that it"
  * typeCode 1..1
  * typeCode = #REFR (exactly)
    * ^comment = "SHALL contain exactly one [1..1] @typeCode=\"REFR\" Refers to (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:1198-32702)."
  * supply 1..1
  * supply only NonMedicinalSupplyActivity
    * ^comment = "SHALL contain exactly one [1..1] Non-Medicinal Supply Activity (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.4.50:2014-06-09) (CONF:1198-32703)."
* entryRelationship[plannedEncounter] ^comment = "MAY contain zero or more [0..*] entryRelationship (CONF:1198-32666) such that it"
  * typeCode 1..1
  * typeCode = #REFR (exactly)
    * ^comment = "SHALL contain exactly one [1..1] @typeCode=\"REFR\" Refers to (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:1198-32706)."
  * encounter 1..1
  * encounter only PlannedEncounter
    * ^comment = "SHALL contain exactly one [1..1] Planned Encounter (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.4.40:2014-06-09) (CONF:1198-32707)."
* entryRelationship[plannedProcedure] ^comment = "MAY contain zero or more [0..*] entryRelationship (CONF:1198-32668) such that it"
  * typeCode 1..1
  * typeCode = #REFR (exactly)
    * ^comment = "SHALL contain exactly one [1..1] @typeCode=\"REFR\" Refers to (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:1198-32710)."
  * procedure 1..1
  * procedure only PlannedProcedure
    * ^comment = "SHALL contain exactly one [1..1] Planned Procedure (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.4.41:2014-06-09) (CONF:1198-32711)."
* entryRelationship[plannedMedicationActivity] ^comment = "MAY contain zero or more [0..*] entryRelationship (CONF:1198-32669) such that it"
  * typeCode 1..1
  * typeCode = #REFR (exactly)
    * ^comment = "SHALL contain exactly one [1..1] @typeCode=\"REFR\" (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:1198-32712)."
  * substanceAdministration 1..1
  * substanceAdministration only PlannedMedicationActivity
    * ^comment = "SHALL contain exactly one [1..1] Planned Medication Activity (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.4.42:2014-06-09) (CONF:1198-32713)."
* entryRelationship[plannedSupply] ^comment = "MAY contain zero or more [0..*] entryRelationship (CONF:1198-32670) such that it"
  * typeCode 1..1
  * typeCode = #REFR (exactly)
    * ^comment = "SHALL contain exactly one [1..1] @typeCode=\"REFR\" Refers to (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:1198-32714)."
  * supply 1..1
  * supply only PlannedSupply
    * ^comment = "SHALL contain exactly one [1..1] Planned Supply (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.4.43:2014-06-09) (CONF:1198-32715)."
* entryRelationship[nutritionRecommendation] ^comment = "MAY contain zero or more [0..*] entryRelationship (CONF:1198-32671) such that it"
  * typeCode 1..1
  * typeCode = #REFR (exactly)
  * act 1..1
  * act only NutritionRecommendation
    * ^comment = "SHALL contain exactly one [1..1] Nutrition Recommendation (identifier: urn:oid:2.16.840.1.113883.10.20.22.4.130) (CONF:1198-32716)."
* entryRelationship[entryReference] ^short = "Where an Intervention needs to reference another entry already described in the CDA document instance, rather than repeating the full content of the entry, the Entry Reference template may be used to reference this entry."
  * ^comment = "MAY contain zero or more [0..*] entryRelationship (CONF:1198-32672) such that it"
  * typeCode 1..1
  * typeCode = #REFR (exactly)
    * ^comment = "SHALL contain exactly one [1..1] @typeCode=\"REFR\" Refers to (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:1198-32717)."
  * act 1..1
  * act only EntryReference
    * ^comment = "SHALL contain exactly one [1..1] Entry Reference (identifier: urn:oid:2.16.840.1.113883.10.20.22.4.122) (CONF:1198-32718)."
* entryRelationship[reason] obeys entry-ref-goal
  * ^short = "An Intervention Act SHALL reference a Goal Observation. Because the Goal Observation is already described in the CDA document instance's Goals section, rather than repeating the full content of the Goal Observation, the Entry Reference template can be used to reference this entry. The following entryRelationship represents an Entry Reference to Goal Observation."
  * ^comment = "SHALL contain at least one [1..*] entryRelationship (CONF:1198-32673) such that it"
  * typeCode 1..1
  * typeCode = #RSON (exactly)
    * ^comment = "SHALL contain exactly one [1..1] @typeCode=\"RSON\" Has reason (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:1198-32720)."
  * act 1..1
  * act only EntryReference
    * ^comment = "SHALL contain exactly one [1..1] Entry Reference (identifier: urn:oid:2.16.840.1.113883.10.20.22.4.122) (CONF:1198-32721)."
* entryRelationship[plannedImmunizationActivity] ^comment = "MAY contain zero or more [0..*] entryRelationship (CONF:1198-32676) such that it"
  * typeCode 1..1
  * typeCode = #REFR (exactly)
    * ^comment = "SHALL contain exactly one [1..1] @typeCode=\"REFR\" Refers to (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:1198-32728)."
  * substanceAdministration 1..1
  * substanceAdministration only PlannedImmunizationActivity
    * ^comment = "SHALL contain exactly one [1..1] Planned Immunization Activity (identifier: urn:oid:2.16.840.1.113883.10.20.22.4.120) (CONF:1198-32729)."
* reference 0..*
  * ^comment = "MAY contain zero or more [0..*] reference (CONF:1198-32766)."
  * typeCode 1..1
  * typeCode = #REFR (exactly)
    * ^comment = "The reference, if present, SHALL contain exactly one [1..1] @typeCode=\"REFR\" Refers to (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:1198-32767)."
  * externalDocument 1..1
  * externalDocument only ExternalDocumentReference
    * ^comment = "The reference, if present, SHALL contain exactly one [1..1] External Document Reference (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.4.115:2014-06-09) (CONF:1198-32768)."
