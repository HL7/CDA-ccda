Profile: ReferralNote
Parent: USRealmHeader
Id: ReferralNote
Title: "Referral Note"
Description: """A Referral Note communicates pertinent information from a provider who is requesting services of another provider of clinical or non-clinical services. The information in this document includes the reason for the referral and additional information that would augment decision making and care delivery. 

Examples of referral situations are when a patient is referred from a family physician to a cardiologist for cardiac evaluation or when patient is sent by a cardiologist to an emergency department for angina or when a patient is referred by a nurse practitioner to an audiologist for hearing screening or when a patient is referred by a hospitalist to social services."""

* insert LogicalModelTemplate(referral-note, 2.16.840.1.113883.10.20.22.1.14, 2024-05-01)

* ^status = #active
* code 1..1
* code from ReferralDocumentType (required)
  * ^short = "The Referral Note recommends use of the document type code 57133-1 \"Referral Note\", with further specification provided by author or performer, setting, or specialty. When pre-coordinated codes are used, any coded values describing the author or performer of the service act or the practice setting must be consistent with the LOINC document type. For example, an Obstetrics and Gynecology Referral note would not be authored by a Pediatric Cardiologist.  The type of referral and the target of the referral are specified via the participant (and not via the author)."
  * ^comment = "SHALL contain exactly one [1..1] code, which SHALL be selected from ValueSet ReferralDocumentType http://hl7.org/fhir/ccda/ValueSet/2.16.840.1.113883.1.11.20.2.3 DYNAMIC (CONF:1198-28949)."
* informationRecipient 1..1
  * ^comment = "SHALL contain exactly one [1..1] informationRecipient (CONF:1198-31589)."
  * intendedRecipient 1..1
    * ^comment = "This informationRecipient SHALL contain exactly one [1..1] intendedRecipient (CONF:1198-31590)."
    * obeys should-addr
    * addr 0..*
    * addr only USRealmAddress
      * ^comment = "This intendedRecipient SHOULD contain zero or more [0..*] addr (CONF:1198-31591)." // auto-should
    * obeys should-telecom
    * telecom 0..*
      * ^comment = "This intendedRecipient SHOULD contain zero or more [0..*] telecom (CONF:1198-31592)." // auto-should
    * informationRecipient 1..1
      * ^comment = "This intendedRecipient SHALL contain exactly one [1..1] informationRecipient (CONF:1198-31593)."
      * name 1..*
      * name only USRealmPersonNamePNUSFIELDED
        * ^comment = "This informationRecipient SHALL contain at least one [1..*] US Realm Person Name (PN.US.FIELDED) (identifier: urn:oid:2.16.840.1.113883.10.20.22.5.1.1) (CONF:1198-31594)."
* obeys should-participant-indirect
* obeys should-participant-callback
* participant ^slicing.discriminator[0].type = #value
  * ^slicing.discriminator[=].path = "typeCode"
  * ^slicing.rules = #open
* participant contains
    indirect 0..* and
    callback 0..*
* participant[indirect] ^comment = "SHOULD contain zero or more [0..*] participant (CONF:1198-31642) such that it"  // man-should
  * typeCode 1..1
  * typeCode = #IND (exactly)
    * ^comment = "SHALL contain exactly one [1..1] @typeCode=\"IND\" Indirect (CodeSystem: HL7ParticipationType urn:oid:2.16.840.1.113883.5.90) (CONF:1198-31924)."
  * associatedEntity 1..1
    * ^comment = "SHALL contain exactly one [1..1] associatedEntity (CONF:1198-31643)."
    * classCode 1..1
    * classCode from INDRoleclassCodes (required)
      * ^comment = "This associatedEntity SHALL contain exactly one [1..1] @classCode, which SHALL be selected from ValueSet INDRoleclassCodes urn:oid:2.16.840.1.113883.11.20.9.33 DYNAMIC (CONF:1198-31925)."
    * associatedPerson 1..1
      * ^comment = "This associatedEntity SHALL contain exactly one [1..1] associatedPerson (CONF:1198-31644)."
      * name 1..*
      * name only USRealmPersonNamePNUSFIELDED
        * ^comment = "This associatedPerson SHALL contain at least one [1..*] US Realm Person Name ."
* participant[callback] ^comment = "SHOULD contain zero or more [0..*] participant (CONF:1198-31647) such that it"  // man-should
  * ^short = "This participant represents the clinician to contact for questions about the referral note.  This call back contact individual may be a different person than the individual(s) identified in the author or legalAuthenticator participant."
  * typeCode 1..1
  * typeCode = #CALLBCK (exactly)
    * ^comment = "SHALL contain exactly one [1..1] @typeCode=\"CALLBCK\" call back contact (CodeSystem: HL7ParticipationType urn:oid:2.16.840.1.113883.5.90 DYNAMIC) (CONF:1198-31648)."
  * associatedEntity 1..1
    * ^comment = "SHALL contain exactly one [1..1] associatedEntity (CONF:1198-31649)."
    * classCode 1..1
    * classCode = #ASSIGNED (exactly)
      * ^comment = "This associatedEntity SHALL contain exactly one [1..1] @classCode=\"ASSIGNED\" assigned entity (CodeSystem: HL7RoleClass urn:oid:2.16.840.1.113883.5.110) (CONF:1198-32419)."
    * id 1..*
      * ^comment = "This associatedEntity SHALL contain at least one [1..*] id (CONF:1198-31650)."
    * obeys should-addr
    * addr 0..*
    * addr only USRealmAddress
      * ^comment = "This associatedEntity SHOULD contain zero or more [0..*] addr (CONF:1198-31651)." // auto-should
    * telecom 1..*
      * ^comment = "This associatedEntity SHALL contain at least one [1..*] telecom (CONF:1198-31652)."
    * associatedPerson 1..1
      * ^comment = "This associatedEntity SHALL contain exactly one [1..1] associatedPerson (CONF:1198-31653)."
      * name 1..*
        * ^comment = "This associatedPerson SHALL contain at least one [1..*] name (CONF:1198-31654)."
    * scopingOrganization 0..1
      * ^comment = "This associatedEntity MAY contain zero or one [0..1] scopingOrganization (CONF:1198-31655)."
* component 1..1
  * structuredBody 1..1
    * obeys ap-or-a-and-p and ap-combo
    * obeys should-section-plan-of-treatment
    * obeys should-section-results
    * obeys should-section-functional-status
    * obeys should-section-mental-status
    * obeys should-section-nutrition
    * ^comment = "This component SHALL contain exactly one [1..1] structuredBody (CONF:1198-29063)."
    * component ^slicing.discriminator[0].type = #profile
      * ^slicing.discriminator[=].path = "section"
      * ^slicing.rules = #open
    * component contains
        planOfTreatment 0..1 and
        advanceDirectives 0..1 and
        historyOfPresentIllness 0..1 and
        familyHistory 0..1 and
        immunizations 0..1 and
        problem 1..1 and
        procedures 0..1 and
        results 0..1 and
        reviewOfSystems 0..1 and
        socialHistory 0..1 and
        vitalSigns 0..1 and
        functionalStatus 0..1 and
        physicalExam 0..1 and
        nutrition 0..1 and
        mentalStatus 0..1 and
        medicalEquip 0..1 and
        allergiesAndIntolerances 1..1 and
        assessment 0..1 and
        assessmentAndPlan 0..1 and
        medicalHistory 0..1 and
        generalStatus 0..1 and
        medications 1..1 and
        reasonForReferral 1..1 and
        payers 0..1
    * component[planOfTreatment] ^comment = "This structuredBody SHOULD contain zero or one [0..1] component (CONF:1198-29066) such that it" // man-should
      * section only PlanofTreatmentSection
        * ^comment = "The component, if present, SHALL contain exactly one [1..1] Plan of Treatment Section (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.2.10:2014-06-09) (CONF:1198-29067)."
    * component[advanceDirectives] ^comment = "This structuredBody MAY contain zero or one [0..1] component (CONF:1198-29068) such that it"
      * section only AdvanceDirectivesSection
        * ^comment = "SHALL contain exactly one [1..1] Advance Directives Section (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.2.21.1:2024-05-01) (CONF:1198-29069)."
    * component[historyOfPresentIllness] ^comment = "This structuredBody MAY contain zero or one [0..1] component (CONF:1198-29074) such that it"
      * section only HistoryofPresentIllnessSection
        * ^comment = "SHALL contain exactly one [1..1] History of Present Illness Section (identifier: urn:oid:1.3.6.1.4.1.19376.1.5.3.1.3.4) (CONF:1198-29075)."
    * component[familyHistory] ^comment = "This structuredBody MAY contain zero or one [0..1] component (CONF:1198-29076) such that it"
      * section only FamilyHistorySection
        * ^comment = "SHALL contain exactly one [1..1] Family History Section (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.2.15:2024-05-01) (CONF:1198-29077)."
    * component[immunizations] ^comment = "This structuredBody MAY contain zero or one [0..1] component (CONF:1198-29082) such that it"
      * section only ImmunizationsSection
        * ^comment = "SHALL contain exactly one [1..1] Immunizations Section (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.2.2.1:2024-05-01) (CONF:1198-29083)."
    * component[problem] ^comment = "This structuredBody SHALL contain exactly one [1..1] component (CONF:1198-29086) such that it"
      * section only ProblemSection
        * ^comment = "SHALL contain exactly one [1..1] Problem Section (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.2.5.1:2024-05-01) (CONF:1198-29087)."
    * component[procedures] ^comment = "This structuredBody MAY contain zero or one [0..1] component (CONF:1198-29088) such that it"
      * section only ProceduresSection
        * ^comment = "SHALL contain exactly one [1..1] Procedures Section (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.2.7.1:2014-06-09) (CONF:1198-29089)."
    * component[results] ^comment = "This structuredBody SHOULD contain zero or one [0..1] component (CONF:1198-29090) such that it" // man-should
      * section only ResultsSection
        * ^comment = "SHALL contain exactly one [1..1] Results Section (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.2.3.1:2024-05-01) (CONF:1198-29091)."
    * component[reviewOfSystems] ^comment = "This structuredBody MAY contain zero or one [0..1] component (CONF:1198-29092) such that it"
      * section only ReviewofSystemsSection
        * ^comment = "SHALL contain exactly one [1..1] Review of Systems Section (identifier: urn:oid:1.3.6.1.4.1.19376.1.5.3.1.3.18) (CONF:1198-29093)."
    * component[socialHistory] ^comment = "This structuredBody MAY contain zero or one [0..1] component (CONF:1198-29094) such that it"
      * section only SocialHistorySection
        * ^comment = "SHALL contain exactly one [1..1] Social History Section (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.2.17:2024-05-01) (CONF:1198-29095)."
    * component[vitalSigns] ^comment = "This structuredBody MAY contain zero or one [0..1] component (CONF:1198-29096) such that it"
      * section only VitalSignsSection
        * ^comment = "SHALL contain exactly one [1..1] Vital Signs Section (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.2.4.1:2024-05-01) (CONF:1198-29097)."
    * component[functionalStatus] ^comment = "This structuredBody SHOULD contain zero or one [0..1] component (CONF:1198-29098) such that it" // man-should
      * section only FunctionalStatusSection
        * ^comment = "SHALL contain exactly one [1..1] Functional Status Section (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.2.14:2014-06-09) (CONF:1198-29099)."
    * component[physicalExam] ^comment = "This structuredBody MAY contain zero or one [0..1] component (CONF:1198-29100) such that it"
      * section only PhysicalExamSection
        * ^comment = "SHALL contain exactly one [1..1] Physical Exam Section (identifier: urn:hl7ii:2.16.840.1.113883.10.20.2.10:2024-05-01) (CONF:1198-29101)."
    * component[nutrition] ^comment = "This structuredBody SHOULD contain zero or one [0..1] component (CONF:1198-30780) such that it" // man-should
      * section only NutritionSection
        * ^comment = "SHALL contain exactly one [1..1] Nutrition Section (identifier: urn:oid:2.16.840.1.113883.10.20.22.2.57) (CONF:1198-30781)."
    * component[mentalStatus] ^comment = "This structuredBody SHOULD contain zero or one [0..1] component (CONF:1198-30796) such that it" // man-should
      * section only MentalStatusSection
        * ^comment = "SHALL contain exactly one [1..1] Mental Status Section (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.2.56:2024-05-01) (CONF:1198-30926)."
    * component[medicalEquip] ^comment = "This structuredBody MAY contain zero or one [0..1] component (CONF:1198-30798) such that it"
      * section only MedicalEquipmentSection
        * ^comment = "SHALL contain exactly one [1..1] Medical Equipment Section (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.2.23:2014-06-09) (CONF:1198-30799)."
    * component[allergiesAndIntolerances] ^comment = "This structuredBody SHALL contain exactly one [1..1] component (CONF:1198-30911) such that it"
      * section only AllergiesAndIntolerancesSection
        * ^comment = "SHALL contain exactly one [1..1] Allergies and Intolerances Section (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.2.6.1:2024-05-01) (CONF:1198-30912)."
    * component[assessment] ^comment = "This structuredBody MAY contain zero or one [0..1] component (CONF:1198-30913) such that it"
      * section only AssessmentSection
        * ^comment = "SHALL contain exactly one [1..1] Assessment Section (identifier: urn:oid:2.16.840.1.113883.10.20.22.2.8) (CONF:1198-30914)."
    * component[assessmentAndPlan] ^comment = "This structuredBody MAY contain zero or one [0..1] component (CONF:1198-30915) such that it"
      * section only AssessmentandPlanSection
        * ^comment = "SHALL contain exactly one [1..1] Assessment and Plan Section (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.2.9:2014-06-09) (CONF:1198-30916)."
    * component[medicalHistory] ^comment = "This structuredBody MAY contain zero or one [0..1] component (CONF:1198-30917) such that it"
      * section only PastMedicalHistory
        * ^comment = "SHALL contain exactly one [1..1] Past Medical History (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.2.20:2024-05-01) (CONF:1198-30918)."
    * component[generalStatus] ^comment = "This structuredBody MAY contain zero or one [0..1] component (CONF:1198-30919) such that it"
      * section only GeneralStatusSection
        * ^comment = "SHALL contain exactly one [1..1] General Status Section (identifier: urn:oid:2.16.840.1.113883.10.20.2.5) (CONF:1198-30920)."
    * component[medications] ^comment = "This structuredBody SHALL contain exactly one [1..1] component (CONF:1198-30922) such that it"
      * section only MedicationsSection
        * ^comment = "SHALL contain exactly one [1..1] Medications Section (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.2.1.1:2014-06-09) (CONF:1198-30923)."
    * component[reasonForReferral] ^comment = "This structuredBody SHALL contain exactly one [1..1] component (CONF:1198-30924) such that it"
      * section only ReasonforReferralSection
        * ^comment = "SHALL contain exactly one [1..1] Reason for Referral Section (identifier: urn:hl7ii:1.3.6.1.4.1.19376.1.5.3.1.3.1:2014-06-09) (CONF:1198-30925)."
    * component[payers] ^comment = "This structuredBody SHOULD contain exactly one [0..1] component (CONF:1198-309240) such that it"
      * section only PayersSection
        * ^comment = "SHOULD contain exactly one [0..1] Payers Section (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.2.18:2024-05-01) (CONF:1198-309250)."
