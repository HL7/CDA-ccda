Profile: TransferSummary
Parent: USRealmHeader
Id: TransferSummary
Title: "Transfer Summary"
Description: """The Transfer Summary standardizes critical information for exchange of information between providers of care when a patient moves between health care settings. 

Standardization of information used in this form will promote interoperability; create information suitable for reuse in quality measurement, public health, research, and for reimbursement."""

* insert LogicalModelTemplate(transfer-summary, 2.16.840.1.113883.10.20.22.1.13, 2024-05-01)
* insert DocumentCategory(Transfer Summary, 18761-7, Transfer summary note)

* ^status = #active
* code 1..1
* code from TransferDocumentType (required)
  * ^short = "The Transfer Summary recommends use of the document type code 18761-7 \"Transfer summary note\", with further specification provided by author or performer, setting, or specialty. When pre-coordinated codes are used, any coded values describing the author or performer of the service act or the practice setting must be consistent with the LOINC document type. For example, an Obstetrics and Gynecology Transfer Summary note would not be authored by a Pediatric Cardiologist.\n\nPre-coordinated codes are those that indicate the specialty or service provided in the LOINC Long Common Name (Print Name in the TransferDocumentType valueSet table).\n\nWhen using a generic type of code such as 18761-7 (Provider - Unspecified Transfer Summary), the types of services involved in the care are handled in documentationOf/serviceEvent with the use of serviceEvent/code (e.g., use a SNOMED CT procedure code such as 69031006 (Excision of breast tissue) while performers/providers involved in the care can be identified using the functionCode (bound to Healthcare Provider Taxonomy role codes)."
  * ^comment = "SHALL contain exactly one [1..1] code, which SHALL be selected from ValueSet TransferDocumentType http://hl7.org/fhir/ccda/ValueSet/2.16.840.1.113883.1.11.20.2.4 DYNAMIC (CONF:1198-28243)."
* title 1..1
  * ^comment = "SHALL contain exactly one [1..1] title (CONF:1198-29838)."
* obeys should-participant-indirect
* obeys should-participant-callback
* participant ^slicing.discriminator[0].type = #value
  * ^slicing.discriminator[=].path = "typeCode"
  * ^slicing.rules = #open
* participant contains
    indirect 0..* and
    callback 0..*
* participant[indirect] ^comment = "SHOULD contain zero or more [0..*] participant (CONF:1198-31599) such that it"  // man-should
  * typeCode 1..1
  * typeCode = #IND (exactly)
    * ^comment = "SHALL contain exactly one [1..1] @typeCode=\"IND\" indirect (CodeSystem: HL7ParticipationType urn:oid:2.16.840.1.113883.5.90) (CONF:1198-31872)."
  * associatedEntity 1..1
    * ^comment = "SHALL contain exactly one [1..1] associatedEntity (CONF:1198-31600)."
    * classCode 1..1
    * classCode from INDRoleclassCodes (required)
      * ^comment = "This associatedEntity SHALL contain exactly one [1..1] @classCode, which SHALL be selected from ValueSet INDRoleclassCodes urn:oid:2.16.840.1.113883.11.20.9.33 DYNAMIC (CONF:1198-31873)."
    * associatedPerson 1..1
      * ^comment = "This associatedEntity SHALL contain exactly one [1..1] associatedPerson (CONF:1198-31601)."
      * name 1..*
        * ^comment = "This associatedPerson SHALL contain at least one [1..*] name (CONF:1198-31602)."
* participant[callback] ^comment = "SHOULD contain zero or more [0..*] participant (CONF:1198-31626) such that it"  // man-should
  * typeCode 1..1
  * typeCode = #CALLBCK (exactly)
    * ^comment = "SHALL contain exactly one [1..1] @typeCode=\"CALLBCK\" Call back contact (CodeSystem: HL7ParticipationType urn:oid:2.16.840.1.113883.5.90) (CONF:1198-31627)."
  * associatedEntity 1..1
    * ^comment = "SHALL contain exactly one [1..1] associatedEntity (CONF:1198-31628)."
    * classCode 1..1
    * classCode = #ASSIGNED (exactly)
      * ^comment = "This associatedEntity SHALL contain exactly one [1..1] @classCode=\"ASSIGNED\" assigned entity (CodeSystem: HL7RoleClass urn:oid:2.16.840.1.113883.5.110) (CONF:1198-31641)."
    * id 1..*
      * ^comment = "This associatedEntity SHALL contain at least one [1..*] id (CONF:1198-31629)."
    * obeys should-addr
    * addr 0..*
    * addr only USRealmAddress
      * ^comment = "This associatedEntity SHOULD contain zero or more [0..*] addr (CONF:1198-31630)." // auto-should
    * telecom 1..*
      * ^comment = "This associatedEntity SHALL contain at least one [1..*] telecom (CONF:1198-31631)."
    * associatedPerson 1..1
      * ^comment = "This associatedEntity SHALL contain exactly one [1..1] associatedPerson (CONF:1198-31632)."
      * name 1..*
        * ^comment = "This associatedPerson SHALL contain at least one [1..*] name (CONF:1198-31633)."
    * scopingOrganization 0..1
      * ^comment = "This associatedEntity MAY contain zero or one [0..1] scopingOrganization (CONF:1198-31634)."
* documentationOf 1..1
  * ^comment = "SHALL contain exactly one [1..1] documentationOf (CONF:1198-31570)."
  * serviceEvent 1..1
    * ^short = "The serviceEvent in a Transfer Note contains the representation of providers who are wholly or partially responsible for the safety and well-being of a subject of care."
    * ^comment = "This documentationOf SHALL contain exactly one [1..1] serviceEvent (CONF:1198-31571)."
    * classCode 1..1
    * classCode = #PCPR (exactly)
      * ^comment = "This serviceEvent SHALL contain exactly one [1..1] @classCode=\"PCPR\" Care Provision (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:1198-31572)."
    * code 0..1
      * ^short = "Use serviceEvent/code when using a generic document type code such as 18761-7 (Provider-Unspecified Transfer Summary) to represent the service."
      * ^comment = "This serviceEvent MAY contain zero or one [0..1] code (CONF:1198-32650)."
    * performer ^slicing.discriminator[0].type = #value
      * ^slicing.discriminator[=].path = "typeCode"
      * ^slicing.rules = #open
    * performer contains performer1 1..*
    * performer[performer1] ^comment = "This serviceEvent SHALL contain at least one [1..*] performer (CONF:1198-31574) such that it"
      * typeCode 1..1
      * typeCode = #PRF (exactly)
        * ^comment = "SHALL contain exactly one [1..1] @typeCode=\"PRF\" Participation of Physical Performer (CodeSystem: HL7ParticipationType urn:oid:2.16.840.1.113883.5.90 DYNAMIC) (CONF:1198-31575)."
      * functionCode 0..1
      * functionCode from $2.16.840.1.114222.4.11.1066 (preferred)
        * ^short = "Use performer/functionCode when using a generic document type code such as 18761-7 (Provider-Unspecified Transfer Summary) to represent the provider."
        * ^comment = "MAY contain zero or one [0..1] functionCode, which SHOULD be selected from ValueSet Healthcare Provider Taxonomy urn:oid:2.16.840.1.114222.4.11.1066 DYNAMIC (CONF:1198-32651)."
* component 1..1
  * ^comment = "SHALL contain exactly one [1..1] component (CONF:1198-28251)."
  * structuredBody 1..1
    * obeys ap-or-a-and-p and ap-combo
    * obeys should-section-advance-directives
    * obeys should-section-functional-status
    * obeys should-section-discharge-dx
    * obeys should-section-procedures
    * obeys should-section-social-history
    * obeys should-section-mental-status
    * obeys should-section-nutrition
    * obeys should-section-hpi
    * ^comment = "This component SHALL contain exactly one [1..1] structuredBody (CONF:1198-28252)."
    * component 7..
      * ^slicing.discriminator[0].type = #profile
      * ^slicing.discriminator[=].path = "section"
      * ^slicing.rules = #open
    * component contains
        advanceDirectives 0..1 and
        allergiesAndIntolerances 1..1 and
        physicalExam 0..1 and
        encounters 0..1 and
        familyHistory 0..1 and
        functionalStatus 0..1 and
        dischargeDiagnosis 0..1 and
        immunizations 0..1 and
        medicalEquip 0..1 and
        medications 1..1 and
        payers 0..1 and
        planOfTreatment 0..1 and
        problem 1..1 and
        procedures 0..1 and
        results 1..1 and
        socialHistory 0..1 and
        vitalSigns 1..1 and
        mentalStatus 0..1 and
        generalStatus 0..1 and
        reviewOfSystems 0..1 and
        nutrition 0..1 and
        reasonForReferral 1..1 and
        pastMedicalHistory 0..1 and
        historyOfPresentIllness 0..1 and
        assessmentAndPlan 0..1 and
        assessment 0..1 and
        admissionMedications 0..1 and
        admissionDiagnosis 0..1 and
        courseOfCare 0..1
    * component[advanceDirectives] ^comment = "This structuredBody SHOULD contain zero or one [0..1] component (CONF:1198-28253) such that it" // man-should
      * ^condition = "should-section-advance-directives"
      * section only AdvanceDirectivesSection
        * ^comment = "The component, if present, SHALL contain exactly one [1..1] Advance Directives Section (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.2.21.1:2024-05-01) (CONF:1198-28254)."
    * component[allergiesAndIntolerances] ^comment = "This structuredBody SHALL contain exactly one [1..1] component (CONF:1198-28255) such that it"
      * section only AllergiesAndIntolerancesSection
        * ^comment = "SHALL contain exactly one [1..1] Allergies and Intolerances Section (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.2.6.1:2024-05-01) (CONF:1198-28256)."
    * component[physicalExam] ^comment = "This structuredBody MAY contain zero or one [0..1] component (CONF:1198-28257) such that it"
      * section only PhysicalExamSection
        * ^comment = "SHALL contain exactly one [1..1] Physical Exam Section (identifier: urn:hl7ii:2.16.840.1.113883.10.20.2.10:2024-05-01) (CONF:1198-28258)."
    * component[encounters] ^comment = "This structuredBody MAY contain zero or one [0..1] component (CONF:1198-28261) such that it"
      * section only EncountersSection
        * ^comment = "SHALL contain exactly one [1..1] Encounters Section (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.2.22.1:2024-05-01) (CONF:1198-28262)."
    * component[familyHistory] ^comment = "This structuredBody MAY contain zero or one [0..1] component (CONF:1198-28263) such that it"
      * section only FamilyHistorySection
        * ^comment = "SHALL contain exactly one [1..1] Family History Section (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.2.15:2024-05-01) (CONF:1198-28264)."
    * component[functionalStatus] ^comment = "This structuredBody SHOULD contain zero or one [0..1] component (CONF:1198-28265) such that it" // man-should
      * ^condition = "should-section-functional-status"
      * section only FunctionalStatusSection
        * ^comment = "SHALL contain exactly one [1..1] Functional Status Section (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.2.14:2014-06-09) (CONF:1198-28266)."
    * component[dischargeDiagnosis] ^comment = "This structuredBody SHOULD contain zero or one [0..1] component (CONF:1198-28271) such that it" // man-should
      * ^condition = "should-section-discharge-dx"
      * section only DischargeDiagnosisSection
        * ^comment = "SHALL contain exactly one [1..1] Discharge Diagnosis Section (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.2.24:2024-05-01) (CONF:1198-28272)."
    * component[immunizations] ^comment = "This structuredBody MAY contain zero or one [0..1] component (CONF:1198-28273) such that it"
      * section only ImmunizationsSection
        * ^comment = "SHALL contain exactly one [1..1] Immunizations Section (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.2.2.1:2024-05-01) (CONF:1198-28274)."
    * component[medicalEquip] ^comment = "This structuredBody MAY contain zero or one [0..1] component (CONF:1198-28275) such that it"
      * section only MedicalEquipmentSection
        * ^comment = "SHALL contain exactly one [1..1] Medical Equipment Section (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.2.23:2014-06-09) (CONF:1198-28276)."
    * component[medications] ^comment = "This structuredBody SHALL contain exactly one [1..1] component (CONF:1198-28277) such that it"
      * section only MedicationsSection
        * ^comment = "SHALL contain exactly one [1..1] Medications Section (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.2.1.1:2014-06-09) (CONF:1198-28278)."
    * component[payers] ^comment = "This structuredBody MAY contain zero or one [0..1] component (CONF:1198-28279) such that it"
      * section only PayersSection
        * ^comment = "SHALL contain exactly one [1..1] Payers Section (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.2.18:2024-05-01) (CONF:1198-28280)."
    * component[planOfTreatment] ^comment = "This structuredBody MAY contain zero or one [0..1] component (CONF:1198-28281) such that it"
      * ^condition[+] = "ap-or-a-and-p"
      * ^condition[+] = "ap-combo"
      * section only PlanofTreatmentSection
        * ^comment = "SHALL contain exactly one [1..1] Plan of Treatment Section (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.2.10:2014-06-09) (CONF:1198-28282)."
    * component[problem] ^comment = "This structuredBody SHALL contain exactly one [1..1] component (CONF:1198-28283) such that it"
      * section only ProblemSection
        * ^comment = "SHALL contain exactly one [1..1] Problem Section (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.2.5.1:2024-05-01) (CONF:1198-28284)."
    * component[procedures] ^comment = "This structuredBody SHOULD contain zero or one [0..1] component (CONF:1198-28285) such that it" // man-should
      * ^condition[+] = "should-section-procedures"
      * section only ProceduresSection
        * ^comment = "SHALL contain exactly one [1..1] Procedures Section  (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.2.7.1:2014-06-09) (CONF:1198-28286)."
    * component[results] ^comment = "This structuredBody SHALL contain exactly one [1..1] component (CONF:1198-28287) such that it"
      * section only ResultsSection
        * ^comment = "SHALL contain exactly one [1..1] Results Section (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.2.3.1:2024-05-01) (CONF:1198-28288)."
    * component[socialHistory] ^comment = "This structuredBody SHOULD contain zero or one [0..1] component (CONF:1198-28289) such that it" // man-should
      * ^condition = "should-section-social-history"
      * section only SocialHistorySection
        * ^comment = "SHALL contain exactly one [1..1] Social History Section (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.2.17:2024-05-01) (CONF:1198-28290)."
    * component[vitalSigns] ^comment = "This structuredBody SHALL contain exactly one [1..1] component (CONF:1198-28291) such that it"
      * section only VitalSignsSection
        * ^comment = "SHALL contain exactly one [1..1] Vital Signs Section (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.2.4.1:2024-05-01) (CONF:1198-28292)."
    * component[mentalStatus] ^comment = "This structuredBody SHOULD contain zero or one [0..1] component (CONF:1198-28327) such that it" // man-should
      * ^condition = "should-section-mental-status"
      * section only MentalStatusSection
        * ^comment = "SHALL contain exactly one [1..1] Mental Status Section (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.2.56:2024-05-01) (CONF:1198-28328)."
    * component[generalStatus] ^comment = "This structuredBody MAY contain zero or one [0..1] component (CONF:1198-28838) such that it"
      * section only GeneralStatusSection
        * ^comment = "SHALL contain exactly one [1..1] General Status Section (identifier: urn:oid:2.16.840.1.113883.10.20.2.5) (CONF:1198-28839)."
    * component[reviewOfSystems] ^comment = "This structuredBody MAY contain zero or one [0..1] component (CONF:1198-30239) such that it"
      * section only ReviewofSystemsSection
        * ^comment = "SHALL contain exactly one [1..1] Review of Systems Section (identifier: urn:oid:1.3.6.1.4.1.19376.1.5.3.1.3.18) (CONF:1198-30240)."
    * component[nutrition] ^comment = "This structuredBody SHOULD contain zero or one [0..1] component (CONF:1198-30776) such that it" // man-should
      * ^condition = "should-section-nutrition"
      * section only NutritionSection
        * ^comment = "SHALL contain exactly one [1..1] Nutrition Section (identifier: urn:oid:2.16.840.1.113883.10.20.22.2.57) (CONF:1198-30777)."
    * component[reasonForReferral] ^comment = "This structuredBody SHALL contain exactly one [1..1] component (CONF:1198-31342) such that it"
      * section only ReasonforReferralSection
        * ^comment = "SHALL contain exactly one [1..1] Reason for Referral Section (identifier: urn:hl7ii:1.3.6.1.4.1.19376.1.5.3.1.3.1:2014-06-09) (CONF:1198-31343)."
    * component[pastMedicalHistory] ^comment = "This structuredBody MAY contain zero or one [0..1] component (CONF:1198-31561) such that it"
      * section only PastMedicalHistory
        * ^comment = "SHALL contain exactly one [1..1] Past Medical History (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.2.20:2024-05-01) (CONF:1198-31562)."
    * component[historyOfPresentIllness] ^comment = "This structuredBody SHOULD contain zero or one [0..1] component (CONF:1198-31563) such that it" // man-should
      * ^condition = "should-section-hpi"
      * section only HistoryofPresentIllnessSection
        * ^comment = "SHALL contain exactly one [1..1] History of Present Illness Section (identifier: urn:oid:1.3.6.1.4.1.19376.1.5.3.1.3.4) (CONF:1198-31564)."
    * component[assessmentAndPlan] ^comment = "This structuredBody MAY contain zero or one [0..1] component (CONF:1198-31565) such that it"
      * ^condition[+] = "ap-or-a-and-p"
      * ^condition[+] = "ap-combo"
      * section only AssessmentandPlanSection
        * ^comment = "SHALL contain exactly one [1..1] Assessment and Plan Section (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.2.9:2014-06-09) (CONF:1198-31566)."
    * component[assessment] ^comment = "This structuredBody MAY contain zero or one [0..1] component (CONF:1198-31567) such that it"
      * ^condition[+] = "ap-or-a-and-p"
      * ^condition[+] = "ap-combo"
      * section only AssessmentSection
        * ^comment = "SHALL contain exactly one [1..1] Assessment Section (identifier: urn:oid:2.16.840.1.113883.10.20.22.2.8) (CONF:1198-31568)."
    * component[admissionMedications] ^comment = "This structuredBody MAY contain zero or one [0..1] component (CONF:1198-32445) such that it"
      * section only AdmissionMedicationsSectionEntriesOptional
        * ^comment = "SHALL contain exactly one [1..1] Admission Medications Section (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.2.44.1:2024-05-01) (CONF:1198-32446)."
    * component[admissionDiagnosis] ^comment = "This structuredBody MAY contain zero or one [0..1] component (CONF:1198-32447) such that it"
      * section only AdmissionDiagnosisSection
        * ^comment = "SHALL contain exactly one [1..1] Admission Diagnosis Section (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.2.43:2024-05-01) (CONF:1198-32448)."
    * component[courseOfCare] ^comment = "This structuredBody MAY contain zero or one [0..1] component (CONF:1198-32648) such that it"
      * section only CourseofCareSection
        * ^comment = "SHALL contain exactly one [1..1] Course of Care Section (identifier: urn:oid:2.16.840.1.113883.10.20.22.2.64) (CONF:1198-32649)."
