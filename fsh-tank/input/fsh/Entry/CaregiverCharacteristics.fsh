Profile: CaregiverCharacteristics
Parent: $Observation
Id: CaregiverCharacteristics
Title: "Caregiver Characteristics"
Description: """This clinical statement represents a caregiver's willingness to provide care and the abilities of that caregiver to provide assistance to a patient in relation to a specific need.
"""

* insert LogicalModelTemplateRootOnly(caregiver-characteristics, 2.16.840.1.113883.10.20.22.4.72)
* insert NarrativeLink

* classCode 1..1
* classCode = #OBS (exactly)
  * ^comment = "SHALL contain exactly one [1..1] @classCode=\"OBS\" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:81-14219)."
* moodCode 1..1
* moodCode = #EVN (exactly)
  * ^comment = "SHALL contain exactly one [1..1] @moodCode=\"EVN\" (CodeSystem: HL7ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:81-14220)."
* id 1..*
  * ^comment = "SHALL contain at least one [1..*] id (CONF:81-14223)."
* code 1..1
  * ^short = "This code MAY be drawn from LOINC (CodeSystem: LOINC 2.16.840.1.113883.6.1)  or MAY be bound to ASSERTION (CodeSystem: ActCode 2.16.840.1.113883.5.4 STATIC) (CONF:81-26513)."
  * ^comment = "SHALL contain exactly one [1..1] code (CONF:81-14230)."
* statusCode 1..1
  * ^comment = "SHALL contain exactly one [1..1] statusCode (CONF:81-14233)."
  * code 1..1
  * code = #completed (exactly)
    * ^comment = "This statusCode SHALL contain exactly one [1..1] @code=\"completed\" Completed (CodeSystem: HL7ActStatus urn:oid:2.16.840.1.113883.5.14 STATIC) (CONF:81-19090)."
* value 1..1
* value only $CD
  * obeys 81-14600
  * ^comment = "SHALL contain exactly one [1..1] value with @xsi:type=\"CD\" (CONF:81-14599)."
* participant 1..*
  * ^comment = "SHALL contain at least one [1..*] participant (CONF:81-14227)."
  * typeCode 1..1
  * typeCode = #IND (exactly)
    * ^comment = "Such participants SHALL contain exactly one [1..1] @typeCode=\"IND\" (CONF:81-26451)."
  * time 0..1
    * ^comment = "Such participants MAY contain zero or one [0..1] time (CONF:81-14830)."
    * low 1..1
      * ^comment = "The time, if present, SHALL contain exactly one [1..1] low (CONF:81-14831)."
    * high 0..1
      * ^comment = "The time, if present, MAY contain zero or one [0..1] high (CONF:81-14832)."
  * participantRole 1..1
    * ^comment = "Such participants SHALL contain exactly one [1..1] participantRole (CONF:81-14228)."
    * classCode 1..1
    * classCode = #CAREGIVER (exactly)
      * ^comment = "This participantRole SHALL contain exactly one [1..1] @classCode=\"CAREGIVER\" (CONF:81-14229)."

Invariant: 81-14600
Description: "The code **SHALL** be selected from LOINC (codeSystem: 2.16.840.1.113883.6.1) or SNOMED CT (CodeSystem: 2.16.840.1.113883.6.96) (CONF:81-14600)."
Severity: #error
Expression: "codeSystem = '2.16.840.1.113883.6.1' or codeSystem = '2.16.840.1.113883.6.96'"