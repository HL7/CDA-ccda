Profile: VitalSignObservation
Parent: $Observation
Id: VitalSignObservation
Title: "Vital Sign Observation"
Description: """This template represents measurement of common vital signs. Vital signs are represented with additional vocabulary constraints for type of vital sign and unit of measure.

The following is a list of recommended units for common types of vital sign measurements:

| Name | Unit |
| -------- | ------- |
| PulseOx | % |
| Height/Head Circumf | cm |
| Weight | kg |
| Temp | Cel |
| BP | mm[Hg] |
| Pulse/Resp Rate | /min |
| BMI | kg/m2 |
| BSA | m2 |
| inhaled oxygen concentration | % |

"""
* insert LogicalModelNA
* ^identifier.value = "urn:hl7ii:2.16.840.1.113883.10.20.22.4.27:2014-06-09"
* ^version = "2014-06-09"
* classCode 1..1
* classCode = #OBS (exactly)
  * ^comment = "SHALL contain exactly one [1..1] @classCode=\"OBS\" Observation (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:1098-7297)."
* moodCode 1..1
* moodCode = #EVN (exactly)
  * ^comment = "SHALL contain exactly one [1..1] @moodCode=\"EVN\" Event (CodeSystem: HL7ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:1098-7298)."
* templateId ^slicing.discriminator[0].type = #value
  * ^slicing.discriminator[=].path = "extension"
  * ^slicing.discriminator[+].type = #value
  * ^slicing.discriminator[=].path = "root"
  * ^slicing.rules = #open
* templateId contains primary 1..1
* templateId[primary] ^comment = "SHALL contain exactly one [1..1] templateId (CONF:1098-7299) such that it"
  * root 1..1
  * root = "2.16.840.1.113883.10.20.22.4.27"
    * ^comment = "SHALL contain exactly one [1..1] @root=\"2.16.840.1.113883.10.20.22.4.27\" (CONF:1098-10527)."
  * extension 1..1
  * extension = "2014-06-09"
    * ^comment = "SHALL contain exactly one [1..1] @extension=\"2014-06-09\" (CONF:1098-32574)."
* id 1..*
  * ^comment = "SHALL contain at least one [1..*] id (CONF:1098-7300)."
* code 1..1
  * ^comment = "SHALL contain exactly one [1..1] code (CONF:1098-7301)."
  * code 0..1
  * code from $2.16.840.1.113883.3.88.12.80.62 (preferred)
    * ^comment = "This code SHOULD contain zero or one [0..1] @code, which SHOULD be selected from ValueSet Vital Sign Result Type urn:oid:2.16.840.1.113883.3.88.12.80.62 DYNAMIC (CONF:1098-32934)."
* statusCode 1..1
  * ^comment = "SHALL contain exactly one [1..1] statusCode (CONF:1098-7303)."
  * code 1..1
  * code = #completed (exactly)
    * ^comment = "This statusCode SHALL contain exactly one [1..1] @code=\"completed\" Completed (CodeSystem: HL7ActStatus urn:oid:2.16.840.1.113883.5.14 STATIC) (CONF:1098-19119)."
* effectiveTime 1..1
  * ^comment = "SHALL contain exactly one [1..1] effectiveTime (CONF:1098-7304)."
* value 1..1
* value only $PQ
  * ^comment = "SHALL contain exactly one [1..1] value with @xsi:type=\"PQ\" (CONF:1098-7305)."
  * unit 1..1
  * unit from UnitsOfMeasureCaseSensitive (required)
    * ^comment = "This value SHALL contain exactly one [1..1] @unit, which SHALL be selected from ValueSet UnitsOfMeasureCaseSensitive urn:oid:2.16.840.1.113883.1.11.12839 DYNAMIC (CONF:1098-31579).  Use a default of 1 for @unit when @nullFlavor is present."
* interpretationCode 0..1
  * ^comment = "MAY contain zero or one [0..1] interpretationCode (CONF:1098-7307)."
  * code 1..1
  * code from $2.16.840.1.113883.1.11.78 (required)
    * ^comment = "The interpretationCode, if present, SHALL contain exactly one [1..1] @code, which SHALL be selected from ValueSet Observation Interpretation (HL7) urn:oid:2.16.840.1.113883.1.11.78 DYNAMIC (CONF:1098-32886)."
* methodCode 0..1
  * ^comment = "MAY contain zero or one [0..1] methodCode (CONF:1098-7308)."
* targetSiteCode 0..1
  * ^comment = "MAY contain zero or one [0..1] targetSiteCode (CONF:1098-7309)."
* author 0..*
* author only AuthorParticipation
  * ^comment = "SHOULD contain zero or more [0..*] Author Participation (identifier: urn:oid:2.16.840.1.113883.10.20.22.4.119) (CONF:1098-7310)."