Profile: ProblemObservation
Parent: $Observation
Id: ProblemObservation
Title: "Problem Observation"
Description: """This template reflects a discrete observation about a patient's problem. Because it is a discrete observation, it will have a statusCode of "completed". The effectiveTime, also referred to as the "biologically relevant time" is the time at which the observation holds for the patient. For a provider seeing a patient in the clinic today, observing a history of heart attack that occurred five years ago, the effectiveTime is five years ago. 

The effectiveTime of the Problem Observation is the definitive indication of whether or not the underlying condition is inactive. If the problem is known to be resolved, in remission, or otherwise inactive, then an effectiveTime/high would be present. If the date of resolution is not known, then effectiveTime/high will be present with a nullFlavor of "UNK"."""

* insert LogicalModelTemplate(problem-obs, 2.16.840.1.113883.10.20.22.4.4, 2024-05-01)
* insert NarrativeLink

* classCode 1..1
* classCode = #OBS (exactly)
  * ^comment = "SHALL contain exactly one [1..1] @classCode=\"OBS\" Observation (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:1198-9041)."
* moodCode 1..1
* moodCode = #EVN (exactly)
  * ^comment = "SHALL contain exactly one [1..1] @moodCode=\"EVN\" Event (CodeSystem: HL7ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:1198-9042)."
* negationInd 0..1
  * ^short = "The negationInd is used to indicate the absence of the condition in observation/value. A negationInd of \"true\" coupled with an observation/value of SNOMED code 64572001 \"Disease (disorder)\" indicates that the patient has no known conditions."
  * ^comment = "MAY contain zero or one [0..1] @negationInd (CONF:1198-10139)."
* id 1..*
  * ^comment = "SHALL contain at least one [1..*] id (CONF:1198-9043)."
* code 1..1
* code from $2.16.840.1.113762.1.4.1267.1 (preferred)
* statusCode 1..1
  * ^comment = "SHALL contain exactly one [1..1] statusCode (CONF:1198-9049)."
  * code 1..1
  * code = #completed (exactly)
    * ^comment = "This statusCode SHALL contain exactly one [1..1] @code=\"completed\" Completed (CodeSystem: HL7ActStatus urn:oid:2.16.840.1.113883.5.14 STATIC) (CONF:1198-19112)."
* effectiveTime 1..1
  * ^short = "If the problem is known to be resolved, but the date of resolution is not known, then the high element **SHALL** be present, and the nullFlavor attribute **SHALL** be set to 'UNK'. Therefore, the existence of a high element within a problem does indicate that the problem has been resolved."
  * ^comment = "SHALL contain exactly one [1..1] effectiveTime (CONF:1198-9050)."
  * low 1..1
    * ^short = "The effectiveTime/low (a.k.a. \"onset date\") asserts when the condition became biologically active."
    * ^comment = "This effectiveTime SHALL contain exactly one [1..1] low (CONF:1198-15603)."
  * high 0..1
    * insert USCDI([[Date of Resolution - The effectiveTime/high (a.k.a. resolution date) asserts when the condition became biologically resolved.]])
    * ^comment = "This effectiveTime MAY contain zero or one [0..1] high (CONF:1198-15604)."
* value 1..1
* value only $CD
* value from http://hl7.org/fhir/us/core/ValueSet/us-core-condition-code (preferred)
  * insert USCDI([[SDOH Problems/Health Concerns]])
  * ^comment = "SHALL contain exactly one [1..1] value with @xsi:type=\"CD\", where the code SHOULD be selected from ValueSet US Core Condition Codes."
  * code 0..1
    * ^short = "A negationInd of \"true\" coupled with an observation/value/@code of SNOMED code 64572001 \"Disease (disorder)\" indicates that the patient has no known conditions.  When the Problem is Social Determinant of Health Observation, the observation/value SHOULD be a SNOMED code selected from ValueSet Social Determinant of Health Conditions 2.16.840.1.113762.1.4.1196.788 DYNAMIC (CONF:4515-32951)."
    * ^comment = "This value MAY contain zero or one [0..1] @code (CONF:1198-31871)."
    * ^binding.strength = #example
    * ^binding.description = "See additional binding"
    * insert AdditionalBinding(preferred, $SDoHConditions, Social Determinant of Health Observations, [[If the Social History Observation is a Social Determinant of Health Observation, the observation/value code **SHOULD** be selected from ValueSet [Social Determinant of Health Conditions 2.16.840.1.113762.1.4.1196.788](http://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1196.788/expansion) **DYNAMIC** (CONF:4515-32957).]])
  * qualifier 0..*
    * ^short = "The observation/value and all the qualifiers together (often referred to as a post-coordinated expression) make up one concept. Qualifiers constrain the meaning of the primary code, and cannot negate it or change its meaning. Qualifiers can only be used according to well-defined rules of post-coordination and only if the underlying code system defines the use of such qualifiers or if there is a third code system that specifies how other code systems may be combined.\n\n In cases where SNOMED CT does not have a precoordinated code that would be appropriate for the problem list, concept post coordination may be used in CDA following the principles outlined in HL7 Version 3 Implementation Guide: TermInfo -
Using SNOMED CT in CDA R2 Models, Release 1 using the V3 CD Data type 1 style.  This is shown in the sample XML."
    * ^comment = "This value MAY contain zero or more [0..*] qualifier (CONF:1198-31870)."
* insert ShouldElement(author)
* author 0..*
* author only AuthorParticipation
  * ^comment = "SHOULD contain zero or more [0..*] Author Participation (identifier: urn:oid:2.16.840.1.113883.10.20.22.4.119) (CONF:1198-31147)." // man-should
* entryRelationship 
  * ^slicing.discriminator[0].type = #profile
  * ^slicing.discriminator[=].path = "observation"
  * ^slicing.discriminator[+].type = #profile
  * ^slicing.discriminator[=].path = "act"
  * ^slicing.rules = #open
* entryRelationship contains
    age 0..1 and
    prognosis 0..1 and
    priority 0..* and
    status 0..1 and
	reference 0..1 and
	assessment 0..1 and
	dateOfDiagnosis 0..1
* entryRelationship[age] ^comment = "MAY contain zero or one [0..1] entryRelationship (CONF:1198-9059) such that it"
  * typeCode 1..1
  * typeCode = #SUBJ (exactly)
    * ^comment = "SHALL contain exactly one [1..1] @typeCode=\"SUBJ\" Has subject (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002 STATIC) (CONF:1198-9060)."
  * inversionInd 1..1
  * inversionInd = true (exactly)
    * ^comment = "SHALL contain exactly one [1..1] @inversionInd=\"true\" True (CONF:1198-9069)."
  * observation 1..1
  * observation only AgeObservation
    * ^comment = "SHALL contain exactly one [1..1] Age Observation (identifier: urn:oid:2.16.840.1.113883.10.20.22.4.31) (CONF:1198-15590)."
* entryRelationship[prognosis] ^comment = "MAY contain zero or one [0..1] entryRelationship (CONF:1198-29951) such that it"
  * typeCode 1..1
  * typeCode = #REFR (exactly)
    * ^comment = "SHALL contain exactly one [1..1] @typeCode=\"REFR\" Refers to (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:1198-31531)."
  * observation 1..1
  * observation only PrognosisObservation
    * ^comment = "SHALL contain exactly one [1..1] Prognosis Observation (identifier: urn:oid:2.16.840.1.113883.10.20.22.4.113) (CONF:1198-29952)."
* entryRelationship[priority] ^comment = "MAY contain zero or more [0..*] entryRelationship (CONF:1198-31063) such that it"
  * typeCode 1..1
  * typeCode = #REFR (exactly)
    * ^comment = "SHALL contain exactly one [1..1] @typeCode=\"REFR\" Refers to (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:1198-31532)."
  * observation 1..1
  * observation only PriorityPreference
    * ^comment = "SHALL contain exactly one [1..1] Priority Preference (identifier: urn:oid:2.16.840.1.113883.10.20.22.4.143) (CONF:1198-31064)."
* entryRelationship[status] ^comment = "MAY contain zero or one [0..1] entryRelationship (CONF:1198-9063) such that it"
  * typeCode 1..1
  * typeCode = #REFR (exactly)
    * ^comment = "SHALL contain exactly one [1..1] @typeCode=\"REFR\" Refers to (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:1198-9068)."
  * observation 1..1
  * observation only ProblemStatus
    * ^comment = "SHALL contain exactly one [1..1] Problem Status (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.4.6:2019-06-20) (CONF:1198-15591)."
* entryRelationship[reference] ^comment = "MAY contain zero or more [0..*] entryRelationship (CONF:4515-32968) such that it"
  * typeCode 1..1
  * typeCode = #SPRT (exactly)
    * ^comment = "SHALL contain exactly one [1..1] @typeCode=\"SPRT\" Has Support (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:4515-32968)."
  * act 1..1
  * act only EntryReference
    * ^comment = "SHALL contain exactly one [1..1] Entry Reference (identifier: 2.16.840.1.113883.10.20.22.4.122) (CONF:4515-32966)."
* entryRelationship[assessment] ^comment = "MAY contain zero or more [0..*] entryRelationship (CONF:4515-32953) such that it"
  * typeCode 1..1
  * typeCode = #SPRT (exactly)
    * ^comment = "SHALL contain exactly one [1..1] @typeCode=\"SPRT\" Has Support (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:4515-32955)."
  * observation 1..1
  * observation only AssessmentScaleObservation
    * ^comment = "SHALL contain exactly one [1..1] Assessment Scale Observation (identifier: 2.16.840.1.113883.10.20.22.4.69) (CONF:4515-32954)."
* entryRelationship[dateOfDiagnosis] ^comment = "MAY contain zero or more [0..*] entryRelationship (CONF:4515-33012) such that it"
  * insert USCDI([[Date of Diagnosis]])
  * typeCode 1..1
  * typeCode = #COMP (exactly)
    * ^comment = "SHALL contain exactly one [1..1] @typeCode=\"COMP\" has Component (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:4515-33014)."
  * act 1..1
  * act only DateOfDiagnosisAct
    * ^comment = "SHALL contain exactly one [1..1] Date of Diagnosis Act (identifier: 2.16.840.1.113883.10.20.22.4.502) (CONF:4515-33013)."

