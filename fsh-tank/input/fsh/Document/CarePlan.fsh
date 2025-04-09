Profile: CarePlan
Parent: USRealmHeader
Id: CarePlan
Title: "Care Plan"
Description: """A Care Plan is a consensus-driven dynamic plan that represents a patient's and Care Team Member's prioritized concerns, goals, and planned interventions. It serves as a blueprint shared by all Care Team Members (including the patient, their caregivers and providers), to guide the patient'ss care. A Care Plan integrates multiple interventions proposed by multiple providers and disciplines for multiple conditions.

A Care Plan represents one or more Plan(s) of Care and serves to reconcile and resolve conflicts between the various Plans of Care developed for a specific patient by different providers. While both a plan of care and a care plan include the patients life goals and require Care Team Members (including patients) to prioritize goals and interventions, the reconciliation process becomes more complex as the number of plans of care increases. The Care Plan also serves to enable longitudinal coordination of care.

The CDA Care Plan represents an instance of this dynamic Care Plan at a point in time. The CDA document itself is NOT dynamic.

Key differentiators between a Care Plan CDA and CCD (another snapshot in time document):
* There are 2 required sections:
** Health Concerns
** Goals
* There are 2 optional sections:
** Activities
** Outcomes
* Provides the ability to identify patient and provider priorities with each act
* Provides a header participant to indicate occurrences of Care Plan review

A care plan document can include entry references from the information in these sections to the information (entries) in other sections."""

* insert LogicalModelTemplate(care-plan, 2.16.840.1.113883.10.20.22.1.15, 2024-05-01)
* insert DocumentCategory(Care Plan, 18776-5, Plan of care note)

* ^status = #active
* code from $2.16.840.1.113762.1.4.1099.10 (required)
* obeys should-setId
* setId 0..1
  * ^comment = "SHOULD contain zero or one [0..1] setId (CONF:1198-32321)." // auto-should
* obeys should-versionNumber
* versionNumber 0..1
  * ^comment = "SHOULD contain zero or one [0..1] versionNumber (CONF:1198-32322)." // auto-should

// Removing slicing on infoRecipient, since the only branch identifier (intendedRecipient) is required anyway
* obeys should-informationRecipient
* informationRecipient 0..*
  * intendedRecipient 1..1
    * ^comment = "SHALL contain exactly one [1..1] intendedRecipient (CONF:1198-31994)."
    * id 1..*
      * ^comment = "This intendedRecipient SHALL contain at least one [1..*] id (CONF:1198-31996)."
    * obeys should-addr
    * addr 0..*
    * addr only USRealmAddress
      * ^comment = "This intendedRecipient SHOULD contain zero or more [0..*] addr (CONF:1198-31997)." // auto-should
    * obeys should-telecom
    * telecom 0..*
      * ^comment = "This intendedRecipient SHOULD contain zero or more [0..*] telecom (CONF:1198-31998)." // auto-should
    * obeys should-informationRecipient
    * informationRecipient 0..1
      * ^comment = "This intendedRecipient SHOULD contain zero or one [0..1] informationRecipient (CONF:1198-31999)." // auto-should
      * name 1..1
      * name only USRealmPersonNamePNUSFIELDED
        * ^comment = "The informationRecipient, if present, SHALL contain exactly one [1..1] US Realm Person Name (PN.US.FIELDED) (identifier: urn:oid:2.16.840.1.113883.10.20.22.5.1.1) (CONF:1198-32320)."
    * obeys should-receivedOrganization
    * receivedOrganization 0..1
      * ^comment = "This intendedRecipient SHOULD contain zero or one [0..1] receivedOrganization (CONF:1198-32000)." // auto-should
      * obeys should-id and should-standardIndustryClassCode
      * id 0..*
        * ^comment = "The receivedOrganization, if present, SHOULD contain zero or more [0..*] id (CONF:1198-32001)." // auto-should
      * standardIndustryClassCode 0..1
      * standardIndustryClassCode from $2.16.840.1.114222.4.11.1066 (required)
        * ^comment = "The receivedOrganization, if present, SHOULD contain zero or one [0..1] standardIndustryClassCode, which SHALL be selected from ValueSet Healthcare Provider Taxonomy urn:oid:2.16.840.1.114222.4.11.1066 DYNAMIC (CONF:1198-32003)."  // man-should
* authenticator
  * time 1..1
    * ^comment = "SHALL contain exactly one [1..1] time (CONF:1198-31911)."
  * signatureCode 1..1
    * ^comment = "SHALL contain exactly one [1..1] signatureCode (CONF:1198-31912)."
  * sdtcSignatureText 0..1
    //"<extension url=\"http://hl7.org/fhir/StructureDefinition/elementdefinition-namespace\"><valueUri value=\"urn:hl7-org:sdtc\"/></extension>"
    * ^short = "The prefix sdtc: SHALL be bound to the namespace “urn:hl7-org:sdtc”. The use of the namespace provides a necessary extension to CDA R2 for the use of the signatureText element"
    * ^comment = "MAY contain zero or one [0..1] sdtc:signatureText (CONF:1198-31913)."
  * assignedEntity 1..1
    * ^comment = "SHALL contain exactly one [1..1] assignedEntity (CONF:1198-31914)."
    * id 1..*
      * ^comment = "This assignedEntity SHALL contain at least one [1..*] id (CONF:1198-31915)."
    * code 1..1
      * ^comment = "This assignedEntity SHALL contain exactly one [1..1] code (CONF:1198-31916)."
      * code 1..1
      * code = #ONESELF
        * ^comment = "This code SHALL contain exactly one [1..1] @code=\"ONESELF\" Self (CONF:1198-31917)."
      * codeSystem 1..1
      * codeSystem = "2.16.840.1.113883.5.111"
        * ^comment = "This code SHALL contain exactly one [1..1] @codeSystem=\"2.16.840.1.113883.5.111\" (CodeSystem: HL7RoleCode urn:oid:2.16.840.1.113883.5.111) (CONF:1198-31918)."
* participant ^slicing.discriminator[0].type = #value
  * ^slicing.discriminator[=].path = "typeCode"
  * ^slicing.rules = #open
* participant contains
    verifier 0..* and
    indirect 0..*
* participant[verifier] ^comment = "SHOULD contain zero or more [0..*] participant (CONF:1198-31677) such that it"
  * typeCode 1..1
  * typeCode = #VRF (exactly)
    * ^comment = "SHALL contain exactly one [1..1] @typeCode=\"VRF\" Verifier (CodeSystem: HL7ParticipationType urn:oid:2.16.840.1.113883.5.90) (CONF:1198-31678)."
  * functionCode 1..1
    * ^comment = "SHALL contain exactly one [1..1] functionCode (CONF:1198-31679)."
    * code 1..1
    * code = #425268008
      * ^comment = "This functionCode SHALL contain exactly one [1..1] @code=\"425268008\" Review of Care Plan (CONF:1198-31680)."
    * codeSystem 1..1
    * codeSystem = "2.16.840.1.113883.6.96"
      * ^comment = "This functionCode SHALL contain exactly one [1..1] @codeSystem=\"2.16.840.1.113883.6.96\" (CodeSystem: SNOMED CT urn:oid:2.16.840.1.113883.6.96) (CONF:1198-31681)."
  * time 1..1
    * ^comment = "SHALL contain exactly one [1..1] time (CONF:1198-31682)."
  * associatedEntity 1..1
    * ^comment = "SHALL contain exactly one [1..1] associatedEntity (CONF:1198-31683)."
    * classCode 1..1
    * classCode = #ASSIGNED (exactly)
      * ^comment = "This associatedEntity SHALL contain exactly one [1..1] @classCode=\"ASSIGNED\" (CodeSystem: HL7RoleClass urn:oid:2.16.840.1.113883.5.110) (CONF:1198-31686)."
    * id 1..*
      * ^comment = "This associatedEntity SHALL contain at least one [1..*] id (CONF:1198-31684)."
    * obeys should-code
    * code 0..1
      * ^comment = "This associatedEntity SHOULD contain zero or one [0..1] code (CONF:1198-31685)." // auto-should
      * code 0..1
      * code from $2.16.840.1.113883.11.20.12.1 (preferred)
        * ^comment = "The code SHOULD be selected from ValueSet Personal And Legal Relationship Role Type urn:oid:2.16.840.1.113883.11.20.12.1 DYNAMIC (CONF:1198-32367)."
* participant[indirect] ^comment = "SHOULD contain zero or more [0..*] participant (CONF:1198-31895) such that it"
  * typeCode 1..1
  * typeCode = #IND (exactly)
    * ^comment = "SHALL contain exactly one [1..1] @typeCode=\"IND\" Indirect (CodeSystem: HL7ParticipationType urn:oid:2.16.840.1.113883.5.90) (CONF:1198-31896)."
  * associatedEntity 1..1
    * ^comment = "SHALL contain exactly one [1..1] associatedEntity (CONF:1198-31897)."
    * classCode 1..1
    * classCode from INDRoleclassCodes (required)
      * ^comment = "This associatedEntity SHALL contain exactly one [1..1] @classCode, which SHALL be selected from ValueSet INDRoleclassCodes urn:oid:2.16.840.1.113883.11.20.9.33 STATIC (CONF:1198-31898)."
    * associatedPerson 1..1
      * ^comment = "This associatedEntity SHALL contain exactly one [1..1] associatedPerson (CONF:1198-31899)."
      * name 1..*
        * ^comment = "This associatedPerson SHALL contain at least one [1..*] name (CONF:1198-31900)."
* documentationOf ^slicing.discriminator[0].type = #value
  * ^slicing.discriminator[=].path = "serviceEvent.classCode"
  * ^slicing.rules = #open
  * ^short = "The serviceEvent describes the provision of healthcare over a period of time. The duration over which care was provided is indicated in serviceEvent/effectiveTime. Additional data from outside this duration may also be included if it is relevant to care provided during that time range (e.g., reviewed during the stated time range)."
* documentationOf contains care-provision 1..1
* documentationOf[care-provision] ^comment = "SHALL contain exactly one [1..1] documentationOf (CONF:1198-31901) such that it"
  * serviceEvent 1..1
    // Removed slicing on performer since it was only branched on assignedEntity which is required anyway
    * ^short = "The serviceEvent describes the provision of healthcare over a period of time. The duration over which care was provided is indicated in serviceEvent/effectiveTime. Additional data from outside this duration may also be included if it is relevant to care provided during that time range (e.g., reviewed during the stated time range)."
    * performer 1..*
      * assignedEntity 1..1
        * ^comment = "SHALL contain exactly one [1..1] assignedEntity (CONF:1198-31907)."
        * id 1..*
          * ^comment = "This assignedEntity SHALL contain at least one [1..*] id (CONF:1198-31908)."
        * code 0..1
          * ^comment = "This assignedEntity MAY contain zero or one [0..1] code (CONF:1198-31909)."
        * assignedPerson 1..1
          * ^comment = "This assignedEntity SHALL contain exactly one [1..1] assignedPerson (CONF:1198-32328)."
          * name 1..1
          * name only USRealmPersonNamePNUSFIELDED
            * ^comment = "This assignedPerson SHALL contain exactly one [1..1] US Realm Person Name (PN.US.FIELDED) (identifier: urn:oid:2.16.840.1.113883.10.20.22.5.1.1) (CONF:1198-32329)."
    * ^comment = "SHALL contain exactly one [1..1] serviceEvent (CONF:1198-31902)."
    * classCode 1..1
    * classCode = #PCPR (exactly)
      * ^comment = "This serviceEvent SHALL contain exactly one [1..1] @classCode=\"PCPR\" Care Provision (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:1198-31903)."
    * effectiveTime 1..1
      * ^comment = "This serviceEvent SHALL contain exactly one [1..1] effectiveTime (CONF:1198-31904)."
      * low 1..1
        * ^comment = "This effectiveTime SHALL contain exactly one [1..1] low (CONF:1198-32330)."
      * high 0..1
        * ^comment = "This effectiveTime MAY contain zero or one [0..1] high (CONF:1198-32331)."
* relatedDocument ^slicing.discriminator[+].type = #exists
  * ^slicing.discriminator[=].path = "parentDocument"
  * ^slicing.rules = #open
* relatedDocument contains relatedDocument1 0..*
* relatedDocument[relatedDocument1] ^comment = "MAY contain zero or more [0..*] relatedDocument (CONF:1198-29893) such that it"
  * typeCode 1..1
  * typeCode from $2.16.840.1.113883.1.11.11610 (required)
    * ^comment = "SHALL contain exactly one [1..1] @typeCode, which SHALL be selected from ValueSet x_ActRelationshipDocument urn:oid:2.16.840.1.113883.1.11.11610 STATIC (CONF:1198-31889)."
  * parentDocument 1..1
    * ^comment = "SHALL contain exactly one [1..1] parentDocument (CONF:1198-29894)."
    * id 1..*
      * ^comment = "This parentDocument SHALL contain at least one [1..*] id (CONF:1198-32949)."
    * setId 1..1
      * ^comment = "This parentDocument SHALL contain exactly one [1..1] setId (CONF:1198-29895)."
    * versionNumber 1..1
      * ^comment = "This parentDocument SHALL contain exactly one [1..1] versionNumber (CONF:1198-29896)."
* obeys should-componentOf
* componentOf 0..1
  * ^comment = "SHOULD contain zero or one [0..1] componentOf (CONF:1198-32004) such that it" // man-should
  //"<sliceName value=\"componentOf1\"/>"
  * encompassingEncounter 1..1
    * ^comment = "SHALL contain exactly one [1..1] encompassingEncounter (CONF:1198-32005)."
    * effectiveTime 1..1
      * ^comment = "This encompassingEncounter SHALL contain exactly one [1..1] effectiveTime (CONF:1198-32007)."
* component 1..1
  * ^comment = "SHALL contain exactly one [1..1] component (CONF:1198-28753)."
  * structuredBody 1..1
    * obeys 1198-31044
    * obeys should-section-healthstatus
    * ^comment = "This component SHALL contain exactly one [1..1] structuredBody (CONF:1198-28754)."
    * component 2..
      * ^slicing.discriminator[0].type = #profile
      * ^slicing.discriminator[=].path = "section"
      * ^slicing.rules = #open
    * component contains
        healthConcerns 1..1 and
        goals 1..1 and
        activities 0..1 and
        healthStatusEvalOutcm 0..1 and
        advDirectives 0..1
    * component[healthConcerns] ^comment = "This structuredBody SHALL contain exactly one [1..1] component (CONF:1198-28755)."
      * section only HealthConcernsSection
    * component[goals] ^comment = "This structuredBody SHALL contain exactly one [1..1] component (CONF:1198-28761) such that it"
      * section only GoalsSection
        * ^comment = "SHALL contain exactly one [1..1] Goals Section (identifier: urn:oid:2.16.840.1.113883.10.20.22.2.60) (CONF:1198-28762)."
    * component[activities] ^comment = "This structuredBody SHOULD contain zero or one [0..1] component (CONF:1198-28763) such that it"
      * section only ActivitiesSection
        * ^comment = "SHALL contain exactly one [1..1] Activities Section (identifier: urn:hl7ii:2.16.840.1.113883.10.20.21.2.3:2024-05-01) (CONF:1198-28764)."
    * component[healthStatusEvalOutcm] ^comment = "This structuredBody SHOULD contain zero or one [0..1] component (CONF:1198-29596) such that it"
      * section only OutcomesSection
        * ^comment = "SHALL contain exactly one [1..1] Outcomes Section (identifier: urn:oid:2.16.840.1.113883.10.20.22.2.61) (CONF:1198-29597)."
    * component[advDirectives] ^comment = "This structuredBody MAY contain zero or one [0..1] component (CONF:1198-28942) such that it"
      * section only AdvanceDirectivesSection
        * ^comment = "SHALL contain exactly one [1..1] Advance Directives Section (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.2.21.1:2024-05-01)."

Invariant: 1198-31044
Description: "This structuredBody **SHALL NOT** contain a Plan of Treatment Section (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.2.10:2014-06-09) (CONF:1198-31044)."
Severity: #error
Expression: "component.where(section.hasTemplateIdOf(PlanofTreatmentSection)).empty()"

Invariant: category-18776-5
Description: "If category is present, then there shall be a category with LOINC code '18776-5'."
Severity: #error
Expression: "sdtcCategory.empty() or sdtcCategory.exists(code = '18776-5' and codeSystem = '2.16.840.1.113883.6.1')"