Profile: BasicIndustryObservation
Parent: SocialHistoryObservation
Id: BasicIndustryObservation
Title: "Basic Industry Observation"
Description: """This template represents a simple observation about the type of business that compensates for work or assigns work to an unpaid worker or volunteer (e.g., US Army, cement manufacturing, children and youth services). Multiple occupation industry observation instances in a single document or derived from multiple documents, represent a basic historical industry record.

 Implementers should use the Basic Industry Observation template for conveying Industry in support of USCDI. It is recommended systems include the Basic Industry Observation in the Social History section.  Implementers wishing to convey more advanced Industry detail may consider using  [HL7 CDA R2 Implementation Guide: C-CDA R2.1 Supplemental Templates for Occupational Data for Health](https://www.hl7.org/implement/standards/product_brief.cfm?product_id=522) in addition to this Observation."""

* insert LogicalModelTemplate(basic-industry-obs, 2.16.840.1.113883.10.20.22.4.504, 2023-05-01)

* ^status = #draft
* classCode 1..1
* classCode = #OBS (exactly)
  * ^comment = "SHALL contain exactly one [1..1] @classCode=\"OBS\" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:4537-33018)."
* moodCode 1..1
* moodCode = #EVN (exactly)
  * ^comment = "SHALL contain exactly one [1..1] @moodCode=\"EVN\" (CodeSystem: HL7ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:4537-33019)."
* code 1..1
  * insert CodedLoinc(86188-0, History of Occupation Industry)
  * ^comment = "This code SHALL contain exactly one [1..1] @code=\"86188-0\" History of Occupation Industry (CONF:4537-33015)."
* statusCode 1..1
  * ^comment = "SHALL contain exactly one [1..1] statusCode (CONF:4537-33011)."
  * code 1..1
  * code = #completed (exactly)
    * ^comment = "This statusCode SHALL contain exactly one [1..1] @code=\"completed\" (CodeSystem: HL7ActStatus urn:oid:2.16.840.1.113883.5.14) (CONF:4537-33017)."
* value 1..1
* value[physical-quantity] 0..0
* value[coded] 1..1
* value[coded] from $2.16.840.1.114222.4.11.7900 (required)
  * ^comment = "SHALL contain exactly one [1..1] value with @xsi:type=\"CD\", which SHALL be selected from ValueSet Industry NAICS Detail (ODH) urn:oid:2.16.840.1.114222.4.11.7900 DYNAMIC (CONF:4537-33022)."