Profile: OperativeNote
Parent: USRealmHeader
Id: OperativeNote
Title: "Operative Note"
Description: """The Operative Note is a frequently used type of procedure note with specific requirements set forth by regulatory agencies. 

The Operative Note is created immediately following a surgical or other high-risk procedure. It records the pre- and post-surgical diagnosis, pertinent events of the procedure, as well as the condition of the patient following the procedure. The report should be sufficiently detailed to support the diagnoses, justify the treatment, document the course of the procedure, and provide continuity of care."""
* insert LogicalModelNA
* ^identifier.value = "urn:hl7ii:2.16.840.1.113883.10.20.22.1.7:2015-08-01"
* ^version = "2015-08-01"
* ^status = #active
* templateId ^slicing.discriminator[0].type = #value
  * ^slicing.discriminator[=].path = "root"
  * ^slicing.discriminator[+].type = #value
  * ^slicing.discriminator[=].path = "extension"
  * ^slicing.rules = #open
* templateId contains secondary 1..1
* templateId[secondary] ^comment = "SHALL contain exactly one [1..1] templateId (CONF:1198-8483) such that it"
  * root 1..1
  * root = "2.16.840.1.113883.10.20.22.1.7"
    * ^comment = "SHALL contain exactly one [1..1] @root=\"2.16.840.1.113883.10.20.22.1.7\" (CONF:1198-10048)."
  * extension 1..1
  * extension = "2015-08-01"
    * ^comment = "SHALL contain exactly one [1..1] @extension=\"2015-08-01\" (CONF:1198-32519)."
* code 1..1
  * ^short = "The Operative Note recommends use of a single document type code, 11504-8 \"Provider-unspecified Operation Note\", with further specification provided by author or performer, setting, or specialty data in the CDA header. Some of the LOINC codes in the Surgical Operation Note Document Type Code table are pre-coordinated with the practice setting or the training or professional level of the author. Use of pre-coordinated codes is not recommended because of potential conflict with other information in the header. When these codes are used, any coded values describing the author or performer of the service act or the practice setting must be consistent with the LOINC document type."
  * ^comment = "SHALL contain exactly one [1..1] code (CONF:1198-17187)."
  * code 1..1
  * code from SurgicalOperationNoteDocumentTypeCode (required)
    * ^comment = "This code SHALL contain exactly one [1..1] @code, which SHALL be selected from ValueSet SurgicalOperationNoteDocumentTypeCode http://hl7.org/fhir/ccda/ValueSet/2.16.840.1.113883.11.20.1.1 DYNAMIC (CONF:1198-17188)."
* documentationOf 1..*
  * ^short = "A serviceEvent represents the main act, such as a colonoscopy or an appendectomy, being documented. A serviceEvent can further specialize the act inherent in the ClinicalDocument/code, such as where the ClinicalDocument/code is simply \"Surgical Operation Note\" and the procedure is \"Appendectomy.\" serviceEvent is required in the Operative Note and it must be equivalent to or further specialize the value inherent in the ClinicalDocument/code; it shall not conflict with the value inherent in the ClinicalDocument/code, as such a conflict would create ambiguity. serviceEvent/effectiveTime can be used to indicate the time the actual event (as opposed to the encounter surrounding the event) took place. If the date and the duration of the procedure is known, serviceEvent/effectiveTime/low is used with a width element that describes the duration; no high element is used. However, if only the date is known, the date is placed in both the low and high elements."
  * ^comment = "SHALL contain at least one [1..*] documentationOf (CONF:1198-8486)."
  * serviceEvent 1..1
    * obeys 1198-8487
    * ^comment = "Such documentationOfs SHALL contain exactly one [1..1] serviceEvent (CONF:1198-8493)."
    * effectiveTime 1..1
    * effectiveTime only USRealmDateandTimeDTUSFIELDED
      * obeys 1198-8488 and 1198-10058 and 1198-10060
      * ^comment = "This serviceEvent SHALL contain exactly one [1..1] US Realm Date and Time (DT.US.FIELDED) (identifier: urn:oid:2.16.840.1.113883.10.20.22.5.3) (CONF:1198-8494)."
    * performer ^slicing.discriminator[0].type = #value
      * ^slicing.discriminator[=].path = "assignedEntity"
      * ^slicing.discriminator[+].type = #value
      * ^slicing.discriminator[=].path = "typeCode"
      * ^slicing.discriminator[+].type = #value
      * ^slicing.discriminator[=].path = "functionCode"
      * ^slicing.rules = #open
      * ^short = "This performer represents any assistants."
    * performer contains
        performer1 1..* and
        performer2 0..*
    * performer[performer1] ^short = "This performer represents clinicians who actually and principally carry out the serviceEvent. Typically, these are clinicians who have surgical privileges in their institutions such as Surgeons, Obstetrician/Gynecologists, and Family Practice Physicians. The performer may also be non-physician providers (NPPs) who have surgical privileges. There may be more than one primary performer in the case of complicated surgeries. There are occasionally co-surgeons. Usually they will be billing separately and will each dictate their own notes. An example may be spinal surgery , where a general surgeon and an orthopedic surgeon both are present and billing off the same Current Procedural Terminology (CPT) codes. Typically two Operative Notes are generated; however, each will list the other as a co-surgeon. Any assistants are identified as a secondary performer (SPRF) in a second performer participant."
      * ^comment = "This serviceEvent SHALL contain one or more [1..*] performer (CONF:1198-8489) such that it"
      * typeCode 1..1
      * typeCode = #PPRF (exactly)
        * ^comment = "SHALL contain exactly one [1..1] @typeCode=\"PPRF\" Primary performer (CodeSystem: HL7ParticipationType urn:oid:2.16.840.1.113883.5.90 STATIC) (CONF:1198-8495)."
      * functionCode 0..1
      * functionCode from $2.16.840.1.113762.1.4.1099.30 (preferred)
        * ^comment = "MAY contain zero or one [0..1] functionCode, which SHOULD be selected from ValueSet Care Team Member Function urn:oid:2.16.840.1.113762.1.4.1099.30 DYNAMIC (CONF:1198-32963)."
      * assignedEntity 1..1
        * ^comment = "SHALL contain exactly one [1..1] assignedEntity (CONF:1198-10917)."
        * code 0..1
        * code from $2.16.840.1.114222.4.11.1066 (required)
          * ^comment = "This assignedEntity SHOULD contain zero or one [0..1] code, which SHALL be selected from ValueSet Healthcare Provider Taxonomy urn:oid:2.16.840.1.114222.4.11.1066 DYNAMIC (CONF:1198-8490)."
    * performer[performer2] ^comment = "This serviceEvent MAY contain zero or more [0..*] performer (CONF:1198-32736) such that it"
      * typeCode 1..1
      * typeCode = #SPRF (exactly)
        * ^comment = "SHALL contain exactly one [1..1] @typeCode=\"SPRF\" Secondary performer (CodeSystem: HL7ParticipationType urn:oid:2.16.840.1.113883.5.90) (CONF:1198-32738)."
      * functionCode 0..1
      * functionCode from $2.16.840.1.113762.1.4.1099.30 (preferred)
        * ^comment = "MAY contain zero or one [0..1] functionCode, which SHOULD be selected from ValueSet Care Team Member Function urn:oid:2.16.840.1.113762.1.4.1099.30 DYNAMIC (CONF:1198-32964)."
      * assignedEntity 1..1
        * ^comment = "SHALL contain exactly one [1..1] assignedEntity (CONF:1198-32737)."
        * code 0..1
        * code from $2.16.840.1.114222.4.11.1066 (required)
          * ^comment = "This assignedEntity SHOULD contain zero or one [0..1] code, which SHALL be selected from ValueSet Healthcare Provider Taxonomy urn:oid:2.16.840.1.114222.4.11.1066 DYNAMIC (CONF:1198-32739)."
* authorization 0..1
  * ^short = "Authorization represents consent. Consent, if present, shall be represented by authorization/consent."
  * ^comment = "MAY contain zero or one [0..1] authorization (CONF:1198-32404)."
  * typeCode 1..1
  * typeCode = #AUTH (exactly)
    * ^comment = "The authorization, if present, SHALL contain exactly one [1..1] @typeCode=\"AUTH\" authorized by (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:1198-32408)."
  * consent 1..1
    * ^comment = "The authorization, if present, SHALL contain exactly one [1..1] consent (CONF:1198-32405)."
    * classCode 1..1
    * classCode = #CONS (exactly)
      * ^comment = "This consent SHALL contain exactly one [1..1] @classCode=\"CONS\" consent (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:1198-32409)."
    * moodCode 1..1
    * moodCode = #EVN (exactly)
      * ^comment = "This consent SHALL contain exactly one [1..1] @moodCode=\"EVN\" event (CodeSystem: HL7ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:1198-32410)."
    * statusCode 1..1
      * ^comment = "This consent SHALL contain exactly one [1..1] statusCode (CONF:1198-32411)."
* component 1..1
  * ^comment = "SHALL contain exactly one [1..1] component (CONF:1198-9585)."
  * structuredBody 1..1
    * ^comment = "This component SHALL contain exactly one [1..1] structuredBody (CONF:1198-30485)."
    * component ^slicing.discriminator[0].type = #value
      * ^slicing.discriminator[=].path = "ClinicalDocument.section"
      * ^slicing.rules = #open
    * component contains
        component1 1..1 and
        component2 1..1 and
        component3 1..1 and
        component4 1..1 and
        component5 1..1 and
        component6 1..1 and
        component7 1..1 and
        component8 1..1 and
        component9 0..1 and
        component10 0..1 and
        component11 0..1 and
        component12 0..1 and
        component13 0..1 and
        component14 0..1 and
        component15 0..1 and
        component16 0..1
    * component[component1] ^comment = "This structuredBody SHALL contain exactly one [1..1] component (CONF:1198-30486)."
      * section 1..1
      * section only AnesthesiaSection
        * ^comment = "This component SHALL contain exactly one [1..1] Anesthesia Section (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.2.25:2014-06-09) (CONF:1198-30487)."
    * component[component2] ^comment = "This structuredBody SHALL contain exactly one [1..1] component (CONF:1198-30488) such that it"
      * section 1..1
      * section only ComplicationsSection
        * ^comment = "SHALL contain exactly one [1..1] Complications Section (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.2.37:2015-08-01) (CONF:1198-30489)."
    * component[component3] ^comment = "This structuredBody SHALL contain exactly one [1..1] component (CONF:1198-30490) such that it"
      * section 1..1
      * section only PreoperativeDiagnosisSection
        * ^comment = "SHALL contain exactly one [1..1] Preoperative Diagnosis Section (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.2.34:2015-08-01) (CONF:1198-30491)."
    * component[component4] ^comment = "This structuredBody SHALL contain exactly one [1..1] component (CONF:1198-30492) such that it"
      * section 1..1
      * section only ProcedureEstimatedBloodLossSection
        * ^comment = "SHALL contain exactly one [1..1] Procedure Estimated Blood Loss Section (identifier: urn:oid:2.16.840.1.113883.10.20.18.2.9) (CONF:1198-30493)."
    * component[component5] ^comment = "This structuredBody SHALL contain exactly one [1..1] component (CONF:1198-30494) such that it"
      * section 1..1
      * section only ProcedureFindingsSection
        * ^comment = "SHALL contain exactly one [1..1] Procedure Findings Section (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.2.28:2015-08-01) (CONF:1198-30495)."
    * component[component6] ^comment = "This structuredBody SHALL contain exactly one [1..1] component (CONF:1198-30496) such that it"
      * section 1..1
      * section only ProcedureSpecimensTakenSection
        * ^comment = "SHALL contain exactly one [1..1] Procedure Specimens Taken Section (identifier: urn:oid:2.16.840.1.113883.10.20.22.2.31) (CONF:1198-30497)."
    * component[component7] ^comment = "This structuredBody SHALL contain exactly one [1..1] component (CONF:1198-30498) such that it"
      * section 1..1
      * section only ProcedureDescriptionSection
        * ^comment = "SHALL contain exactly one [1..1] Procedure Description Section (identifier: urn:oid:2.16.840.1.113883.10.20.22.2.27) (CONF:1198-30499)."
    * component[component8] ^comment = "This structuredBody SHALL contain exactly one [1..1] component (CONF:1198-30500) such that it"
      * section 1..1
      * section only PostoperativeDiagnosisSection
        * ^comment = "SHALL contain exactly one [1..1] Postoperative Diagnosis Section (identifier: urn:oid:2.16.840.1.113883.10.20.22.2.35) (CONF:1198-30501)."
    * component[component9] ^comment = "This structuredBody MAY contain zero or one [0..1] component (CONF:1198-30502) such that it"
      * section 1..1
      * section only ProcedureImplantsSection
        * ^comment = "SHALL contain exactly one [1..1] Procedure Implants Section (identifier: urn:oid:2.16.840.1.113883.10.20.22.2.40) (CONF:1198-30503)."
    * component[component10] ^comment = "This structuredBody MAY contain zero or one [0..1] component (CONF:1198-30504) such that it"
      * section 1..1
      * section only OperativeNoteFluidsSection
        * ^comment = "SHALL contain exactly one [1..1] Operative Note Fluids Section (identifier: urn:oid:2.16.840.1.113883.10.20.7.12) (CONF:1198-30505)."
    * component[component11] ^comment = "This structuredBody MAY contain zero or one [0..1] component (CONF:1198-30506) such that it"
      * section 1..1
      * section only OperativeNoteSurgicalProcedureSection
        * ^comment = "SHALL contain exactly one [1..1] Operative Note Surgical Procedure Section (identifier: urn:oid:2.16.840.1.113883.10.20.7.14) (CONF:1198-30507)."
    * component[component12] ^comment = "This structuredBody MAY contain zero or one [0..1] component (CONF:1198-30508) such that it"
      * section 1..1
      * section only PlanofTreatmentSection
        * ^comment = "SHALL contain exactly one [1..1] Plan of Treatment Section (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.2.10:2014-06-09) (CONF:1198-30509)."
    * component[component13] ^comment = "This structuredBody MAY contain zero or one [0..1] component (CONF:1198-30510) such that it"
      * section 1..1
      * section only PlannedProcedureSection
        * ^comment = "SHALL contain exactly one [1..1] Planned Procedure Section (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.2.30:2014-06-09) (CONF:1198-30511)."
    * component[component14] ^comment = "This structuredBody MAY contain zero or one [0..1] component (CONF:1198-30512) such that it"
      * section 1..1
      * section only ProcedureDispositionSection
        * ^comment = "SHALL contain exactly one [1..1] Procedure Disposition Section (identifier: urn:oid:2.16.840.1.113883.10.20.18.2.12) (CONF:1198-30513)."
    * component[component15] ^comment = "This structuredBody MAY contain zero or one [0..1] component (CONF:1198-30514) such that it"
      * section 1..1
      * section only ProcedureIndicationsSection
        * ^comment = "SHALL contain exactly one [1..1] Procedure Indications Section (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.2.29:2014-06-09) (CONF:1198-30515)."
    * component[component16] ^comment = "This structuredBody MAY contain zero or one [0..1] component (CONF:1198-30516) such that it"
      * section 1..1
      * section only SurgicalDrainsSection
        * ^comment = "SHALL contain exactly one [1..1] Surgical Drains Section (identifier: urn:oid:2.16.840.1.113883.10.20.7.13) (CONF:1198-30517)."

Invariant: 1198-8487
Description: "The value of serviceEvent/code **SHALL** be from ICD9 CM Procedures (CodeSystem 2.16.840.1.113883.6.104), CPT-4 (CodeSystem 2.16.840.1.113883.6.12), or values descending from 71388002 (Procedure) from the SNOMED CT (CodeSystem 2.16.840.1.113883.6.96) ValueSet Procedure 2.16.840.1.113883.3.88.12.80.28 *DYNAMIC* (CONF:1198-8487)."
Severity: #error

Invariant: 1198-8488
Description: "The serviceEvent/effectiveTime **SHALL** be present with effectiveTime/low (CONF:1198-8488)."
Severity: #error

Invariant: 1198-10058
Description: "If a width is not present, the serviceEvent/effectiveTime **SHALL** include effectiveTime/high (CONF:1198-10058)."
Severity: #error

Invariant: 1198-10060
Description: "When only the date and the length of the procedure are known a width element **SHALL** be present and the serviceEvent/effectiveTime/high **SHALL NOT** be present (CONF:1198-10060)."
Severity: #error