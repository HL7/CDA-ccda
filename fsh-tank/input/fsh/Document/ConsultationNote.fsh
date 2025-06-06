Profile: ConsultationNote
Parent: USRealmHeader
Id: ConsultationNote
Title: "Consultation Note"
Description: """The Consultation Note is generated by a request from a clinician for an opinion or advice from another clinician. Consultations may involve face-to-face time with the patient or may fall under the auspices of telemedicine visits. Consultations may occur while the patient is inpatient or ambulatory. The Consultation Note should also be used to summarize an Emergency Room or Urgent Care encounter.

A Consultation Note includes the reason for the referral, history of present illness, physical examination, and decision-making components (Assessment and Plan)."""

* insert LogicalModelTemplate(consult-note, 2.16.840.1.113883.10.20.22.1.4, 2024-05-01)
* insert DocumentCategory(Consult Note, 11488-4, Consult note)

* ^status = #active
* code 1..1
* code from ConsultDocumentType (required)
  * ^short = "The Consultation Note recommends use of  the document type code 11488-4 \"Consult note\", with further specification provided by author or performer, setting, or specialty. When pre-coordinated codes are used, any coded values describing the author or performer of the service act or the practice setting must be consistent with the LOINC document type."
  * ^comment = "SHALL contain exactly one [1..1] code, which SHALL be selected from ValueSet ConsultDocumentType http://hl7.org/fhir/ccda/ValueSet/2.16.840.1.113883.11.20.9.31 DYNAMIC (CONF:1198-17176)."
* participant ^slicing.discriminator[0].type = #value
  * ^slicing.discriminator[=].path = "typeCode"
  * ^slicing.rules = #open
  * ^short = "This participant represents the person to contact for questions about the consult summary. This call back contact individual may be a different person than the individual(s) identified in the author or legalAuthenticator participant."
* obeys should-participant-callback
* participant contains callback 0..*
* participant[callback] ^comment = "SHOULD contain zero or more [0..*] participant (CONF:1198-31656) such that it" // man-should
  * typeCode 1..1
  * typeCode = #CALLBCK (exactly)
    * ^comment = "SHALL contain exactly one [1..1] @typeCode=\"CALLBCK\" call back contact (CodeSystem: HL7ParticipationType urn:oid:2.16.840.1.113883.5.90 DYNAMIC) (CONF:1198-31657)."
  * associatedEntity 1..1
    * ^comment = "SHALL contain exactly one [1..1] associatedEntity (CONF:1198-31658)."
    * classCode 1..1
    * classCode = #ASSIGNED (exactly)
      * ^comment = "This associatedEntity SHALL contain exactly one [1..1] @classCode=\"ASSIGNED\" assigned entity (CodeSystem: HL7RoleClass urn:oid:2.16.840.1.113883.5.110 DYNAMIC) (CONF:1198-31659)."
    * id 1..*
      * ^comment = "This associatedEntity SHALL contain at least one [1..*] id (CONF:1198-31660)."
    * obeys should-addr
    * addr 0..*
    * addr only USRealmAddress
      * ^comment = "This associatedEntity SHOULD contain zero or more [0..*] addr (CONF:1198-31661)." // auto-should
    * telecom 1..*
      * ^comment = "This associatedEntity SHALL contain at least one [1..*] telecom (CONF:1198-31662)."
    * associatedPerson 1..1
      * ^comment = "This associatedEntity SHALL contain exactly one [1..1] associatedPerson (CONF:1198-31663)."
      * name 1..*
        * ^comment = "This associatedPerson SHALL contain at least one [1..*] name (CONF:1198-31664)."
    * scopingOrganization 0..1
      * ^comment = "This associatedEntity MAY contain zero or one [0..1] scopingOrganization (CONF:1198-31665)."
* inFulfillmentOf 1..*
  * ^short = "The inFulfillmentOf element describes prior orders that are fulfilled (in whole or part) by the service events described in the Consultation Note. For example, a prior order might be the consultation that is being reported in the note."
  * ^comment = "SHALL contain at least one [1..*] inFulfillmentOf (CONF:1198-8382)."
  * order 1..1
    * ^comment = "Such inFulfillmentOfs SHALL contain exactly one [1..1] order (CONF:1198-29923)."
    * id 1..*
      * ^short = "Where a referral is being fulfilled by this consultation, this id would be the same as the id in the Referral Act template."
      * ^comment = "This order SHALL contain at least one [1..*] id (CONF:1198-29924)."
* componentOf 1..1
  * ^short = "A Consultation Note is always associated with an encounter; the id element of the encompassingEncounter is required to be present and represents the identifier for the encounter."
  * ^comment = "SHALL contain exactly one [1..1] componentOf (CONF:1198-8386)."
  * encompassingEncounter 1..1
    * ^comment = "This componentOf SHALL contain exactly one [1..1] encompassingEncounter (CONF:1198-8387)."
    * id 1..*
      * ^comment = "This encompassingEncounter SHALL contain at least one [1..*] id (CONF:1198-8388)."
    * effectiveTime 1..1
    * effectiveTime only USRealmDateTimeInterval
      * ^comment = "This encompassingEncounter SHALL contain exactly one [1..1] US Realm Date and Time (Interval) (identifier: urn:oid:2.16.840.1.113883.10.20.22.5.3) (CONF:1198-8389)."
    * encounterParticipant 0..*
      * ^short = "The encounterParticipant element represents persons who participated in the encounter and not necessarily the entire episode of care."
      * ^comment = "This encompassingEncounter MAY contain zero or more [0..*] encounterParticipant (CONF:1198-8392)."
      * assignedEntity 1..1
        * obeys 1198-32906
        * ^comment = "The encounterParticipant, if present, SHALL contain exactly one [1..1] assignedEntity (CONF:1198-32902)."
* component 1..1
  * ^comment = "SHALL contain exactly one [1..1] component (CONF:1198-8397)."
  * structuredBody 1..1
    * obeys ap-combo and cc-rfv-combo and 1198-9504 and ap-or-a-and-p
    * obeys should-section-medications
    * obeys should-section-physical-exam
    * obeys should-section-results
    * ^comment = "This component SHALL contain exactly one [1..1] structuredBody (CONF:1198-28895)."
    * component 5..
      * ^slicing.discriminator[0].type = #profile
      * ^slicing.discriminator[=].path = "section"
      * ^slicing.rules = #open
    * component contains
        assessment 0..1 and
        assessmentAndPlan 0..1 and
        planOfTreatment 0..1 and
        reasonForVisit 0..1 and
        hpi 1..1 and
        physicalExam 0..1 and
        allergies 1..1 and
        chiefComplaint 0..1 and
        chiefComplaintRFV 0..1 and
        familyHistory 0..1 and
        generalStatus 0..1 and
        pastMedicalHistory 0..1 and
        immunizations 0..1 and
        medications 0..1 and
        problems 1..1 and
        procedures 0..1 and
        results 0..1 and
        socialHist 0..1 and
        vitalSigns 0..1 and
        advDirectives 0..1 and
        functionalStatus 0..1 and
        reviewOfSystems 0..1 and
        medicalEquipment 0..1 and
        mentalStatus 0..1 and
        nutrition 0..1
    * component[assessment] ^comment = "This structuredBody MAY contain zero or one [0..1] component (CONF:1198-28896) such that it"
      * section only AssessmentSection
        * ^comment = "The component, if present, SHALL contain exactly one [1..1] Assessment Section (identifier: urn:oid:2.16.840.1.113883.10.20.22.2.8) (CONF:1198-28897)."
    * component[assessmentAndPlan] ^comment = "This structuredBody MAY contain zero or one [0..1] component (CONF:1198-28898) such that it"
      * section only AssessmentandPlanSection
        * ^comment = "SHALL contain exactly one [1..1] Assessment and Plan Section (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.2.9:2014-06-09) (CONF:1198-28899)."
    * component[planOfTreatment] ^comment = "This structuredBody MAY contain zero or one [0..1] component (CONF:1198-28900) such that it"
      * section only PlanofTreatmentSection
        * ^comment = "SHALL contain exactly one [1..1] Plan of Treatment Section (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.2.10:2014-06-09) (CONF:1198-28901)."
    * component[reasonForVisit] ^comment = "This structuredBody MAY contain zero or one [0..1] component (CONF:1198-28904) such that it"
      * section only ReasonforVisitSection
        * ^comment = "SHALL contain exactly one [1..1] Reason for Visit Section (identifier: urn:oid:2.16.840.1.113883.10.20.22.2.12) (CONF:1198-28905)."
    * component[hpi] ^comment = "This structuredBody SHALL contain exactly one [1..1] component (CONF:1198-28906) such that it"
      * section only HistoryofPresentIllnessSection
        * ^comment = "SHALL contain exactly one [1..1] History of Present Illness Section (identifier: urn:oid:1.3.6.1.4.1.19376.1.5.3.1.3.4) (CONF:1198-28907)."
    * component[physicalExam] ^comment = "This structuredBody SHOULD contain zero or one [0..1] component (CONF:1198-28908) such that it" // man-should
      * section only PhysicalExamSection
        * ^comment = "SHALL contain exactly one [1..1] Physical Exam Section (identifier: urn:hl7ii:2.16.840.1.113883.10.20.2.10:2024-05-01) (CONF:1198-28909)."
    * component[allergies] ^comment = "This structuredBody SHALL contain exactly one [1..1] component (CONF:1198-28910) such that it"
      * section only AllergiesAndIntolerancesSection
        * ^comment = "SHALL contain exactly one [1..1] Allergies and Intolerances Section (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.2.6.1:2024-05-01) (CONF:1198-28911)."
    * component[chiefComplaint] ^comment = "This structuredBody MAY contain zero or one [0..1] component (CONF:1198-28912) such that it"
      * section only ChiefComplaintSection
        * ^comment = "SHALL contain exactly one [1..1] Chief Complaint Section (identifier: urn:oid:1.3.6.1.4.1.19376.1.5.3.1.1.13.2.1) (CONF:1198-28913)."
    * component[chiefComplaintRFV] ^comment = "This structuredBody MAY contain zero or one [0..1] component (CONF:1198-28915) such that it"
      * section only ChiefComplaintandReasonforVisitSection
        * ^comment = "SHALL contain exactly one [1..1] Chief Complaint and Reason for Visit Section (identifier: urn:oid:2.16.840.1.113883.10.20.22.2.13) (CONF:1198-28916)."
    * component[familyHistory] ^comment = "This structuredBody MAY contain zero or one [0..1] component (CONF:1198-28917) such that it"
      * section only FamilyHistorySection
        * ^comment = "SHALL contain exactly one [1..1] Family History Section (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.2.15:2024-05-01) (CONF:1198-28918)."
    * component[generalStatus] ^comment = "This structuredBody MAY contain zero or one [0..1] component (CONF:1198-28919) such that it"
      * section only GeneralStatusSection
        * ^comment = "SHALL contain exactly one [1..1] General Status Section (identifier: urn:oid:2.16.840.1.113883.10.20.2.5) (CONF:1198-28920)."
    * component[pastMedicalHistory] ^comment = "This structuredBody MAY contain zero or one [0..1] component (CONF:1198-28921) such that it"
      * section only PastMedicalHistory
        * ^comment = "SHALL contain exactly one [1..1] Past Medical History (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.2.20:2024-05-01) (CONF:1198-28922)."
    * component[immunizations] ^comment = "This structuredBody MAY contain zero or one [0..1] component (CONF:1198-28923) such that it"
      * section only ImmunizationsSection
        * ^comment = "SHALL contain exactly one [1..1] Immunizations Section (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.2.2.1:2024-05-01) (CONF:1198-28924)."
    * component[medications] ^comment = "This structuredBody SHOULD contain zero or one [0..1] component (CONF:1198-28925) such that it" // man-should
      * section only MedicationsSection
        * ^comment = "SHALL contain exactly one [1..1] Medications Section (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.2.1.1:2014-06-09) (CONF:1198-28926)."
    * component[problems] ^comment = "This structuredBody SHALL contain exactly one [1..1] component (CONF:1198-28928) such that it"
      * section only ProblemSection
        * ^comment = "SHALL contain exactly one [1..1] Problem Section (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.2.5.1:2024-05-01) (CONF:1198-28929)."
    * component[procedures] ^comment = "This structuredBody MAY contain zero or one [0..1] component (CONF:1198-28930) such that it"
      * section only ProceduresSection
        * ^comment = "SHALL contain exactly one [1..1] Procedures Section (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.2.7.1:2014-06-09) (CONF:1198-28931)."
    * component[results] ^comment = "This structuredBody SHOULD contain zero or one [0..1] component (CONF:1198-28932) such that it" // man-should
      * section only ResultsSection
        * ^comment = "SHALL contain exactly one [1..1] Results Section (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.2.3.1:2024-05-01) (CONF:1198-28933)."
    * component[socialHist] ^comment = "This structuredBody MAY contain zero or one [0..1] component (CONF:1198-28934) such that it"
      * section only SocialHistorySection
        * ^comment = "SHALL contain exactly one [1..1] Social History Section (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.2.17:2024-05-01) (CONF:1198-28935)."
    * component[vitalSigns] ^comment = "This structuredBody MAY contain zero or one [0..1] component (CONF:1198-28936) such that it"
      * section only VitalSignsSection
        * ^comment = "SHALL contain exactly one [1..1] Vital Signs Section (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.2.4.1:2024-05-01) (CONF:1198-28937)."
    * component[advDirectives] ^comment = "This structuredBody MAY contain zero or one [0..1] component (CONF:1198-28942) such that it"
      * section only AdvanceDirectivesSection
        * ^comment = "SHALL contain exactly one [1..1] Advance Directives Section (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.2.21.1:2024-05-01) (CONF:1198-28943)."
    * component[functionalStatus] ^comment = "This structuredBody MAY contain zero or one [0..1] component (CONF:1198-28944) such that it"
      * section only FunctionalStatusSection
        * ^comment = "SHALL contain exactly one [1..1] Functional Status Section (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.2.14:2014-06-09) (CONF:1198-28945)."
    * component[reviewOfSystems] ^comment = "This structuredBody MAY contain zero or one [0..1] component (CONF:1198-30237) such that it"
      * section only ReviewofSystemsSection
        * ^comment = "SHALL contain exactly one [1..1] Review of Systems Section (identifier: urn:oid:1.3.6.1.4.1.19376.1.5.3.1.3.18) (CONF:1198-30238)."
    * component[medicalEquipment] ^comment = "This structuredBody MAY contain zero or one [0..1] component (CONF:1198-30904) such that it"
      * section only MedicalEquipmentSection
        * ^comment = "SHALL contain exactly one [1..1] Medical Equipment Section (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.2.23:2014-06-09) (CONF:1198-30905)."
    * component[mentalStatus] ^comment = "This structuredBody MAY contain zero or one [0..1] component (CONF:1198-30906) such that it"
      * section only MentalStatusSection
        * ^comment = "SHALL contain exactly one [1..1] Mental Status Section (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.2.56:2024-05-01) (CONF:1198-30907)."
    * component[nutrition] ^comment = "This structuredBody MAY contain zero or one [0..1] component (CONF:1198-30909) such that it"    
      * section only NutritionSection
        * ^comment = "SHALL contain exactly one [1..1] Nutrition Section (identifier: urn:oid:2.16.840.1.113883.10.20.22.2.57) (CONF:1198-30910)."

Invariant: 1198-32906
Description: "This assignedEntity SHALL contain an assignedPerson or a representedOrganization or both (CONF:1198-32906)."
Severity: #error
Expression: "assignedPerson.exists() or representedOrganization.exists()"

Invariant: ap-combo
Description: "This structuredBody **SHALL NOT** contain an Assessment and Plan Section (2.16.840.1.113883.10.20.22.2.9:2014-06-09) when either an Assessment Section (2.16.840.1.113883.10.20.22.2.8) or a Plan of Treatment Section (2.16.840.1.113883.10.20.22.2.10:2014-06-09) is present."
Severity: #error
Expression: "component.where(section.hasTemplateIdOf(AssessmentandPlanSection)).exists() implies component.where(section.hasTemplateIdOf(AssessmentSection) or section.hasTemplateIdOf(PlanofTreatmentSection)).empty()"

Invariant: cc-rfv-combo
Description: "This structuredBody **SHALL NOT** contain a Chief Complaint and Reason for Visit Section (2.16.840.1.113883.10.20.22.2.13) when either a Chief Complaint Section (1.3.6.1.4.1.19376.1.5.3.1.1.13.2.1) or a Reason for Visit Section (2.16.840.1.113883.10.20.22.2.12) is present."
Severity: #error
Expression: "component.where(section.hasTemplateIdOf(ChiefComplaintandReasonforVisitSection)).exists() implies component.where(section.hasTemplateIdOf(ChiefComplaintSection) or section.hasTemplateIdOf(ReasonforVisitSection)).empty()"

Invariant: 1198-9504
Description: "**SHALL** include a Reason for Referral or Reason for Visit section (CONF:1198-9504)."
Severity: #error
Expression: "component.where(section.hasTemplateIdOf(ReasonforReferralSection) or section.hasTemplateIdOf(ReasonforVisitSection)).exists()"

Invariant: ap-or-a-and-p
Description: "**SHALL** include an Assessment and Plan Section, or both an Assessment Section and a Plan of Treatment Section."
Severity: #error
Expression: "component.where(section.hasTemplateIdOf(AssessmentandPlanSection)).exists() or (component.where(section.hasTemplateIdOf(AssessmentSection) or section.hasTemplateIdOf(PlanofTreatmentSection)).count() = 2)"
