Profile: NutritionalStatusObservation
Parent: $Observation
Id: NutritionalStatusObservation
Title: "Nutritional Status Observation"
Description: "This template describes the overall nutritional status of the patient including findings related to nutritional status."

* insert LogicalModelTemplateRootOnly(nutritional-status-obs, 2.16.840.1.113883.10.20.22.4.124)

* classCode 1..1
* classCode = #OBS (exactly)
  * ^comment = "SHALL contain exactly one [1..1] @classCode=\"OBS\" Observation (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:1098-29841)."
* moodCode 1..1
* moodCode = #EVN (exactly)
  * ^comment = "SHALL contain exactly one [1..1] @moodCode=\"EVN\" Event (CodeSystem: HL7ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:1098-29842)."
* id 1..*
  * ^comment = "SHALL contain at least one [1..*] id (CONF:1098-29845)."
* code 1..1
  * ^comment = "SHALL contain exactly one [1..1] code (CONF:1098-29846)."
  * code 1..1
  * code = #75305-3
    * ^comment = "This code SHALL contain exactly one [1..1] @code=\"75305-3\" Nutrition status (CONF:1098-29897)."
  * codeSystem 1..1
  * codeSystem = "2.16.840.1.113883.6.1"
    * ^comment = "This code SHALL contain exactly one [1..1] @codeSystem=\"2.16.840.1.113883.6.1\" (CodeSystem: LOINC urn:oid:2.16.840.1.113883.6.1) (CONF:1098-29898)."
* statusCode 1..1
  * ^comment = "SHALL contain exactly one [1..1] statusCode (CONF:1098-29852)."
  * code 1..1
  * code from $2.16.840.1.113762.1.4.1240.6 (required)
  * ^comment = "This statusCode SHALL contain exactly one [1..1] @code, which SHALL be selected from ValueSet Completed or Nullified Act Status urn:oid:2.16.840.1.113762.1.4.1240.6."
* effectiveTime 1..1
  * ^comment = "SHALL contain exactly one [1..1] effectiveTime (CONF:1098-31867)."
* value 1..1
* value only $CD
* value from $2.16.840.1.113883.1.11.20.2.7 (preferred)
  * ^comment = "SHALL contain exactly one [1..1] value, which SHOULD be selected from ValueSet Nutritional Status urn:oid:2.16.840.1.113883.1.11.20.2.7 DYNAMIC (CONF:1098-29854)."
* entryRelationship ^slicing.discriminator.type = #value
  * ^slicing.discriminator.path = "Observation.typeCode"
  * ^slicing.rules = #open
* entryRelationship contains nutritionAssessment 1..*
* entryRelationship[nutritionAssessment] ^comment = "SHALL contain at least one [1..*] entryRelationship (CONF:1098-30323) such that it"
  * typeCode 1..1
  * typeCode = #SUBJ (exactly)
    * ^comment = "SHALL contain exactly one [1..1] @typeCode=\"SUBJ\" Has subject (CONF:1098-30335)."
  * observation 1..1
  * observation only NutritionAssessment
    * ^comment = "SHALL contain exactly one [1..1] Nutrition Assessment (identifier: urn:oid:2.16.840.1.113883.10.20.22.4.138) (CONF:1098-30336)."