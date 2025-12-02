Profile: NutritionRecommendation
Parent: $Act
Id: NutritionRecommendation
Title: "Nutrition Recommendation"
Description: "This template represents nutrition regimens (e.g., fluid restrictions, calorie minimum), interventions (e.g., NPO, nutritional supplements), and procedures (e.g., G-Tube by bolus, TPN by central line). It may also depict the need for nutrition education."

* insert LogicalModelTemplateRootOnly(nutrition-rec, 2.16.840.1.113883.10.20.22.4.130)
* insert NarrativeLink

* classCode 1..1
* classCode = #ACT (exactly)
  * ^comment = "SHALL contain exactly one [1..1] @classCode=\"ACT\" act (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:1098-30385)."
* moodCode 1..1
* moodCode from $2.16.840.1.113883.11.20.9.23 (required)
  * ^comment = "SHALL contain exactly one [1..1] @moodCode, which SHALL be selected from ValueSet Planned moodCode (Act/Encounter/Procedure) urn:oid:2.16.840.1.113883.11.20.9.23 STATIC 2014-09-01 (CONF:1098-30386)."
* code 1..1
* code from $2.16.840.1.113762.1.4.1095.65 (preferred)
  * ^comment = "SHALL contain exactly one [1..1] code, which SHOULD be selected from ValueSet Nutrition Recommendation Grouping urn:oid:2.16.840.1.113762.1.4.1095.65."
* statusCode 1..1
  * ^comment = "SHALL contain exactly one [1..1] statusCode (CONF:1098-31697)."
  * code 1..1
  * code = #active (exactly)
    * ^comment = "This statusCode SHALL contain exactly one [1..1] @code=\"active\" Active (CodeSystem: HL7ActStatus urn:oid:2.16.840.1.113883.5.14) (CONF:1098-31698)."
* insert ShouldElement(effectiveTime)
* effectiveTime 0..1
  * ^short = "The effectiveTime indicates the time when the activity is intended to take place."
  * ^comment = "SHOULD contain zero or one [0..1] effectiveTime (CONF:1098-31699)." // auto-should
* entryRelationship ^slicing.discriminator[0].type = #profile
  * ^slicing.discriminator[=].path = "act"
  * ^slicing.discriminator[+].type = #profile
  * ^slicing.discriminator[=].path = "encounter"
  * ^slicing.discriminator[+].type = #profile
  * ^slicing.discriminator[=].path = "substanceAdministration"
  * ^slicing.discriminator[+].type = #profile
  * ^slicing.discriminator[=].path = "supply"
  * ^slicing.discriminator[+].type = #profile
  * ^slicing.discriminator[=].path = "procedure"
  * ^slicing.rules = #open
* entryRelationship contains
    plannedEncounter 0..* and
    plannedMedActivity 0..* and
    plannedProc 0..* and
    plannedSupply 0..* 
* entryRelationship[plannedEncounter] ^comment = "MAY contain zero or more [0..*] entryRelationship (CONF:1098-32382) such that it"
  * typeCode 1..1
  * typeCode = #REFR (exactly)
    * ^comment = "SHALL contain exactly one [1..1] @typeCode=\"REFR\" Refers to (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:1098-32928)."
  * encounter 1..1
  * encounter only PlannedEncounter
    * ^comment = "SHALL contain exactly one [1..1] Planned Encounter (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.4.40:2014-06-09) (CONF:1098-32383)."
* entryRelationship[plannedMedActivity] ^comment = "MAY contain zero or more [0..*] entryRelationship (CONF:1098-32384) such that it"
  * typeCode 1..1
  * typeCode = #REFR (exactly)
    * ^comment = "SHALL contain exactly one [1..1] @typeCode=\"REFR\" Refers to (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:1098-32929)."
  * substanceAdministration 1..1
  * substanceAdministration only PlannedMedicationActivity
    * ^comment = "SHALL contain exactly one [1..1] Planned Medication Activity (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.4.42:2014-06-09) (CONF:1098-32385)."
* entryRelationship[plannedProc] ^comment = "MAY contain zero or more [0..*] entryRelationship (CONF:1098-32388) such that it"
  * typeCode 1..1
  * typeCode = #REFR (exactly)
    * ^comment = "SHALL contain exactly one [1..1] @typeCode=\"REFR\" Refers to (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:1098-32931)."
  * procedure 1..1
  * procedure only PlannedProcedure
    * ^comment = "SHALL contain exactly one [1..1] Planned Procedure (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.4.41:2014-06-09) (CONF:1098-32389)."
* entryRelationship[plannedSupply] ^comment = "MAY contain zero or more [0..*] entryRelationship (CONF:1098-32390) such that it"
  * typeCode 1..1
  * typeCode = #REFR (exactly)
    * ^comment = "SHALL contain exactly one [1..1] @typeCode=\"REFR\" Refers to (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:1098-32932)."
  * supply 1..1
  * supply only PlannedSupply
    * ^comment = "SHALL contain exactly one [1..1] Planned Supply (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.4.43:2014-06-09) (CONF:1098-32391)."