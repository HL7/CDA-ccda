Profile: ContinuityofCareDocumentCCD
Parent: USRealmHeader
Id: ContinuityofCareDocumentCCD
Title: "Continuity of Care Document (CCD)"
Description: """This document type was originally based on the Continuity of Care Document (CCD) Release 1.1 which itself was derived from HITSP C32 and CCD Release 1.0.

The Continuity of Care Document (CCD) represents a core data set of the most relevant administrative, demographic, and clinical information facts about a patient's healthcare, covering one or more healthcare encounters. It provides a means for one healthcare practitioner, system, or setting to aggregate all of the pertinent data about a patient and forward it to another to support the continuity of care.  

The primary use case for the CCD is to provide a snapshot in time containing the germane clinical, demographic, and administrative data for a specific patient. The key characteristic of a CCD is that the ServiceEvent is constrained to "PCPR". This means it does not function to report new ServiceEvents associated with performing care. It reports on care that has already been provided. The CCD provides a historical tally of the care over a range of time and is not a record of new services delivered.

More specific use cases, such as a Discharge Summary, Transfer Summary, Referral Note, Consultation Note, or Progress Note, are available as alternative documents in this guide."""
* insert LogicalModelNA
* ^identifier.value = "urn:hl7ii:2.16.840.1.113883.10.20.22.1.2:2015-08-01"
* ^version = "2015-08-01"
* ^status = #active
* templateId ^slicing.discriminator[0].type = #value
  * ^slicing.discriminator[=].path = "root"
  * ^slicing.discriminator[+].type = #value
  * ^slicing.discriminator[=].path = "extension"
  * ^slicing.rules = #open
* templateId contains primary 1..1
* templateId[primary] ^comment = "SHALL contain exactly one [1..1] templateId (CONF:1198-8450) such that it"
  * root 1..1
  * root = "2.16.840.1.113883.10.20.22.1.2"
    * ^comment = "SHALL contain exactly one [1..1] @root=\"2.16.840.1.113883.10.20.22.1.2\" (CONF:1198-10038)."
  * extension 1..1
  * extension = "2015-08-01"
    * ^comment = "SHALL contain exactly one [1..1] @extension=\"2015-08-01\" (CONF:1198-32516)."
* code 1..1
  * ^comment = "SHALL contain exactly one [1..1] code (CONF:1198-17180)."
  * code 1..1
  * code = #34133-9
    * ^comment = "This code SHALL contain exactly one [1..1] @code=\"34133-9\" Summarization of Episode Note (CONF:1198-17181)."
  * codeSystem 1..1
  * codeSystem = "2.16.840.1.113883.6.1"
    * ^comment = "This code SHALL contain exactly one [1..1] @codeSystem=\"2.16.840.1.113883.6.1\" (CodeSystem: LOINC urn:oid:2.16.840.1.113883.6.1) (CONF:1198-32138)."
* author 1..*
  * ^comment = "SHALL contain at least one [1..*] author (CONF:1198-9442)."
  * assignedAuthor 1..1
    * obeys 1198-8456 and 1198-8457
    * ^comment = "Such authors SHALL contain exactly one [1..1] assignedAuthor (CONF:1198-9443)."
* documentationOf 1..1
  * ^short = "The documentationOf relationship in a Continuity Care Document contains the representation of providers who are wholly or partially responsible for the safety and well-being of a subject of care."
  * ^comment = "SHALL contain exactly one [1..1] documentationOf (CONF:1198-8452)."
  * serviceEvent 1..1
    * ^short = "The main activity being described by a CCD is the provision of healthcare over a period of time. This is shown by setting the value of serviceEvent/@classCode to 'PCPR' (care provision) and indicating the duration over which care was provided in serviceEvent/effectiveTime. Additional data from outside this duration may also be included if it is relevant to care provided during that time range (e.g., reviewed during the stated time range). \n\nNOTE: Implementations originating a CCD should take care to discover what the episode of care being summarized is. For example, when a patient fills out a form providing relevant health history, the episode of care being documented might be from birth to the present."
    * ^comment = "This documentationOf SHALL contain exactly one [1..1] serviceEvent (CONF:1198-8480)."
    * classCode 1..1
    * classCode = #PCPR (exactly)
      * ^comment = "This serviceEvent SHALL contain exactly one [1..1] @classCode=\"PCPR\" Care Provision (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:1198-8453)."
    * effectiveTime 1..1
      * ^comment = "This serviceEvent SHALL contain exactly one [1..1] effectiveTime (CONF:1198-8481)."
      * low 1..1
        * ^comment = "This effectiveTime SHALL contain exactly one [1..1] low (CONF:1198-8454)."
      * high 1..1
        * ^comment = "This effectiveTime SHALL contain exactly one [1..1] high (CONF:1198-8455)."
    * performer 0..*
      * ^short = "The serviceEvent/performer represents the healthcare providers involved in the current or pertinent historical care of the patient. Preferably, the patient's key healthcare providers would be listed, particularly their primary physician and any active consulting physicians, therapists, and counselors."
      * ^comment = "This serviceEvent SHOULD contain zero or more [0..*] performer (CONF:1198-8482)."
      * typeCode 1..1
      * typeCode = #PRF (exactly)
        * ^comment = "The performer, if present, SHALL contain exactly one [1..1] @typeCode=\"PRF\" Participation physical performer (CodeSystem: HL7ParticipationType urn:oid:2.16.840.1.113883.5.90 STATIC) (CONF:1198-8458)."
      * assignedEntity ..1
        * ^short = "SG 20230709: Illegal constraint - base has min = 1 (deleted min=0)"
        * ^comment = "The performer, if present, MAY contain zero or one [0..1] assignedEntity (CONF:1198-8459)."
        //"<min value=\"0\"/>"
        * id 1..*
          * obeys 1198-32466
          * ^comment = "The assignedEntity, if present, SHALL contain at least one [1..*] id (CONF:1198-30882)."
          //"<slicing><rules value=\"open\"/></slicing></element>"
          //"SG 20230601 Note that this has some weird extra long path"
          //"<element id=\"ClinicalDocument.documentationOf.serviceEvent.performer.assignedEntity.id:id1\">"
          //"<path value=\"ClinicalDocument.documentationOf.serviceEvent.performer.assignedEntity.id\"/>"
          //"<sliceName value=\"id1\"/>"
        * assignedPerson 0..1
          * ^comment = "The assignedEntity, if present, MAY contain zero or one [0..1] assignedPerson (CONF:1198-32467)."
* component 1..1
  * ^comment = "SHALL contain exactly one [1..1] component (CONF:1198-30659)."
  * structuredBody 1..1
    * ^comment = "This component SHALL contain exactly one [1..1] structuredBody (CONF:1198-30660)."
    * component ^slicing.discriminator[0].type = #profile
      * ^slicing.discriminator[=].path = "section"
      * ^slicing.rules = #open
    * component contains
        allergies 1..1 and
        medications 1..1 and
        problems 1..1 and
        procedures 0..1 and
        results 1..1 and
        advDirectives 0..1 and
        encounters 0..1 and
        famHistory 0..1 and
        functionalStatus 0..1 and
        immunizations 0..1 and
        medEquipment 0..1 and
        payers 0..1 and
        planOfTreatment 0..1 and
        socialHist 1..1 and
        vitalSigns 1..1 and
        mentalStatus 0..1 and
        nutrition 0..1
    * component[allergies] ^comment = "This structuredBody SHALL contain exactly one [1..1] component (CONF:1198-30661)."
      * section only AllergiesAndIntolerancesSection
        * ^comment = "This component SHALL contain exactly one [1..1] Allergies and Intolerances Section (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.2.6.1:2015-08-01) (CONF:1198-30662)."
    * component[medications] ^comment = "This structuredBody SHALL contain exactly one [1..1] component (CONF:1198-30663) such that it"
      * section only MedicationsSection
        * ^comment = "SHALL contain exactly one [1..1] Medications Section (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.2.1.1:2014-06-09) (CONF:1198-30664)."
    * component[problems] ^comment = "This structuredBody SHALL contain exactly one [1..1] component (CONF:1198-30665) such that it"
      * section only ProblemSection
        * ^comment = "SHALL contain exactly one [1..1] Problem Section (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.2.5.1:2015-08-01) (CONF:1198-30666)."
    * component[procedures] ^comment = "This structuredBody SHOULD contain zero or one [0..1] component (CONF:1198-30667) such that it"
      * section only ProceduresSection
        * ^comment = "SHALL contain exactly one [1..1] Procedures Section (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.2.7.1:2014-06-09) (CONF:1198-30668)."
    * component[results] ^comment = "This structuredBody SHALL contain exactly one [1..1] component (CONF:1198-30669) such that it"
      * section only ResultsSection
        * ^comment = "SHALL contain exactly one [1..1] Results Section (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.2.3.1:2015-08-01) (CONF:1198-30670)."
    * component[advDirectives] ^comment = "This structuredBody MAY contain zero or one [0..1] component (CONF:1198-30671) such that it"
      * section only AdvanceDirectivesSection
        * ^comment = "SHALL contain exactly one [1..1] Advance Directives Section (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.2.21.1:2015-08-01) (CONF:1198-30672)."
    * component[encounters] ^comment = "This structuredBody MAY contain zero or one [0..1] component (CONF:1198-30673) such that it"
      * section only EncountersSection
        * ^comment = "SHALL contain exactly one [1..1] Encounters Section (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.2.22.1:2015-08-01) (CONF:1198-30674)."
    * component[famHistory] ^comment = "This structuredBody MAY contain zero or one [0..1] component (CONF:1198-30675) such that it"
      * section only FamilyHistorySection
        * ^comment = "SHALL contain exactly one [1..1] Family History Section (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.2.15:2015-08-01) (CONF:1198-30676)."
    * component[functionalStatus] ^comment = "This structuredBody MAY contain zero or one [0..1] component (CONF:1198-30677) such that it"
      * section only FunctionalStatusSection
        * ^comment = "SHALL contain exactly one [1..1] Functional Status Section (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.2.14:2014-06-09) (CONF:1198-30678)."
    * component[immunizations] ^comment = "This structuredBody MAY contain zero or one [0..1] component (CONF:1198-30679) such that it"
      * section only ImmunizationsSection
        * ^comment = "SHALL contain exactly one [1..1] Immunizations Section (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.2.2.1:2015-08-01) (CONF:1198-30680)."
    * component[medEquipment] ^comment = "This structuredBody MAY contain zero or one [0..1] component (CONF:1198-30681) such that it"
      * section only MedicalEquipmentSection
        * ^comment = "SHALL contain exactly one [1..1] Medical Equipment Section (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.2.23:2014-06-09) (CONF:1198-30682)."
    * component[payers] ^comment = "This structuredBody MAY contain zero or one [0..1] component (CONF:1198-30683) such that it"
      * section only PayersSection
        * ^comment = "SHALL contain exactly one [1..1] Payers Section (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.2.18:2015-08-01) (CONF:1198-30684)."
    * component[planOfTreatment] ^comment = "This structuredBody SHOULD contain zero or one [0..1] component (CONF:1198-30685) such that it"
      * section only PlanofTreatmentSection
        * ^comment = "SHALL contain exactly one [1..1] Plan of Treatment Section (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.2.10:2014-06-09) (CONF:1198-30686)."
    * component[socialHist] ^comment = "This structuredBody SHALL contain exactly one [1..1] component (CONF:1198-30687) such that it"
      * section only SocialHistorySection
        * ^comment = "SHALL contain exactly one [1..1] Social History Section (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.2.17:2015-08-01) (CONF:1198-30688)."
    * component[vitalSigns] ^comment = "This structuredBody SHALL contain exactly one [1..1] component (CONF:1198-30689) such that it"
      * section only VitalSignsSection
        * ^comment = "SHALL contain exactly one [1..1] Vital Signs Section (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.2.4.1:2015-08-01) (CONF:1198-30690)."
    * component[mentalStatus] ^comment = "This structuredBody MAY contain zero or one [0..1] component (CONF:1198-32143) such that it"
      * section only MentalStatusSection
        * ^comment = "SHALL contain exactly one [1..1] Mental Status Section (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.2.56:2015-08-01) (CONF:1198-32144)."
    * component[nutrition] ^comment = "This structuredBody MAY contain zero or one [0..1] component (CONF:1198-32624) such that it"
      * section only NutritionSection
        * ^comment = "SHALL contain exactly one [1..1] Nutrition Section (identifier: urn:oid:2.16.840.1.113883.10.20.22.2.57) (CONF:1198-32625)."

Invariant: 1198-8456
Description: "Such assignedAuthors **SHALL** contain (exactly one [1..1] assignedPerson) or (exactly one [1..1] assignedAuthoringDevice and exactly one [1..1] representedOrganization) (CONF:1198-8456)."
Severity: #error

Invariant: 1198-8457
Description: "If assignedAuthor has an associated representedOrganization with no assignedPerson or assignedAuthoringDevice, then the value for “ClinicalDocument/author/assignedAuthor/id/@NullFlavor” **SHALL** be “NA” “Not applicable” 2.16.840.1.113883.5.1008 NullFlavor STATIC (CONF:1198-8457)."
Severity: #error

Invariant: 1198-32466
Description: "If this assignedEntity is an assignedPerson, the assignedEntity/id **SHOULD** contain zero or one [0..1] @root=\"2.16.840.1.113883.4.6\" National Provider Identifier (CONF:1198-32466)."
Severity: #warning