Profile: GenderIdentityObservation
Parent: $Observation
Id: GenderIdentityObservation
Title: "Gender Identity Observation"
Description: """This observation represents the gender identity of the patient. Defined as:

One's basic sense of being male, female, or other gender (for example, transgender or gender queer). Gender identity can be congruent or incongruent with one's sex assigned at birth based on the appearance of external genitalia. (Advancing Effective Communication, Cultural Competence, and Patient- and Family-Centered Care for the Lesbian, Gay, Bisexual, and Transgender (LGBT) CommunityA Field Guide, The Joint Commission (2011).)

This template follows the guidelines from the HL7 Gender Harmony project.

This observation is not appropriate for recording patient gender (administrativeGender) or birth sex."""

* insert LogicalModelTemplate(gender-identity-obs, 2.16.840.1.113883.10.20.34.3.45, 2023-05-01)
* insert NarrativeLink
* ^status = #draft
* classCode 1..1
* classCode = #OBS (exactly)
  * ^comment = "SHALL contain exactly one [1..1] @classCode=\"OBS\" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:4537-1230)."
* moodCode 1..1
* moodCode = #EVN (exactly)
  * ^comment = "SHALL contain exactly one [1..1] @moodCode=\"EVN\" (CodeSystem: HL7ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:4537-1231)."
* id 1..*
  * ^comment = "SHALL contain at least one [1..*] id."
* code 1..1
  * insert CodedLoinc(76691-5, [[Gender Identity]])
* text 0..1
* statusCode 1..1
  * ^comment = "SHALL contain exactly one [1..1] statusCode (CONF:4537-33067)."
  * code 1..1
  * code = #completed (exactly)
    * ^comment = "This statusCode SHALL contain exactly one [1..1] @code=\"completed\" (CodeSystem: HL7ActStatus urn:oid:2.16.840.1.113883.5.14) (CONF:4537-33069)."
* effectiveTime 1..1
  * ^comment = "SHALL contain exactly one [1..1] effectiveTime (CONF:4537-33068)."
  * ^short = "The effectiveTime represents the relevant time of the observation. A patient's \"gender identity\" may change and using effectiveTime/low and effectiveTime/high defines the time during which the patient had identified as specified."
  * low 1..1
    * ^comment = "This effectiveTime SHALL contain exactly one [1..1] low (CONF:4537-33070)."
  * high 0..1
    * ^comment = "This effectiveTime MAY contain zero or one [0..1] high (CONF:4537-33071)."
* value 1..1
* value only $CD
  * insert BindAtCode($2.16.840.1.113762.1.4.1021.32, required)
