Profile: NumberofPressureUlcersObservation
Parent: $Observation
Id: NumberofPressureUlcersObservation
Title: "Number of Pressure Ulcers Observation"
Description: "This template represents the number of pressure ulcers observed at a particular stage."

* insert LogicalModelTemplate(numberof-pressure-ulcers-obs, 2.16.840.1.113883.10.20.22.4.76, 2015-08-01)
* insert NarrativeLink

* classCode 1..1
* classCode = #OBS (exactly)
  * ^comment = "SHALL contain exactly one [1..1] @classCode=\"OBS\" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:1198-14705)."
* moodCode 1..1
* moodCode = #EVN (exactly)
  * ^comment = "SHALL contain exactly one [1..1] @moodCode=\"EVN\" (CodeSystem: HL7ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:1198-14706)."
* id 1..*
  * ^comment = "SHALL contain at least one [1..*] id (CONF:1198-14709)."
* code 1..1
  * ^comment = "SHALL contain exactly one [1..1] code (CONF:1198-14767)."
  * insert CodedSnomed(2264892003, [[Number of pressure ulcers]])
  * translation ^slicing.discriminator[0].type = #value
    * ^slicing.discriminator[=].path = "codeSystem"
    * ^slicing.discriminator[+].type = #value
    * ^slicing.discriminator[=].path = "code"
    * ^slicing.rules = #open
  * translation contains translation1 1..1
  * translation[translation1] ^comment = "This code SHALL contain exactly one [1..1] translation (CONF:1198-32849) such that it"
    * insert CodedLoinc(75277-4, [[Number of pressure ulcers]])
* statusCode 1..1
  * ^comment = "SHALL contain exactly one [1..1] statusCode (CONF:1198-14714)."
  * code 1..1
  * code = #completed (exactly)
    * ^comment = "This statusCode SHALL contain exactly one [1..1] @code=\"completed\" Completed (CodeSystem: HL7ActStatus urn:oid:2.16.840.1.113883.5.14 STATIC) (CONF:1198-19108)."
* effectiveTime 1..1
  * ^comment = "SHALL contain exactly one [1..1] effectiveTime (CONF:1198-14715)."
* value 1..1
* value only $INT
  * ^comment = "SHALL contain exactly one [1..1] value with @xsi:type=\"INT\" (CONF:1198-14771)."
* author 0..1
  * ^comment = "MAY contain zero or one [0..1] author (CONF:1198-14717)."
* entryRelationship ^slicing.discriminator[0].type = #value
  * ^slicing.discriminator[=].path = "typeCode"
  * ^slicing.discriminator[+].type = #exists
  * ^slicing.discriminator[=].path = "observation"
  * ^slicing.rules = #open
* entryRelationship contains stage 1..1
* entryRelationship[stage] ^comment = "SHALL contain exactly one [1..1] entryRelationship (CONF:1198-14718) such that it"
  * typeCode 1..1
  * typeCode = #SUBJ (exactly)
    * ^comment = "SHALL contain exactly one [1..1] @typeCode=\"SUBJ\" Has subject (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002 STATIC) (CONF:1198-14719)."
  * observation 1..1
    * ^comment = "SHALL contain exactly one [1..1] observation (CONF:1198-14720)."
    * classCode 1..1
    * classCode = #OBS (exactly)
      * ^comment = "This observation SHALL contain exactly one [1..1] @classCode=\"OBS\" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:1198-14721)."
    * moodCode 1..1
    * moodCode = #EVN (exactly)
      * ^comment = "This observation SHALL contain exactly one [1..1] @moodCode=\"EVN\" (CodeSystem: HL7ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:1198-14722)."
    * code 1..1
      * insert CodedLoinc(91150-3, [[Pressure Injury Stage NPUAP]])
    * value 1..1
    * value only $CD
    * value from $2.16.840.1.113883.11.20.9.35 (preferred)
      * ^comment = "This observation SHALL contain exactly one [1..1] value with @xsi:type=\"CD\", where the code SHOULD be selected from ValueSet Pressure Ulcer Stage urn:oid:2.16.840.1.113883.11.20.9.35 DYNAMIC (CONF:1198-14725)."