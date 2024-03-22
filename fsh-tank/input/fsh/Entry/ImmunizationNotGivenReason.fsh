Profile: ImmunizationNotGivenReason
Parent: $Observation
Id: ImmunizationNotGivenReason
Title: "Immunization Not Given Reason"
Description: "The Immunization Not Given Reason documents the rationale for the patient declining an immunization."

* insert LogicalModelTemplate(imm-not-given-reason, 2.16.840.1.113883.10.20.22.4.53, 2024-05-01)
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
  * insert CodedLoinc(71798-3, [[Reason Immunization Not Given]])
* statusCode 1..1
  * ^comment = "SHALL contain exactly one [1..1] statusCode (CONF:81-8996)."
  * code 1..1
  * code = #completed (exactly)
    * ^comment = "This statusCode SHALL contain exactly one [1..1] @code=\"completed\" Completed (CodeSystem: HL7ActStatus urn:oid:2.16.840.1.113883.5.14 STATIC) (CONF:81-19104)."
* value 1..1
* value only $CD
* value from $2.16.840.1.113883.1.11.19717 (required)
