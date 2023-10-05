Profile: SectionTimeRangeObservation
Parent: $Observation
Id: SectionTimeRangeObservation
Title: "Section Time Range Observation"
Description: "This observation represents the date and time range of the information contained in a section. It is an optional entry and may be used in any section."
* ^meta.versionId = "5"
* ^meta.lastUpdated = "2023-07-11T23:41:34.303Z"

* insert LogicalModelTemplate(sectionTimeRangeObservation, 2.16.840.1.113883.10.20.22.4.201, 2016-06-01)

* classCode 1..1
* classCode = #OBS (exactly)
  * ^comment = "SHALL contain exactly one [1..1] @classCode=\"OBS\" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:3250-32960)."
* moodCode 1..1
* moodCode = #EVN (exactly)
  * ^comment = "SHALL contain exactly one [1..1] @moodCode=\"EVN\" (CodeSystem: HL7ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:3250-32961)."
* code 1..1
  * ^comment = "SHALL contain exactly one [1..1] code (CONF:3250-32952)."
  * code 1..1
  * code = #82607-3
    * ^comment = "This code SHALL contain exactly one [1..1] @code=\"82607-3\" Section Time Range (CodeSystem: LOINC urn:oid:2.16.840.1.113883.6.1 STATIC) (CONF:3250-32957)."
  * codeSystem 1..1
  * codeSystem = "2.16.840.1.113883.6.1"
    * ^comment = "This code SHALL contain exactly one [1..1] @codeSystem=\"2.16.840.1.113883.6.1\" (CodeSystem: LOINC urn:oid:2.16.840.1.113883.6.1 STATIC) (CONF:3250-32958)."
* text 1..1
  * ^comment = "SHALL contain exactly one [1..1] text (CONF:3250-32962)."
  * reference 1..1
    * ^comment = "This text SHALL contain exactly one [1..1] reference (CONF:3250-32963)."
    * value 1..1
      * ^comment = "This reference SHALL contain exactly one [1..1] @value (CONF:3250-32964)."
* statusCode 1..1
  * ^comment = "SHALL contain exactly one [1..1] statusCode (CONF:3250-32950)."
  * code 1..1
  * code = #completed (exactly)
    * ^comment = "This statusCode SHALL contain exactly one [1..1] @code=\"completed\" Completed (CodeSystem: HL7ActStatus urn:oid:2.16.840.1.113883.5.14 STATIC) (CONF:3250-32954)."
* value 1..1
* value only $IVL-TS
  * ^comment = "SHALL contain exactly one [1..1] value with @xsi:type=\"IVL_TS\" (CONF:3250-32953)."
  * low 1..1
    * ^comment = "This value SHALL contain exactly one [1..1] low (CONF:3250-32965)."
  * high 1..1
    * ^comment = "This value SHALL contain exactly one [1..1] high (CONF:3250-32966)."