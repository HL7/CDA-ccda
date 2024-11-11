Profile: SexualOrientationObservation
Parent: $Observation
Id: SexualOrientationObservation
Title: "Sexual Orientation Observation"
Description: """This observation represents the sexual orientation of the patient. Defined as:

A persons identification of their emotional, romantic, sexual, or affectional attraction to another person.

This template was informed by the HL7 Gender Harmony project.

This observation is not appropriate for recording patient gender (administrativeGender), Gender Identity (Gender Identity Observation), or birth sex (Birth Sex Observation)."""

* insert LogicalModelTemplate(sexual-orientation-obs, 2.16.840.1.113883.10.20.22.4.501, 2023-05-01)
* insert NarrativeLink
* ^status = #draft
* classCode 1..1
* classCode = #OBS (exactly)
  * ^comment = "SHALL contain exactly one [1..1] @classCode=\"OBS\" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:4537-193)."
* moodCode 1..1
* moodCode = #EVN (exactly)
  * ^comment = "SHALL contain exactly one [1..1] @moodCode=\"EVN\" (CodeSystem: HL7ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:4537-194)."
* id 1..*
  * ^comment = "SHALL contain at least one [1..*] id."
* code 1..1
  * insert CodedLoinc(76690-7, [[Sexual Orientation]])
* text 0..1
* statusCode 1..1
  * ^comment = "SHALL contain exactly one [1..1] statusCode (CONF:4537-32881)."
  * code 1..1
  * code = #completed (exactly)
    * ^comment = "This statusCode SHALL contain exactly one [1..1] @code=\"completed\" (CodeSystem: HL7ActStatus urn:oid:2.16.840.1.113883.5.14) (CONF:4537-33073)."
* effectiveTime 1..1
  * ^short = "The effectiveTime represents the  relevant time of the observation. A patient's \"sexual orientation\" may change and using effectiveTime/low and effectiveTime/high defines the time during which the patient had identified their emotional, romantic, sexual, or affectional attraction to another person."
  * ^comment = "SHALL contain exactly one [1..1] effectiveTime (CONF:4537-33072)."
  * low 1..1
    * ^comment = "This effectiveTime SHALL contain exactly one [1..1] low (CONF:4537-33074)."
  * high 0..1
    * ^comment = "This effectiveTime MAY contain zero or one [0..1] high (CONF:4537-33075)."
* value 1..1
* value only $CD
  * insert BindAtCode($2.16.840.1.113762.1.4.1240.11, required)
