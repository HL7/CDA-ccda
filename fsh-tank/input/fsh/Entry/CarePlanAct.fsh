Profile: CarePlanAct
Parent: $Act
Id: CarePlanAct
Title: "Care Plan Act"
Description: """The Care Plan Act represents a snapshot in time of a dynamic, consensus-driven plan that has captured a patient's and care team members' prioritized concerns, goals, and planned interventions. It reflects the state of the care plan as managed within a source system and may be exchanged to support care coordination across systems and settings.

The Care Plan Act identifies the authoring individual or organization (act.author), which aligns with the FHIR CarePlan.contributor, and records the set of health concerns or conditions being addressed.

**To meet USCDI requirements, at least one entryRelationship:addresses element referencing an Indication, Problem Observation, or Observation is required.**

The Care Plan Act may integrate multiple condition- or discipline-specific plans of care and serves to align activities and responsibilities among participants. *Supporting entryRelationship templates such as Goal, Intervention Act, Planned Intervention Act, and Act are available for systems capable of representing structured care plans, but their use is optional and not required for USCDI compliance.*

This entry conveys an instance of the evolving Care Plan at a specific point in time and does not represent a dynamically updated plan."""

* insert LogicalModelTemplate(care-plan-act, 2.16.840.1.113883.10.20.22.4.518, 2026-05-01)
* insert NarrativeLink

// * insert FixedCategory(assess-plan, 2.16.840.1.113883.4.642.40.2.16.1, Assessment and Plan of Treatment, assess-plan)

* moodCode 1..1
  * ^short = "CarePlan.intent" // TODO move to mapping

* code 1..1
  * insert CodedLoinc(18776-5, Plan of care note)
  * translation from http://hl7.org/fhir/ValueSet/care-plan-category (preferred)
* statusCode 1..1
  * ^short = "CarePlan.status"

* author 0..*
* author only AuthorParticipation
  * ^short = "CarePlan.contributor"

* entryRelationship 0..*
  * ^slicing.discriminator[0].type = #value
  * ^slicing.discriminator[=].path = "typeCode"
  * ^slicing.rules = #open
  * ^short = "Entries can be embedded directly or referenced via EntryReference. Use the @typeCode attribute to distinguish the type of relationship."
* entryRelationship contains
  addresses 0..* and
  goal 0..* and 
  supportingInfo 0..* and
  activity 0..*

* entryRelationship[addresses]
  * typeCode = #RSON
  * insert USCDI(CarePlan.addresses)
  * obeys act-or-observation
  * observation only Indication or ProblemObservation or $Observation
    // force the resource into the profile array since SUSHI currently doesn't do it for us
    * ^type.profile[2] = $Observation
    * ^short = "Directly-embedded Problem or Indication observation. Use EntryReference to reference an existing problem observation or indication described elsewhere in the document."
  * act only EntryReference or $Act
    * ^short = "References an Indication, Problem Observation, or other Problem described elsewhere in the document."
    // force the resource into the profile array since SUSHI currently doesn't do it for us
    * ^type.profile[1] = $Act

* entryRelationship[goal]
  * ^short = "Desired outcome of the plan (CarePlan.goal). Can embed a Goal Observation directly or use the EntryReference template to reference a Goal Observation described elsewhere in the document."
  * obeys act-or-observation
  * typeCode = #GEVL
  * observation 0..1
  * observation only GoalObservation
    * ^short = "Use to embed a Goal Observation directly"
  * act 0..1
  * act only EntryReference
    * ^short = "Use to reference a Goal Observation elsewhere"
    * obeys entry-ref-goal

* entryRelationship[supportingInfo]
  * typeCode = #SPRT
  * ^short = "Information considered as part of the plan (CarePlan.supportingInfo)"
* entryRelationship[activity]
  * typeCode = #COMP
  * ^short = "Activity to occur as part of plan (CarePlan.activity). Common examples include the Intervention Act and Planned Intervention Act, but any entry may be considered an activity of the care plan."
  * act 0..1
  * act only InterventionAct or PlannedInterventionAct or $Act
    // force the resource into the profile array since SUSHI currently doesn't do it for us
    * ^type.profile[2] = $Act
    * ^short = "A care plan may have multiple COMP entryRelationships, but each entryRelationship may only have a single act/encounter/observation/supply or other clinical statement."
  * encounter 0..1
    * ^short = "A care plan may have multiple COMP entryRelationships, but each entryRelationship may only have a single act/encounter/observation/supply or other clinical statement."
  * observation 0..1
    * ^short = "A care plan may have multiple COMP entryRelationships, but each entryRelationship may only have a single act/encounter/observation/supply or other clinical statement."
  * supply 0..1
    * ^short = "A care plan may have multiple COMP entryRelationships, but each entryRelationship may only have a single act/encounter/observation/supply or other clinical statement."

Mapping: CarePlanActToUsCoreCarePlan
Source: CarePlanAct
Target: "http://hl7.org/fhir/us/core/StructureDefinition/us-core-careplan"
Title: "FHIR US Core"
* -> "CarePlan"
* moodCode -> "CarePlan.intent"
* statusCode -> "CarePlan.status"
* code.translation -> "CarePlan.category"
* author -> "CarePlan.contributor"
* entryRelationship[addresses] -> "CarePlan.addresses"
* entryRelationship[goal] -> "CarePlan.goal"
* entryRelationship[supportingInfo] -> "CarePlan.supportingInfo"
* entryRelationship[activity] -> "CarePlan.activity"

Invariant: act-or-observation
Description: "Either act or observation SHALL be present but not both."
Severity: #error
Expression: "act.exists() or observation.exists()"
