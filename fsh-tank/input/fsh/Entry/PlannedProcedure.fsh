Profile: PlannedProcedure
Parent: $Procedure
Id: PlannedProcedure
Title: "Planned Procedure"
Description: """This template represents planned alterations of the patient's physical condition. Examples of such procedures are tracheostomy, knee replacement, and craniectomy. The priority of the procedure to the patient and provider is communicated through Priority Preference. The effectiveTime indicates the time when the procedure is intended to take place and authorTime indicates when the documentation of the plan occurred. The Planned Procedure Template may also indicate the potential insurance coverage for the procedure.

Planned Procedure Usage Note: Common practice in the industry has shown that Planned Procedure is the usually implemented CDA template for any type of intervention or procedure regardless of if the "immediate and primary outcome (post-condition) is the alteration of the physical condition of the patient", or not. As a result, it is recommended to use Planned Procedure when sending procedures also thought of as "interventions" such as "Home Environment Evaluation" or "Assessment of nutritional status".
"""

* insert LogicalModelTemplate(planned-proc, 2.16.840.1.113883.10.20.22.4.41, 2022-06-01)
* insert NarrativeLink

* classCode 1..1
* classCode = #PROC (exactly)
  * ^comment = "SHALL contain exactly one [1..1] @classCode=\"PROC\" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:4515-8568)."
* moodCode 1..1
* moodCode from $2.16.840.1.113883.11.20.9.23 (required)
  * ^comment = "SHALL contain exactly one [1..1] @moodCode, which SHALL be selected from ValueSet Planned moodCode (Act/Encounter/Procedure) urn:oid:2.16.840.1.113883.11.20.9.23 STATIC 2011-09-30 (CONF:4515-8569)."
* id 1..*
  * ^comment = "SHALL contain at least one [1..*] id (CONF:4515-8571)."
* code 1..1
  * code from http://hl7.org/fhir/us/core/ValueSet/us-core-procedure-code (preferred)
  * insert USCDI([[SDOH Interventions]])
  * ^comment = "This code SHALL contain exactly one [1..1] @code, which SHOULD be selected from ValueSet US Core Procedure Codes urn:oid:2.16.840.1.113883.4.642.40.48.31 ."
  * insert AdditionalBinding(preferred, $SDoHServiceRequest, For Social Determinant of Planned Intervention Procedure, [[If the Planned Intervention Procedure is a Social Determinant of Health Planned Intervention Procedure, the procedure code **SHOULD** be selected from ValueSet [Social Determinant of Health Service Request](https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1196.790/expansion) **DYNAMIC** (CONF:4515-32993).]])
* statusCode 1..1
  * ^comment = "SHALL contain exactly one [1..1] statusCode (CONF:4515-30446)."
  * code 1..1
  * code = #active (exactly)
    * ^comment = "This statusCode SHALL contain exactly one [1..1] @code=\"active\" Active (CodeSystem: HL7ActStatus urn:oid:2.16.840.1.113883.5.14) (CONF:4515-31978)."
* obeys should-effectiveTime
* effectiveTime 0..1
  * ^short = "The effectiveTime in a planned procedure represents the time that the procedure should occur."
  * ^comment = "SHOULD contain zero or one [0..1] effectiveTime (CONF:4515-30447)." // auto-should
* methodCode 0..*
  * ^short = "In a planned procedure the provider may suggest that a procedure should be performed using a particular method. MethodCode *SHALL NOT* conflict with the method inherent in Procedure/code."
  * ^comment = "MAY contain zero or more [0..*] methodCode (CONF:4515-31980)."
* targetSiteCode 0..*
* targetSiteCode from $2.16.840.1.113883.3.88.12.3221.8.9 (required)
  * ^short = "The targetSiteCode is used to identify the part of the body of concern for the planned procedure."
  * ^comment = "MAY contain zero or more [0..*] targetSiteCode, which SHALL be selected from ValueSet Body Site Value Set urn:oid:2.16.840.1.113883.3.88.12.3221.8.9 DYNAMIC (CONF:4515-31981)."
* performer 0..*
  * ^short = "The clinician who is expected to perform the procedure could be identified using procedure/performer."
  * ^comment = "MAY contain zero or more [0..*] performer (CONF:4515-30449)."
* obeys should-author
* author 0..1
* author only AuthorParticipation
  * ^short = "The author in a planned procedure represents the clinician who is requesting or planning the procedure."
  * ^comment = "SHOULD contain zero or one [0..1] Author Participation (identifier: urn:oid:2.16.840.1.113883.10.20.22.4.119) (CONF:4515-31979)." // man-should
* entryRelationship ^slicing.discriminator[0].type = #profile
  * ^slicing.discriminator[=].path = "act"
  * ^slicing.discriminator[+].type = #profile
  * ^slicing.discriminator[=].path = "observation"
  * ^slicing.rules = #open
  * ^comment = "MAY contain zero or more [0..*] entryRelationship (CONF:4515-32996) such that it"
* entryRelationship contains
    entryRelationship1 0..* and
    entryRelationship2 0..* and
    entryRelationship3 0..* and
    entryRelationship4 0..* and
    entryRelationship5 0..* and
    entryRelationship6 0..*
* entryRelationship[entryRelationship1] ^short = "The following entryRelationship represents the priority that a patient or a provider places on the procedure."
  * ^comment = "MAY contain zero or more [0..*] entryRelationship (CONF:4515-31079) such that it"
  * typeCode 1..1
  * typeCode = #REFR (exactly)
    * ^comment = "SHALL contain exactly one [1..1] @typeCode=\"REFR\" Refers to (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:4515-31080)."
  * observation 1..1
  * observation only PriorityPreference
    * ^comment = "SHALL contain exactly one [1..1] Priority Preference (identifier: urn:oid:2.16.840.1.113883.10.20.22.4.143) (CONF:4515-31081)."
* entryRelationship[entryRelationship2] ^short = "The following entryRelationship represents the indication for the procedure."
  * ^comment = "MAY contain zero or more [0..*] entryRelationship (CONF:4515-31982) such that it"
  * typeCode 1..1
  * typeCode = #RSON (exactly)
    * ^comment = "SHALL contain exactly one [1..1] @typeCode=\"RSON\" Has Reason (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:4515-31983)."
  * observation 1..1
  * observation only Indication
    * ^comment = "SHALL contain exactly one [1..1] Indication (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.4.19:2014-06-09) (CONF:4515-31984)."
* entryRelationship[entryRelationship3] ^short = "The following entryRelationship captures any instructions associated with the planned procedure."
  * ^comment = "MAY contain zero or more [0..*] entryRelationship (CONF:4515-31985) such that it"
  * typeCode 1..1
  * typeCode = #SUBJ (exactly)
    * ^comment = "SHALL contain exactly one [1..1] @typeCode=\"SUBJ\" Has Subject (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:4515-31986)."
  * inversionInd 1..1
  * inversionInd = true (exactly)
    * ^comment = "SHALL contain exactly one [1..1] @inversionInd=\"true\" True (CONF:4515-31987)."
  * act 1..1
  * act only Instruction
    * ^comment = "SHALL contain exactly one [1..1] Instruction (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.4.20:2014-06-09) (CONF:4515-31989)."
* entryRelationship[entryRelationship4] ^short = "The following entryRelationship represents the insurance coverage the patient may have for the procedure."
  * ^comment = "MAY contain zero or more [0..*] entryRelationship (CONF:4515-31990) such that it"
  * typeCode 1..1
  * typeCode = #COMP (exactly)
    * ^comment = "SHALL contain exactly one [1..1] @typeCode=\"COMP\" Has component (CONF:4515-31991)."
  * act 1..1
  * act only PlannedCoverage
    * ^comment = "SHALL contain exactly one [1..1] Planned Coverage (identifier: urn:oid:2.16.840.1.113883.10.20.22.4.129) (CONF:4515-31992)."
* entryRelationship[entryRelationship5] ^short = "When an Assessment Scale Observation is contained in a Procedure Template instance that is a Social Determinant of Health procedure, that Assessment scale **MAY** contain Assessment Scale observations that represent LOINC question and answer pairs from SDOH screening instruments."
  * ^comment = "MAY contain zero or more [0..*] entryRelationship (CONF:4515-32994) such that it"
  * typeCode 1..1
  * typeCode = #RSON (exactly)
    * ^comment = "SHALL contain exactly one [1..1] @typeCode=\"RSON\" Has reason (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:4515-32998)."
  * observation 1..1
  * observation only AssessmentScaleObservation
    * ^comment = "SHALL contain exactly one [1..1] Assessment Scale Observation (identifier: urn:oid:2.16.840.1.113883.10.20.22.4.69) (CONF:4515-32995)."
* entryRelationship[entryRelationship6] ^short = "When an Entry Reference Template is contained in a Procedure Template instance that is a Social Determinant of Health procedure, that Entry Reference **MAY** refer to Assessment Scale Observation in the same document that represent LOINC question and answer pairs from SDOH screening instruments."
  * ^comment = "MAY contain zero or more [0..*] entryRelationship (CONF:4515-32996) such that it"
  * typeCode 1..1
  * typeCode = #RSON (exactly)
    * ^comment = "SHALL contain exactly one [1..1] @typeCode=\"RSON\" Has reason (CONF:4515-32999)."
  * act 1..1
  * act only EntryReference
    * ^comment = "SHALL contain exactly one [1..1] Entry Reference (identifier: urn:oid:2.16.840.1.113883.10.20.22.4.122) (CONF:4515-32997)."

