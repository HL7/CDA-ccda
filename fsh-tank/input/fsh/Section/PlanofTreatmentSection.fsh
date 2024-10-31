Profile: PlanofTreatmentSection
Parent: $Section
Id: PlanofTreatmentSection
Title: "Plan of Treatment Section"
Description: """This section, formerly known as "Plan of Care", contains data that define pending orders, interventions, encounters, services, and procedures for the patient. It is limited to prospective, unfulfilled, or incomplete orders and requests only. These are indicated by the @moodCode of the entries within this section. All active, incomplete, or pending orders, appointments, referrals, procedures, services, or any other pending event of clinical significance to the current care of the patient should be listed. 

This section may also contain information about ongoing care of the patient, clinical reminders, patient's values, beliefs, preferences, care expectations, and overarching care goals. 

Clinical reminders are placed here to provide prompts for disease prevention and management, patient safety, and healthcare quality improvements, including widely accepted performance measures. 

Values may include the importance of quality of life over longevity. These values are taken into account when prioritizing all problems and their treatments. 

Beliefs may include comfort with dying or the refusal of blood transfusions because of the patient's religious convictions. 

Preferences may include liquid medicines over tablets, or treatment via secure email instead of in person. 

Care expectations may range from being treated only by female clinicians, to expecting all calls to be returned within 24 hours. 

Overarching goals described in this section are not tied to a specific condition, problem, health concern, or intervention. Examples of overarching goals could be to minimize pain or dependence on others, or to walk a daughter down the aisle for her marriage. 

The plan may also indicate that patient education will be provided.

Wrapping the text of this section in a Note Activity will support ingestion.
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
    plannedEnc 0..* and
    plannedProc 0..* and
    plannedMed 0..* and
    plannedSupply 0..* and
    instruction 0..* and
    handoffCommParticipants 0..* and
    nutrition 0..* and
    plannedImmunization 0..* and
    goal 0..* and
	notes 0..*
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
    * insert USCDI([[MedicationOrder - SHALL contain exactly one [1..1] Planned Medication Activity (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.4.42:2014-06-09) (CONF:1098-30475).]])
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

