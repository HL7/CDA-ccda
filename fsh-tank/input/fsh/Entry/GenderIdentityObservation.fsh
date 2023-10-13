Profile: GenderIdentityObservation
Parent: SocialHistoryObservation
Id: GenderIdentityObservation
Title: "Gender Identity Observation"
Description: """This observation represents the gender identity of the patient, defined as:

> "Ones basic sense of being male, female, or other gender (for example, transgender or gender queer). Gender identity can be congruent or incongruent with ones sex assigned at birth based on the appearance of external genitalia. (Advancing Effective Communication, Cultural Competence, and Patient- and Family-Centered Care for the Lesbian, Gay, Bisexual, and Transgender (LGBT) CommunityA Field Guide, The Joint Commission (2011).)

This template follows the guidelines from the HL7 Gender Harmony project. This template is based on C-CDA Social History Observation template.

This observation is not appropriate for recording patient gender (administrativeGender) or birth sex."""

* insert LogicalModelTemplate(gender-identity-obs, 2.16.840.1.113883.10.20.34.3.45, 2023-05-01)
* ^status = #draft
* classCode 1..1
* classCode = #OBS (exactly)
  * ^comment = "SHALL contain exactly one [1..1] @classCode=\"OBS\" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:4537-1230)."
* moodCode 1..1
* moodCode = #EVN (exactly)
  * ^comment = "SHALL contain exactly one [1..1] @moodCode=\"EVN\" (CodeSystem: HL7ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:4537-1231)."
* code 1..1
  * ^comment = "SHALL contain exactly one [1..1] code (CONF:4537-1222)."
  * code 1..1
  * code = #76691-5
    * ^comment = "This code SHALL contain exactly one [1..1] @code=\"76691-5\" Gender identity (CONF:4537-1227)."
  * codeSystem 1..1
  * codeSystem = "2.16.840.1.113883.6.1"
    * ^comment = "This code SHALL contain exactly one [1..1] @codeSystem=\"2.16.840.1.113883.6.1\" (CodeSystem: LOINC urn:oid:2.16.840.1.113883.6.1 STATIC) (CONF:4537-1228)."
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
* value from $2.16.840.1.113762.1.4.1021.101 (required)
  * ^comment = "SHALL contain exactly one [1..1] value with @xsi:type=\"CD\", where the code SHALL be selected from ValueSet Gender Identity USCDI core urn:oid:2.16.840.1.113762.1.4.1021.101 DYNAMIC (CONF:4537-1223)."
  * nullFlavor 0..1
  * nullFlavor from $2.16.840.1.113762.1.4.1114.17 (preferred)
    * ^short = "To represent additional Gender Identities, set nullFlavor=\"OTH\". To represent \"choose not to disclose\", set nullFlavor=\"ASKU\"."
    * ^comment = "This value MAY contain zero or one [0..1] @nullFlavor, which SHOULD be selected from ValueSet Asked but Unknown and Other urn:oid:2.16.840.1.113762.1.4.1114.17 DYNAMIC (CONF:4537-1232)."