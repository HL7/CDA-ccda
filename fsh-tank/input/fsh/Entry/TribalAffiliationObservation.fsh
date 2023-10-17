Profile: TribalAffiliationObservation
Parent: SocialHistoryObservation
Id: TribalAffiliationObservation
Title: "Tribal Affiliation Observation"
Description: """This template represents the tribe or band that an individual associates with, within the United States. It is recommended systems include the Tribal Affiliation Observation in the Social History section.
The tribe or band name is drawn from an HL7 code system that aligns with the Indian entities list, a list of tribes or bands recognized by and eligible to receive services from the United States Bureau of Indian Affairs. This template does not represent tribal enrollment.
Please see [Indian Entities Recognized by and Eligible To Receive Services From the United States Bureau of Indian Affairs](https://www.federalregister.gov/documents/2021/01/29/2021-01606/indian-entities-recognized-by-and-eligible-to-receive-services-from-the-united-states-bureau-of)."""

* insert LogicalModelTemplate(tribal-affiliation-obs, 2.16.840.1.113883.10.20.22.4.506, 2023-05-01)

* ^status = #draft
* classCode 1..1
* classCode = #OBS (exactly)
  * ^comment = "SHALL contain exactly one [1..1] @classCode=\"OBS\" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:4537-2)."
* moodCode 1..1
* moodCode = #EVN (exactly)
  * ^comment = "SHALL contain exactly one [1..1] @moodCode=\"EVN\" (CodeSystem: HL7ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:4537-3)."
* code 1..1
  * ^comment = "SHALL contain exactly one [1..1] code (CONF:4537-6)."
  * code 1..1
  * code = #95370-3
    * ^comment = "This code SHALL contain exactly one [1..1] @code=\"95370-3\" Tribal Affiliation (CONF:4537-7)."
  * codeSystem 1..1
  * codeSystem = "2.16.840.1.113883.6.1"
    * ^comment = "This code SHALL contain exactly one [1..1] @codeSystem=\"2.16.840.1.113883.6.1\" (CodeSystem: LOINC urn:oid:2.16.840.1.113883.6.1 STATIC) (CONF:4537-8)."
* statusCode 1..1
  * ^comment = "SHALL contain exactly one [1..1] statusCode (CONF:4537-9)."
  * code 1..1
  * code from $2.16.840.1.113762.1.4.1240.6 (required)
  * ^comment = "This statusCode SHALL contain exactly one [1..1] @code, which SHALL be selected from ValueSet Completed or Nullified Act Status urn:oid:2.16.840.1.113762.1.4.1240.6."
* effectiveTime 1..1
  * ^short = "The effectiveTime reflects a point in time observation when the current tribal affiliation status was observed. Note: This template represents a \"snapshot in time\" observation, simply reflecting the patient's tribal affiliation at the time of the observation. As a result, the effectiveTime is constrained to just a time stamp."
  * ^comment = "SHALL contain exactly one [1..1] effectiveTime (CONF:4537-11)."
  * low 1..1
    * ^comment = "This effectiveTime SHALL NOT contain exactly one [1..1] low (CONF:4537-33048)."
  * width 1..1
    * ^comment = "This effectiveTime SHALL NOT contain exactly one [1..1] width (CONF:4537-33049)."
  * high 1..1
    * ^comment = "This effectiveTime SHALL NOT contain exactly one [1..1] high (CONF:4537-33050)."
  * center 1..1
    * ^comment = "This effectiveTime SHALL NOT contain exactly one [1..1] center (CONF:4537-33051)."
* value 1..1
* value only $CD
* value from TribalEntityUS (required)
  * ^comment = "SHALL contain exactly one [1..1] value, which SHALL be selected from ValueSet TribalEntityUS http://terminology.hl7.org/ValueSet/v3-TribalEntityUS DYNAMIC (CONF:4537-12)."