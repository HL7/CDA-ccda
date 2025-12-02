Profile: NutritionAssessment
Parent: $Observation
Id: NutritionAssessment
Title: "Nutrition Assessment"
Description: "This template represents the patient's nutrition abilities and habits including intake, diet requirements or diet followed."

* insert LogicalModelTemplateRootOnly(nutrition-assessment, 2.16.840.1.113883.10.20.22.4.138)
* insert NarrativeLink

* classCode 1..1
* classCode = #OBS (exactly)
  * ^comment = "SHALL contain exactly one [1..1] @classCode=\"OBS\" Observation (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:1098-32914)."
* moodCode 1..1
* moodCode = #EVN (exactly)
  * ^comment = "SHALL contain exactly one [1..1] @moodCode=\"EVN\" Event (CodeSystem: HL7ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:1098-32915)."
* id 1..*
  * ^comment = "SHALL contain at least one [1..*] id (CONF:1098-32918)."
* code 1..1
  * ^comment = "SHALL contain exactly one [1..1] code (CONF:1098-32919)."
  * code 1..1
  * code = #75303-8
    * ^comment = "This code SHALL contain exactly one [1..1] @code=\"75303-8\" Nutrition assessment (CONF:1098-32926)."
  * codeSystem 1..1
  * codeSystem = "2.16.840.1.113883.6.1"
    * ^comment = "This code SHALL contain exactly one [1..1] @codeSystem=\"2.16.840.1.113883.6.1\" (CodeSystem: LOINC urn:oid:2.16.840.1.113883.6.1) (CONF:1098-32927)."
* statusCode 1..1
  * ^comment = "SHALL contain exactly one [1..1] statusCode (CONF:1098-32920)."
  * code 1..1
  * code = #completed (exactly)
    * ^comment = "This statusCode SHALL contain exactly one [1..1] @code=\"completed\" Completed (CodeSystem: HL7ActStatus urn:oid:2.16.840.1.113883.5.14 STATIC) (CONF:1098-32921)."
* effectiveTime 1..1
  * ^comment = "SHALL contain exactly one [1..1] effectiveTime (CONF:1098-32923)."
* value 1..1
  * obeys 1098-32925
  * ^comment = "SHALL contain exactly one [1..1] value (CONF:1098-32922)."
* insert ShouldElement(author)
* author 0..*
* author only AuthorParticipation
  * ^comment = "SHOULD contain zero or more [0..*] Author Participation (identifier: urn:oid:2.16.840.1.113883.10.20.22.4.119) (CONF:1098-32924)." // man-should

Invariant: 1098-32925
Description: "If coded, **SHOULD** contain a code from SNOMED CT (CodeSystem: 2.16.840.1.113883.6.96) (CONF:1098-32925)."
Severity: #warning
Expression: "codeSystem.exists() implies codeSystem = '2.16.840.1.113883.6.96'"