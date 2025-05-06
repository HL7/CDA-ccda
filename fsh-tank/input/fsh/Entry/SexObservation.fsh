Profile: SexObservation
Parent: $Observation
Id: SexObservation
Title: "Sex Observation"
Description: """USCDI includes a data element for Sex, intended to support the exchange of a recorded sex value. This observation template aligns with the USCDI definition of Sex: "Documentation of a specific instance of sex."
It enables systems to share the documented sex value as recorded in a particular context. If the source of the information is captured, it should be represented using Provenance participation.
It is recommended that systems include the Sex Observation in the Social History section; however, the template may be used wherever it is appropriate to support the sending system’s workflow."""

* insert LogicalModelTemplate(sex-obs, 2.16.840.1.113883.10.20.22.4.507, 2023-06-28)
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
  * insert IntervalValueOnly
* value 1..1
* value only $CD
  * ^comment = "SHALL contain exactly one [1..1] value with @xsi:type=\"CD\"(CONF:4537-33080)."
  * insert BindAtCode($2.16.840.1.113762.1.4.1021.121, preferred)