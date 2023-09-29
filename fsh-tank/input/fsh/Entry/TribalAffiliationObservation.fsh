Profile: TribalAffiliationObservation
Parent: SocialHistoryObservation
Id: TribalAffiliationObservation
Title: "Tribal Affiliation Observation"
Description: """This template represents the tribe or band that an individual associates with, within the United States. It is recommended systems include the Tribal Affiliation Observation in the Social History section.
The tribe or band name is drawn from an HL7 code system that aligns with the Indian entities list, a list of tribes or bands recognized by and eligible to receive services from the United States Bureau of Indian Affairs. This template does not represent tribal enrollment.
Please see [Indian Entities Recognized by and Eligible To Receive Services From the United States Bureau of Indian Affairs](https://www.federalregister.gov/documents/2021/01/29/2021-01606/indian-entities-recognized-by-and-eligible-to-receive-services-from-the-united-states-bureau-of)."""
* ^meta.versionId = "4"
* ^meta.lastUpdated = "2023-07-11T23:41:53.256Z"
* insert LogicalModelNA
* ^identifier.value = "urn:hl7ii:2.16.840.1.113883.10.20.22.4.506:2023-05-01"
* ^version = "2023-05-01"
* ^status = #draft
* classCode 1..1
* classCode = #OBS (exactly)
  * ^comment = "SHALL contain exactly one [1..1] @classCode=\"OBS\" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:4537-2)."
* moodCode 1..1
* moodCode = #EVN (exactly)
  * ^comment = "SHALL contain exactly one [1..1] @moodCode=\"EVN\" (CodeSystem: HL7ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:4537-3)."
* templateId ^slicing.discriminator[0].type = #value
  * ^slicing.discriminator[=].path = "root"
  * ^slicing.discriminator[+].type = #value
  * ^slicing.discriminator[=].path = "extension"
  * ^slicing.rules = #open
* templateId contains templateId1 1..1
* templateId[templateId1] ^short = "templateId"
  * ^comment = "SHALL contain exactly one [1..1] templateId (CONF:4537-1) such that it"
  * root 1..1
  * root = "2.16.840.1.113883.10.20.22.4.506"
    * ^comment = "SHALL contain exactly one [1..1] @root=\"2.16.840.1.113883.10.20.22.4.506\" (CONF:4537-4)."
  * extension 1..1
  * extension = "2023-05-01"
    * ^comment = "SHALL contain exactly one [1..1] @extension=\"2023-05-01\" (CONF:4537-5)."
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
  * code = #completed (exactly)
    * ^comment = "This statusCode SHALL contain exactly one [1..1] @code=\"completed\" (CodeSystem: HL7ActStatus urn:oid:2.16.840.1.113883.5.14) (CONF:4537-10)."
* effectiveTime 1..1
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