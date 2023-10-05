Profile: CareTeamTypeObservation
Parent: $Observation
Id: CareTeamTypeObservation
Title: "Care Team Type Observation"
Description: """This template is used to express the care team type. A care team can have multiple care team types. Examples include but are not limited to: 
* Condition focused, longitudinal care team
* Event focused, Home & Community Based Services care team
* Condition focused, clinical research care team 
* Public health focused, Longitudinal care-coordination care team

"""
* ^meta.versionId = "4"
* ^meta.lastUpdated = "2023-07-11T23:41:50.575Z"

* insert LogicalModelTemplate(careTeamTypeObservation, 2.16.840.1.113883.10.20.22.4.500.2, 2019-07-01)

* classCode 1..1
* classCode = #OBS (exactly)
  * ^comment = "SHALL contain exactly one [1..1] @classCode=\"OBS\" Observation (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:4435-101)."
* moodCode 1..1
* moodCode = #EVN (exactly)
  * ^comment = "SHALL contain exactly one [1..1] @moodCode=\"EVN\" Event (CodeSystem: HL7ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:4435-102)."
* code 1..1
  * ^comment = "SHALL contain exactly one [1..1] code (CONF:4435-97)."
  * code 1..1
  * code = #86744-0
    * ^comment = "This code SHALL contain exactly one [1..1] @code=\"86744-0\" Care Team (CONF:4435-103)."
  * codeSystem 1..1
  * codeSystem = "2.16.840.1.113883.6.1"
    * ^comment = "This code SHALL contain exactly one [1..1] @codeSystem=\"2.16.840.1.113883.6.1\" LOINC (CodeSystem: LOINC urn:oid:2.16.840.1.113883.6.1) (CONF:4435-104)."
* statusCode 1..1
  * ^comment = "SHALL contain exactly one [1..1] statusCode (CONF:4435-100)."
  * code 1..1
  * code = #completed (exactly)
    * ^comment = "This statusCode SHALL contain exactly one [1..1] @code=\"completed\" Completed (CodeSystem: HL7ActStatus urn:oid:2.16.840.1.113883.5.14 STATIC) (CONF:4435-107)."
* value 1..1
* value only $CD
  * ^short = "value"
  //"<sliceName value=\"value1\"/>"
  * ^comment = "SHALL contain exactly one [1..1] value with @xsi:type=\"CD\" (CONF:4435-98) such that it"
  * code 1..1
  * code from $2.16.840.1.113883.4.642.3.155 (required)
    * ^comment = "SHALL contain exactly one [1..1] @code, which SHALL be selected from ValueSet Care Team Category urn:oid:2.16.840.1.113883.4.642.3.155 DYNAMIC (CONF:4435-109)."