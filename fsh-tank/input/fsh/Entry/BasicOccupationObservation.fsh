Profile: BasicOccupationObservation
Parent: SocialHistoryObservation
Id: BasicOccupationObservation
Title: "Basic Occupation Observation"
Description: """This template represents a simple observation about the type of work (e.g., infantry, business analyst, social worker) of a person. The effectiveTime low and high represent the start and end times of a particular observation about an occupation. Multiple occupation observation instances in a single document or derived from multiple documents, represent a basic historical occupation record. Implementers should use the Basic Occupation Observation template for conveying occupation information in support of USCDI v3.  It is recommended systems include the Basic Industry Observation in the Social History section.

Implementers wishing to convey more advanced Occupation detail, such as employer, usual work (longest held), or other work related observations may consider using [HL7 CDA R2 Implementation Guide: C-CDA R2.1 Supplemental Templates for Occupational Data for Health](https://www.hl7.org/implement/standards/product_brief.cfm?product_id=522)  in addition to this Observation."""

* insert LogicalModelTemplate(basic-occupation-obs, 2.16.840.1.113883.10.20.22.4.503, 2023-05-01)

* ^status = #draft
* classCode 1..1
* classCode = #OBS (exactly)
  * ^comment = "SHALL contain exactly one [1..1] @classCode=\"OBS\" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:4537-33000)."
* moodCode 1..1
* moodCode = #EVN (exactly)
  * ^comment = "SHALL contain exactly one [1..1] @moodCode=\"EVN\" (CodeSystem: HL7ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:4537-33001)."
* code 1..1
  * ^comment = "SHALL contain exactly one [1..1] code (CONF:4537-32996)."
  * code 1..1
  * code = #11341-5
    * ^comment = "This code SHALL contain exactly one [1..1] @code=\"11341-5\" History of Occupation (CONF:4537-33002)."
  * codeSystem 1..1
  * codeSystem = "2.16.840.1.113883.6.1"
    * ^comment = "This code SHALL contain exactly one [1..1] @codeSystem=\"2.16.840.1.113883.6.1\" (CodeSystem: LOINC urn:oid:2.16.840.1.113883.6.1 STATIC) (CONF:4537-33003)."
* statusCode 1..1
  * ^comment = "SHALL contain exactly one [1..1] statusCode (CONF:4537-32997)."
  * code 1..1
  * code from $2.16.840.1.113762.1.4.1240.6 (required)
  * ^comment = "This statusCode SHALL contain exactly one [1..1] @code, which SHALL be selected from ValueSet Completed or Nullified Act Status urn:oid:2.16.840.1.113762.1.4.1240.6."
* effectiveTime 1..1
  * ^comment = "SHALL contain exactly one [1..1] effectiveTime (CONF:4537-33005)."
  * low 1..1
    * ^short = "The low value reflects the start date of the recorded occupation."
    * ^comment = "This effectiveTime SHALL contain exactly one [1..1] low (CONF:4537-33007)."
  * high 0..1
    * ^short = "The high value reflects the end date of the recorded occupation. An absent high value means the occupation was current at the time the document was generated."
    * ^comment = "This effectiveTime MAY contain zero or one [0..1] high (CONF:4537-33008)."
* value 1..1
* value only $CD
* value from $2.16.840.1.114222.4.11.7901 (required)
  * ^comment = "SHALL contain exactly one [1..1] value with @xsi:type=\"CD\", which SHALL be selected from ValueSet Occupation ONETSOC Detail (ODH) urn:oid:2.16.840.1.114222.4.11.7901 DYNAMIC (CONF:4537-33006)."
* subject 0..1
  * ^short = "Indicates that this observation is for a related person whose occupation may affect the patient."
  * ^comment = "MAY contain zero or one [0..1] subject (CONF:4537-33058)."
  * relatedSubject 1..1
    * ^comment = "The subject, if present, SHALL contain exactly one [1..1] relatedSubject (CONF:4537-33059)."
* entryRelationship ^slicing.discriminator[0].type = #value
  * ^slicing.discriminator[=].path = "act"
  * ^slicing.discriminator[+].type = #value
  * ^slicing.discriminator[=].path = "observation"
  * ^slicing.discriminator[+].type = #value
  * ^slicing.discriminator[=].path = "typeCode"
  * ^slicing.rules = #open
  * ^comment = "SHOULD contain zero or one [0..1] entryRelationship (CONF:4537-33060) such that it"
* entryRelationship contains entryRelationship1 0..1
* entryRelationship[entryRelationship1] ^short = "entryRelationship"
  * ^comment = "SHOULD contain zero or one [0..1] entryRelationship (CONF:4537-33060) such that it"
  * typeCode 1..1
  * typeCode = #REFR (exactly)
    * ^comment = "SHALL contain exactly one [1..1] @typeCode=\"REFR\" Refers to (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:4537-33062)."
  * observation 1..1
  * observation only BasicIndustryObservation
    * ^comment = "SHALL contain exactly one [1..1] Basic Industry Observation (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.4.504:2023-05-01) (CONF:4537-33063)."