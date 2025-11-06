### Version 5.0.0-ballot

The changes in this versino of Consolidated CDA were made from comments raised post version 4.0.0 along with new USCDI requirements for Unique Device Identifier, Facility Address, Care Plan, Problem Date of Onset, Family Health History, and Portable Medical Order.

#### Major Changes

##### Changed Templates
* Note Activity and Notes Section - new version of template with changes to note code bindings
* Social History Observation - updated cardinality and invariants on sdtc:category
* Age Range Observation - new template ID and value allows IVL_PQ or ST
* Pregnancy Observation - new version of template and codeSystem is LOINC


#### Tracker Issues Applied
* [CDA-21375](https://jira.hl7.org/browse/CDA-21375) - Pregnancy Observation has wrong code system
* [CDA-21376](https://jira.hl7.org/browse/CDA-21376) - Age Range Observation needs new template ID
* [CDA-21383](https://jira.hl7.org/browse/CDA-21383) - Social History Observation added category without versioning
* [CDA-21411](https://jira.hl7.org/browse/CDA-21411) - Discharge Medication Act does not slice translation
* [CDA-21412](https://jira.hl7.org/browse/CDA-21412), [CDA-21426](https://jira.hl7.org/browse/CDA-21426),  - UDI Organizer Entry slices have been made individual and SHOULD constraints added
* [CDA-21415](https://jira.hl7.org/browse/CDA-21415) - Update note code bindings on Note Activity and Notes Section
* [CDA-21423](https://jira.hl7.org/browse/CDA-21423) - Health Concern Act - Act.code contains wrong code display name


### Version 4.0.0

The changes in this version of Consolidated CDA were made from comments raised during the ballot period.

#### Major Changes

* Added a listing of templates ordered by template ID
* Every template now lists referenced templates and templates that use that template
* Updated the Supporting Guidance page to remove guidance that is already in templates and to not use conformance language for the remaining best practices

##### New Templates
* Age Range Observation

##### Changed Templates

###### Entry Templates
* Advance Directive Existence Observation - new sdtc:category element
* Assessment Scale Observation - Updated code bindings
* Patient Referral Act - changed name to Referral Act
* Result Observation - new sdtc:category element
* Service Delivery Location - Updated code bindings

###### Section Templates
* Health Status Evalations and Outcomes Section - renamed to Outcomes Section

###### Document Templates
* US Realm Header - adminstrativeGender is no longer mandatory, race codes, ethnicity codes, and language codes received new bindings


#### Tracker Issues Applied
* [CDA-20011](https://jira.hl7.org/browse/CDA-20011) - Social History Observation - problems with value set binding on code element
* [CDA-21250](https://jira.hl7.org/browse/CDA-21250) - Incorrect LOINC code specified for Individual Pronoun Observation
* [CDA-21252](https://jira.hl7.org/browse/CDA-21252) - Smoking Status Meaningful Use listed as new template in Change Log
* [CDA-21253](https://jira.hl7.org/browse/CDA-21253) - Add descriptions and links to "Tracker Issues Applied" for 4.0
* [CDA-21254](https://jira.hl7.org/browse/CDA-21254) - Some new USCDI labels are inconsistent with others
* [CDA-21255](https://jira.hl7.org/browse/CDA-21255) - AdvanceDirectives False Constraint is too constraining
* [CDA-21256](https://jira.hl7.org/browse/CDA-21256) - Align C-CDA and US Core Race and Ethnicity Value Set Concepts
* [CDA-21257](https://jira.hl7.org/browse/CDA-21257) - Wrapping AdvanceDirectives inside an existence observation seems overly complicated
* [CDA-21258](https://jira.hl7.org/browse/CDA-21258) - AdvanceDirective Existence - No way to identify type
* [CDA-21259](https://jira.hl7.org/browse/CDA-21259) - Add category to Result Observation
* [CDA-21263](https://jira.hl7.org/browse/CDA-21263) - Include high effectiveTime in differential when should is present
* [CDA-21264](https://jira.hl7.org/browse/CDA-21264) - Include Pregnancy Intention in Social History
* [CDA-21265](https://jira.hl7.org/browse/CDA-21265) - New Note Activity guidance in sections should be clarified
* [CDA-21267](https://jira.hl7.org/browse/CDA-21267) - Assessment Scale Observation value guidance isn't clear
* [CDA-21269](https://jira.hl7.org/browse/CDA-21269) - Update typeCode when referencing Assessment Scale Observations
* [CDA-21270](https://jira.hl7.org/browse/CDA-21270) - Change Patient Language binding 
* [CDA-21271](https://jira.hl7.org/browse/CDA-21271) - Add guidance  about the use of the Location Value set wrt USCDI Terminology requirements
* [CDA-21272](https://jira.hl7.org/browse/CDA-21272) - Add asked-declined to Race and Ethnicity Value Sets
* [CDA-21274](https://jira.hl7.org/browse/CDA-21274) - Consider adding the referenced entries to the narrative
* [CDA-21275](https://jira.hl7.org/browse/CDA-21275) - Please add a "Plain Language Summary about this Guide" to the home page.
* [CDA-21276](https://jira.hl7.org/browse/CDA-21276) - Age Observation does not accommodate age range 
* [CDA-21277](https://jira.hl7.org/browse/CDA-21277) - Small and blurry images
* [CDA-21281](https://jira.hl7.org/browse/CDA-21281) - Interpreter Needed Observation: effectiveTime description
* [CDA-21282](https://jira.hl7.org/browse/CDA-21282) - Change Log: Replaced Templates
* [CDA-21283](https://jira.hl7.org/browse/CDA-21283) - Artifacts: Search by templateId
* [CDA-21284](https://jira.hl7.org/browse/CDA-21284) - Align any changes made in US Core 8.0 to C-CDA 
* [CDA-21285](https://jira.hl7.org/browse/CDA-21285) - HLSOC translation for encounter location should be required, not optional
* [CDA-21289](https://jira.hl7.org/browse/CDA-21289) - clarification about use of provider organization 
* [CDA-21290](https://jira.hl7.org/browse/CDA-21290) - Change MAY to SHOULD
* [CDA-21291](https://jira.hl7.org/browse/CDA-21291) - Change SHOULD to SHALL 
* [CDA-21292](https://jira.hl7.org/browse/CDA-21292) - Change SHOULD to SHALL 
* [CDA-21293](https://jira.hl7.org/browse/CDA-21293) - Change SHOULD to SHALL 
* [CDA-21294](https://jira.hl7.org/browse/CDA-21294) - Advance Directive Observation Example shouldn't be about a Referral Note document
* [CDA-21295](https://jira.hl7.org/browse/CDA-21295) - Complex entry should show the nested sub-part for the Advance Directive Observation
* [CDA-21296](https://jira.hl7.org/browse/CDA-21296) - Type-o in name of Advance Directive Existance Observation Example
* [CDA-21297](https://jira.hl7.org/browse/CDA-21297) - Assessment Scale Observation - move survey to category
* [CDA-21298](https://jira.hl7.org/browse/CDA-21298) - Add link from USCDI page to C-CDA release checkerboard slide
* [CDA-21299](https://jira.hl7.org/browse/CDA-21299) - Wrong title on USCDI mapping table?
* [CDA-21313](https://jira.hl7.org/browse/CDA-21313) - Specimen Collection Procedure - Specimen Ref Makes No Sense
* [CDA-21314](https://jira.hl7.org/browse/CDA-21314) - Referral Act entryRelationship is poorly modeled
* [CDA-21315](https://jira.hl7.org/browse/CDA-21315) - Rename Patient Referral Act template
* [CDA-21316](https://jira.hl7.org/browse/CDA-21316) - Discharge Diagnosis Section does not allow any other entries
* [CDA-21318](https://jira.hl7.org/browse/CDA-21318) - Medication timing slice names and shorts are backwards
* [CDA-21319](https://jira.hl7.org/browse/CDA-21319) - Conformance Statements in Supporting Guidance
* [CDA-21320](https://jira.hl7.org/browse/CDA-21320) - Add SHALL in mapping of C-CDA to USCDI
* [CDA-21322](https://jira.hl7.org/browse/CDA-21322) - Health Concern Act slicing is incorrect
* [CDA-21323](https://jira.hl7.org/browse/CDA-21323) - Fix name of Health Status Evaluation and Outcomes Section
* [CDA-21324](https://jira.hl7.org/browse/CDA-21324) - Add Narrative Guidance on USCDI Provenance
* [CDA-21325](https://jira.hl7.org/browse/CDA-21325) - Add back "Complaint" (inactive SCT code) to SCT Problem Type Value Set
* [CDA-21326](https://jira.hl7.org/browse/CDA-21326) - Change Value Set Binding in "Sex" Observation, change Observation description, adjust associated text guidance
* [CDA-21328](https://jira.hl7.org/browse/CDA-21328) - Value sets referenced by US realm specs need to be updated at least yearly
* [CDA-21329](https://jira.hl7.org/browse/CDA-21329) - Value sets should not include inactive codes unless specific to historical queries
* [CDA-21332](https://jira.hl7.org/browse/CDA-21332) - Immunization Activity template description formatting messed up
* [CDA-21334](https://jira.hl7.org/browse/CDA-21334) - Policy Activity, Coverage Activity and related USCDI table corrections
* [CDA-21335](https://jira.hl7.org/browse/CDA-21335) - Policy Activity - Group Identifier
* [CDA-21340](https://jira.hl7.org/browse/CDA-21340) - Code Binding corrections and text clarifications in ADI templates
* [CDA-21341](https://jira.hl7.org/browse/CDA-21341) - Add Additional Bindings to Service Delivery Location for Multiple Industry Code Systems
* [CDA-21342](https://jira.hl7.org/browse/CDA-21342) - EO Related Changes
* [CDA-21343](https://jira.hl7.org/browse/CDA-21343) - Correct State value set to point to THO set

### Version 4.0.0-ballot

The changes in this version of Consolidated CDA were made from comments raised plus additions for new USCDI elements.

#### Major Changes

* Updated USCDI Table
* Updated Terminology page

##### New Templates
* Advance Directive Existence Observation
* Smoking Status 
* Individual Pronoun Observation
* Interpreter Needed Observation
* Sex Parameter For Clinical Use Observation
* Instruction Observation

##### Deprecated Templates
* Advance Directive Organizer
* Tobacco Use
* Smoking Status Meaningful Use
* Instruction Activity

##### Changed Templates

###### Entry Templates
* AssessmentScaleObservation - changed code binding
* EncounterActivity - change code and discharge disposition binding, added InterpreterNeededObservation entry
* GenderIdentityObservation - no longer a Social History Observation
* PlannedEncounter - changed code binding, added InterpreterNeededObservation entry
* PlannedProcedure - added sdtcCategory
* PregnancyIntentionInNextYear - mood changed from INT to EVN
* PregnancyObservation renamed to PregnancyStatusObservation
* ResultOrganizer - add sdtcCategory
* ServiceDeliveryLocation - changed code binding
* SexualOrientationObservation - no longer a Social History Observation
* SpecimenConditionObservation - changed value binding

###### Section Templates
* AdvanceDirectivesSection - removed organizer, changed observation to existence observation
* AssessmentSection - added MAY NotesActivity
* AssessmentAndPlanSection - added MAY NotesActivity
* PlanOfTreatmentSection - added MAY NotesActivity
* SocialHistorySection - added IndividualPronounObservation

#### Tracker Issues Applied
* [CDA-20007](https://jira.hl7.org/browse/CDA-20007) - Allow CMS Place of Service codes for HealthcareServiceLocation
* [CDA-20887](https://jira.hl7.org/browse/CDA-20887) - Update Guidance on Unknown and No Known Information
* [CDA-21022](https://jira.hl7.org/browse/CDA-21022) - Examples need to be streamlined
* [CDA-21112](https://jira.hl7.org/browse/CDA-21112) - Update Pregnancy Status Observation to better align with FHIR
* [CDA-21113](https://jira.hl7.org/browse/CDA-21113) - Align Encounter Type between C-CDA and FHIR US Core
* [CDA-21114](https://jira.hl7.org/browse/CDA-21114) - Problem Type Value Set points to https instead of http
* [CDA-21120](https://jira.hl7.org/browse/CDA-21120) - How to Read: Word "Profile" should be replaced with "Template"
* [CDA-21123](https://jira.hl7.org/browse/CDA-21123) - Add guidance in the short description in the Result Organizer at component:SpecimenProc
* [CDA-21124](https://jira.hl7.org/browse/CDA-21124) - Correct link and name to VSAC SDOH Assessments and Questions value set
* [CDA-21125](https://jira.hl7.org/browse/CDA-21125) - On validation page add information about the new tooling that generated SD generated schematron
* [CDA-21126](https://jira.hl7.org/browse/CDA-21126) - Move "How to Read"
* [CDA-21127](https://jira.hl7.org/browse/CDA-21127) - Link to Specimen Condition Observation in USCDI table is broken
* [CDA-21128](https://jira.hl7.org/browse/CDA-21128) - Discharge Disposition - point to US Core set and delete C-CDA set
* [CDA-21129](https://jira.hl7.org/browse/CDA-21129) - Change binding at encompassingEncounter.code from HL7 EncounterDischargeDisposition to NUBC
* [CDA-21130](https://jira.hl7.org/browse/CDA-21130) - Add Guidance about Radiology LOINC codes in Result Organizer and Result Observation Templates
* [CDA-21134](https://jira.hl7.org/browse/CDA-21134) - Sexual Orientation should be a simple observation and not derive from from Social Hx Observation
* [CDA-21137](https://jira.hl7.org/browse/CDA-21137) - Review hl7VS-specimenCondition completeness
* [CDA-21143](https://jira.hl7.org/browse/CDA-21143) - Assessment Scale Observation - add value set binding to observation code
* [CDA-21144](https://jira.hl7.org/browse/CDA-21144) - Add Guidance about Lab LOINC in Result Organizer and Result Observation Templates
* [CDA-21148](https://jira.hl7.org/browse/CDA-21148) - Binding to value sets where null and or DAR values are used instead of null values - restriction and guidance is needed
* [CDA-21151](https://jira.hl7.org/browse/CDA-21151) - Add guidance to Assessment Scale Observation and Assessment Scale Supporting Observation about scores and calculated scores
* [CDA-21153](https://jira.hl7.org/browse/CDA-21153) - UnitsofMeasureCaseSensitive
* [CDA-21157](https://jira.hl7.org/browse/CDA-21157) - Add USCDI to C-CDA mapping table
* [CDA-21178](https://jira.hl7.org/browse/CDA-21178) - Improve Guidance and coding guidance for Result Organizer
* [CDA-21179](https://jira.hl7.org/browse/CDA-21179) - Add requirement to require C-CDAs include minimum content
* [CDA-21180](https://jira.hl7.org/browse/CDA-21180) - Improve Progress Note Document-level guidance
* [CDA-21181](https://jira.hl7.org/browse/CDA-21181) - Add Requirement to wrap Assessment and Plan in Note Activity
* [CDA-21215](https://jira.hl7.org/browse/CDA-21215) - Instruction template is ambiguous / not useful
* [CDA-21221](https://jira.hl7.org/browse/CDA-21221) - Add USCDI indicator to Immunization Lot Number Text
* [CDA-21222](https://jira.hl7.org/browse/CDA-21222) - Updated Guidance on Medication Route
* [CDA-21224](https://jira.hl7.org/browse/CDA-21224) - USCDI Planned Procedure
* [CDA-21225](https://jira.hl7.org/browse/CDA-21225) - USCDI Name to Use
* [CDA-21226](https://jira.hl7.org/browse/CDA-21226) - USCDI Interpreter Needed
* [CDA-21227](https://jira.hl7.org/browse/CDA-21227) - USCDI Patient Pronouns
* [CDA-21228](https://jira.hl7.org/browse/CDA-21228) - USCDI Add Provenance Author and Author Role
* [CDA-21229](https://jira.hl7.org/browse/CDA-21229) - USCDI Advance Directive Observation
* [CDA-21230](https://jira.hl7.org/browse/CDA-21230) - USCDI Add new Author extension to Advance Directive observation
* [CDA-21231](https://jira.hl7.org/browse/CDA-21231) - USCDI - Update Advance Directive Observation
* [CDA-21232](https://jira.hl7.org/browse/CDA-21232) - USCDI - Deprecate Advance Directive Organizer
* [CDA-21233](https://jira.hl7.org/browse/CDA-21233) - USCDI - Update Advance Directive Text in Advance Directive Observation
* [CDA-21234](https://jira.hl7.org/browse/CDA-21234) - USCDI - Advance Directive Section - changes related to new AD design
* [CDA-21235](https://jira.hl7.org/browse/CDA-21235) - USCDI Sex Parameter for Clinical Use
* [CDA-21237](https://jira.hl7.org/browse/CDA-21237) - Add sdtc:category to documents with required value
* [CDA-21245](https://jira.hl7.org/browse/CDA-21245) - Sex Observation templateId extension changed
* [CDA-21247](https://jira.hl7.org/browse/CDA-21247) - Add guidance to Note Activity template to call out USCDI Notes and their LOINC codes

### Version 3.0.0

The changes in this version of Consolidated CDA were made from comments raised during the January 2024 ballot of Consolidated CDA plus other issues that were raised during the ballot timeframe.

#### Major Changes

* Removed Planned Activity Act and Planned Activity Observation templates
* Deprecated the Smoking Status - Meaningful Use and Tobacco Use templates
* Added new Smoking Status template
* Added new Average Blood Pressure Organizer template


#### Tracker Issues Applied
- [CDA-2089](https://jira.hl7.org/browse/CDA-2089) - Create sdtc:telecom extension in CDA and reference it in the US Realm Header template.
- [CDA-20848](https://jira.hl7.org/browse/CDA-20848) - C-CDA Vital Sign Result Type value set in VSAC corrected with appropriate vital signs types.
- [CDA-20849](https://jira.hl7.org/browse/CDA-20849) - Update Social History Section description.
- [CDA-20854](https://jira.hl7.org/browse/CDA-20854) - Add constraint to only contain inactive Problem observations in Past Medical History.
- [CDA-20855](https://jira.hl7.org/browse/CDA-20855) - Update Problem Observation effectiveTime description.
- [CDA-20882](https://jira.hl7.org/browse/CDA-20882) - Change LOINC codes for Care Team Member Act and Planned Coverage.
- [CDA-20883](https://jira.hl7.org/browse/CDA-20883) - Update How To Read section on tabs to use the proper names of the tabs.
- [CDA-20884](https://jira.hl7.org/browse/CDA-20884) - Provide an example of Template Inheritance showing how the old Profile that showed all constraints is different from the Differential Tab which only shows new constraints.
- [CDA-20885](https://jira.hl7.org/browse/CDA-20885) - Add statements about US@ to US Realm Address.
- [CDA-20886](https://jira.hl7.org/browse/CDA-20886) - Change binding at Gender Identity observationCode to Gender Identity value set and remove binding to nullFlavor (but don't preclude)
- [CDA-20888](https://jira.hl7.org/browse/CDA-20888) - Update Care Experience Preference description.
- [CDA-20894](https://jira.hl7.org/browse/CDA-20894) - Update Goal Observation description.
- [CDA-20896](https://jira.hl7.org/browse/CDA-20896) - Will add effectiveTime 1..1 (nullFlavor is allowed) with just a value that indicates the point in time when the ProgressTowardsGoalObservation was made.
- [CDA-20898](https://jira.hl7.org/browse/CDA-20898) - Fix typos.
- [CDA-20899](https://jira.hl7.org/browse/CDA-20899) - Fix typos.
- [CDA-20901](https://jira.hl7.org/browse/CDA-20901) - Fix typos.
- [CDA-20902](https://jira.hl7.org/browse/CDA-20902) - Add USCDI Flag to Care Team Member Act elements.
- [CDA-20903](https://jira.hl7.org/browse/CDA-20903) - Add display name for fixed code.
- [CDA-20904](https://jira.hl7.org/browse/CDA-20904) - Update the How To Read page to be version-agnostic.
- [CDA-20905](https://jira.hl7.org/browse/CDA-20905) - Add guidance in the How To Read page that the Snapshot table will show all guidance, including that inherited from base CDA models.
- [CDA-20906](https://jira.hl7.org/browse/CDA-20906) - Changed closed templates from using invariants to specifically excluding unneeded elements.
- [CDA-20907](https://jira.hl7.org/browse/CDA-20907) - Fix script to create valid artifact descriptions.
- [CDA-20908](https://jira.hl7.org/browse/CDA-20908) - Update CoverageAct.effectiveTime, Remove PolicyActivity.effectiveTime, provide guidance on PolicyActivity.participant.coverage-target.time.
- [CDA-20909](https://jira.hl7.org/browse/CDA-20909) - Change binding on the Related Person Relationship and Name Participant associated Entity to a value set.
- [CDA-20910](https://jira.hl7.org/browse/CDA-20910) - Make the Key Elements Table tab the default for CDA specifications.
- [CDA-20911](https://jira.hl7.org/browse/CDA-20911) - Fix guidance on Medication Activity and Medication Information templates for typos and clarification.
- [CDA-20912](https://jira.hl7.org/browse/CDA-20912) - Add constraint about Observation.value using UCUM units for PQ datatype to Social History Observation.
- [CDA-20914](https://jira.hl7.org/browse/CDA-20914) - Give EncounterDiagnosis a new template version as this is a breaking change.
- [CDA-20915](https://jira.hl7.org/browse/CDA-20915) - Change Smoking Status-Meaningful Use value from required to preferred.
- [CDA-20916](https://jira.hl7.org/browse/CDA-20916) - Change Payers section in Referral Note from required to optional.
- [CDA-20918](https://jira.hl7.org/browse/CDA-20918) - Add binding to Observation Interpretation on Vital Sign Observation interpretationCode.
- [CDA-20919](https://jira.hl7.org/browse/CDA-20919) - Add USCDI flags to Encounter Activity elements.
- [CDA-20920](https://jira.hl7.org/browse/CDA-20920) - Add link to NUBC codes as well as the license in the comments of Encounter.sdtcDischargeDispositionCode.
- [CDA-20922](https://jira.hl7.org/browse/CDA-20922) - Add clarification on USCDI interpretation to the USCDI page.
- [CDA-20924](https://jira.hl7.org/browse/CDA-20924) - Create actual terminology bindings for the Goal Observation constraint text.
- [CDA-20925](https://jira.hl7.org/browse/CDA-20925) - Add missing USCDI flags to Coverage Activity
- [CDA-20926](https://jira.hl7.org/browse/CDA-20926) - Add display name for fixed code.
- [CDA-20927](https://jira.hl7.org/browse/CDA-20927) - Add missing USCDI flag to Result Organizer.
- [CDA-20928](https://jira.hl7.org/browse/CDA-20928) - Add text guidance in the Description field that states that the Specimen Collection Procedure "Includes representation of the USCDI data element "Specimen Condition Acceptability"
- [CDA-20929](https://jira.hl7.org/browse/CDA-20929) - Fix Result Organizer description.
- [CDA-20930](https://jira.hl7.org/browse/CDA-20930) - Add missing USCDI flag to Result Observation.
- [CDA-20931](https://jira.hl7.org/browse/CDA-20931) - Fix typo.
- [CDA-20932](https://jira.hl7.org/browse/CDA-20932) - Add missing USCDI flag to Patient Language Code.
- [CDA-20933](https://jira.hl7.org/browse/CDA-20933) - Ensure binding to UCUM units is preferred and not required.
- [CDA-20936](https://jira.hl7.org/browse/CDA-20936) - We will make a note of the should-relatedParticipant invariant on the participant so that it is more prevalent.
- [CDA-20938](https://jira.hl7.org/browse/CDA-20938) - Update SDOH bindings and add USCDI tags on the relevant elements.
- [CDA-20939](https://jira.hl7.org/browse/CDA-20939) - Add new binding to SDOH Screening Assessments in AssessmentScaleObservation template.
- [CDA-20940](https://jira.hl7.org/browse/CDA-20940) - Add the @code requirement on US Realm Header and reset the bindings on all document templates to the code element
- [CDA-20941](https://jira.hl7.org/browse/CDA-20941) - Remove comment and short from Procedure Note encompassingEncounter location.
- [CDA-20942](https://jira.hl7.org/browse/CDA-20942) - Add binding to ServiceEvent.Performer.functionCode in Patient Generated Header.
- [CDA-20943](https://jira.hl7.org/browse/CDA-20943) - Add a constraint that if @code and @codeSystem exists, @nullFlavor can not exist.
- [CDA-20944](https://jira.hl7.org/browse/CDA-20944) - Change Referral Participant Name template to Person Name.
- [CDA-20945](https://jira.hl7.org/browse/CDA-20945) - Remove the Short since the invariant expresses the proper constraint.
- [CDA-20946](https://jira.hl7.org/browse/CDA-20946) - Move the note that is on PCP.typeCode to functionCode
- [CDA-20947](https://jira.hl7.org/browse/CDA-20947) - Remove the EVN entryRelationships from the Planned Intervention Act.
- [CDA-20948](https://jira.hl7.org/browse/CDA-20948) - Remove the note about Hospital Discharge Diagnosis from the Encounter Diagnosis template.
- [CDA-20949](https://jira.hl7.org/browse/CDA-20949) - Update the Care Plan notes around the required and optional sections.
- [CDA-20950](https://jira.hl7.org/browse/CDA-20950) - Model the Planned Medication Activity's effectiveTime similar to Medication Activity.
- [CDA-20951](https://jira.hl7.org/browse/CDA-20951) - Make an example binding to the proper value set.
- [CDA-20952](https://jira.hl7.org/browse/CDA-20952) - Update the Health Status Evaluations Section description.
- [CDA-20953](https://jira.hl7.org/browse/CDA-20953) - Remove the language around Assessments and Assessment and Plan from the Care Plan document.
- [CDA-20954](https://jira.hl7.org/browse/CDA-20954) - Make both Performer slices have typeCode = PRF and remove the constraint language.
- [CDA-20955](https://jira.hl7.org/browse/CDA-20955) - Created new [Average Blood Pressure Organizer](StructureDefinition-AverageBloodPressureOrganizer.html) template
- [CDA-20957](https://jira.hl7.org/browse/CDA-20957) - Change the Problem Observation code binding to a new Grouper value set.
- [CDA-20958](https://jira.hl7.org/browse/CDA-20958) - Change the Problem Value set binding to the US Core Condition value set.
- [CDA-20961](https://jira.hl7.org/browse/CDA-20961) - Update the Advance Directive Organizer description.
- [CDA-20962](https://jira.hl7.org/browse/CDA-20962) - Change the Procedure code bindings to use the US Core Procedure set.
- [CDA-20963](https://jira.hl7.org/browse/CDA-20963) - Remove Planned Activity Act and Planned Activity Observation Templates.
- [CDA-20965](https://jira.hl7.org/browse/CDA-20965) - Update the Advance Directive Observation description.
- [CDA-20966](https://jira.hl7.org/browse/CDA-20966) - Update the Advance Directive Organizer description.
- [CDA-20967](https://jira.hl7.org/browse/CDA-20967) - Update the Advance Directive Observation description.
- [CDA-20969](https://jira.hl7.org/browse/CDA-20969) - Bind the playingEntity.code to the Personal and Legal Relationship Role Types value set.
- [CDA-20970](https://jira.hl7.org/browse/CDA-20970) - Update the Advance Directive Observation externalDocument.code binding to to be Preferred to Advance Directive Categories.
- [CDA-20971](https://jira.hl7.org/browse/CDA-20971) - Update the Advance Directive Observation code binding to be to a new grouper value set.
- [CDA-20973](https://jira.hl7.org/browse/CDA-20973) - Remove the prohibition on ReferenceRange.code.
- [CDA-20974](https://jira.hl7.org/browse/CDA-20974) - Create an invariant on Indication similarly to how EntryReference and AuthorParticipation do it.
- [CDA-20975](https://jira.hl7.org/browse/CDA-20975) - Update the value set binding from Nutrition Recommendations to Nutrition Recommendation Grouping.
- [CDA-20976](https://jira.hl7.org/browse/CDA-20976) - Add a paragraph about how the guide uses FHIR Structure Definitions and change "based on FHIR" to be "generated with"
- [CDA-20977](https://jira.hl7.org/browse/CDA-20977) - Add information about XML vs JSON in the new section that explains what "based on FHIR" means.
- [CDA-20978](https://jira.hl7.org/browse/CDA-20978) - Fix a broken link.
- [CDA-20980](https://jira.hl7.org/browse/CDA-20980) - Add a note that SDTC extensions are used in the templates and provide a link to find information about those extensions.
- [CDA-20981](https://jira.hl7.org/browse/CDA-20981) - Move section 3.12 to the Validation page.
- [CDA-20983](https://jira.hl7.org/browse/CDA-20983) - Move the "How to Read" into the Guidance menu structure.
- [CDA-20985](https://jira.hl7.org/browse/CDA-20985) - Add information about required value set bindings to the General Guidance section.
- [CDA-20989](https://jira.hl7.org/browse/CDA-20989) - We will change the title of the guide to include C-CDA.
- [CDA-20990](https://jira.hl7.org/browse/CDA-20990) - Fix capitalizations.
- [CDA-20992](https://jira.hl7.org/browse/CDA-20992) - We will add a section to the How to Read about why the template versions are no longer in the name.
- [CDA-20993](https://jira.hl7.org/browse/CDA-20993) - Remove figure numbering.
- [CDA-20995](https://jira.hl7.org/browse/CDA-20995) - Fix typos.
- [CDA-21017](https://jira.hl7.org/browse/CDA-21017) - Change the binding on routeCode.translation to be Preferred instead of Required.
- [CDA-21019](https://jira.hl7.org/browse/CDA-21019) - Rename USCDI "Time of Procedure" element to "Performance Time"
- [CDA-21041](https://jira.hl7.org/browse/CDA-21041) - Change the CCDA IG template to use the word Template instead of Profile.
- [CDA-21042](https://jira.hl7.org/browse/CDA-21042) - Remove the SpecimenRejectReasonObservation template.
- [CDA-21048](https://jira.hl7.org/browse/CDA-21048) - Swap the bindings on the code and the translations on Advance Directive Observation code.
- [CDA-21049](https://jira.hl7.org/browse/CDA-21049) - Change Problem Type value set bindings to use a new Grouper value set.
- [CDA-21051](https://jira.hl7.org/browse/CDA-21051) - Update VSAC/LOINC/SNOMED display names.
- [CDA-21052](https://jira.hl7.org/browse/CDA-21052) - Change Vital Signs Organizer code to use LOINC code.
- [CDA-21053](https://jira.hl7.org/browse/CDA-21053) - Changed the Patient Referral Act statusCode binding to be to ActStatus code system.
- [CDA-21054](https://jira.hl7.org/browse/CDA-21054) - Created new [Smoking Status](StructureDefinition-SmokingStatus.html) template and deprecated [Smoking Status - Meaningful Use](StructureDefinition-SmokingStatusMeaningfulUse.html) and [Tobacco Use](StructureDefinition-TobaccoUse.html)
- [CDA-21056](https://jira.hl7.org/browse/CDA-21056) - Update Basic Industry Occupation examples to match templates.
- [CDA-21057](https://jira.hl7.org/browse/CDA-21057) - Added explanatory text on what effectiveTime means within goals
- [CDA-21058](https://jira.hl7.org/browse/CDA-21058) - Updated the Immunization Refusal Reason template to Immunization Not Given Reason and use proper codes and value set bindings.
- [CDA-21060](https://jira.hl7.org/browse/CDA-21060) - Update Sex Observation value set.
- [CDA-21062](https://jira.hl7.org/browse/CDA-21062) - Update Patient Generated Document description.
- [CDA-21064](https://jira.hl7.org/browse/CDA-21064) - Add 0..* authors to the Disability Status Observation.
- [CDA-21065](https://jira.hl7.org/browse/CDA-21065) - Change the Sex Observation value set binding to be Preferred.
- [CDA-21066](https://jira.hl7.org/browse/CDA-21066) - Update slice names throughout guide
- [CDA-21067](https://jira.hl7.org/browse/CDA-21067) - Change Patient Referral Act participant from SHALL contain exactly one to MAY contain zero or one.
- [CDA-21070](https://jira.hl7.org/browse/CDA-21070) - Add slicing logic to [Medications Administered Section](StructureDefinition-MedicationsAdministeredSection.html)
- [CDA-21076](https://jira.hl7.org/browse/CDA-21076) - Add test for SHOULD NOT on [Allergy](StructureDefinition-SubstanceOrDeviceAllergyIntoleranceObservation.html) severity
- [CDA-21080](https://jira.hl7.org/browse/CDA-21080) - Fix comment to reference proper code on ProcedureNote participant typeCode
- [CDA-21081](https://jira.hl7.org/browse/CDA-21081) - Combine Goal Observation's two REFR EntryReference entries into one
- [CDA-21087](https://jira.hl7.org/browse/CDA-21087) - Fix the OID for LOINC 
- [CDA-21088](https://jira.hl7.org/browse/CDA-21088) - Combine Risk Concern Act's two REFR EntryReference entries into one

### Version 3.0.0-ballot 

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
- [CDA-1381](https://jira.hl7.org/browse/CDA-1381) - Prevent doseQuantity/@unit and administrationUnitCode/@code from both being present where both are on a template
- [CDA-1429](https://jira.hl7.org/browse/CDA-1429) - Remove Goal Observation value constraint
- [CDA-1430](https://jira.hl7.org/browse/CDA-1430) - Added code constraints to Findings Section
- [CDA-1469](https://jira.hl7.org/browse/CDA-1469) - Updated MentalStatusObservation.value to be from new SNOMED cognitive function value set.
- [CDA-1505](https://jira.hl7.org/browse/CDA-1505) - Patient Generated Document header has the same bindings as US Realm Header for performer functionCode.
- [CDA-1513](https://jira.hl7.org/browse/CDA-1513) - Change the Health Insurance Type binding to be the X12N Insurance Type code system
- [CDA-1526](https://jira.hl7.org/browse/CDA-1526) - Add guidance on @unit in Vital Sign Observation
- [CDA-1627](https://jira.hl7.org/browse/CDA-1627) - Bind Procedure Act Procedure code to US Core Procedure value set.
- [CDA-1637](https://jira.hl7.org/browse/CDA-1637)/[CDA-1638](https://jira.hl7.org/browse/CDA-1638) - Update Discharge Disposition code binding.
- [CDA-1757](https://jira.hl7.org/browse/CDA-1757) - Updated BirthSex template to align with Gender Harmony.
- [CDA-1760](https://jira.hl7.org/browse/CDA-1760) - Changed Smoking Status statusCode to be bound to a value set.
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
- [CDA-20085](https://jira.hl7.org/browse/CDA-20085) - Allow Result Observation value to be from SNOMED or LOINC.
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
- [CDA-20565](https://jira.hl7.org/browse/CDA-20565) - Remove requirement to send R1.1 template Ids
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
- [CDA-20775](https://jira.hl7.org/browse/CDA-20775) - Make USRealmDateTime require timezone offsets; use this template in any other modified templates where it was missed
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
- [CDA-20877](https://jira.hl7.org/browse/CDA-20877) - Removed compatibility comment on vital signs organizer
- [CDA-20878](https://jira.hl7.org/browse/CDA-20878) - Updated LOINC code on Coverage Activity to 52556-8 Payment sources


#### Templates with New Extensions due to Major Change

{% raw %}
<blockquote class="note-to-balloters">
<p>
	The intent of providing a new extension to a template was to indicate when major change had occurred and thus instances of the template that were previously valid might no longer be valid due to changes in the template.  We have tried to identify all templates where major change occurred.  Comments about specific templates that SHOULD have received a new extension or templates that SHOULD NOT have received a new extension are appreciated.
</p>
</blockquote>
{% endraw %}


Templates that received a new extension in this version of the guide have '2024-05-01' as their extension.

##### Document Templates
*US Realm Header* had a number of changes that propagate through the other Document Templates.  Due to this, all document template ids received a new extension.

##### Section Templates
No section templates had major changes and thus they all retain their previous template id.

##### Entry Templates
The following entry templates had major changes and thus their template ids received a new extension:

| Entry | Changes |
| --- | --- |
| [Birth Sex Observation](StructureDefinition-BirthSexObservation.html) | value binding changed |
| [Coverage Activity](StructureDefinition-CoverageActivity.html) | updated LOINC code |
| [Mental Status Observation](StructureDefinition-MentalStatusObservation.html) | updated code and new value binding |
| [Planned Supply](StructureDefinition-PlannedSupply.html) | one form of product SHALL be present |
| [Policy Activity](StructureDefinition-PolicyActivity.html) | effectiveTime is now SHOULD |
| [Problem Concern Act](StructureDefinition-ProblemConcernAct.html) | only one ProblemObservation is allowed |
| [Problem Observation](StructureDefinition-ProblemObservation.html) | value has US-Core value set binding |
| [Procedure Activity Procedure](StructureDefinition-ProcedureActivityProcedure.html) | code has new US-Core binding |
| [Smoking Status - Meaningful Use](StructureDefinition-SmokingStatusMeaningfulUse.html) | statusCode.code bound to new valueset |
