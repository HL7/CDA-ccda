Profile: ProgressNote
Parent: USRealmHeader
Id: ProgressNote
Title: "Progress Note"
Description: """This template represents a patient's clinical status during a hospitalization, outpatient visit, treatment with a LTPAC provider, or other healthcare encounter.

Taber's medical dictionary defines a Progress Note as "An ongoing record of a patient's illness and treatment. Physicians, nurses, consultants, and therapists record their notes concerning the progress or lack of progress made by the patient between the time of the previous note and the most recent note."

Mosby's medical dictionary defines a Progress Note as "Notes made by a nurse, physician, social worker, physical therapist, and other health care professionals that describe the patient's condition and the treatment given or planned."

A Progress Note is not a re-evaluation note. A Progress Note is not intended to be a Progress Report for Medicare. Medicare B Section 1833(e) defines the requirements of a Medicare Progress Report."""

* insert LogicalModelTemplate(progress-note, 2.16.840.1.113883.10.20.22.1.9, 2024-05-01)

* ^status = #active
* code from ProgressNoteDocumentTypeCode (required)
  * ^short = "The Progress Note recommends use of a single document type code, 11506-3 \"Subsequent evaluation note\", with further specification provided by author or performer, setting, or specialty. When pre-coordinated codes are used, any coded values describing the author or performer of the service act or the practice setting must be consistent with the LOINC document type."
  * ^comment = "SHALL contain exactly one [1..1] code (CONF:1198-17189)."
* obeys should-documentationOf
* documentationOf 0..1
  * ^short = "A documentationOf can contain a serviceEvent to further specialize the act inherent in the ClinicalDocument/code. In a Progress Note, a serviceEvent can represent the event of writing the Progress Note. The serviceEvent/effectiveTime is the time period the note documents."
  * ^comment = "SHOULD contain zero or one [0..1] documentationOf (CONF:1198-7603)." // auto-should
  * serviceEvent 1..1
    * ^comment = "The documentationOf, if present, SHALL contain exactly one [1..1] serviceEvent (CONF:1198-7604)."
    * classCode 1..1
    * classCode = #PCPR (exactly)
      * ^comment = "This serviceEvent SHALL contain exactly one [1..1] @classCode=\"PCPR\" Care Provision (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:1198-26420)."
    * templateId ^slicing.discriminator[0].type = #value
      * ^slicing.discriminator[=].path = "root"
      * ^slicing.rules = #open
    * templateId contains secondary 1..1
    * templateId[secondary] ^comment = "This serviceEvent SHALL contain exactly one [1..1] templateId (CONF:1198-9480) such that it, SHALL not contain [0..0] extension."
      * root 1..1
      * root = "2.16.840.1.113883.10.20.21.3.1"
        * ^comment = "SHALL contain exactly one [1..1] @root=\"2.16.840.1.113883.10.20.21.3.1\" (CONF:1198-10068)."
      * extension 0..0
    * effectiveTime 1..1
    * effectiveTime only USRealmDateTimeInterval
      * low 1..1
      * obeys 1198-10066
      * ^comment = "This serviceEvent SHALL contain zero or one [0..1] US Realm Date and Time (Interval) (identifier: urn:oid:2.16.840.1.113883.10.20.22.5.3) (CONF:1198-9481)."
* componentOf 1..1
  * ^short = "The Progress Note is always associated with an encounter by the componentOf/encompassingEncounter element in the header. The effectiveTime element for an encompassingEncounter represents the time or time interval in which the encounter took place. A single encounter may contain multiple Progress Notes; hence the effectiveTime elements for a Progress Note (recorded in serviceEvent) and for an encounter (recorded in encompassingEncounter) represent different time intervals. For outpatient encounters that are a point in time, set effectiveTime/high, effectiveTime/low, and effectiveTime/@value to the same time. All visits take place at a specific location. When available, the location ID is included in the encompassingEncounter/location/healthCareFacility/id element."
  * ^comment = "SHALL contain exactly one [1..1] componentOf (CONF:1198-7595)."
  * encompassingEncounter 1..1
    * ^comment = "This componentOf SHALL contain exactly one [1..1] encompassingEncounter (CONF:1198-7596)."
    * id 1..*
      * ^comment = "This encompassingEncounter SHALL contain at least one [1..*] id (CONF:1198-7597)."
    * effectiveTime 1..1
    * effectiveTime only USRealmDateTimeInterval
      * ^comment = "This encompassingEncounter SHALL contain exactly one [1..1] US Realm Date and Time (Interval) (identifier: urn:oid:2.16.840.1.113883.10.20.22.5.3) (CONF:1198-7598)."
      * low 1..1
        * ^comment = "This effectiveTime SHALL contain exactly one [1..1] low (CONF:1198-7599)."
    * location 1..1
      * ^comment = "This encompassingEncounter SHALL contain exactly one [1..1] location (CONF:1198-30879)."
      * healthCareFacility 1..1
        * ^comment = "This location SHALL contain exactly one [1..1] healthCareFacility (CONF:1198-30880)."
        * id 1..*
          * ^comment = "This healthCareFacility SHALL contain at least one [1..*] id (CONF:1198-30881)."
* component 1..1
  * ^comment = "SHALL contain exactly one [1..1] component (CONF:1198-9591)."
  * structuredBody 1..1
    * obeys ap-or-a-and-p and ap-combo
    * ^short = "In this template (templateId 2.16.840.1.113883.10.20.22.1.9.2), coded entries are optional"
    * ^comment = "This component SHALL contain exactly one [1..1] structuredBody (CONF:1198-30617)."
    * component 1..
      * ^slicing.discriminator[0].type = #profile
      * ^slicing.discriminator[=].path = "section"
      * ^slicing.rules = #open
    * component contains
        assessment 0..1 and
        planOfTreatment 0..1 and
        assessmentAndPlan 0..1 and
        allergies 0..1 and
        chiefComplaint 0..1 and
        activities 0..1 and
        instructions 0..1 and
        medications 0..1 and
        objective 0..1 and
        physicalExam 0..1 and
        problems 0..1 and
        results 0..1 and
        reviewOfSystems 0..1 and
        subjective 0..1 and
        vitalSigns 0..1 and
        nutrition 0..1 and
        mentalStatus 0..1 and
        advDirectives 0..1
    * component[assessment] ^comment = "This structuredBody MAY contain zero or one [0..1] component (CONF:1198-30618)."
      * section only AssessmentSection
        * ^comment = "The component, if present, SHALL contain exactly one [1..1] Assessment Section (identifier: urn:oid:2.16.840.1.113883.10.20.22.2.8) (CONF:1198-30619)."
    * component[planOfTreatment] ^comment = "This structuredBody MAY contain zero or one [0..1] component (CONF:1198-30620) such that it"
      * section only PlanofTreatmentSection
        * ^comment = "SHALL contain exactly one [1..1] Plan of Treatment Section (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.2.10:2014-06-09) (CONF:1198-30621)."
    * component[assessmentAndPlan] ^comment = "This structuredBody MAY contain zero or one [0..1] component (CONF:1198-30622) such that it"
      * section only AssessmentandPlanSection
        * ^comment = "SHALL contain exactly one [1..1] Assessment and Plan Section (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.2.9:2014-06-09) (CONF:1198-30623)."
    * component[allergies] ^comment = "This structuredBody MAY contain zero or one [0..1] component (CONF:1198-30624) such that it"
      * section only AllergiesAndIntolerancesSection
        * ^comment = "SHALL contain exactly one [1..1] Allergies and Intolerances Section (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.2.6.1:2024-05-01) (CONF:1198-30625)."
    * component[chiefComplaint] ^comment = "This structuredBody MAY contain zero or one [0..1] component (CONF:1198-30626) such that it"
      * section only ChiefComplaintSection
        * ^comment = "SHALL contain exactly one [1..1] Chief Complaint Section (identifier: urn:oid:1.3.6.1.4.1.19376.1.5.3.1.1.13.2.1) (CONF:1198-30627)."
    * component[activities] ^comment = "This structuredBody MAY contain zero or one [0..1] component (CONF:1198-30628) such that it"
      * section only ActivitiesSection
        * ^comment = "SHALL contain exactly one [1..1] Activities Section (identifier: urn:hl7ii:2.16.840.1.113883.10.20.21.2.3:2024-05-01) (CONF:1198-30629)."
    * component[instructions] ^comment = "This structuredBody MAY contain zero or one [0..1] component (CONF:1198-30639) such that it"
      * section only InstructionsSection
        * ^comment = "SHALL contain exactly one [1..1] Instructions Section (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.2.45:2014-06-09) (CONF:1198-31386)."
    * component[medications] ^comment = "This structuredBody MAY contain zero or one [0..1] component (CONF:1198-30641) such that it"
      * section only MedicationsSection
        * ^comment = "SHALL contain exactly one [1..1] Medications Section (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.2.1.1:2014-06-09) (CONF:1198-30642)."
    * component[objective] ^comment = "This structuredBody MAY contain zero or one [0..1] component (CONF:1198-30643) such that it"
      * section only ObjectiveSection
        * ^comment = "SHALL contain exactly one [1..1] Objective Section (identifier: urn:oid:2.16.840.1.113883.10.20.21.2.1) (CONF:1198-30644)."
    * component[physicalExam] ^comment = "This structuredBody MAY contain zero or one [0..1] component (CONF:1198-30645) such that it"
      * section only PhysicalExamSection
        * ^comment = "SHALL contain exactly one [1..1] Physical Exam Section (identifier: urn:hl7ii:2.16.840.1.113883.10.20.2.10:2024-05-01) (CONF:1198-30646)."
    * component[problems] ^comment = "This structuredBody MAY contain zero or one [0..1] component (CONF:1198-30647) such that it"
      * section only ProblemSection
        * ^comment = "SHALL contain exactly one [1..1] Problem Section (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.2.5.1:2024-05-01) (CONF:1198-30648)."
    * component[results] ^comment = "This structuredBody MAY contain zero or one [0..1] component (CONF:1198-30649) such that it"
      * section only ResultsSection
        * ^comment = "SHALL contain exactly one [1..1] Results Section (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.2.3.1:2024-05-01) (CONF:1198-30650)."
    * component[reviewOfSystems] ^comment = "This structuredBody MAY contain zero or one [0..1] component (CONF:1198-30651) such that it"
      * section only ReviewofSystemsSection
        * ^comment = "SHALL contain exactly one [1..1] Review of Systems Section (identifier: urn:oid:1.3.6.1.4.1.19376.1.5.3.1.3.18) (CONF:1198-30652)."
    * component[subjective] ^comment = "This structuredBody MAY contain zero or one [0..1] component (CONF:1198-30653) such that it"
      * section only SubjectiveSection
        * ^comment = "SHALL contain exactly one [1..1] Subjective Section (identifier: urn:oid:2.16.840.1.113883.10.20.21.2.2) (CONF:1198-30654)."
    * component[vitalSigns] ^comment = "This structuredBody MAY contain zero or one [0..1] component (CONF:1198-30655) such that it"
      * section only VitalSignsSection
        * ^comment = "SHALL contain exactly one [1..1] Vital Signs Section (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.2.4.1:2024-05-01) (CONF:1198-30656)."
    * component[nutrition] ^comment = "This structuredBody MAY contain zero or one [0..1] component (CONF:1198-32626) such that it"
      * section only NutritionSection
        * ^comment = "SHALL contain exactly one [1..1] Nutrition Section (identifier: urn:oid:2.16.840.1.113883.10.20.22.2.57) (CONF:1198-32627)."
    * component[mentalStatus] ^comment = "This structuredBody MAY contain zero or one [0..1] component (CONF:1198-32626) such that it"
      * section only MentalStatusSection
        * ^comment = "SHALL contain exactly one [1..1] Mental Status Section (identifier: urn:oid:2.16.840.1.113883.10.20.22.2.56)."
    * component[advDirectives] ^comment = "This structuredBody MAY contain zero or one [0..1] component (CONF:1198-28942) such that it"
      * section only AdvanceDirectivesSection
        * ^comment = "SHALL contain exactly one [1..1] Advance Directives Section (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.2.21.1:2024-05-01)."

Invariant: 1198-10066
Description: "If a width element is not present, the serviceEvent **SHALL** include effectiveTime/high (CONF:1198-10066)."
Severity: #error
Expression: "width.empty() implies high.exists()"
