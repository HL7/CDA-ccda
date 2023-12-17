Profile: TreatmentInterventionPreference
Parent: $Observation
Id: TreatmentInterventionPreference
Title: "Treatment Intervention Preference"
Description: """This Treatment Intervention Preference template represents personal health goals, preferences, and priorities for medical treatments or interventions in the event of a future health scenario where a person is unable to make medical decisions because of a serious illness or injury. This does not represent actual orders or formal advance directives, but holds observations about wishes. These observations may inform the placement of future orders or creation of advance directives. While observation.code is encoded to support system queries, the answers represented at observation.value are likley to be text. Precondition.Criterion is required to represent the situation when a person would prefer the stated intervention preferences.
This template may be used directly in any section, such as Care Plan Document Sections, Social History, or Advance Directives, and may be used inside any entry such as Procedure or Medication Activity."""

* insert LogicalModelTemplate(treatment-intervention-pref, 2.16.840.1.113883.10.20.22.4.510, 2024-05-01)
* insert NarrativeLink

* classCode 1..1
* classCode = #OBS (exactly)
* moodCode 1..1
* moodCode = #INT (exactly)
* negationInd 0..0
* id 1..*
* code 1..1
  * insert CodedLoinc(75773-2,[[Goals, preferences, and priorities for medical treatment]])
* value 1..1
* value only CD or ED
  * ^short = "Most of the time, the value will be a string representing the person's words."
* sdtcPrecondition2 1..1
  * criterion 1..1
    * code 1..1
    * code from $2.16.840.1.113762.1.4.1115.23 (preferred)