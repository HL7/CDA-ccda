Profile: SmokingStatusMeaningfulUse
Parent: $Observation
Id: SmokingStatusMeaningfulUse
Title: "Smoking Status - Meaningful Use (Deprecated)"
Description: """This template represents the current smoking status of the patient as specified in Meaningful Use (MU) Stage 2 requirements. Historic smoking status observations as well as details about the smoking habit (e.g., how many per day) would be represented in the Tobacco Use template.

This template represents a "snapshot in time" observation, simply reflecting what the patient's current smoking status is at the time of the observation. As a result, the effectiveTime is constrained to a time stamp, and will approximately correspond with the author/time. Details regarding the time period when the patient is/was smoking would be recorded in the Tobacco Use template.

If the patient's current smoking status is unknown, the value element must be populated with SNOMED CT code 266927001 to communicate "Unknown if ever smoked" from the Current Smoking Status Value Set."""

* ^status = #retired
* insert LogicalModelTemplate(smoking-status, 2.16.840.1.113883.10.20.22.4.78, 2024-05-01)
* insert NarrativeLink

* classCode 1..1
* classCode = #OBS (exactly)
  * ^comment = "SHALL contain exactly one [1..1] @classCode=\"OBS\" Observation (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:1098-14806)."
* moodCode 1..1
* moodCode = #EVN (exactly)
  * ^comment = "SHALL contain exactly one [1..1] @moodCode=\"EVN\" Event (CodeSystem: HL7ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:1098-14807)."
* id 1..*
  * ^comment = "SHALL contain at least one [1..*] id (CONF:1098-32401)."
* code 1..1
  * ^comment = "SHALL contain exactly one [1..1] code (CONF:1098-19170)."
  * code 1..1
  * code = #72166-2
    * ^comment = "This code SHALL contain exactly one [1..1] @code=\"72166-2\" Tobacco smoking status NHIS (CONF:1098-31039)."
  * codeSystem 1..1
  * codeSystem = "2.16.840.1.113883.6.1"
    * ^comment = "This code SHALL contain exactly one [1..1] @codeSystem=\"2.16.840.1.113883.6.1\" (CodeSystem: LOINC urn:oid:2.16.840.1.113883.6.1) (CONF:1098-32157)."
* statusCode 1..1
  * ^comment = "SHALL contain exactly one [1..1] statusCode (CONF:1098-14809)."
  * insert BindAtCode($2.16.840.1.113762.1.4.1240.6, required)
* effectiveTime 1..1
  * ^short = "This template represents a \"snapshot in time\" observation, simply reflecting what the patient's current smoking status is at the time of the observation. As a result, the effectiveTime is constrained to just a time stamp, and will approximately correspond with the author/time."
  * ^comment = "SHALL contain exactly one [1..1] effectiveTime (CONF:1098-31928)."
  * insert IntervalValueOnly
* value 1..1
* value only $CD
  * insert USCDI([[Smoking Status: If the patient's current smoking status is unknown, @code **SHALL** contain '266927001' (Unknown if ever smoked) from ValueSet Current Smoking Status (2.16.840.1.113883.11.20.9.38 STATIC 2014-09-01) (CONF:1098-31019).]])
  * ^comment = "SHALL contain exactly one [1..1] value with @xsi:type=\"CD\" (CONF:1098-14810)."
  * code 0..1
  * code from $2.16.840.1.113883.11.20.9.38 (preferred)
    * ^comment = "This value SHALL contain exactly one [1..1] @code, which SHALL be selected from ValueSet Smoking Status urn:oid:2.16.840.1.113883.11.20.9.38 DYNAMIC (CONF:1098-14817)."
* obeys should-author
* author 0..*
* author only AuthorParticipation
  * ^comment = "SHOULD contain zero or more [0..*] Author Participation (identifier: urn:oid:2.16.840.1.113883.10.20.22.4.119) (CONF:1098-31148)." // man-should
