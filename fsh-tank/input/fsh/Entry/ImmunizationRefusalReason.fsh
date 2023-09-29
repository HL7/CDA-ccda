Profile: ImmunizationRefusalReason
Parent: $Observation
Id: ImmunizationRefusalReason
Title: "Immunization Refusal Reason"
Description: "The Immunization Refusal Reason documents the rationale for the patient declining an immunization."
* insert LogicalModelNA
* ^identifier.value = "urn:oid:2.16.840.1.113883.10.20.22.4.53"
* classCode 1..1
* classCode = #OBS (exactly)
  * ^comment = "SHALL contain exactly one [1..1] @classCode=\"OBS\" Observation (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:81-8991)."
* moodCode 1..1
* moodCode = #EVN (exactly)
  * ^comment = "SHALL contain exactly one [1..1] @moodCode=\"EVN\" Event (CodeSystem: HL7ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:81-8992)."
* templateId ^slicing.discriminator.type = #value
  * ^slicing.discriminator.path = "root"
  * ^slicing.rules = #open
* templateId contains primary 1..1
* templateId[primary] ^comment = "SHALL contain exactly one [1..1] templateId (CONF:81-8993) such that it, SHALL not contain [0..0] extension."
  * root 1..1
  * root = "2.16.840.1.113883.10.20.22.4.53"
    * ^comment = "SHALL contain exactly one [1..1] @root=\"2.16.840.1.113883.10.20.22.4.53\" (CONF:81-10500)."
  * extension 0..0
* id 1..*
  * ^comment = "SHALL contain at least one [1..*] id (CONF:81-8994)."
* code 1..1
* code from $2.16.840.1.113883.1.11.19717 (required)
  * ^comment = "SHALL contain exactly one [1..1] code, which SHALL be selected from ValueSet No Immunization Reason urn:oid:2.16.840.1.113883.1.11.19717 DYNAMIC (CONF:81-8995)."
* statusCode 1..1
  * ^comment = "SHALL contain exactly one [1..1] statusCode (CONF:81-8996)."
  * code 1..1
  * code = #completed (exactly)
    * ^comment = "This statusCode SHALL contain exactly one [1..1] @code=\"completed\" Completed (CodeSystem: HL7ActStatus urn:oid:2.16.840.1.113883.5.14 STATIC) (CONF:81-19104)."