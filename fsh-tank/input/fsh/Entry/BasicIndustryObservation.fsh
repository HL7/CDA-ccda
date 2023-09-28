Profile: BasicIndustryObservation
Parent: SocialHistoryObservation
Id: BasicIndustryObservation
Title: "Basic Industry Observation"
Description: """This template represents a simple observation about the type of business that compensates for work or assigns work to an unpaid worker or volunteer (e.g., U.S. Army, cement manufacturing, children and youth services). Multiple occupation industry observation instances in a single document or derived from multiple documents, represent a basic historical industry record.

 Implementers should use the Basic Industry Observation template for conveying Industry in support of USCDI v3. It is recommended systems include the Basic Industry Observation in the Social History section.  Implementers wishing to convey more advanced Industry detail may consider using  [HL7 CDA R2 Implementation Guide: C-CDA R2.1 Supplemental Templates for Occupational Data for Health](https://www.hl7.org/implement/standards/product_brief.cfm?product_id=522) in addition to this Observation."""
* ^meta.versionId = "4"
* ^meta.lastUpdated = "2023-07-11T23:41:52.557Z"
* insert LogicalModelNA
* ^identifier.value = "urn:hl7ii:2.16.840.1.113883.10.20.22.4.504:2023-05-01"
* ^version = "2023-05-01"
* ^status = #draft
* classCode 1..1
* classCode = #OBS (exactly)
  * ^comment = "SHALL contain exactly one [1..1] @classCode=\"OBS\" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:4537-33018)."
* moodCode 1..1
* moodCode = #EVN (exactly)
  * ^comment = "SHALL contain exactly one [1..1] @moodCode=\"EVN\" (CodeSystem: HL7ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:4537-33019)."
* templateId ^slicing.discriminator[0].type = #value
  * ^slicing.discriminator[=].path = "root"
  * ^slicing.discriminator[+].type = #value
  * ^slicing.discriminator[=].path = "extension"
  * ^slicing.rules = #open
  * ^comment = "SHALL contain exactly one [1..1] templateId (CONF:4537-33009) such that it"
* templateId contains templateId1 1..1
* templateId[templateId1] ^short = "templateId"
  * ^comment = "SHALL contain exactly one [1..1] templateId (CONF:4537-33009) such that it"
  * root 1..1
  * root = "2.16.840.1.113883.10.20.22.4.504"
    * ^comment = "SHALL contain exactly one [1..1] @root=\"2.16.840.1.113883.10.20.22.4.504\" (CONF:4537-33013)."
  * extension 1..1
  * extension = "2023-05-01"
    * ^comment = "SHALL contain exactly one [1..1] @extension=\"2023-05-01\" (CONF:4537-33014)."
* code 1..1
  * ^comment = "SHALL contain exactly one [1..1] code (CONF:4537-33010)."
  * code 1..1
  * code = #86188-0
    * ^comment = "This code SHALL contain exactly one [1..1] @code=\"86188-0\" History of Occupation Industry (CONF:4537-33015)."
  * codeSystem 1..1
  * codeSystem = "2.16.840.1.113883.6.1"
    * ^comment = "This code SHALL contain exactly one [1..1] @codeSystem=\"2.16.840.1.113883.6.1\" (CodeSystem: LOINC urn:oid:2.16.840.1.113883.6.1 STATIC) (CONF:4537-33016)."
* statusCode 1..1
  * ^comment = "SHALL contain exactly one [1..1] statusCode (CONF:4537-33011)."
  * code 1..1
  * code = #completed (exactly)
    * ^comment = "This statusCode SHALL contain exactly one [1..1] @code=\"completed\" (CodeSystem: HL7ActStatus urn:oid:2.16.840.1.113883.5.14) (CONF:4537-33017)."
* value 1..1
* value only $CD
* value from $2.16.840.1.114222.4.11.7900 (required)
  * ^comment = "SHALL contain exactly one [1..1] value, which SHALL be selected from ValueSet Industry NAICS Detail (ODH) urn:oid:2.16.840.1.114222.4.11.7900 DYNAMIC (CONF:4537-33022)."