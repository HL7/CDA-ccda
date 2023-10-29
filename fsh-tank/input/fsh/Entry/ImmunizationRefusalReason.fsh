Profile: ImmunizationRefusalReason
Parent: $Observation
Id: ImmunizationRefusalReason
Title: "Immunization Refusal Reason"
Description: "The Immunization Refusal Reason documents the rationale for the patient declining an immunization."

* insert LogicalModelTemplateRootOnly(imm-refuse-reason, 2.16.840.1.113883.10.20.22.4.53)
* insert NarrativeLink

* classCode 1..1
* classCode = #OBS (exactly)
  * ^comment = "SHALL contain exactly one [1..1] @classCode=\"OBS\" Observation (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:81-8991)."
* moodCode 1..1
* moodCode = #EVN (exactly)
  * ^comment = "SHALL contain exactly one [1..1] @moodCode=\"EVN\" Event (CodeSystem: HL7ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:81-8992)."
* id 1..*
  * ^comment = "SHALL contain at least one [1..*] id (CONF:81-8994)."
* code 1..1
* code from $2.16.840.1.113883.1.11.19717 (required)
  * ^comment = "SHALL contain exactly one [1..1] code, which SHALL be selected from ValueSet No Immunization Reason urn:oid:2.16.840.1.113883.1.11.19717 DYNAMIC (CONF:81-8995)."
* statusCode 1..1
  * ^comment = "SHALL contain exactly one [1..1] statusCode (CONF:81-8996)."
  * code 1..1
  * code from $2.16.840.1.113762.1.4.1240.6 (required)
  * ^comment = "This statusCode SHALL contain exactly one [1..1] @code, which SHALL be selected from ValueSet Completed or Nullified Act Status urn:oid:2.16.840.1.113762.1.4.1240.6."