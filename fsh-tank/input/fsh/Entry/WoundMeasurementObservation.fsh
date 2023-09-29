Profile: WoundMeasurementObservation
Parent: $Observation
Id: WoundMeasurementObservation
Title: "Wound Measurement Observation"
Description: "This template represents the Wound Measurement Observations of wound width, depth and length."
* insert LogicalModelNA
* ^identifier.value = "urn:oid:2.16.840.1.113883.10.20.22.4.133"
* classCode 1..1
* classCode = #OBS (exactly)
  * ^comment = "SHALL contain exactly one [1..1] @classCode=\"OBS\" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:1098-29926)."
* moodCode 1..1
* moodCode = #EVN (exactly)
  * ^comment = "SHALL contain exactly one [1..1] @moodCode=\"EVN\" (CodeSystem: HL7ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:1098-29927)."
* templateId ^slicing.discriminator.type = #value
  * ^slicing.discriminator.path = "root"
  * ^slicing.rules = #open
* templateId contains primary 1..1
* templateId[primary] ^comment = "SHALL contain exactly one [1..1] templateId (CONF:1098-29928) such that it, SHALL not contain [0..0] extension."
  * root 1..1
  * root = "2.16.840.1.113883.10.20.22.4.133"
    * ^comment = "SHALL contain exactly one [1..1] @root=\"2.16.840.1.113883.10.20.22.4.133\" (CONF:1098-29929)."
  * extension 0..0
* id 1..*
  * ^comment = "SHALL contain at least one [1..*] id (CONF:1098-29930)."
* code 1..1
* code from $2.16.840.1.113883.1.11.20.2.5 (required)
  * ^comment = "SHALL contain exactly one [1..1] code, which SHALL be selected from ValueSet Wound Measurements urn:oid:2.16.840.1.113883.1.11.20.2.5 DYNAMIC (CONF:1098-29931)."
* statusCode 1..1
  * ^comment = "SHALL contain exactly one [1..1] statusCode (CONF:1098-29933)."
  * code 1..1
  * code = #completed (exactly)
    * ^comment = "This statusCode SHALL contain exactly one [1..1] @code=\"completed\" Completed (CodeSystem: HL7ActStatus urn:oid:2.16.840.1.113883.5.14 STATIC) (CONF:1098-29934)."
* effectiveTime 1..1
  * ^comment = "SHALL contain exactly one [1..1] effectiveTime (CONF:1098-29935)."
* value 1..1
* value only $PQ
  * ^comment = "SHALL contain exactly one [1..1] value with @xsi:type=\"PQ\" (CONF:1098-29936)."