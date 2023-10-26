Profile: CareExperiencePreference
Parent: $Observation
Id: CareExperiencePreference
Title: "Care Experience Preference"
Description: """This Care Experience Preference template represents a person's care preferences during their care and treatment. Examples include, but are not limited to religious preferences, dislikes and fears, and thoughts and feelings to be shared. This templates does not represent actual order, but holds observations about wishes. These observations may inform the placement of future orders. While observation.code is encoded to support system queries, the answers represented at observation.value are likley to be text. Precondition.Criterion is recommended to represent the situations when a person would prefer the stated care experiences, such as during childbirth or interventional procedures.
This template may be used directly in any section, such as Care Plan Document Sections, Social History, or Advance Directives, and may be used inside any entry such as Procedure or Medication Activity."""

* insert LogicalModelTemplate(care-experience-pref, 2.16.840.1.113883.10.20.22.4.509, 2024-01-01)
* insert NarrativeLink

* classCode 1..1
* classCode = #OBS (exactly)
* moodCode 1..1
* moodCode = #INT (exactly)
* id 1..*
* code 1..1
  * insert CodedLoinc(95541-9,[[Care Experience Preference]])
* value 1..1
* value only CD or ED
  * ^short = "Most of the time, the value will be a string representing the person's words."
* obeys should-sdtcPrecondition2
* sdtcPrecondition2
  * obeys should-criterion