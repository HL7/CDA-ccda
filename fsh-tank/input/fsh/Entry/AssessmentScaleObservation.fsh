Profile: AssessmentScaleObservation
Parent: $Observation
Id: AssessmentScaleObservation
Title: "Assessment Scale Observation"
Description: """An assessment scale is a collection of observations that together can yield a calculated or non-calculated summary evaluation of a one or more conditions. Examples include the Braden Scale (assesses pressure ulcer risk), APACHE Score (estimates mortality in critically ill patients), Mini-Mental Status Exam (assesses cognitive function), APGAR Score (assesses the health of a newborn), Glasgow Coma Scale (assesses coma and impaired consciousness), and WE CARE (Well Child Care, Evaluation, Community Resources, Advocacy, Referral, Education - a clinic-based screening and referral system developed for pediatric settings).

When an Assessment Scale Observation is contained in a Problem Observation, a Social History Observation or a Procedure instance that is Social Determinant of Health focused, that Assessment scale **MAY** contain assessment scale observations that represent question and answer pairs from SDOH screening instruments that are represented in LOINC. Note that guidance on the use of LOINC in assessment scales already exists in Assessment Scale Observation constraints and Assessment Scale Supporting Observations constraints.

The Observation value is used to record a calculated score using an integer. A LOINC answer concept is used when the assessment is non-calculated result."""

* insert LogicalModelTemplate(assessment-scale-obs, 2.16.840.1.113883.10.20.22.4.69, 2022-06-01)
* insert NarrativeLink

* classCode 1..1
* classCode = #OBS (exactly)
  * ^comment = "SHALL contain exactly one [1..1] @classCode=\"OBS\" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:4515-14434)."
* moodCode 1..1
* moodCode = #EVN (exactly)
  * ^comment = "SHALL contain exactly one [1..1] @moodCode=\"EVN\" (CodeSystem: HL7ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:4515-14435)."
* id 1..*
  * ^comment = "SHALL contain at least one [1..*] id (CONF:4515-14438)."
* insert FixedCategory(survey, 2.16.840.1.113883.4.642.1.1125, Survey, survey)
* code 1..1
* code from $ScreeningAssessmentSurveyCodes
  * obeys should-translation
  * translation 0..*
  * translation from $SDoHAssessmentsAndQuestions (preferred)
  * ^short = "For Social Determinant of Health Assessments"
* derivationExpr 0..1
  * ^comment = "MAY contain zero or one [0..1] derivationExpr (CONF:4515-14637)."
  * ^short = "Such derivation expression can contain a text calculation of how the components total up to the summed score"
* statusCode 1..1
  * ^comment = "SHALL contain exactly one [1..1] statusCode (CONF:4515-14444)."
  * code 1..1
  * code = #completed (exactly)
    * ^comment = "This statusCode SHALL contain exactly one [1..1] @code=\"completed\" Completed (CodeSystem: HL7ActStatus urn:oid:2.16.840.1.113883.5.14 STATIC) (CONF:4515-19088)."
* effectiveTime 1..1
  * ^comment = "SHALL contain exactly one [1..1] effectiveTime (CONF:4515-14445)."
  * ^short = "Represents clinically effective time of the measurement, which may be when the measurement was performed (e.g., a BP measurement), or may be when sample was taken (and measured some time afterwards)"
* value 1..1
  * insert USCDI([[Functional Status, Mental/Cognitive Status, Alcohol Use, Substance Use, Physical Activity, SDOH Assessment]])
  * ^comment = "SHALL contain exactly one [1..1] value (CONF:4515-14450)."
  * ^short = "This is intended to hold the overall assessment score.  This could be calculated from the contained Assessment Scale Supporting Observations"
* interpretationCode 0..*
  * ^comment = "MAY contain zero or more [0..*] interpretationCode (CONF:4515-14459)."
  * translation 0..*
    * ^comment = "The interpretationCode, if present, MAY contain zero or more [0..*] translation (CONF:4515-14888)."
* author 0..*
  * ^comment = "MAY contain zero or more [0..*] author (CONF:4515-14460)."
* entryRelationship ^slicing.discriminator[0].type = #profile
  * ^slicing.discriminator[=].path = "observation"
  * ^slicing.discriminator[+].type = #value
  * ^slicing.discriminator[=].path = "typeCode"
  * ^slicing.rules = #open
  * ^comment = "SHOULD contain zero or more [0..*] entryRelationship (CONF:4515-14451) such that it"
* entryRelationship contains supportingObs 0..*
* entryRelationship[supportingObs] ^short = "entryRelationship"
  * ^comment = "SHOULD contain zero or more [0..*] entryRelationship (CONF:4515-14451) such that it"
  * typeCode 1..1
  * typeCode = #COMP (exactly)
    * ^comment = "SHALL contain exactly one [1..1] @typeCode=\"COMP\" has component (CONF:4515-16741)."
  * observation 1..1
  * observation only AssessmentScaleSupportingObservation
    * ^comment = "SHALL contain exactly one [1..1] Assessment Scale Supporting Observation (identifier: urn:oid:2.16.840.1.113883.10.20.22.4.86) (CONF:4515-16742)."
* referenceRange 0..*
  * ^comment = "MAY contain zero or more [0..*] referenceRange (CONF:4515-16799)."
  * ^short = "The referenceRange/observationRange/text, if present, MAY contain a description of the scale (e.g., for a Pain Scale 1 to 10: 1 to 3 = little pain, 4 to 7 = moderate pain, 8 to 10 = severe pain)"
  * observationRange 1..1
    * ^comment = "The referenceRange, if present, SHALL contain exactly one [1..1] observationRange (CONF:4515-16800)."
    * obeys should-text
    * insert NarrativeLink
    * text 0..1
      * ^comment = "This observationRange SHOULD contain zero or one [0..1] text (CONF:4515-16801)." // auto-should
      * ^short = "The text may contain a description of the scale (e.g., for a Pain Scale 1 to 10:  1 to 3 = little pain, 4 to 7= moderate pain, 8 to 10 = severe pain)"
