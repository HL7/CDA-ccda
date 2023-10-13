Profile: BirthSexObservation
Parent: $Observation
Id: BirthSexObservation
Title: "Birth Sex Observation"
Description: """This observation represents the sex of the patient at birth. It is the sex that is entered on the person's birth certificate at time of birth.

This observation is not appropriate for recording patient gender (administrativeGender).

This observation is not appropriate for recording Gender Identity (GI).

It is recommended systems include the Birth Sex observation in the Social History section."""
* ^meta.versionId = "4"
* ^meta.lastUpdated = "2023-07-11T23:41:33.961Z"

* insert LogicalModelTemplate(birth-sex-obs, 2.16.840.1.113883.10.20.22.4.200, 2023-05-01)

* ^status = #draft
* classCode 1..1
* classCode = #OBS (exactly)
  * ^comment = "SHALL contain exactly one [1..1] @classCode=\"OBS\" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:4537-33041)."
* moodCode 1..1
* moodCode = #EVN (exactly)
  * ^comment = "SHALL contain exactly one [1..1] @moodCode=\"EVN\" (CodeSystem: HL7ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:4537-33042)."
* code 1..1
  * ^comment = "SHALL contain exactly one [1..1] code (CONF:4537-33033)."
  * code 1..1
  * code = #76689-9
    * ^comment = "This code SHALL contain exactly one [1..1] @code=\"76689-9\" Sex Assigned At Birth (CONF:4537-33038)."
  * codeSystem 1..1
  * codeSystem = "2.16.840.1.113883.6.1"
    * ^comment = "This code SHALL contain exactly one [1..1] @codeSystem=\"2.16.840.1.113883.6.1\" (CodeSystem: LOINC urn:oid:2.16.840.1.113883.6.1 STATIC) (CONF:4537-33039)."
* statusCode 1..1
  * ^comment = "SHALL contain exactly one [1..1] statusCode (CONF:4537-33031)."
  * code 1..1
  * code = #completed (exactly)
    * ^comment = "This statusCode SHALL contain exactly one [1..1] @code=\"completed\" Completed (CodeSystem: HL7ActStatus urn:oid:2.16.840.1.113883.5.14 STATIC) (CONF:4537-33035)."
* effectiveTime 1..1
  * ^short = "Note: This template represents a \"snapshot in time\" observation, simply reflecting the patient's sex at the time of the observation. As a result, the effectiveTime is constrained to just a time stamp. Since this represents Birth Sex it SHALL match the birthTime."
  * ^comment = "SHALL contain exactly one [1..1] effectiveTime (CONF:4537-33043)."
  * low 1..1
    * ^comment = "This effectiveTime SHALL NOT contain exactly one [1..1] low (CONF:4537-33044)."
  * width 1..1
    * ^comment = "This effectiveTime SHALL NOT contain exactly one [1..1] width (CONF:4537-33045)."
  * high 1..1
    * ^comment = "This effectiveTime SHALL NOT contain exactly one [1..1] high (CONF:4537-33046)."
  * center 1..1
    * ^comment = "This effectiveTime SHALL NOT contain exactly one [1..1] center (CONF:4537-33047)."
* value 1..1
* value only $CD
* value from $2.16.840.1.113762.1.4.1021.24 (required)
