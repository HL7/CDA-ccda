Profile: HealthConcernAct
Parent: $Act
Id: HealthConcernAct
Title: "Health Concern Act"
Description: """This template represents a health concern. 

It is a wrapper for a single health concern which may be derived from a variety of sources within an EHR (such as Problem List, Family History, Social History, Social Worker Note, etc.). 

A Health Concern Act is used to track non-optimal physical or psychological situations drawing the patient to the healthcare system. These may be from the perspective of the care team or from the perspective of the patient. 
When the underlying condition is of concern (i.e., as long as the condition, whether active or resolved, is of ongoing concern and interest), the statusCode is active. Only when the underlying condition is no longer of concern is the statusCode set to completed. The effectiveTime reflects the time that the underlying condition was felt to be a concern; it may or may not correspond to the effectiveTime of the condition (e.g., even five years later, a prior heart attack may remain a concern).
Health concerns require intervention(s) to increase the likelihood of achieving the goals of care for the patient and they specify the condition oriented reasons for creating the plan."""

* insert LogicalModelTemplate(healthConcernAct, 2.16.840.1.113883.10.20.22.4.132, 2022-06-01)

* obeys 4515-32962
* classCode 1..1
* classCode = #ACT (exactly)
  * ^comment = "SHALL contain exactly one [1..1] @classCode=\"ACT\" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:4515-30750)."
* moodCode 1..1
* moodCode = #EVN (exactly)
  * ^comment = "SHALL contain exactly one [1..1] @moodCode=\"EVN\" (CodeSystem: HL7ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:4515-30751)."
* id 1..*
  * ^comment = "SHALL contain at least one [1..*] id (CONF:4515-30754)."
* code 1..1
  * ^comment = "SHALL contain exactly one [1..1] code (CONF:4515-32310)."
  * code 1..1
  * code = #75310-3
    * ^comment = "This code SHALL contain exactly one [1..1] @code=\"75310-3\" Health Concern (CONF:4515-32311)."
  * codeSystem 1..1
  * codeSystem = "2.16.840.1.113883.6.1"
    * ^comment = "This code SHALL contain exactly one [1..1] @codeSystem=\"2.16.840.1.113883.6.1\" (CodeSystem: LOINC urn:oid:2.16.840.1.113883.6.1) (CONF:4515-32312)."
* statusCode 1..1
  * ^comment = "SHALL contain exactly one [1..1] statusCode (CONF:4515-30758)."
  * code 1..1
  * code from $2.16.840.1.113883.11.20.9.19 (required)
    * ^comment = "This statusCode SHALL contain exactly one [1..1] @code, which SHALL be selected from ValueSet ProblemAct statusCode urn:oid:2.16.840.1.113883.11.20.9.19 STATIC (CONF:4515-32313)."
* effectiveTime 0..1
  * ^comment = "MAY contain zero or one [0..1] effectiveTime (CONF:4515-30759)."
* author 0..*
* author only AuthorParticipation
  * ^comment = "SHOULD contain zero or more [0..*] Author Participation (identifier: urn:oid:2.16.840.1.113883.10.20.22.4.119) (CONF:4515-31546)."
* entryRelationship ^slicing.discriminator[0].type = #value
  * ^slicing.discriminator[=].path = "act"
  * ^slicing.discriminator[+].type = #value
  * ^slicing.discriminator[=].path = "typeCode"
  * ^slicing.rules = #open
  * ^comment = "MAY contain zero or more [0..*] entryRelationship (CONF:4515-31549) such that it"
* entryRelationship contains
    entryRelationship1 0..* and
    entryRelationship2 0..* and
    entryRelationship3 0..* and
    entryRelationship4 0..* and
    entryRelationship5 0..* and
    entryRelationship6 0..* and
    entryRelationship7 0..* and
    entryRelationship8 0..* and
    entryRelationship9 0..* and
    entryRelationship10 0..* and
    entryRelationship11 0..* and
    entryRelationship12 0..* and
    entryRelationship13 0..* and
    entryRelationship14 0..* and
    entryRelationship15 0..* and
    entryRelationship16 0..* and
    entryRelationship17 0..* and
    entryRelationship18 0..* and
    entryRelationship19 0..* and
    entryRelationship20 0..* and
    entryRelationship21 0..* and
    entryRelationship22 0..* and
    entryRelationship23 0..* and
    entryRelationship24 0..* and
    entryRelationship25 0..* and
    entryRelationship26 0..* and
    entryRelationship27 0..* and
    entryRelationship28 0..* and
    entryRelationship29 0..* and
    entryRelationship30 0..* and
    entryRelationship31 0..* and
    entryRelationship32 0..*
* entryRelationship[entryRelationship1] ^short = "entryRelationship"
  * ^comment = "MAY contain zero or more [0..*] entryRelationship (CONF:4515-30761) such that it"
  * typeCode 1..1
  * typeCode = #REFR (exactly)
    * ^comment = "SHALL contain exactly one [1..1] @typeCode=\"REFR\" Refers to (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:4515-30762)."
  * observation 1..1
  * observation only ProblemObservation
    * ^comment = "SHALL contain exactly one [1..1] Problem Observation (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.4.4:2015-08-01) (CONF:4515-31001)."
* entryRelationship[entryRelationship2] ^short = "entryRelationship"
  * ^comment = "MAY contain zero or more [0..*] entryRelationship (CONF:4515-31007) such that it"
  * typeCode 1..1
  * typeCode = #REFR (exactly)
    * ^comment = "SHALL contain exactly one [1..1] @typeCode=\"REFR\" Refers to (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:4515-31008)."
  * observation 1..1
  * observation only AllergyIntoleranceObservation
    * ^comment = "SHALL contain exactly one [1..1] Allergy - Intolerance Observation (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.4.7:2014-06-09) (CONF:4515-31186)."
* entryRelationship[entryRelationship3] ^short = "entryRelationship"
  * ^comment = "MAY contain zero or more [0..*] entryRelationship (CONF:4515-31157) such that it"
  * typeCode 1..1
  * typeCode = #REFR (exactly)
    * ^comment = "SHALL contain exactly one [1..1] @typeCode=\"REFR\" Refers to (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:4515-31158)."
  * act 1..1
  * act only EntryReference
    * obeys 4515-32860
    * ^comment = "SHALL contain exactly one [1..1] Entry Reference (identifier: urn:oid:2.16.840.1.113883.10.20.22.4.122) (CONF:4515-32106)."
* entryRelationship[entryRelationship4] ^short = "entryRelationship"
  * ^comment = "MAY contain zero or more [0..*] entryRelationship (CONF:4515-31160) such that it"
  * typeCode 1..1
  * typeCode = #COMP (exactly)
    * ^comment = "SHALL contain exactly one [1..1] @typeCode=\"COMP\" Has component (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:4515-31161)."
  * act 1..1
  * act only EntryReference
    * obeys 4515-32745
    * ^comment = "SHALL contain exactly one [1..1] Entry Reference (identifier: urn:oid:2.16.840.1.113883.10.20.22.4.122) (CONF:4515-32107)."
* entryRelationship[entryRelationship5] ^short = "entryRelationship"
  * ^comment = "MAY contain zero or more [0..*] entryRelationship (CONF:4515-31190) such that it"
  * typeCode 1..1
  * typeCode = #REFR (exactly)
    * ^comment = "SHALL contain exactly one [1..1] @typeCode=\"REFR\" Refers to (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:4515-31191)."
  * observation 1..1
  * observation only AssessmentScaleObservation
    * ^comment = "SHALL contain exactly one [1..1] Assessment Scale Observation (identifier: urn:oid:2.16.840.1.113883.10.20.22.4.69) (CONF:4515-31192)."
* entryRelationship[entryRelationship6] ^short = "entryRelationship"
  * ^comment = "MAY contain zero or more [0..*] entryRelationship (CONF:4515-31232) such that it"
  * typeCode 1..1
  * typeCode = #REFR (exactly)
    * ^comment = "SHALL contain exactly one [1..1] @typeCode=\"REFR\" Refers to (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:4515-31264)."
  * observation 1..1
  * observation only SelfCareActivitiesADLandIADL
    * ^comment = "SHALL contain exactly one [1..1] Self-Care Activities (ADL and IADL) (identifier: urn:oid:2.16.840.1.113883.10.20.22.4.128) (CONF:4515-31265)."
* entryRelationship[entryRelationship7] ^short = "entryRelationship"
  * ^comment = "MAY contain zero or more [0..*] entryRelationship (CONF:4515-31234) such that it"
  * typeCode 1..1
  * typeCode = #REFR (exactly)
    * ^comment = "SHALL contain exactly one [1..1] @typeCode=\"REFR\" Refers to (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:4515-31268)."
  * observation 1..1
  * observation only MentalStatusObservation
    * ^comment = "SHALL contain exactly one [1..1] Mental Status Observation (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.4.74:2015-08-01) (CONF:4515-31273)."
* entryRelationship[entryRelationship8] ^short = "entryRelationship"
  * ^comment = "MAY contain zero or more [0..*] entryRelationship (CONF:4515-31235) such that it"
  * typeCode 1..1
  * typeCode = #REFR (exactly)
    * ^comment = "SHALL contain exactly one [1..1] @typeCode=\"REFR\" Refers to (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:4515-31269)."
  * observation 1..1
  * observation only SmokingStatusMeaningfulUse
    * ^comment = "SHALL contain exactly one [1..1] Smoking Status - Meaningful Use (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.4.78:2014-06-09) (CONF:4515-31275)."
* entryRelationship[entryRelationship9] ^short = "entryRelationship"
  * ^comment = "MAY contain zero or more [0..*] entryRelationship (CONF:4515-31236) such that it"
  * typeCode 1..1
  * typeCode = #REFR (exactly)
    * ^comment = "SHALL contain exactly one [1..1] @typeCode=\"REFR\" Refers to (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:4515-31270)."
  * act 1..1
  * act only EncounterDiagnosis
    * ^comment = "SHALL contain exactly one [1..1] Encounter Diagnosis (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.4.80:2015-08-01) (CONF:4515-31277)."
* entryRelationship[entryRelationship10] ^short = "entryRelationship"
  * ^comment = "MAY contain zero or more [0..*] entryRelationship (CONF:4515-31237) such that it"
  * typeCode 1..1
  * typeCode = #REFR (exactly)
    * ^comment = "SHALL contain exactly one [1..1] @typeCode=\"REFR\" Refers To (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:4515-31279)."
  * organizer 1..1
  * organizer only FamilyHistoryOrganizer
    * ^comment = "SHALL contain exactly one [1..1] Family History Organizer (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.4.45:2015-08-01) (CONF:4515-31280)."
* entryRelationship[entryRelationship11] ^short = "entryRelationship"
  * ^comment = "MAY contain zero or more [0..*] entryRelationship (CONF:4515-31238) such that it"
  * typeCode 1..1
  * typeCode = #REFR (exactly)
    * ^comment = "SHALL contain exactly one [1..1] @typeCode=\"REFR\" Refers to (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:4515-31282)."
  * observation 1..1
  * observation only FunctionalStatusObservation
    * ^comment = "SHALL contain exactly one [1..1] Functional Status Observation (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.4.67:2014-06-09) (CONF:4515-31283)."
* entryRelationship[entryRelationship12] ^short = "entryRelationship"
  * ^comment = "MAY contain zero or more [0..*] entryRelationship (CONF:4515-31241) such that it"
  * typeCode 1..1
  * typeCode = #REFR (exactly)
    * ^comment = "SHALL contain exactly one [1..1] @typeCode=\"REFR\" Refers to (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:4515-31291)."
  * act 1..1
  * act only HospitalAdmissionDiagnosis
    * ^comment = "SHALL contain exactly one [1..1] Hospital Admission Diagnosis (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.4.34:2015-08-01) (CONF:4515-31292)."
* entryRelationship[entryRelationship13] ^short = "entryRelationship"
  * ^comment = "MAY contain zero or more [0..*] entryRelationship (CONF:4515-31244) such that it"
  * typeCode 1..1
  * typeCode = #REFR (exactly)
    * ^comment = "SHALL contain exactly one [1..1] @typeCode=\"REFR\" Refers to (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:4515-31300)."
  * observation 1..1
  * observation only NutritionAssessment
    * ^comment = "SHALL contain exactly one [1..1] Nutrition Assessment (identifier: urn:oid:2.16.840.1.113883.10.20.22.4.138) (CONF:4515-31301)."
* entryRelationship[entryRelationship14] ^short = "entryRelationship"
  * ^comment = "MAY contain zero or more [0..*] entryRelationship (CONF:4515-31246) such that it"
  * typeCode 1..1
  * typeCode = #REFR (exactly)
    * ^comment = "SHALL contain exactly one [1..1] @typeCode=\"REFR\" Refers to (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:4515-31306)."
  * act 1..1
  * act only PostprocedureDiagnosis
    * ^comment = "SHALL contain exactly one [1..1] Postprocedure Diagnosis (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.4.51:2015-08-01) (CONF:4515-31307)."
* entryRelationship[entryRelationship15] ^short = "entryRelationship"
  * ^comment = "MAY contain zero or more [0..*] entryRelationship (CONF:4515-31247) such that it"
  * typeCode 1..1
  * typeCode = #REFR (exactly)
    * ^comment = "SHALL contain exactly one [1..1] @typeCode=\"REFR\" Refers to (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:4515-31309)."
  * observation 1..1
  * observation only PregnancyObservation
    * ^comment = "SHALL contain exactly one [1..1] Pregnancy Observation (identifier: urn:oid:2.16.840.1.113883.10.20.15.3.8) (CONF:4515-31310)."
* entryRelationship[entryRelationship16] ^short = "entryRelationship"
  * ^comment = "MAY contain zero or more [0..*] entryRelationship (CONF:4515-31248) such that it"
  * typeCode 1..1
  * typeCode = #REFR (exactly)
    * ^comment = "SHALL contain exactly one [1..1] @typeCode=\"REFR\" Refers to (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:4515-31312)."
  * act 1..1
  * act only PreoperativeDiagnosis
    * ^comment = "SHALL contain exactly one [1..1] Preoperative Diagnosis (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.4.65:2015-08-01) (CONF:4515-31313)."
* entryRelationship[entryRelationship17] ^short = "entryRelationship"
  * ^comment = "MAY contain zero or more [0..*] entryRelationship (CONF:4515-31250) such that it"
  * typeCode 1..1
  * typeCode = #REFR (exactly)
    * ^comment = "SHALL contain exactly one [1..1] @typeCode=\"REFR\" Refers to (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:4515-31318)."
  * observation 1..1
  * observation only ReactionObservation
    * ^comment = "SHALL contain exactly one [1..1] Reaction Observation (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.4.9:2014-06-09) (CONF:4515-31319)."
* entryRelationship[entryRelationship18] ^short = "entryRelationship"
  * ^comment = "MAY contain zero or more [0..*] entryRelationship (CONF:4515-31251) such that it"
  * typeCode 1..1
  * typeCode = #REFR (exactly)
    * ^comment = "SHALL contain exactly one [1..1] @typeCode=\"REFR\" Refers to (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:4515-31321)."
  * observation 1..1
  * observation only ResultObservation
    * ^comment = "SHALL contain exactly one [1..1] Result Observation (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.4.2:2015-08-01) (CONF:4515-31322)."
* entryRelationship[entryRelationship19] ^short = "entryRelationship"
  * ^comment = "MAY contain zero or more [0..*] entryRelationship (CONF:4515-31252) such that it"
  * typeCode 1..1
  * typeCode = #REFR (exactly)
    * ^comment = "SHALL contain exactly one [1..1] @typeCode=\"REFR\" Refers to (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:4515-31324)."
  * observation 1..1
  * observation only SensoryStatus
    * ^comment = "SHALL contain exactly one [1..1] Sensory Status (identifier: urn:oid:2.16.840.1.113883.10.20.22.4.127) (CONF:4515-31325)."
* entryRelationship[entryRelationship20] ^short = "entryRelationship"
  * ^comment = "MAY contain zero or more [0..*] entryRelationship (CONF:4515-31253) such that it"
  * typeCode 1..1
  * typeCode = #REFR (exactly)
    * ^comment = "SHALL contain exactly one [1..1] @typeCode=\"REFR\" Refers to (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:4515-31327)."
  * observation 1..1
  * observation only SocialHistoryObservation
    * ^comment = "SHALL contain exactly one [1..1] Social History Observation (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.4.38:2015-08-01) (CONF:4515-31328)."
* entryRelationship[entryRelationship21] ^short = "entryRelationship"
  * ^comment = "MAY contain zero or more [0..*] entryRelationship (CONF:4515-31254) such that it"
  * typeCode 1..1
  * typeCode = #REFR (exactly)
    * ^comment = "SHALL contain exactly one [1..1] @typeCode=\"REFR\" Refers to (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:4515-32961)."
  * observation 1..1
  * observation only SubstanceOrDeviceAllergyIntoleranceObservation
    * ^comment = "SHALL contain exactly one [1..1] Substance or Device Allergy - Intolerance Observation (identifier: urn:hl7ii:2.16.840.1.113883.10.20.24.3.90:2014-06-09) (CONF:4515-31331)."
* entryRelationship[entryRelationship22] ^short = "entryRelationship"
  * ^comment = "MAY contain zero or more [0..*] entryRelationship (CONF:4515-31255) such that it"
  * typeCode 1..1
  * typeCode = #REFR (exactly)
    * ^comment = "SHALL contain exactly one [1..1] @typeCode=\"REFR\" Refers to (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:4515-31333)."
  * observation 1..1
  * observation only TobaccoUse
    * ^comment = "SHALL contain exactly one [1..1] Tobacco Use (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.4.85:2014-06-09) (CONF:4515-31334)."
* entryRelationship[entryRelationship23] ^short = "entryRelationship"
  * ^comment = "MAY contain zero or more [0..*] entryRelationship (CONF:4515-31256) such that it"
  * typeCode 1..1
  * typeCode = #REFR (exactly)
    * ^comment = "SHALL contain exactly one [1..1] @typeCode=\"REFR\" Refers to (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:4515-31336)."
  * observation 1..1
  * observation only VitalSignObservation
    * ^comment = "SHALL contain exactly one [1..1] Vital Sign Observation (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.4.27:2014-06-09) (CONF:4515-31337)."
* entryRelationship[entryRelationship24] ^short = "entryRelationship"
  * ^comment = "MAY contain zero or more [0..*] entryRelationship (CONF:4515-31257) such that it"
  * typeCode 1..1
  * typeCode = #REFR (exactly)
    * ^comment = "SHALL contain exactly one [1..1] @typeCode=\"REFR\" Refers to (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:4515-31339)."
  * observation 1..1
  * observation only LongitudinalCareWoundObservation
    * ^comment = "SHALL contain exactly one [1..1] Longitudinal Care Wound Observation (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.4.114:2015-08-01) (CONF:4515-31340)."
* entryRelationship[entryRelationship25] ^short = "entryRelationship"
  * ^comment = "MAY contain zero or more [0..*] entryRelationship (CONF:4515-31365) such that it"
  * typeCode 1..1
  * typeCode = #SPRT (exactly)
    * ^comment = "SHALL contain exactly one [1..1] @typeCode=\"SPRT\" Has support (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:4515-31366)."
  * observation 1..1
  * observation only ProblemObservation
    * ^comment = "SHALL contain exactly one [1..1] Problem Observation (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.4.4:2015-08-01) (CONF:4515-31367)."
* entryRelationship[entryRelationship26] ^short = "entryRelationship"
  * ^comment = "MAY contain zero or more [0..*] entryRelationship (CONF:4515-31368) such that it"
  * typeCode 1..1
  * typeCode = #REFR (exactly)
    * ^comment = "SHALL contain exactly one [1..1] @typeCode=\"REFR\" Refers to (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:4515-31369)."
  * observation 1..1
  * observation only CaregiverCharacteristics
    * ^comment = "SHALL contain exactly one [1..1] Caregiver Characteristics (identifier: urn:oid:2.16.840.1.113883.10.20.22.4.72) (CONF:4515-31370)."
* entryRelationship[entryRelationship27] ^short = "entryRelationship"
  * ^comment = "MAY contain zero or more [0..*] entryRelationship (CONF:4515-31371) such that it"
  * typeCode 1..1
  * typeCode = #REFR (exactly)
    * ^comment = "SHALL contain exactly one [1..1] @typeCode=\"REFR\" Refers to (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:4515-31372)."
  * observation 1..1
  * observation only CulturalandReligiousObservation
    * ^comment = "SHALL contain exactly one [1..1] Cultural and Religious Observation (identifier: urn:oid:2.16.840.1.113883.10.20.22.4.111) (CONF:4515-31373)."
* entryRelationship[entryRelationship28] ^short = "entryRelationship"
  * ^comment = "MAY contain zero or more [0..*] entryRelationship (CONF:4515-31374) such that it"
  * typeCode 1..1
  * typeCode = #REFR (exactly)
    * ^comment = "SHALL contain exactly one [1..1] @typeCode=\"REFR\" Refers to (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:4515-31375)."
  * observation 1..1
  * observation only CharacteristicsofHomeEnvironment
    * ^comment = "SHALL contain exactly one [1..1] Characteristics of Home Environment (identifier: urn:oid:2.16.840.1.113883.10.20.22.4.109) (CONF:4515-31376)."
* entryRelationship[entryRelationship29] ^short = "entryRelationship"
  * ^comment = "MAY contain zero or more [0..*] entryRelationship (CONF:4515-31377) such that it"
  * typeCode 1..1
  * typeCode = #REFR (exactly)
    * ^comment = "SHALL contain exactly one [1..1] @typeCode=\"REFR\" Refers to (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:4515-31378)."
  * observation 1..1
  * observation only NutritionalStatusObservation
    * ^comment = "SHALL contain exactly one [1..1] Nutritional Status Observation (identifier: urn:oid:2.16.840.1.113883.10.20.22.4.124) (CONF:4515-31379)."
* entryRelationship[entryRelationship30] ^short = "entryRelationship"
  * ^comment = "MAY contain zero or more [0..*] entryRelationship (CONF:4515-31380) such that it"
  * typeCode 1..1
  * typeCode = #REFR (exactly)
    * ^comment = "SHALL contain exactly one [1..1] @typeCode=\"REFR\" Refers to (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:4515-31381)."
  * organizer 1..1
  * organizer only ResultOrganizer
    * ^comment = "SHALL contain exactly one [1..1] Result Organizer (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.4.1:2015-08-01) (CONF:4515-31382)."
* entryRelationship[entryRelationship31] ^short = "entryRelationship"
  * ^comment = "MAY contain zero or more [0..*] entryRelationship (CONF:4515-31442) such that it"
  * typeCode 1..1
  * typeCode = #REFR (exactly)
    * ^comment = "SHALL contain exactly one [1..1] @typeCode=\"REFR\" Refers to (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:4515-31443)."
  * observation 1..1
  * observation only PriorityPreference
    * ^comment = "SHALL contain exactly one [1..1] Priority Preference (identifier: urn:oid:2.16.840.1.113883.10.20.22.4.143) (CONF:4515-31444)."
* entryRelationship[entryRelationship32] ^short = "entryRelationship"
  * ^comment = "MAY contain zero or more [0..*] entryRelationship (CONF:4515-31549) such that it"
  * typeCode 1..1
  * typeCode = #REFR (exactly)
    * ^comment = "SHALL contain exactly one [1..1] @typeCode=\"REFR\" Refers to (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:4515-31550)."
  * act 1..1
  * act only EntryReference
    * ^comment = "SHALL contain exactly one [1..1] Entry Reference (identifier: urn:oid:2.16.840.1.113883.10.20.22.4.122) (CONF:4515-31551)."
* reference 0..*
  * ^comment = "MAY contain zero or more [0..*] reference (CONF:4515-32757)."
  * typeCode 1..1
  * typeCode = #REFR (exactly)
    * ^comment = "The reference, if present, SHALL contain exactly one [1..1] @typeCode=\"REFR\" Refers to (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:4515-32758)."
  * externalDocument 1..1
  * externalDocument only ExternalDocumentReference
    * ^comment = "The reference, if present, SHALL contain exactly one [1..1] External Document Reference (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.4.115:2014-06-09) (CONF:4515-32759)."

Invariant: 4515-32962
Description: "When this Health Concern Act is a Social Determinant of Health Health Concern it **SHOULD** contain zero or more [0..*] entryRelationship subentries such that it contains an observation with an observation/value selected from ValueSet [Social Determinant of Health Conditions 2.16.840.1.113762.1.4.1196.788](https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1196.788/expansion) **DYNAMIC** (CONF:4515-32962)."
Severity: #error

Invariant: 4515-32860
Description: "The Entry Reference template **SHALL** contain an id that references a Health Concern Act (CONF:4515-32860)."
Severity: #error

Invariant: 4515-32745
Description: "The Entry Reference template **SHALL** contain an id that references a Health Concern Act (CONF:4515-32745)."
Severity: #error