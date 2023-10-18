Profile: ProcedureNote
Parent: USRealmHeader
Id: ProcedureNote
Title: "Procedure Note"
Description: """A Procedure Note encompasses many types of non-operative procedures including interventional cardiology, gastrointestinal endoscopy, osteopathic manipulation, and many other specialty fields. Procedure Notes are differentiated from Operative Notes because they do not involve incision or excision as the primary act.

The Procedure Note is created immediately following a non-operative procedure. It records the indications for the procedure and, when applicable, postprocedure diagnosis, pertinent events of the procedure, and the patient's tolerance for the procedure. It should be detailed enough to justify the procedure, describe the course of the procedure, and provide continuity of care."""

* insert LogicalModelTemplate(procedure-note, 2.16.840.1.113883.10.20.22.1.6, 2015-08-01)

* ^status = #active
* code 1..1
  * ^short = "The Procedure Note recommends use of a single document type code, 28570-0 \"Procedure Note\", with further specification provided by author or performer, setting, or specialty. When pre-coordinated codes are used, any coded values describing the author or performer of the service act or the practice setting must be consistent with the LOINC document type."
  * ^comment = "SHALL contain exactly one [1..1] code (CONF:1198-17182)."
  * code 1..1
  * code from ProcedureNoteDocumentTypeCodes (required)
    * ^comment = "This code SHALL contain exactly one [1..1] @code, which SHALL be selected from ValueSet ProcedureNoteDocumentTypeCodes http://hl7.org/fhir/ccda/ValueSet/2.16.840.1.113883.11.20.6.1 DYNAMIC (CONF:1198-17183)."
* participant ^slicing.discriminator[0].type = #value
  * ^slicing.discriminator[=].path = "typeCode"
  * ^slicing.discriminator[+].type = #value
  * ^slicing.discriminator[=].path = "functionCode.code"
  * ^slicing.rules = #open
  * ^short = "The participant element in the Procedure Note header follows the General Header Constraints for participants."
* participant contains participant1 0..*
* participant[participant1] ^comment = "MAY contain zero or more [0..*] participant (CONF:1198-8504) such that it"
  * typeCode 1..1
  * typeCode = #IND (exactly)
    * ^comment = "SHALL contain exactly one [1..1] @typeCode=\"IND\" Individual (CodeSystem: HL7ParticipationFunction urn:oid:2.16.840.1.113883.5.88 STATIC) (CONF:1198-8505)."
  * functionCode 1..1
    * ^comment = "SHALL contain exactly one [1..1] functionCode=\"PCP\" Primary Care Physician (CodeSystem: HL7ParticipationFunction urn:oid:2.16.840.1.113883.5.88 STATIC) (CONF:1198-8506)."
    * code 1..1
    * code = #PCP
  * associatedEntity
    * classCode 1..1
    * classCode = #PROV (exactly)
      * ^comment = "SHALL contain exactly one [1..1] associatedEntity/@classCode=\"PROV\" Provider (CodeSystem: HL7ParticipationType urn:oid:2.16.840.1.113883.5.90 STATIC) (CONF:1198-8507)."
    * associatedPerson 1..1
      * ^comment = "This associatedEntity/@classCode SHALL contain exactly one [1..1] associatedPerson (CONF:1198-8508)."
// Removed slicing on documentationOf since its only branch-id was serviceEvent, which is required anyway
* documentationOf 1..*
  * ^short = "A serviceEvent is required in the Procedure Note to represent the main act, such as a colonoscopy or a cardiac stress study, being documented. It must be equivalent to or further specialize the value inherent in the ClinicalDocument/@code (such as where the ClinicalDocument/@code is simply \"Procedure Note\" and the procedure is \"colonoscopy\"), and it shall not conflict with the value inherent in the ClinicalDocument/@code, as such a conflict would create ambiguity. A serviceEvent/effectiveTime element indicates the time the actual event (as opposed to the encounter surrounding the event) took place. serviceEvent/effectiveTime may be represented two different ways in the Procedure Note. For accuracy to the second, the best method is effectiveTime/low together with effectiveTime/high. If a more general time, such as minutes or hours, is acceptable OR if the duration is unknown, an effectiveTime/low with a width element may be used. If the duration is unknown, the appropriate HL7 null value such as \"NI\" or \"NA\" must be used for the width element."
  * serviceEvent 1..1
    * performer ^slicing.discriminator[0].type = #value
      * ^slicing.discriminator[=].path = "typeCode"
      * ^slicing.rules = #open
      * ^short = "This performer identifies any assistants."
    * performer contains
        performer1 1..1 and
        performer2 0..*
    * performer[performer1] ^short = "This performer participant represents clinicians who actually and principally carry out the serviceEvent. Typically, these are clinicians who have the appropriate privileges in their institutions such as gastroenterologists, interventional radiologists, and family practice physicians. Performers may also be non-physician providers (NPPs) who have other significant roles in the procedure such as a radiology technician, dental assistant, or nurse. Any assistants are identified as a secondary performer (SPRF) in a second performer participant."
      * ^comment = "This serviceEvent SHALL contain exactly one [1..1] performer (CONF:1198-8520) such that it"
      * typeCode 1..1
      * typeCode = #PPRF (exactly)
        * ^comment = "SHALL contain exactly one [1..1] @typeCode=\"PPRF\" Primary Performer (CodeSystem: HL7ParticipationType urn:oid:2.16.840.1.113883.5.90 STATIC) (CONF:1198-8521)."
      * assignedEntity 1..1
        * ^comment = "SHALL contain exactly one [1..1] assignedEntity (CONF:1198-14911)."
        * code 0..1
        * code from $2.16.840.1.114222.4.11.1066 (required)
          * ^comment = "This assignedEntity SHOULD contain zero or one [0..1] code, which SHALL be selected from ValueSet Healthcare Provider Taxonomy urn:oid:2.16.840.1.114222.4.11.1066 DYNAMIC (CONF:1198-14912)."
    * performer[performer2] ^comment = "This serviceEvent MAY contain zero or more [0..*] performer (CONF:1198-32732) such that it"
      * typeCode 1..1
      * typeCode = #SPRF (exactly)
        * ^comment = "SHALL contain exactly one [1..1] @typeCode=\"SPRF\" Secondary Performer (CodeSystem: HL7ParticipationType urn:oid:2.16.840.1.113883.5.90) (CONF:1198-32734)."
      * assignedEntity 1..1
        * ^comment = "SHALL contain exactly one [1..1] assignedEntity (CONF:1198-32733)."
        * code 0..1
        * code from $2.16.840.1.114222.4.11.1066 (required)
          * ^comment = "This assignedEntity SHOULD contain zero or one [0..1] code, which SHALL be selected from ValueSet Healthcare Provider Taxonomy urn:oid:2.16.840.1.114222.4.11.1066 DYNAMIC (CONF:1198-32735)."
    * obeys 1198-8511
    * ^comment = "SHALL contain exactly one [1..1] serviceEvent (CONF:1198-10061)."
    * effectiveTime 1..1
    * effectiveTime only USRealmDateTimeInterval
      * obeys 1198-8514 and 1198-8515
      * ^comment = "This serviceEvent SHALL contain exactly one [1..1] US Realm Date and Time (Interval) (identifier: urn:oid:2.16.840.1.113883.10.20.22.5.3) (CONF:1198-10062)."
      * low 1..1
        * ^comment = "This effectiveTime SHALL contain exactly one [1..1] low (CONF:1198-26449) / (CONF:1198-8513)."  
* authorization 0..1
  * ^short = "Authorization represents consent. Consent, if present, shall be represented by authorization/consent."
  * ^comment = "MAY contain zero or one [0..1] authorization (CONF:1198-32412)."
  * typeCode 1..1
  * typeCode = #AUTH (exactly)
    * ^comment = "The authorization, if present, SHALL contain exactly one [1..1] @typeCode=\"AUTH\" authorized by (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:1198-32413)."
  * consent 1..1
    * ^comment = "The authorization, if present, SHALL contain exactly one [1..1] consent (CONF:1198-32414)."
    * classCode 1..1
    * classCode = #CONS (exactly)
      * ^comment = "This consent SHALL contain exactly one [1..1] @classCode=\"CONS\" consent (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:1198-32415)."
    * moodCode 1..1
    * moodCode = #EVN (exactly)
      * ^comment = "This consent SHALL contain exactly one [1..1] @moodCode=\"EVN\" event (CodeSystem: HL7ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:1198-32416)."
    * statusCode 1..1
      * ^comment = "This consent SHALL contain exactly one [1..1] statusCode (CONF:1198-32417)."
* obeys should-componentOf
* componentOf 0..1
  * ^comment = "SHOULD contain zero or one [0..1] componentOf (CONF:1198-30871)." // auto-should
  * encompassingEncounter 1..1
    * ^comment = "The componentOf, if present, SHALL contain exactly one [1..1] encompassingEncounter (CONF:1198-30872)."
    * obeys should-id
    * id ..*
      * ^short = "SG 20230709: EncompassingEncounter.id is required in US Realm Header - this is an illegal constraint - deleted min=0"
      * ^comment = "This encompassingEncounter SHOULD contain zero or more [0..*] id (CONF:1198-32395)." // auto-should
      //"<min value=\"0\"/>"
    * code 1..1
    * code from $2.16.840.1.113762.1.4.1240.5 (preferred)
      * ^comment = "This encompassingEncounter SHALL contain exactly one [1..1] code, which SHOULD be selected from ValueSet Act Encounter Codes urn:oid:2.16.840.1.113762.1.4.1240.5 (CONF:1198-30873)."
    * encounterParticipant ^slicing.discriminator[0].type = #value
      * ^slicing.discriminator[=].path = "typeCode"
      * ^slicing.rules = #open
    * encounterParticipant contains encounterParticipant1 0..1
    * encounterParticipant[encounterParticipant1] ^comment = "This encompassingEncounter MAY contain zero or one [0..1] encounterParticipant (CONF:1198-30874) such that it"
      * typeCode 1..1
      * typeCode = #REF (exactly)
        * ^comment = "SHALL contain exactly one [1..1] @typeCode=\"REF\" Referrer (CONF:1198-30875)."
    * location 1..
      * ^short = "SG 20230709: EncompassingEncounter.location can have a maximum of 1 (CDA Base) - this is an illegal constraint - deleted max=*"
      * ^comment = "This encompassingEncounter SHALL contain at least one [1..*] location (CONF:1198-30876)."
      * healthCareFacility 1..1
        * ^comment = "Such locations SHALL contain exactly one [1..1] healthCareFacility (CONF:1198-30877)."
        * id 1..*
          * ^comment = "This healthCareFacility SHALL contain at least one [1..*] id (CONF:1198-30878)."
* component 1..1
  * ^comment = "SHALL contain exactly one [1..1] component (CONF:1198-9588)."
  * structuredBody 1..1
    * obeys 1198-30412 and 1198-30414 and 1198-30415
    * ^comment = "This component SHALL contain exactly one [1..1] structuredBody (CONF:1198-30352)."
    * component 5..
      * ^slicing.discriminator[0].type = #profile
      * ^slicing.discriminator[=].path = "section"
      * ^slicing.rules = #open
    * component contains
        component1 1..1 and
        component2 1..1 and
        component3 1..1 and
        component4 1..1 and
        component5 0..1 and
        component6 0..1 and
        component7 0..1 and
        component8 0..1 and
        component9 0..1 and
        component10 0..1 and
        component11 0..1 and
        component12 0..1 and
        component13 0..1 and
        component14 0..1 and
        component15 0..1 and
        component16 0..1 and
        component17 0..1 and
        component18 0..1 and
        component19 0..1 and
        component20 0..1 and
        component21 0..1 and
        component22 0..1 and
        component23 0..1 and
        component24 0..1 and
        component25 0..1 and
        component26 0..1 and
        component27 0..1 and
        component28 0..1
    * component[component1] ^comment = "This structuredBody SHALL contain exactly one [1..1] component (CONF:1198-30353)."
      * section only ComplicationsSection
        * ^comment = "This component SHALL contain exactly one [1..1] Complications Section (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.2.37:2015-08-01) (CONF:1198-30387)."
    * component[component2] ^comment = "This structuredBody SHALL contain exactly one [1..1] component (CONF:1198-30355) such that it"
      * section only ProcedureDescriptionSection
        * ^comment = "SHALL contain exactly one [1..1] Procedure Description Section (identifier: urn:oid:2.16.840.1.113883.10.20.22.2.27) (CONF:1198-30356)."
    * component[component3] ^comment = "This structuredBody SHALL contain exactly one [1..1] component (CONF:1198-30357) such that it"
      * section only ProcedureIndicationsSection
        * ^comment = "SHALL contain exactly one [1..1] Procedure Indications Section (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.2.29:2014-06-09) (CONF:1198-30358)."
    * component[component4] ^comment = "This structuredBody SHALL contain exactly one [1..1] component (CONF:1198-30359) such that it"
      * section only PostprocedureDiagnosisSection
        * ^comment = "SHALL contain exactly one [1..1] Postprocedure Diagnosis Section (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.2.36:2015-08-01) (CONF:1198-30360)."
    * component[component5] ^comment = "This structuredBody MAY contain zero or one [0..1] component (CONF:1198-30361) such that it"
      * section only AssessmentSection
        * ^comment = "SHALL contain exactly one [1..1] Assessment Section (identifier: urn:oid:2.16.840.1.113883.10.20.22.2.8) (CONF:1198-30362)."
    * component[component6] ^comment = "This structuredBody MAY contain zero or one [0..1] component (CONF:1198-30363) such that it"
      * section only AssessmentandPlanSection
        * ^comment = "SHALL contain exactly one [1..1] Assessment and Plan Section (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.2.9:2014-06-09) (CONF:1198-30364)."
    * component[component7] ^comment = "This structuredBody MAY contain zero or one [0..1] component (CONF:1198-30365) such that it"
      * section only PlanofTreatmentSection
        * ^comment = "SHALL contain exactly one [1..1] Plan of Treatment Section (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.2.10:2014-06-09) (CONF:1198-30366)."
    * component[component8] ^comment = "This structuredBody MAY contain zero or one [0..1] component (CONF:1198-30367) such that it"
      * section only AllergiesAndIntolerancesSection
        * ^comment = "SHALL contain exactly one [1..1] Allergies and Intolerances Section (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.2.6.1:2015-08-01) (CONF:1198-30368)."
    * component[component9] ^comment = "This structuredBody MAY contain zero or one [0..1] component (CONF:1198-30369) such that it"
      * section only AnesthesiaSection
        * ^comment = "SHALL contain exactly one [1..1] Anesthesia Section (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.2.25:2014-06-09) (CONF:1198-30370)."
    * component[component10] ^comment = "This structuredBody MAY contain zero or one [0..1] component (CONF:1198-30371) such that it"
      * section only ChiefComplaintSection
        * ^comment = "SHALL contain exactly one [1..1] Chief Complaint Section (identifier: urn:oid:1.3.6.1.4.1.19376.1.5.3.1.1.13.2.1) (CONF:1198-30372)."
    * component[component11] ^comment = "This structuredBody MAY contain zero or one [0..1] component (CONF:1198-30373) such that it"
      * section only ChiefComplaintandReasonforVisitSection
        * ^comment = "SHALL contain exactly one [1..1] Chief Complaint and Reason for Visit Section (identifier: urn:oid:2.16.840.1.113883.10.20.22.2.13) (CONF:1198-30374)."
    * component[component12] ^comment = "This structuredBody MAY contain zero or one [0..1] component (CONF:1198-30375) such that it"
      * section only FamilyHistorySection
        * ^comment = "SHALL contain exactly one [1..1] Family History Section (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.2.15:2015-08-01) (CONF:1198-30376)."
    * component[component13] ^comment = "This structuredBody MAY contain zero or one [0..1] component (CONF:1198-30377) such that it"
      * section only PastMedicalHistory
        * ^comment = "SHALL contain exactly one [1..1] Past Medical History (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.2.20:2015-08-01) (CONF:1198-30378)."
    * component[component14] ^comment = "This structuredBody MAY contain zero or one [0..1] component (CONF:1198-30379) such that it"
      * section only HistoryofPresentIllnessSection
        * ^comment = "SHALL contain exactly one [1..1] History of Present Illness Section (identifier: urn:oid:1.3.6.1.4.1.19376.1.5.3.1.3.4) (CONF:1198-30380)."
    * component[component15] ^comment = "This structuredBody MAY contain zero or one [0..1] component (CONF:1198-30381) such that it"
      * section only MedicalGeneralHistorySection
        * ^comment = "SHALL contain exactly one [1..1] Medical (General) History Section (identifier: urn:oid:2.16.840.1.113883.10.20.22.2.39) (CONF:1198-30382)."
    * component[component16] ^comment = "This structuredBody MAY contain zero or one [0..1] component (CONF:1198-30383) such that it"
      * section only MedicationsSection
        * ^comment = "SHALL contain exactly one [1..1] Medications Section (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.2.1.1:2014-06-09) (CONF:1198-30384)."
    * component[component17] ^comment = "This structuredBody MAY contain zero or one [0..1] component (CONF:1198-30388) such that it"
      * section only MedicationsAdministeredSection
        * ^comment = "SHALL contain exactly one [1..1] Medications Administered Section (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.2.38:2014-06-09) (CONF:1198-30389)."
    * component[component18] ^comment = "This structuredBody MAY contain zero or one [0..1] component (CONF:1198-30390) such that it"
      * section only PhysicalExamSection
        * ^comment = "SHALL contain exactly one [1..1] Physical Exam Section (identifier: urn:hl7ii:2.16.840.1.113883.10.20.2.10:2015-08-01) (CONF:1198-30391)."
    * component[component19] ^comment = "This structuredBody MAY contain zero or one [0..1] component (CONF:1198-30392) such that it"
      * section only PlannedProcedureSection
        * ^comment = "SHALL contain exactly one [1..1] Planned Procedure Section (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.2.30:2014-06-09) (CONF:1198-30393)."
    * component[component20] ^comment = "This structuredBody MAY contain zero or one [0..1] component (CONF:1198-30394) such that it"
      * section only ProcedureDispositionSection
        * ^comment = "SHALL contain exactly one [1..1] Procedure Disposition Section (identifier: urn:oid:2.16.840.1.113883.10.20.18.2.12) (CONF:1198-30395)."
    * component[component21] ^comment = "This structuredBody MAY contain zero or one [0..1] component (CONF:1198-30396) such that it"
      * section only ProcedureEstimatedBloodLossSection
        * ^comment = "SHALL contain exactly one [1..1] Procedure Estimated Blood Loss Section (identifier: urn:oid:2.16.840.1.113883.10.20.18.2.9) (CONF:1198-30397)."
    * component[component22] ^comment = "This structuredBody MAY contain zero or one [0..1] component (CONF:1198-30398) such that it"
      * section only ProcedureFindingsSection
        * ^comment = "SHALL contain exactly one [1..1] Procedure Findings Section (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.2.28:2015-08-01) (CONF:1198-30399)."
    * component[component23] ^comment = "This structuredBody MAY contain zero or one [0..1] component (CONF:1198-30400) such that it"
      * section only ProcedureImplantsSection
        * ^comment = "SHALL contain exactly one [1..1] Procedure Implants Section (identifier: urn:oid:2.16.840.1.113883.10.20.22.2.40) (CONF:1198-30401)."
    * component[component24] ^comment = "This structuredBody MAY contain zero or one [0..1] component (CONF:1198-30402) such that it"
      * section only ProcedureSpecimensTakenSection
        * ^comment = "SHALL contain exactly one [1..1] Procedure Specimens Taken Section (identifier: urn:oid:2.16.840.1.113883.10.20.22.2.31) (CONF:1198-30403)."
    * component[component25] ^comment = "This structuredBody MAY contain zero or one [0..1] component (CONF:1198-30404) such that it"
      * section only ProceduresSection
        * ^comment = "SHALL contain exactly one [1..1] Procedures Section (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.2.7.1:2014-06-09) (CONF:1198-30405)."
    * component[component26] ^comment = "This structuredBody MAY contain zero or one [0..1] component (CONF:1198-30406) such that it"
      * section only ReasonforVisitSection
        * ^comment = "SHALL contain exactly one [1..1] Reason for Visit Section (identifier: urn:oid:2.16.840.1.113883.10.20.22.2.12) (CONF:1198-30407)."
    * component[component27] ^comment = "This structuredBody MAY contain zero or one [0..1] component (CONF:1198-30408) such that it"
      * section only ReviewofSystemsSection
        * ^comment = "SHALL contain exactly one [1..1] Review of Systems Section (identifier: urn:oid:1.3.6.1.4.1.19376.1.5.3.1.3.18) (CONF:1198-30409)."
    * component[component28] ^comment = "This structuredBody MAY contain zero or one [0..1] component (CONF:1198-30410) such that it"
      * section only SocialHistorySection
        * ^comment = "SHALL contain exactly one [1..1] Social History Section (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.2.17:2015-08-01) (CONF:1198-30411)."

Invariant: 1198-8511
Description: "The value of Clinical Document /documentationOf/serviceEvent/code **SHALL** be from ICD9 CM Procedures (codeSystem 2.16.840.1.113883.6.104), CPT-4 (codeSystem 2.16.840.1.113883.6.12), HCPCS (codeSystem 2.16.840.1.113883.6.285), or values descending from 71388002 (Procedure) from the SNOMED CT (codeSystem 2.16.840.1.113883.6.96) ValueSet 2.16.840.1.113883.3.88.12.80.28 Procedure *DYNAMIC* (CONF:1198-8511)."
Severity: #error

Invariant: 1198-8514
Description: "If a width is not present, the serviceEvent/effectiveTime **SHALL** include effectiveTime/high (CONF:1198-8514)."
Severity: #error
Expression: "width.empty() implies high.exists()"

Invariant: 1198-8515
Description: "When only the date and the length of the procedure are known a width element **SHALL** be present and the serviceEvent/effectiveTime/high **SHALL NOT** be present (CONF:1198-8515)."
Severity: #error
Expression: "width.exists() implies high.exmpty()"

Invariant: 1198-30412
Description: "This structuredBody **SHALL** contain an Assessment and Plan Section (2.16.840.1.113883.10.20.22.2.9:2014-06-09), or an Assessment Section (2.16.840.1.113883.10.20.22.2.8) and a Plan of Treatment Section (2.16.840.1.113883.10.20.22.2.10:2014-06-09) (CONF:1198-30412)."
Severity: #error

Invariant: 1198-30414
Description: "This structuredBody **SHALL NOT** contain an Assessment and Plan Section (2.16.840.1.113883.10.20.22.2.9:2014-06-09) when either an Assessment Section (2.16.840.1.113883.10.20.22.2.8) or a Plan of Treatment Section (2.16.840.1.113883.10.20.22.2.10:2014-06-09) is present (CONF:1198-30414)."
Severity: #error

Invariant: 1198-30415
Description: "This structuredBody **SHALL NOT** contain a Chief Complaint and Reason for Visit Section (2.16.840.1.113883.10.20.22.2.13) when either a Chief Complaint Section (1.3.6.1.4.1.19376.1.5.3.1.1.13.2.1) or a Reason for Visit Section (2.16.840.1.113883.10.20.22.2.12) is present (CONF:1198-30415)."
Severity: #error