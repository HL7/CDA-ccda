### Version 

The changes in this version of Consolidated CDA have been made from STU comments and JIRA issues that were raised by the community and approved by the Structured Documents working group.

#### Major Changes

* Removed Diagnostic Imaging Report document template and relevant section and entry templates
* Removed any templates that are DEPRECATED
* Removed Entries Optional templates if an equivalent Entries Required template exists
* Combined Companion Guide and C-CDA narrative into one guide
* Added Medication Adherence, Treatment Intervention Preference, and Care Experience Preference USCDI Entry templates
* Added USCDI tag and extensions to relevant USCDI elements
* Moved USCDI guidance to the relevant template element

#### Tracker Issues Applied

- [CDA-814](https://jira.hl7.org/browse/CDA-814) - Change assorted vocabulary bindings
- [CDA-939](https://jira.hl7.org/browse/CDA-939) - Make Interventions section mandatory in Care Plan
- [CDA-1693](https://jira.hl7.org/browse/CDA-1693) - Change the name of the Interventions Section to Activities Section.
- [CDA-1240](https://jira.hl7.org/browse/CDA-1240) - Added assignedPerson with US Realm Person Name to Procedure Activity Procedure template.
- [CDA-1273](https://jira.hl7.org/browse/CDA-1273) - Changed Problem Observation in Problem Concern Act from 1..* to 1..1.
- [CDA-1274](https://jira.hl7.org/browse/CDA-1274) - Changed Allergy Intolerance Observation in Allergy Concern Act from 1..* to 1..1.
- [CDA-1277](https://jira.hl7.org/browse/CDA-1277) - Added a Progress Towards Goal Observation to the Goal Observation template.
- [CDA-1278](https://jira.hl7.org/browse/CDA-1278) - Changed the GoalObservation statusCode to be bound to a value set.
- [CDA-1367](https://jira.hl7.org/browse/CDA-1367) - Use proper LOINC code (8693-4) with no translations on Mental Status Observation template.
- [CDA-1381](https://jira.hl7.org/browse/CDA-1381) - Constraint that doseQuantity/@unit and administrationUnitCode SHALL NOT both be present.
- [CDA-1381](https://jira.hl7.org/browse/CDA-1381) - Prevent doseQuantity/@unit and administrationUnitCode/@code from both being present where both are on a profile
- [CDA-1429](https://jira.hl7.org/browse/CDA-1429) - Remove Goal Observation value constraint
- [CDA-1430](https://jira.hl7.org/browse/CDA-1430) - Added code constraints to Findings Section
- [CDA-1469](https://jira.hl7.org/browse/CDA-1469) - Updated MentalStatusObservation.value to be from new SNOMED cognitive function value set.
- [CDA-1505](https://jira.hl7.org/browse/CDA-1505) - Patient Generated Document header has the same bindings as US Realm Header for performer functionCode.
- [CDA-1513](https://jira.hl7.org/browse/CDA-1513) - Change the Health Insurance Type binding to be the X12N Insurance Type code system
- [CDA-1526](https://jira.hl7.org/browse/CDA-1526) - Add guidance on @unit in Vital Sign Observation
- [CDA-1627](https://jira.hl7.org/browse/CDA-1627) - Bind Procedure Act Procedure code to US Core Procedure value set.
- [CDA-1637](https://jira.hl7.org/browse/CDA-1637)/[CDA-1638](https://jira.hl7.org/browse/CDA-1638) - Update Discharge Disposition code binding.
- [CDA-1757](https://jira.hl7.org/browse/CDA-1757) - Updated BirthSex template to align with Gender Harmony.
- [CDA-1760](https://jira.hl7.org/browse/CDA-1760) - Changed any statusCode that were set to 'completed' to be bound to a value set.
- [CDA-1762](https://jira.hl7.org/browse/CDA-1762) - Update the encompassingEncounter responsibleParty to be SHOULD.
- [CDA-1789](https://jira.hl7.org/browse/CDA-1789) - Provided guidance on using PlannedEncounter template for future encounters.
- [CDA-1793](https://jira.hl7.org/browse/CDA-1793) - Remove Vaccine Clinical Drug value set from Immunization Medication Information template
- [CDA-1797](https://jira.hl7.org/browse/CDA-1797) - Add optional Payers Section to Referral Note
- [CDA-1802](https://jira.hl7.org/browse/CDA-1802) - Change Smoking Status binding from SHALL to MAY
- [CDA-1806](https://jira.hl7.org/browse/CDA-1806) - Updated wording of documentationOf.serviceEvent.code in Operative Note
- [CDA-1873](https://jira.hl7.org/browse/CDA-1873) - Changed Encounter Diagnosis statusCode to be 'completed'.
- [CDA-1922](https://jira.hl7.org/browse/CDA-1922) - NullFlavor is not allowed on confidentialityCode.
- [CDA-1922](https://jira.hl7.org/browse/CDA-1922) - Added @code and disallowed @nullFlavor from confidentialityCode in US Realm Header
- [CDA-2007](https://jira.hl7.org/browse/CDA-2007) - Change Authorization Activity entryRelationship from SHALL to MAY
- [CDA-2108](https://jira.hl7.org/browse/CDA-2108) - Prevent both @code and @nullFlavor from being present on Result Observation
- [CDA-20004](https://jira.hl7.org/browse/CDA-20004) - Remove binding to HL7 Discharge Disposition code system
- [CDA-20005](https://jira.hl7.org/browse/CDA-20005) - Added LOINC Scale chart to description in Result Observation
- [CDA-20008](https://jira.hl7.org/browse/CDA-20008) - Updated ProcedureNote.encompassingEncounter.code binding to requested valueset. Added code 0..1 to USRealmHeader.encompassingEncounter with binding to requested valueset
- [CDA-20014](https://jira.hl7.org/browse/CDA-20014) - Added new problem observation example that includes a SNOMED post-coordinated code.
- [CDA-20022](https://jira.hl7.org/browse/CDA-20022) - Added a page that lists all of the used value sets and used code systems.
- [CDA-20047](https://jira.hl7.org/browse/CDA-20047) - Remove Diagnostic Imaging Report document template and child section and entry templates.  Remove templates with DEPRECATED in title
- [CDA-20053](https://jira.hl7.org/browse/CDA-20053) - Updated languageCode to use valueset AllLanguages in US Realm Header and US Realm Header for Patient Generated Document
- [CDA-20053](https://jira.hl7.org/browse/CDA-20053) - Updated value set binding for languageCode to be AllLanguages.
- [CDA-20076](https://jira.hl7.org/browse/CDA-20076) - Changed value on Severity Observation from SHALL to SHOULD and modified description to match
- [CDA-20085](https://jira.hl7.org/browse/CDA-20085) - Allow Result Observation value to be from SNOMED or LOING.
- [CDA-20085](https://jira.hl7.org/browse/CDA-20085) - Updated Observation/value to include LOINC codes in Result Observation
- [CDA-20324](https://jira.hl7.org/browse/CDA-20324) - Moved binding to ObservationInterpretation from interpretationCode/@code to interpretationCode.
- [CDA-20444](https://jira.hl7.org/browse/CDA-20444) - Bind Problem Observation code to US Core Condition value set.
- [CDA-20449](https://jira.hl7.org/browse/CDA-20449) - Added Mental Status Section to Progress Note
- [CDA-20449](https://jira.hl7.org/browse/CDA-20449) - Allow Mental Status section in Progress Note document.
- [CDA-20451](https://jira.hl7.org/browse/CDA-20451) - Allow HCPCS to Procedure Note serviceEvent code
- [CDA-20462](https://jira.hl7.org/browse/CDA-20462) - Allow multiple performers in Operative Note
- [CDA-20463](https://jira.hl7.org/browse/CDA-20463) - Allow HCPCS to Planned Procedure code
- [CDA-20478](https://jira.hl7.org/browse/CDA-20478) - Added @code under dosumentationOf.serviceEvent in Operative Note and moved constraint there
- [CDA-20478](https://jira.hl7.org/browse/CDA-20478) / [CDA-1806](https://jira.hl7.org/browse/CDA-1806) - Update OperativeNote/ProcedureNote binding on serviceEvent.
- [CDA-20482](https://jira.hl7.org/browse/CDA-20482) - Extensionless templates are not allowed to have an extension.
- [CDA-20516](https://jira.hl7.org/browse/CDA-20516) - Added specific wording to code defining nullFlavor in designconsiderations.md
- [CDA-20516](https://jira.hl7.org/browse/CDA-20516) - Updated guidance on how to specify when NullFlavors are allowed.
- [CDA-20518](https://jira.hl7.org/browse/CDA-20518) - Allow NDC codes when specifying MedicationInformation.
- [CDA-20543](https://jira.hl7.org/browse/CDA-20543) - Change guidance on Supply repeatNumber
- [CDA-20546](https://jira.hl7.org/browse/CDA-20546) - PQ values require a @unit
- [CDA-20565](https://jira.hl7.org/browse/CDA-20565) - Remove requirement to send R1.1 template IDs
- [CDA-20568](https://jira.hl7.org/browse/CDA-20568) - Add the word DYNAMIC to Encounter Activity binding.
- [CDA-20664](https://jira.hl7.org/browse/CDA-20664) - Remove Entries Optional section templates
- [CDA-20673](https://jira.hl7.org/browse/CDA-20673) - Update Policy Activity to be "SHOULD contain 0..1 address".
- [CDA-20681](https://jira.hl7.org/browse/CDA-20681) - Templates no longer contain a version label in their name (such as V2, V3, etc.)
- [CDA-20687](https://jira.hl7.org/browse/CDA-20687) - Update MedicationActivity doseQuantity guidance.
- [CDA-20693](https://jira.hl7.org/browse/CDA-20693) - typo correction to USCDI guidance
- [CDA-20698](https://jira.hl7.org/browse/CDA-20698) / [CDA-20697](https://jira.hl7.org/browse/CDA-20697) - Add sections to Discharge Summary document.
- [CDA-20711](https://jira.hl7.org/browse/CDA-20711) - update Gender Harmony guidance
- [CDA-20713](https://jira.hl7.org/browse/CDA-20713) - Care Team Member Function value set updated.
- [CDA-20737](https://jira.hl7.org/browse/CDA-20737) - Remove Procedure Activity Act and Procedure Activity Observation templates.
- [CDA-20757](https://jira.hl7.org/browse/CDA-20757), [CDA-20771](https://jira.hl7.org/browse/CDA-20771), [CDA-20758](https://jira.hl7.org/browse/CDA-20758) - Updated USCDI guidance on Coverage Activity and Policy Activity.
- [CDA-20763](https://jira.hl7.org/browse/CDA-20763) - Updated text on Policy Activity Act around coverage information.
- [CDA-20767](https://jira.hl7.org/browse/CDA-20767) - Remove CarePlan intendedRecipient/receivedOrganization/name rule
- [CDA-20769](https://jira.hl7.org/browse/CDA-20769) - Added new Disability Status Observation example that meets the template.
- [CDA-20771](https://jira.hl7.org/browse/CDA-20771) - Added SHOULD effectiveTime to Policy Activity Act.
- [CDA-20772](https://jira.hl7.org/browse/CDA-20772) - Updated RelatedPersonRelationshipandNameParticipant associatedEntity.code to new valueset
- [CDA-20784](https://jira.hl7.org/browse/CDA-20784) - Updated the Advance Directive Section, Organizer, and Observation to the latest versions of the templates.
- [CDA-20786](https://jira.hl7.org/browse/CDA-20786) - Set some bound observations to have a type.
- [CDA-20787](https://jira.hl7.org/browse/CDA-20787) - Add guidance on the use of subsections.
- [CDA-20788](https://jira.hl7.org/browse/CDA-20788) - Updated the purpose statement of the Advance Directive Section template.
- [CDA-20789](https://jira.hl7.org/browse/CDA-20789) - Added Advance Directives Section to all Document templates (as MAY if not already there)
- [CDA-20790](https://jira.hl7.org/browse/CDA-20790) - Added guidance on machine readable information to Advance Directive Section
- [CDA-20792](https://jira.hl7.org/browse/CDA-20792) - Added subsection guidance to Procedures and Results sections
- [CDA-20794](https://jira.hl7.org/browse/CDA-20794) - Restrict Immunization.repeatNumber to just a value
- [CDA-20803](https://jira.hl7.org/browse/CDA-20803) - Updated description in ResultOrganizer to include specimen clarification
- [CDA-20807](https://jira.hl7.org/browse/CDA-20807) - Add should rules for Performer, Author, and Informant to Advance Directive Organizer and Observation
- [CDA-20813](https://jira.hl7.org/browse/CDA-20813) - Changed the DeceasedInd and DeceasedTime constraints.
- [CDA-20814](https://jira.hl7.org/browse/CDA-20814) - Updated all UDI templates to allow additional templateIds.
- [CDA-20822](https://jira.hl7.org/browse/CDA-20822) - Updated CareTeamMemberAct to clean up untestable constraints and unnecessary "such that it".
- [CDA-20823](https://jira.hl7.org/browse/CDA-20823) - Updated USRealmAddress Value Sets; used everywhere addr was referenced in IG
- [CDA-20825](https://jira.hl7.org/browse/CDA-20825) - Clean up PlannedSupply product vs device modeling
- [CDA-20827](https://jira.hl7.org/browse/CDA-20827) - Removed slicing from USRealmHeader authenticator
- [CDA-20828](https://jira.hl7.org/browse/CDA-20828) - Changed constraint in Advance Directive Observation to only allow a timestamp instead of an interval


#### Templates with New Extensions due to Major Change

##### Document
|20.1 Care Plan|structuredBody.component cardinality increased to 3, templateId cardinality increased to 2|
|-----|-----|
|20.2 Consultation Note|constraints now have sources, structuredBody.component cardinality increased to 5|
|20.3 Continuity of Care Document (CCD)|structuredBody.component cardinality increased to 6, templateId cardinality increased to 2|
|20.4 Discharge Summary|structuredBody.component cardinality increased to 7, removed required element participant.typeCode, Results Section now required component|
|20.5 History and Physical|structuredBody.component cardinality increased to 12|
|20.6 Operative Note|structuredBody.component cardinality increased to 8, serviceEvent.code removed one code system and added another, serviceEvent.code now required|
|20.7 Procedure Note|structuredBody.component cardinality increased to 5|
|20.8 Progress Note|templateId cardinality increased to 2, element order change, serviceEvent.templateId.extension set to 0..0|
|20.9 Referral Note|structuredBody.compoenent cardinality increased to 5, templateId cardinality increased to 2|
|20.10 Transfer Summary|templateId cardinality increased to 2, structuredBoyd.component cardinality increased to 7|
|20.11 Unstructured Document|templateId cardinality increased to 2|
|20.12 US Realm Header|element order change, statusCode.code bound to new valueset, new constraint on recordTarget.patientRole.patient.sdtcDeceasedInd, serviceEvent.effectiveTime set to new valueset, addr.item included, languageCode bound to new valueset, realmCode.code element added|

##### Section
|20.17 Advance Directives Section|now requires Advance Directives Organizer|
|20.21 Assessment Section|templateId.extension set to 0..0|
|20.23 Chief Complaint and Reason for Visit Section|templateId.extension set to 0..0|
|20.24 Chief Complaint Section|templateId.extension set to 0..0|
|20.26 Course of Care Section|templateId.extension set to 0..0|
|20.32 General Status Section|templateId.extension set to 0..0|
|20.33 Goals Section|templateId.extension set to 0..0|
|20.35 Health Status Evaluations and Outcomes Section|templateId.extension set to 0..0|
|20.36 History of Present Illness Section|templateId.extension set to 0..0|
|20.37 Hospital Consultations Section|templateId.extension set to 0..0|
|20.38 Hospital Course Section|templateId.extension set to 0..0|
|20.39 Hospital Discharge Instructions Section|templateId.extension set to 0..0|
|20.40 Hospital Discharge Physical Section|templateId.extension set to 0..0|
|20.41 Hospital Discharge Studies Summary Section|templateId.extension set to 0..0|
|20.44 Medical (General) History Section|templateId.extension set to 0..0|
|20.49 Notes Section|new code.code and code.codeSystem required elements|
|20.50 Nutrition Section|templateId.extension set to 0..0|
|20.51 Objective Section|templateId.extension set to 0..0|
|20.52 Operative Note Fluids Section|templateId.extension set to 0..0|
|20.53 Operative Note Surgical Procedure Section|templateId.extension set to 0..0|
|20.59 Postoperative Diagnosis Section|templateId.extension set to 0..0|
|20.63 Procedure Description Section|templateId.extension set to 0..0|
|20.64 Procedure Disposition Section|templateId.extension set to 0..0|
|20.65 Procedure Estimated Blood Loss Section|templateId.extension set to 0..0|
|20.67 Procedure Implants Section|templateId.extension set to 0..0|
|20.69 Procedure Specimens Taken Section|templateId.extension set to 0..0|
|20.70 Procedures Section|removed procedure activity act and procedure activity observation from entries|
|20.72 Reason for Visit Section|templateId.extension set to 0..0|
|20.73 Results Section|3 years ago Section.entry.entry1.organizer was removed but still appears (in a way) in the original ccda online guide. I added it back in 3 months ago in commit CDA-2047 20664. i think it's a major change but i'm not sure|
|20.74 Review of Systems Section|templateId.extension set to 0..0|
|20.76 Subjective Section|templateId.extension set to 0..0|
|20.77 Surgical Drains Section|templateId.extension set to 0..0|

##### Entry
|20.79 Admission Medication|element order change|
|20.80 Advance Directive Observation|element order change, statusCode.code bound to new valueset, participant.templateId.extension set to 0..0|
|20.81 Advance Directive Organizer|element order change, statusCode.code bound to new valueset|
|20.82 Age Observation|element order change, statusCode.code bound to new valueset, templateId.extension set to 0..0|
|20.83 Allergy Intolerance Observation|element order change, statusCode.code bound to new valueset|
|20.84 Allergy Concern Act|element order change|
|20.85 Allergy Status Observation|element order change, statusCode.code bound to new valueset|
|20.86 Assessment Scale Observation|element order change, statusCode.code bound to new valueset|
|20.87 Assessment Scale Supporting Observation|element order change, statusCode.code bound to new valueset|
|20.88 Authorization Activity|element order change, templateId.extension set to 0..0|
|20.89 Basic Industry Observation|element order change, statusCode.code bound to new valueset, section cardinality increased to 2|
|20.90 Basic Occupation Observation|element order change, statusCode.code bound to new valueset, section cardinality increased to 2|
|20.91 Birth Sex Observation|element order change, statusCode.code bound to new valueset, value now bound to a type|
|20.92 Brand Name Observation|element order change, value now bound to a type|
|20.94 Care Team Member Act|element order change|
|20.95 Care Team Member Schedule Observation|element order change, statusCode.code bound to new valueset|
|20.96 Care Team Organizer|element order change|
|20.97 Care Team Type Observation|element order change, statusCode.code bound to new valueset|
|20.98 Caregiver Characteristics|element order change, statusCode.code bound to new valueset, templateId.extension set to 0..0|
|20.99 Catalog Number Observation|value now bound to a type|
|20.100 Characteristics of Home Environment|element order change, statusCode.code bound to new valueset|
|20.101 Comment Activity|element order change, templateId.extension set to 0..0|
|20.102 Company Name Observation|value now bound to a type|
|20.103 Coverage Activity|element order change, statusCode.code bound to new valueset|
|20.104 Criticality Observation|element order change, statusCode.code bound to new valueset, templateId.extension set to 0..0|
|20.105 Cultural and Religious Observation|element order change, statusCode.code bound to new valueset, templateId.extension set to 0..0|
|20.106 Date of Diagnosis Act|element order change, statusCode.code bound to new valueset|
|20.107 Deceased Observation|element order change, statusCode.code bound to new valueset|
|20.108 Device Identifier Observation|element order change|
|20.109 Disability Status Observation|element order change, statusCode.code bound to new valueset|
|20.110 Discharge Medication|element order change, statusCode.code bound to new valueset|
|20.111 Distinct Identification Code Observation|value now bound to a type|
|20.112 Drug Monitoring Act|element order change, templateId.extension set to 0..0|
|20.113 Drug Vehicle|element order change, templateId.extension set to 0..0|
|20.114 Encounter Activity|element order change|
|20.115 Encounter Diagnosis|element order change, statusCode.code bound to new valueset|
|20.116 Entry Reference|element order change, templateId.extension set to 0..0|
|20.117 Estimated Date of Delivery|element order change, statusCode.code bound to new valueset, templateId.extension set to 0..0|
|20.119 External Document Reference|element order change|
|20.120 Family History Death Observation|element order change, statusCode.code bound to new valueset, templateId.extension set to 0..0|
|20.121 Family History Observation|element order change, statusCode.code bound to new valueset|
|20.122 Family History Organizer|element order change, statusCode.code bound to new valueset|
|20.123 Functional Status Observation|element order change, statusCode.code bound to new valueset|
|20.124 Functional Status Organizer|element order change, statusCode.code bound to new valueset|
|20.125 Gender Identity Observation|element order change, statusCode.code bound to new valueset, section cardinality increased to  2|
|20.126 Goal Observation|element order change|
|20.127 Health Concern Act|element order change|
|20.128 Health Status Observation|element order change, statusCode.code bound to new valueset|
|20.129 Highest Pressure Ulcer Stage|element order change, templateId.extension set to 0..0|
|20.130 Hospital Admission Diagnosis|element order change|
|20.131 Hospital Discharge Diagnosis|element order change|
|20.132 Immunization Activity|element order change|
|20.133 Immunization Medication Information|element order change|
|20.134 Immunization Refusal Reason|element order change, statusCode.code bound to new valueset, templateId.extension set to 0..0|
|20.135 Implantable Device Status Observation|value now bound to a type|
|20.136 Indication|element order change, statusCode.code bound to new valueset, value now bound to a type|
|20.137 Instruction|element order change, statusCode.code bound to new valueset|
|20.138 Intervention Act|element order change, statusCode.code bound to new valueset|
|20.139 Latex Safety Observation|value now bound to a type|
|20.140 Longitudinal Care Wound Observation|element order change, value now bound to a type|
|20.141 Lot Or Batch Number Observation|value now bound to a type|
|20.143 Medical Equipment Organizer|element order change, templateId.extension set to 0..0|
|20.144 Medication Activity|element order change|
|20.146 Medication Dispense|element order change, statusCode.code bound to new valueset|
|20.147 Medication Free Text Sig|element order change, templateId.extension set to 0..0|
|20.148 Medication Information|element order change|
|20.149 Medication Supply Order|element order change|
|20.150 Mental Status Observation|element order change, statusCode.code bound to new valueset|
|20.151 Mental Status Organizer|element order change, statusCode.code bound to new valueset|
|20152 Model Number Observation|value now bound to a type|
|20.154 Non-Medicinal Supply Activity|element order change|
|20.155 Note Activity|element order change|
|20.156 Number of Pressure Ulcers Observation|element order change, statusCode.code bound to new valueset, value now bound to a type|
|20.157 Nutrition Assessment|element order change, statusCode.code bound to new valueset, templateId.extension set to 0..0|
|20.158 Nutrition Recommendation|element order change, templateId.extension set to 0..0|
|20.159 Nutritional Status Observation|element order change, statusCode.code bound to new valueset, templateId.extension set to 0..0|
|20.160 Outcome Observation|element order change, templateId.extension set to 0..0|
|20.161 Patient Referral Act|element order change, statusCode.code bound to new valueset, templateId.extension set to 0..0|
|20.162 Planned Act|element order change|
|20.163 Planned Coverage|element order change, templateId.extension set to 0..0|
|20.164 Planned Encounter|element order change|
|20.165 Planned Immunization Activity|element order change, templateId.extension set to 0..0|
|20.166 Planned Intervention Act|element order change|
|20.167 Planned Medication Activity|element order change|
|20.168 Planned Observation|element order change|
|20.169 Planned Procedure|element order change|
|20.170 Planned Supply|element order change|
|20.171 Policy Activity|element order change, statusCode.code bound to new valueset, templateId.extension set to 0..0|
|20.172 Postprocedure Diagnosis|element order change|
|20.174 Pregnancy Intention in Next Year|element order change, statusCode.code bound to new valueset, value now bound to a type|
|20.175 Pregnancy Observation|element order change, statusCode.code bound to new valueset, templateId.extension set to 0..0|
|20.176 Preoperative Diagnosis|element order change|
|20.177 Priority Preference|element order change, templateId.extension set to 0..0|
|20.178 Problem Concern Act|element order change|
|20.179 Problem Observation|element order change, statusCode.code bound to new valueset|
|20.180 Problem Status|element order change, statusCode.code bound to new valueset|
|20.181 Procedure Activity Procedure|element order change|
|20.182 Product Instance|element order change, templateId.extension set to 0..0|
|20.183 Prognosis Observation|element order change, statusCode.code bound to new valueset, templateId.extension set to 0..0|
|20.184 Progress Toward Goal Observation|element order change, statusCode.code bound to new valueset, templateId.extension set to 0..0|
|20.185 Reaction Observation|element order change, statusCode.code bound to new valueset|
|20.186 Reason|element order change, statusCode.code bound to new valueset, value now bound to a type|
|20.187 Result Observation|element order change|
|20.188 Result Organizer|element order change|
|20.189 Risk Concern Act|element order change|
|20.190 Section Time Range Observation|element order change, statusCode.code bound to new valueset|
|20.191 Self-Care Activities (ADL and IADL)|element order change, statusCode.code bound to new valueset, templateId.extension set to 0..0|
|20.192 Sensory Status|element order change, statusCode.code bound to new valueset, templateId.extension set to 0..0|
|20.193 Serial Number Observation|value now bound to a type|
|20.194 Service Delivery Location|element order change, templateId.extension set to 0..0|
|20.195 Severity Observation|element order change, statusCode.code bound to new valueset|
|20.196 Sex Observation|element order change, statusCode.code bound to new valueset, value now bound to a type|
|20.197 Sexual Orientation Observation|element order change, statusCode.code bound to new valueset, section cardinality increased to 2|
|20.198 Smoking Status - Meaningful Use|element order change, statusCode.code bound to new valueset|
|20.199 Social History Observation|element order change, statusCode.code bound to new valueset|
|20.202 Substance Administered Act|element order change, statusCode.code bound to new valueset, templateId.extension set to 0..0|
|20.203 Substance or Device Allergy Intolerance Observation|element order change, statusCode.code bound to new valueset|
|20.204 Tobacco Use|element order change, statusCode.code bound to new valueset|
|20.206 Tribal Affiliation Observation|element order change, statusCode.code bound to new valueset, templateId cardinality increased to 2, templateId.extension set to 0..0|
|20.207 UDI Organizer|element order change, statusCode.code bound to new valueset|
|20.208 Vital Sign Observation|element order change, statusCode.code bound to new valueset|
|20.209 Vital Signs Organizer|element order change, statusCode.code bound to new valueset|
|20.210 Wound Characteristic|element order change, statusCode.code bound to new valueset, templateId.extension set to 0..0|
|20.211 Wound Measurement Observation|element order change, statusCode.code bound to new valueset, templateId.extension set to 0..0|
|20.213 Handoff Communication Participants|element order change, statusCode.code bound to new valueset, templateId.extension set to 0..0|
|20.214 Provenance - Assembler Participation|element order change|
|20.216 Related Person Relationship and Name Participant|element order change|

##### Other
|20.212 Author Participation|new constraint on assignedAuthor, new element (assignedAuthor.addr), templateId.extension set to 0..0|
|20.217 US Realm Address (AD.US.FIELDED)|updated constraint expressions, item.country bound to new valuset, item.state bound to new valueset|
|20.218 US Realm Date and Time (Interval)|value,low, and high have constraint expressions now|
|20.219 US Realm Date and Time (Point in Time)|constraint has expression|
|20.220 US Realm Patient Name (PTN.US.FIELDED)|name sections are now under item|
|||

