Profile: CareTeamMemberScheduleObservation
Parent: $Observation
Id: CareTeamMemberScheduleObservation
Title: "Care Team Member Schedule Observation"
Description: """This template represents the schedule of when the care team member participates on the care team. Examples include: 
 An oncologist who participated on the care team for one week.
 A primary care provider who participated on a care team during one summer (e.g. in the case of patients who are snow-birds).
 A crisis team who participated on the care team for the patient during an inpatient stay (e.g. in the case of children with special needs).
"""
* ^meta.versionId = "4"
* ^meta.lastUpdated = "2023-07-11T23:41:50.902Z"

* insert LogicalModelTemplate(care-team-member-schedule-obs, 2.16.840.1.113883.10.20.22.4.500.3, 2022-06-01)

* classCode 1..1
* classCode = #OBS (exactly)
  * ^comment = "SHALL contain exactly one [1..1] @classCode=\"OBS\" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:4515-33026)."
* moodCode 1..1
* moodCode = #EVN (exactly)
  * ^comment = "SHALL contain exactly one [1..1] @moodCode=\"EVN\" (CodeSystem: HL7ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:4515-33027)."
* code 1..1
  * ^comment = "SHALL contain exactly one [1..1] code (CONF:4515-13)."
  * code 1..1
  * code = #57203-2
    * ^comment = "This code SHALL contain exactly one [1..1] @code=\"57203-2\" Episode Timing [CMS Assessment] (CONF:4515-33023)."
  * codeSystem 1..1
  * codeSystem = "2.16.840.1.113883.6.1"
    * ^comment = "This code SHALL contain exactly one [1..1] @codeSystem=\"2.16.840.1.113883.6.1\" LOINC (CONF:4515-33024)."
* text 1..1
  * ^comment = "SHALL contain exactly one [1..1] text (CONF:4515-33020)."
  * reference 1..1
    * ^comment = "This text SHALL contain exactly one [1..1] reference (CONF:4515-16)."
    * value 1..1
      * ^comment = "This reference SHALL contain exactly one [1..1] @value (CONF:4515-33025)."
* statusCode 1..1
  * ^comment = "SHALL contain exactly one [1..1] statusCode (CONF:4515-33018)."
  * code 1..1
  * code = #completed (exactly)
    * ^comment = "This statusCode SHALL contain exactly one [1..1] @code=\"completed\" Completed (CodeSystem: HL7ActStatus urn:oid:2.16.840.1.113883.5.14 STATIC) (CONF:4515-33021)."
* value 1..1
* value only $IVL-TS
  * ^short = "Observation/value Interval Time Stamp holds the time range the Care Team Member participated on the Care Team of the patient."
  * ^comment = "SHALL contain exactly one [1..1] value with @xsi:type=\"IVL_TS\" (CONF:4515-14)."
  * low 1..1
    * ^comment = "This value SHALL contain exactly one [1..1] low (CONF:4515-33030)."
  * obeys should-high
  * high 0..1
    * ^comment = "This value SHOULD contain zero or one [0..1] high (CONF:4515-33029)." // auto-should