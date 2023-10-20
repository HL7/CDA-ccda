Profile: CareExperiencePreference
Parent: $Observation
Id: CareExperiencePreference
Title: "Care Experience Preference"
Description: """This Care Experience Preference template represents a person's care preferences during their care and treatment. Examples include, but are not limited to religious preferences, dislikes and fears, and thoughts and feelings to be shared. This templates does not represent actual order, but holds observations about wishes. These observations may inform the placement of future orders. While observation.code is encoded to support system queries, the answers represented at observation.value are likley to be text. Precondition.Criterion is recommended to represent the situations when a person would prefer the stated care experiences, such as during childbirth or interventional procedures."""

* insert LogicalModelTemplate(care-experience-pref, 2.16.840.1.113883.10.20.22.4.509, 2024-01-01)

* classCode 1..1
* classCode = #OBS (exactly)
* moodCode 1..1
* moodCode = #INT (exactly)
* id 1..*
* code 1..1
  * code = #95541-9 
  * codeSystem = "https://loinc.org"
  * displayName = "Care Experience Preference"
* value 1..1
* value only CD or ED
  * ^short = "This will most often by a string"
* obeys should-precondition
* precondition
  * obeys should-criterion