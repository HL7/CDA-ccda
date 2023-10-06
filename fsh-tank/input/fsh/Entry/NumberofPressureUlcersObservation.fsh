Profile: NumberofPressureUlcersObservation
Parent: $Observation
Id: NumberofPressureUlcersObservation
Title: "Number of Pressure Ulcers Observation"
Description: "This template represents the number of pressure ulcers observed at a particular stage."

* insert LogicalModelTemplate(numberof-pressure-ulcers-obs, 2.16.840.1.113883.10.20.22.4.76, 2015-08-01)

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
  * code 1..1
  * code = #2264892003
    * ^comment = "This code SHALL contain exactly one [1..1] @code=\"2264892003\" Number of pressure ulcers (CONF:1198-14768)."
  * codeSystem 1..1
  * codeSystem = "2.16.840.1.113883.6.96"
    * ^comment = "This code SHALL contain exactly one [1..1] @codeSystem=\"2.16.840.1.113883.6.96\" (CodeSystem: SNOMED CT urn:oid:2.16.840.1.113883.6.96 STATIC) (CONF:1198-32164)."
  * translation ^slicing.discriminator[0].type = #value
    * ^slicing.discriminator[=].path = "codeSystem"
    * ^slicing.discriminator[+].type = #value
    * ^slicing.discriminator[=].path = "code"
    * ^slicing.rules = #open
  * translation contains translation1 1..1
  * translation[translation1] ^comment = "This code SHALL contain exactly one [1..1] translation (CONF:1198-32849) such that it"
    * code 1..1
    * code = #75277-4
      * ^comment = "SHALL contain exactly one [1..1] @code=\"75277-4\" Number of pressure ulcers (CONF:1198-32850)."
    * codeSystem 1..1
    * codeSystem = "2.16.840.1.113883.6.1"
      * ^comment = "SHALL contain exactly one [1..1] @codeSystem=\"2.16.840.1.113883.6.1\" (CodeSystem: LOINC urn:oid:2.16.840.1.113883.6.1) (CONF:1198-32851)."
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
  * ^slicing.discriminator[=].path = "Observation.typeCode"
  * ^slicing.rules = #open
* entryRelationship contains entryRelationship1 1..1
* entryRelationship[entryRelationship1] ^comment = "SHALL contain exactly one [1..1] entryRelationship (CONF:1198-14718) such that it"
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
      * ^short = "SG 20230709: This constraint not entered properly in TWB - missing codesystem and code set at top level rather than on observation.code.code - added observation.code.code and observation.code.codeSystem"
      * ^comment = "This observation SHALL contain exactly one [1..1] code=\"ASSERTION\" Assertion (CodeSystem: HL7ActCode urn:oid:2.16.840.1.113883.5.4) (CONF:1198-31930)."
      * code 1..1
      * code = #ASSERTION
      * codeSystem 1..1
      * codeSystem = "2.16.840.1.113883.5.4"
    * value 1..1
    * value only $CD
    * value from $2.16.840.1.113883.11.20.9.35 (preferred)
      * ^comment = "This observation SHALL contain exactly one [1..1] value with @xsi:type=\"CD\", where the code SHOULD be selected from ValueSet Pressure Ulcer Stage urn:oid:2.16.840.1.113883.11.20.9.35 DYNAMIC (CONF:1198-14725)."