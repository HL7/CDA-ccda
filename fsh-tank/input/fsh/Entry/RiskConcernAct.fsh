Profile: RiskConcernAct
Parent: $Act
Id: RiskConcernAct
Title: "Risk Concern Act"
Description: """This template represents a risk concern. 

It is a wrapper for a single risk concern which may be derived from a variety of sources within an EHR (such as Problem List, Family History, Social History, Social Worker Note, etc.). 

A Risk Concern Act represents a health concern that is a risk. A risk is a clinical or socioeconomic condition that the patient does not currently have, but the probability of developing that condition rises to the level of concern such that an intervention and/or monitoring is needed."""

* insert LogicalModelTemplate(risk-concern-act, 2.16.840.1.113883.10.20.22.4.136, 2015-08-01)
* insert NarrativeLink

* classCode 1..1
* classCode = #ACT (exactly)
  * ^comment = "SHALL contain exactly one [1..1] @classCode=\"ACT\" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:1198-32220)."
* moodCode 1..1
* moodCode = #EVN (exactly)
  * ^comment = "SHALL contain exactly one [1..1] @moodCode=\"EVN\" (CodeSystem: HL7ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:1198-32221)."
* id 1..*
  * ^comment = "SHALL contain at least one [1..*] id (CONF:1198-32223)."
* code 1..1
  * ^comment = "SHALL contain exactly one [1..1] code (CONF:1198-32305)."
  * insert CodedSnomed(281694009, [[At risk - finding]])
* statusCode 1..1
  * ^comment = "SHALL contain exactly one [1..1] statusCode (CONF:1198-32225)."
  * insert BindAtCode($2.16.840.1.113883.11.20.9.19, required)
* effectiveTime 0..1
  * ^comment = "MAY contain zero or one [0..1] effectiveTime (CONF:1198-32226)."
* obeys should-author
* author 0..*
* author only AuthorParticipation
  * ^comment = "SHOULD contain zero or more [0..*] Author Participation (identifier: urn:oid:2.16.840.1.113883.10.20.22.4.119) (CONF:1198-32300)." // man-should
* entryRelationship 
  * ^slicing.discriminator[+].type = #value
  * ^slicing.discriminator[=].path = "typeCode"
  * ^slicing.discriminator[+].type = #profile
  * ^slicing.discriminator[=].path = "observation"
  * ^slicing.discriminator[+].type = #profile
  * ^slicing.discriminator[=].path = "act"
  * ^slicing.discriminator[+].type = #profile
  * ^slicing.discriminator[=].path = "organizer"
  * ^slicing.rules = #open
  * ^short = "Where a Health Concern needs to reference another entry already described in the CDA document instance, rather than repeating the full content of the entry, the Entry Reference template may be used to reference this entry."
* entryRelationship contains
    problemObservation1 0..* and
    allergy-IntoleranceObservation 0..* and
    entryReferenceRefr 0..* and
    entryReferenceComp 0..* and
    assessmentScaleObservation 0..* and
    mentalStatusObservation1 0..* and
    self-CareActivitiesADLandIADL 0..* and
    mentalStatusObservation2 0..* and
    smokingStatus 0..* and
    encounterDiagnosis 0..* and
    entryRelationship11 0..* and
    functionalStatusObservation 0..* and
    hospitalAdmissionDiagnosis 0..* and
    nutritionAssessment 0..* and
    postprocedureDiagnosis 0..* and
    pregnancyStatusObservation 0..* and
    preoperativeDiagnosis 0..* and
    reactionObservation 0..* and
    resultObservation 0..* and
    sensoryStatus 0..* and
    socialHistoryObservation 0..* and
    substanceorDeviceAllergy-IntoleranceObservation 0..* and
    vitalSignObservation 0..* and
    longitudinalCareWoundObservation 0..* and
    problemObservation2 0..* and
    caregiverCharacteristics 0..* and
    culturalandReligiousObservation 0..* and
    characteristicsofHomeEnvironment 0..* and
    nutritionalStatusObservation 0..* and
    resultOrganizer 0..* and
    priorityPreference1 0..* and
    priorityPreference2 0..* and
    problemConcernAct 0..*
* entryRelationship[problemObservation1] ^comment = "MAY contain zero or more [0..*] entryRelationship (CONF:1198-32179) such that it"
  * typeCode 1..1
  * typeCode = #REFR (exactly)
    * ^comment = "SHALL contain exactly one [1..1] @typeCode=\"REFR\" Refers to (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:1198-32227)."
  * observation 1..1
  * observation only ProblemObservation
    * ^comment = "SHALL contain exactly one [1..1] Problem Observation (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.4.4:2015-08-01) (CONF:1198-32219)."
* entryRelationship[allergy-IntoleranceObservation] ^comment = "MAY contain zero or more [0..*] entryRelationship (CONF:1198-32181) such that it"
  * typeCode 1..1
  * typeCode = #REFR (exactly)
    * ^comment = "SHALL contain exactly one [1..1] @typeCode=\"REFR\" Refers to (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:1198-32228)."
  * observation 1..1
  * observation only AllergyIntoleranceObservation
    * ^comment = "SHALL contain exactly one [1..1] Allergy - Intolerance Observation (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.4.7:2014-06-09) (CONF:1198-32229)."
* entryRelationship[entryReferenceRefr] ^short = "The following entryRelationship represents the relationship between two Health Concern Acts where there is a general relationship between the source and the target (Health Concern RELATES TO Health Concern). It can also represent the relationship between a Health Concern and another entry already described in the CDA document instance. The Entry Reference template is used here because the target entry will be defined elsewhere and thus a reference to that instance is all that is required."
  * ^comment = "MAY contain zero or more [0..*] entryRelationship (CONF:1198-32182) such that it"
  * typeCode 1..1
  * typeCode = #REFR (exactly)
    * ^comment = "SHALL contain exactly one [1..1] @typeCode=\"REFR\" Refers to (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:1198-32230)."
  * act 1..1
  * act only EntryReference
    * ^comment = "SHALL contain exactly one [1..1] Entry Reference (identifier: urn:oid:2.16.840.1.113883.10.20.22.4.122) (CONF:1198-32231)."
* entryRelationship[entryReferenceComp] ^short = "The following entryRelationship represents the relationship between two Health Concern Acts where the target is a component of the source (Health Concern HAS COMPONENT Health Concern). The Enry Reference template is used here because the target Health Concern Act will be defined elsewhere in the Health Concerns Section and thus a reference to that template is all that is required."
  * ^comment = "MAY contain zero or more [0..*] entryRelationship (CONF:1198-32183) such that it"
  * typeCode 1..1
  * typeCode = #COMP (exactly)
    * ^comment = "SHALL contain exactly one [1..1] @typeCode=\"COMP\" Has component (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:1198-32232)."
  * act 1..1
  * act only EntryReference
    * ^comment = "SHALL contain exactly one [1..1] Entry Reference (identifier: urn:oid:2.16.840.1.113883.10.20.22.4.122) (CONF:1198-32233)."
* entryRelationship[assessmentScaleObservation] ^comment = "MAY contain zero or more [0..*] entryRelationship (CONF:1198-32184) such that it"
  * typeCode 1..1
  * typeCode = #REFR (exactly)
    * ^comment = "SHALL contain exactly one [1..1] @typeCode=\"REFR\" Refers to (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:1198-32234)."
  * observation 1..1
  * observation only AssessmentScaleObservation
    * ^comment = "SHALL contain exactly one [1..1] Assessment Scale Observation (identifier: urn:oid:2.16.840.1.113883.10.20.22.4.69) (CONF:1198-32235)."
* entryRelationship[mentalStatusObservation1] ^comment = "MAY contain zero or more [0..*] entryRelationship (CONF:1198-32185) such that it"
  * typeCode 1..1
  * typeCode = #REFR (exactly)
    * ^comment = "SHALL contain exactly one [1..1] @typeCode=\"REFR\" Refers to (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:1198-32236)."
  * observation 1..1
  * observation only MentalStatusObservation
    * ^comment = "SHALL contain exactly one [1..1] Mental Status Observation (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.4.74:2015-08-01) (CONF:1198-32237)."
* entryRelationship[self-CareActivitiesADLandIADL] ^comment = "MAY contain zero or more [0..*] entryRelationship (CONF:1198-32186) such that it"
  * typeCode 1..1
  * typeCode = #REFR (exactly)
    * ^comment = "SHALL contain exactly one [1..1] @typeCode=\"REFR\" Refers to (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:1198-32238)."
  * observation 1..1
  * observation only SelfCareActivitiesADLandIADL
    * ^comment = "SHALL contain exactly one [1..1] Self-Care Activities (ADL and IADL) (identifier: urn:oid:2.16.840.1.113883.10.20.22.4.128) (CONF:1198-32239)."
* entryRelationship[mentalStatusObservation2] ^comment = "MAY contain zero or more [0..*] entryRelationship (CONF:1198-32188) such that it"
  * typeCode 1..1
  * typeCode = #REFR (exactly)
    * ^comment = "SHALL contain exactly one [1..1] @typeCode=\"REFR\" Refers to (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:1198-32242)."
  * observation 1..1
  * observation only MentalStatusObservation
    * ^comment = "SHALL contain exactly one [1..1] Mental Status Observation (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.4.74:2015-08-01) (CONF:1198-32243)."
* entryRelationship[smokingStatus] ^comment = "MAY contain zero or more [0..*] entryRelationship (CONF:1198-32189) such that it"
  * typeCode 1..1
  * typeCode = #REFR (exactly)
    * ^comment = "SHALL contain exactly one [1..1] @typeCode=\"REFR\" Refers to (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:1198-32244)."
  * observation 1..1
  * observation only SmokingStatus
    * ^comment = "SHALL contain exactly one [1..1] Smoking Status (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.4.511:2024-05-01) (CONF:1198-32245)."
* entryRelationship[encounterDiagnosis] ^comment = "MAY contain zero or more [0..*] entryRelationship (CONF:1198-32190) such that it"
  * typeCode 1..1
  * typeCode = #REFR (exactly)
    * ^comment = "SHALL contain exactly one [1..1] @typeCode=\"REFR\" Refers to (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:1198-32246)."
  * act 1..1
  * act only EncounterDiagnosis
    * ^comment = "SHALL contain exactly one [1..1] Encounter Diagnosis (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.4.80:2015-08-01) (CONF:1198-32247)."
* entryRelationship[entryRelationship11] ^comment = "MAY contain zero or more [0..*] entryRelationship (CONF:1198-32191) such that it"
  * typeCode 1..1
  * typeCode = #REFR (exactly)
    * ^comment = "SHALL contain exactly one [1..1] @typeCode=\"REFR\" Refers To (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:1198-32248)."
  * organizer 1..1
  * organizer only FamilyHistoryOrganizer
    * ^comment = "SHALL contain exactly one [1..1] Family History Organizer (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.4.45:2015-08-01) (CONF:1198-32249)."
* entryRelationship[functionalStatusObservation] ^comment = "MAY contain zero or more [0..*] entryRelationship (CONF:1198-32192) such that it"
  * typeCode 1..1
  * typeCode = #REFR (exactly)
    * ^comment = "SHALL contain exactly one [1..1] @typeCode=\"REFR\" Refers to (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:1198-32250)."
  * observation 1..1
  * observation only FunctionalStatusObservation
    * ^comment = "SHALL contain exactly one [1..1] Functional Status Observation (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.4.67:2014-06-09) (CONF:1198-32251)."
* entryRelationship[hospitalAdmissionDiagnosis] ^comment = "MAY contain zero or more [0..*] entryRelationship (CONF:1198-32193) such that it"
  * typeCode 1..1
  * typeCode = #REFR (exactly)
    * ^comment = "SHALL contain exactly one [1..1] @typeCode=\"REFR\" Refers to (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:1198-32252)."
  * act 1..1
  * act only HospitalAdmissionDiagnosis
    * ^comment = "SHALL contain exactly one [1..1] Hospital Admission Diagnosis (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.4.34:2015-08-01) (CONF:1198-32253)."
* entryRelationship[nutritionAssessment] ^comment = "MAY contain zero or more [0..*] entryRelationship (CONF:1198-32195) such that it"
  * typeCode 1..1
  * typeCode = #REFR (exactly)
    * ^comment = "SHALL contain exactly one [1..1] @typeCode=\"REFR\" Refers to (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:1198-32256)."
  * observation 1..1
  * observation only NutritionAssessment
    * ^comment = "SHALL contain exactly one [1..1] Nutrition Assessment (identifier: urn:oid:2.16.840.1.113883.10.20.22.4.138) (CONF:1198-32257)."
* entryRelationship[postprocedureDiagnosis] ^comment = "MAY contain zero or more [0..*] entryRelationship (CONF:1198-32197) such that it"
  * typeCode 1..1
  * typeCode = #REFR (exactly)
    * ^comment = "SHALL contain exactly one [1..1] @typeCode=\"REFR\" Refers to (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:1198-32260)."
  * act 1..1
  * act only PostprocedureDiagnosis
    * ^comment = "SHALL contain exactly one [1..1] Postprocedure Diagnosis (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.4.51:2015-08-01) (CONF:1198-32261)."
* entryRelationship[pregnancyStatusObservation] ^comment = "MAY contain zero or more [0..*] entryRelationship (CONF:1198-32198) such that it"
  * typeCode 1..1
  * typeCode = #REFR (exactly)
    * ^comment = "SHALL contain exactly one [1..1] @typeCode=\"REFR\" Refers to (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:1198-32262)."
  * observation 1..1
  * observation only PregnancyStatusObservation
    * ^comment = "SHALL contain exactly one [1..1] Pregnancy Status Observation (identifier: urn:oid:2.16.840.1.113883.10.20.15.3.8) (CONF:1198-32263)."
* entryRelationship[preoperativeDiagnosis] ^comment = "MAY contain zero or more [0..*] entryRelationship (CONF:1198-32199) such that it"
  * typeCode 1..1
  * typeCode = #REFR (exactly)
    * ^comment = "SHALL contain exactly one [1..1] @typeCode=\"REFR\" Refers to (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:1198-32264)."
  * act 1..1
  * act only PreoperativeDiagnosis
    * ^comment = "SHALL contain exactly one [1..1] Preoperative Diagnosis (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.4.65:2015-08-01) (CONF:1198-32265)."
* entryRelationship[reactionObservation] ^comment = "MAY contain zero or more [0..*] entryRelationship (CONF:1198-32200) such that it"
  * typeCode 1..1
  * typeCode = #REFR (exactly)
    * ^comment = "SHALL contain exactly one [1..1] @typeCode=\"REFR\" Refers to (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:1198-32266)."
  * observation 1..1
  * observation only ReactionObservation
    * ^comment = "SHALL contain exactly one [1..1] Reaction Observation (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.4.9:2014-06-09) (CONF:1198-32267)."
* entryRelationship[resultObservation] ^comment = "MAY contain zero or more [0..*] entryRelationship (CONF:1198-32201) such that it"
  * typeCode 1..1
  * typeCode = #REFR (exactly)
    * ^comment = "SHALL contain exactly one [1..1] @typeCode=\"REFR\" Refers to (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:1198-32268)."
  * observation 1..1
  * observation only ResultObservation
    * ^comment = "SHALL contain exactly one [1..1] Result Observation (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.4.2:2015-08-01) (CONF:1198-32269)."
* entryRelationship[sensoryStatus] ^comment = "MAY contain zero or more [0..*] entryRelationship (CONF:1198-32202) such that it"
  * typeCode 1..1
  * typeCode = #REFR (exactly)
    * ^comment = "SHALL contain exactly one [1..1] @typeCode=\"REFR\" Refers to (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:1198-32270)."
  * observation 1..1
  * observation only SensoryStatus
    * ^comment = "SHALL contain exactly one [1..1] Sensory Status (identifier: urn:oid:2.16.840.1.113883.10.20.22.4.127) (CONF:1198-32271)."
* entryRelationship[socialHistoryObservation] ^comment = "MAY contain zero or more [0..*] entryRelationship (CONF:1198-32203) such that it"
  * typeCode 1..1
  * typeCode = #REFR (exactly)
    * ^comment = "SHALL contain exactly one [1..1] @typeCode=\"REFR\" Refers to (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:1198-32272)."
  * observation 1..1
  * observation only SocialHistoryObservation
    * ^comment = "SHALL contain exactly one [1..1] Social History Observation (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.4.38:2015-08-01) (CONF:1198-32273)."
* entryRelationship[substanceorDeviceAllergy-IntoleranceObservation] ^comment = "MAY contain zero or more [0..*] entryRelationship (CONF:1198-32204) such that it"
  * typeCode 1..1
  * typeCode = #REFR (exactly)
    * ^comment = "SHALL contain exactly one [1..1] @typeCode=\"REFR\" Refers to (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:1198-32958)."
  * observation 1..1
  * observation only SubstanceOrDeviceAllergyIntoleranceObservation
    * ^comment = "SHALL contain exactly one [1..1] Substance or Device Allergy - Intolerance Observation (identifier: urn:hl7ii:2.16.840.1.113883.10.20.24.3.90:2014-06-09) (CONF:1198-32275)."
* entryRelationship[vitalSignObservation] ^comment = "MAY contain zero or more [0..*] entryRelationship (CONF:1198-32206) such that it"
  * typeCode 1..1
  * typeCode = #REFR (exactly)
    * ^comment = "SHALL contain exactly one [1..1] @typeCode=\"REFR\" Refers to (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:1198-32278)."
  * observation 1..1
  * observation only VitalSignObservation
    * ^comment = "SHALL contain exactly one [1..1] Vital Sign Observation (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.4.27:2014-06-09) (CONF:1198-32279)."
* entryRelationship[longitudinalCareWoundObservation] ^comment = "MAY contain zero or more [0..*] entryRelationship (CONF:1198-32207) such that it"
  * typeCode 1..1
  * typeCode = #REFR (exactly)
    * ^comment = "SHALL contain exactly one [1..1] @typeCode=\"REFR\" Refers to (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:1198-32280)."
  * observation 1..1
  * observation only LongitudinalCareWoundObservation
    * ^comment = "SHALL contain exactly one [1..1] Longitudinal Care Wound Observation (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.4.114:2015-08-01) (CONF:1198-32281)."
* entryRelationship[problemObservation2] ^short = "The following entryRelationship represents the relationship Health Concern HAS SUPPORT Observation."
  * ^comment = "MAY contain zero or more [0..*] entryRelationship (CONF:1198-32208) such that it"
  * typeCode 1..1
  * typeCode = #SPRT (exactly)
    * ^comment = "SHALL contain exactly one [1..1] @typeCode=\"SPRT\" Has support (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:1198-32282)."
  * observation 1..1
  * observation only ProblemObservation
    * ^comment = "SHALL contain exactly one [1..1] Problem Observation (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.4.4:2015-08-01) (CONF:1198-32283)."
* entryRelationship[caregiverCharacteristics] ^comment = "MAY contain zero or more [0..*] entryRelationship (CONF:1198-32209) such that it"
  * typeCode 1..1
  * typeCode = #REFR (exactly)
    * ^comment = "SHALL contain exactly one [1..1] @typeCode=\"REFR\" Refers to (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:1198-32284)."
  * observation 1..1
  * observation only CaregiverCharacteristics
    * ^comment = "SHALL contain exactly one [1..1] Caregiver Characteristics (identifier: urn:oid:2.16.840.1.113883.10.20.22.4.72) (CONF:1198-32285)."
* entryRelationship[culturalandReligiousObservation] ^comment = "MAY contain zero or more [0..*] entryRelationship (CONF:1198-32210) such that it"
  * typeCode 1..1
  * typeCode = #REFR (exactly)
    * ^comment = "SHALL contain exactly one [1..1] @typeCode=\"REFR\" Refers to (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:1198-32286)."
  * observation 1..1
  * observation only CulturalandReligiousObservation
    * ^comment = "SHALL contain exactly one [1..1] Cultural and Religious Observation (identifier: urn:oid:2.16.840.1.113883.10.20.22.4.111) (CONF:1198-32287)."
* entryRelationship[characteristicsofHomeEnvironment] ^comment = "MAY contain zero or more [0..*] entryRelationship (CONF:1198-32211) such that it"
  * typeCode 1..1
  * typeCode = #REFR (exactly)
    * ^comment = "SHALL contain exactly one [1..1] @typeCode=\"REFR\" Refers to (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:1198-32288)."
  * observation 1..1
  * observation only CharacteristicsofHomeEnvironment
    * ^comment = "SHALL contain exactly one [1..1] Characteristics of Home Environment (identifier: urn:oid:2.16.840.1.113883.10.20.22.4.109) (CONF:1198-32289)."
* entryRelationship[nutritionalStatusObservation] ^comment = "MAY contain zero or more [0..*] entryRelationship (CONF:1198-32212) such that it"
  * typeCode 1..1
  * typeCode = #REFR (exactly)
    * ^comment = "SHALL contain exactly one [1..1] @typeCode=\"REFR\" Refers to (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:1198-32290)."
  * observation 1..1
  * observation only NutritionalStatusObservation
    * ^comment = "SHALL contain exactly one [1..1] Nutritional Status Observation (identifier: urn:oid:2.16.840.1.113883.10.20.22.4.124) (CONF:1198-32291)."
* entryRelationship[resultOrganizer] ^comment = "MAY contain zero or more [0..*] entryRelationship (CONF:1198-32213) such that it"
  * typeCode 1..1
  * typeCode = #REFR (exactly)
    * ^comment = "SHALL contain exactly one [1..1] @typeCode=\"REFR\" Refers to (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:1198-32292)."
  * organizer 1..1
  * organizer only ResultOrganizer
    * ^comment = "SHALL contain exactly one [1..1] Result Organizer (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.4.1:2015-08-01) (CONF:1198-32293)."
* entryRelationship[priorityPreference1] ^short = "The following entryRelationship represents the priority that the patient puts on the health concern."
  * ^comment = "MAY contain zero or more [0..*] entryRelationship (CONF:1198-32214) such that it"
  * typeCode 1..1
  * typeCode = #REFR (exactly)
    * ^comment = "SHALL contain exactly one [1..1] @typeCode=\"REFR\" Refers to (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:1198-32294)."
  * observation 1..1
  * observation only PriorityPreference
    * ^comment = "SHALL contain exactly one [1..1] Priority Preference (identifier: urn:oid:2.16.840.1.113883.10.20.22.4.143) (CONF:1198-32295)."
* entryRelationship[priorityPreference2] ^short = "The following entryRelationship represents the priority that the provider puts on the health concern."
  * ^comment = "MAY contain zero or more [0..*] entryRelationship (CONF:1198-32215) such that it"
  * typeCode 1..1
  * typeCode = #REFR (exactly)
    * ^comment = "SHALL contain exactly one [1..1] @typeCode=\"REFR\" Refers to (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:1198-32296)."
  * observation 1..1
  * observation only PriorityPreference
    * ^comment = "SHALL contain exactly one [1..1] Priority Preference (identifier: urn:oid:2.16.840.1.113883.10.20.22.4.143) (CONF:1198-32297)."
* entryRelationship[problemConcernAct] ^comment = "MAY contain zero or more [0..*] entryRelationship (CONF:1198-32216) such that it"
  * typeCode 1..1
  * typeCode = #REFR (exactly)
    * ^comment = "SHALL contain exactly one [1..1] @typeCode=\"REFR\" Refers to (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:1198-32298)."
  * act 1..1
  * act only ProblemConcernAct
    * ^comment = "SHALL contain exactly one [1..1] Problem Concern Act (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.4.3:2015-08-01) (CONF:1198-32299)."
* reference 0..*
  * ^comment = "MAY contain zero or more [0..*] reference (CONF:1198-32769)."
  * typeCode 1..1
  * typeCode = #REFR (exactly)
    * ^comment = "The reference, if present, SHALL contain exactly one [1..1] @typeCode=\"REFR\" Refers to (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:1198-32908)."
  * externalDocument 1..1
  * externalDocument only ExternalDocumentReference
    * ^comment = "The reference, if present, SHALL contain exactly one [1..1] External Document Reference (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.4.115:2014-06-09) (CONF:1198-32909)."