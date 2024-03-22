Profile: SexObservation
Parent: $Observation
Id: SexObservation
Title: "Sex Observation"
Description: """This Sex Observation template is used to reflect the documentation of a person's sex. Systems choosing to record the source of information should include the Provenance participation.

USCDI v3 includes a data element for sex, intended to support the exchange of a sex value that is not characterized as sex assigned at birth or birth sex. This version of the C-CDA companion guide supports USCDI Sex data element. Sex assigned at birth or birth sex must be recorded using the Birth Sex Observation which falls under the broader category of a 'Sex observation'. A Data Absent Reason (DAR) code value of 'asked-declined' may be used when a person has chosen not to disclose their sex.

Future versions of the template may be informed by the content of the HL7 Cross Paradigm IG: Gender Harmony - Sex and Gender Representation, which may include additional guidance on this Sex observation and the relationship to administrative gender (administrativeGenderCode).

It is recommended systems include the Sex Observation in the Social History section."""
* ^meta.versionId = "4"
* ^meta.lastUpdated = "2023-07-11T23:41:53.603Z"

* insert LogicalModelTemplate(sex-obs, 2.16.840.1.113883.10.20.22.4.507, 2023-07-01)
* insert NarrativeLink

* ^status = #draft
* classCode 1..1
* classCode = #OBS (exactly)
  * ^comment = "SHALL contain exactly one [1..1] @classCode=\"OBS\" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:4537-33088)."
* moodCode 1..1
* moodCode = #EVN (exactly)
  * ^comment = "SHALL contain exactly one [1..1] @moodCode=\"EVN\" (CodeSystem: HL7ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:4537-33089)."
* code 1..1
  * insert CodedLoinc(46098-0, Sex)
  * ^comment = "SHALL contain exactly one [1..1] code (CONF:4537-33079)."
* statusCode 1..1
  * ^comment = "SHALL contain exactly one [1..1] statusCode (CONF:4537-33077)."
  * code 1..1
  * code = #completed (exactly)
    * ^comment = "This statusCode SHALL contain exactly one [1..1] @code=\"completed\" Completed (CodeSystem: HL7ActStatus urn:oid:2.16.840.1.113883.5.14 STATIC) (CONF:4537-33082)."
* effectiveTime 1..1
  * ^comment = "SHALL contain exactly one [1..1] effectiveTime (CONF:4537-33081)."
  * low 0..0
    * ^comment = "This effectiveTime SHALL NOT contain exactly one [1..1] low (CONF:4537-33090)."
  * width 0..0
    * ^comment = "This effectiveTime SHALL NOT contain exactly one [1..1] width (CONF:4537-33091)."
  * high 0..0
    * ^comment = "This effectiveTime SHALL NOT contain exactly one [1..1] high (CONF:4537-33092)."
  * center 0..0
    * ^comment = "This effectiveTime SHALL NOT contain exactly one [1..1] center (CONF:4537-33093)."
* value 1..1
* value only $CD
  * ^comment = "SHALL contain exactly one [1..1] value with @xsi:type=\"CD\"(CONF:4537-33080)."
  * insert BindAtCode($2.16.840.1.113762.1.4.1240.3, preferred)