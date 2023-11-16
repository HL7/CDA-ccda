Profile: PregnancyIntentionInNextYear
Parent: $Observation
Id: PregnancyIntentionInNextYear
Title: "Pregnancy Intention in Next Year"
Description: """This template represents a patient's reported intention or desire in the next year to either become pregnant or prevent a future pregnancy. The effectiveTime.low represents the date the intention was recorded and the effectiveTime.high represents the date a year from the recorded date.
"""
* ^meta.versionId = "4"
* ^meta.lastUpdated = "2023-07-11T23:41:36.964Z"

* insert LogicalModelTemplate(pregnancy-intention-next-year, 2.16.840.1.113883.10.20.22.4.281, 2023-05-01)
* insert NarrativeLink

* ^status = #draft
* classCode 1..1
* classCode = #OBS (exactly)
  * ^comment = "SHALL contain exactly one [1..1] @classCode=\"OBS\" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:4537-26557)."
* moodCode 1..1
* moodCode = #INT (exactly)
  * ^comment = "SHALL contain exactly one [1..1] @moodCode=\"INT\" Intent (CodeSystem: HL7ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:4537-26558)."
* id 1..*
  * ^comment = "SHALL contain at least one [1..*] id (CONF:4537-26981)."
* code 1..1
  * ^comment = "SHALL contain exactly one [1..1] code (CONF:4537-26550)."
  * code 1..1
  * code = #86645-9
    * ^comment = "This code SHALL contain exactly one [1..1] @code=\"86645-9\" Future pregnancy intention Reported (CONF:4537-26554)."
  * codeSystem 1..1
  * codeSystem = "2.16.840.1.113883.6.1"
    * ^comment = "This code SHALL contain exactly one [1..1] @codeSystem=\"2.16.840.1.113883.6.1\" (CodeSystem: LOINC urn:oid:2.16.840.1.113883.6.1) (CONF:4537-26555)."
* statusCode 1..1
  * ^comment = "SHALL contain exactly one [1..1] statusCode (CONF:4537-26551)."
  * code 1..1
  * code = #completed (exactly)
    * ^comment = "This statusCode SHALL contain exactly one [1..1] @code=\"completed\" Completed (CodeSystem: HL7ActStatus urn:oid:2.16.840.1.113883.5.14) (CONF:4537-26556)."
* effectiveTime 1..1
  * ^comment = "SHALL contain exactly one [1..1] effectiveTime (CONF:4537-26560)."
  * low 1..1
    * ^short = "Recorded date"
    * ^comment = "This effectiveTime SHALL contain exactly one [1..1] low (CONF:4537-26821)."
  * high 1..1
    * ^short = "Should be 1 year from effectiveTime/low"
    * ^comment = "This effectiveTime SHALL contain exactly one [1..1] high (CONF:4537-26822)."
* value 1..1
* value only $CD
* value from $2.16.840.1.113762.1.4.1166.22 (required)
  * ^comment = "SHALL contain exactly one [1..1] value with @xsi:type=\"CD\", where the code SHALL be selected from ValueSet Pregnancy Intention urn:oid:2.16.840.1.113762.1.4.1166.22 DYNAMIC (CONF:4537-26559)."