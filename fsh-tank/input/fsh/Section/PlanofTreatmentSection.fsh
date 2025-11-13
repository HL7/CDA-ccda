Profile: PlanofTreatmentSection
Parent: $Section
Id: PlanofTreatmentSection
Title: "Plan of Treatment Section"
Description: """This section captures planned, pending, active, or completed orders, interventions, encounters, services, and procedures relevant to a patient’s care. It may also include or reference existing problems or conditions that inform ongoing care planning. While entries typically represent prospective or in-progress actions (as indicated by their @moodCode), completed activities of clinical significance may be included to maintain continuity and context. The section may contain information about ongoing or anticipated care, clinical reminders, and overarching goals, along with the patient’s values, beliefs, preferences, and care expectations that shape care decisions. Examples include reminders for preventive services, values such as quality of life over longevity, beliefs such as refusal of blood transfusions, or preferences regarding care modalities or provider characteristics.

Previously defined entry templates remain valid for compatibility. The Care Plan Act entry template provides a structured way to represent a snapshot of a dynamic, consensus-driven care plan that captures prioritized concerns, goals, and planned interventions. This entry reflects the current state of the care plan as managed in the source system and supports exchange across systems for coordinated, longitudinal care.

When additional context appears in the section narrative (section.text) but not in discrete entries, it is recommended to encapsulate the text in a Note Activity to support ingestion and preserve meaning.
"""

// !!! Caution - this templateId and extension is used in CarePlan invariant 1198-31044. If changed here, replace there.
* insert Section(#18776-5, Plan of care note, 2.16.840.1.113883.10.20.22.2.10, 2014-06-09)
* entry ..*
  * ^slicing.discriminator[0].type = #profile
  * ^slicing.discriminator[=].path = "observation"
  * ^slicing.discriminator[+].type = #profile
  * ^slicing.discriminator[=].path = "encounter"
  * ^slicing.discriminator[+].type = #profile
  * ^slicing.discriminator[=].path = "procedure"
  * ^slicing.discriminator[+].type = #profile
  * ^slicing.discriminator[=].path = "substanceAdministration"
  * ^slicing.discriminator[+].type = #profile
  * ^slicing.discriminator[=].path = "supply"
  * ^slicing.discriminator[+].type = #profile
  * ^slicing.discriminator[=].path = "act"
  * ^slicing.rules = #open
* entry contains
    carePlanAct 0..* and
    goal 0..* and
    handoffCommParticipants 0..* and
    instruction 0..* and
    nutrition 0..* and
    plannedEnc 0..* and
    plannedImmunization 0..* and
    plannedMed 0..* and
    plannedProc 0..* and
    plannedSupply 0..* and
	  notes 0..*
* entry[carePlanAct]
  * act 1..1
  * act only CarePlanAct
* entry[plannedEnc] ^comment = "MAY contain zero or more [0..*] entry (CONF:1098-8805) such that it"
  * encounter 1..1
  * encounter only PlannedEncounter
    * ^comment = "SHALL contain exactly one [1..1] Planned Encounter (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.4.40:2014-06-09) (CONF:1098-30472)."
* entry[plannedProc] ^comment = "MAY contain zero or more [0..*] entry (CONF:1098-8809) such that it"
  * procedure 1..1
  * procedure only PlannedProcedure
    * ^comment = "SHALL contain exactly one [1..1] Planned Procedure (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.4.41:2014-06-09) (CONF:1098-30474)."
* entry[plannedMed] ^comment = "MAY contain zero or more [0..*] entry (CONF:1098-8811) such that it"
  * substanceAdministration 1..1
  * substanceAdministration only PlannedMedicationActivity
    * insert USCDI([[MedicationOrder]])
    * ^comment = "SHALL contain exactly one [1..1] Planned Medication Activity (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.4.42:2014-06-09) (CONF:1098-30475)."
* entry[plannedSupply] ^comment = "MAY contain zero or more [0..*] entry (CONF:1098-8813) such that it"
  * supply 1..1
  * supply only PlannedSupply
    * ^comment = "SHALL contain exactly one [1..1] Planned Supply (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.4.43:2014-06-09) (CONF:1098-30476)."
* entry[instruction] ^comment = "MAY contain zero or more [0..*] entry (CONF:1098-14695) such that it"
  * observation 1..1
  * observation only InstructionObservation
* entry[handoffCommParticipants] ^comment = "MAY contain zero or more [0..*] entry (CONF:1098-29621) such that it"
  * act 1..1
  * act only HandoffCommunicationParticipants
    * ^comment = "SHALL contain exactly one [1..1] Handoff Communication Participants (identifier: urn:oid:2.16.840.1.113883.10.20.22.4.141) (CONF:1098-30868)."
* entry[nutrition] ^comment = "MAY contain zero or more [0..*] entry (CONF:1098-31841) such that it"
  * act 1..1
  * act only NutritionRecommendation
    * ^comment = "SHALL contain exactly one [1..1] Nutrition Recommendation (identifier: urn:oid:2.16.840.1.113883.10.20.22.4.130) (CONF:1098-31864)."
* entry[plannedImmunization] ^comment = "MAY contain zero or more [0..*] entry (CONF:1098-32353) such that it"
  * substanceAdministration 1..1
  * substanceAdministration only PlannedImmunizationActivity
    * ^comment = "SHALL contain exactly one [1..1] Planned Immunization Activity (identifier: urn:oid:2.16.840.1.113883.10.20.22.4.120) (CONF:1098-32354)."
* entry[goal] ^comment = "MAY contain zero or more [0..*] entry (CONF:1098-32887) such that it"
  * observation 1..1
  * observation only GoalObservation
    * ^comment = "SHALL contain exactly one [1..1] Goal Observation (identifier: urn:oid:2.16.840.1.113883.10.20.22.4.121) (CONF:1098-32888)."
* entry[notes] ^comment = "MAY contain zero or more [0..*] entry such that it"
  * act 1..1
  * act only NoteActivity
    * ^comment = "SHALL contain exactly one [1..1] Notes Activity (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.4.202,2016-11-01)."

