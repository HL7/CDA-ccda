////////////////////////////////////////////////////////////
//                                                        //
//                  Section SHOULD's                      //
//                                                        //
////////////////////////////////////////////////////////////
// Basically all identical; copy, paste, change
// Apply at top-level of section

Invariant: should-section-advance-directives
Description: "SHOULD contain am Advamce Directives Section"
Severity: #warning
Expression: "component.where(section.hasTemplateIdOf(AdvanceDirectivesSection))"

Invariant: should-section-discharge-dx
Description: "SHOULD contain a Discharge Diagnosis Section"
Severity: #warning
Expression: "component.where(section.hasTemplateIdOf(DischargeDiagnosisSection))"

Invariant: should-section-discharge-meds
Description: "SHOULD contain a Discharge Medications Section"
Severity: #warning
Expression: "component.where(section.hasTemplateIdOf(DischargeMedicationsSection))"

Invariant: should-section-functional-status
Description: "SHOULD contain a Functional Status Section"
Severity: #warning
Expression: "component.where(section.hasTemplateIdOf(FunctionalStatusSection))"

Invariant: should-section-healthstatus
Description: "SHOULD contain a Health Status Evaluations and Outcomes Section"
Severity: #warning
Expression: "component.where(section.hasTemplateIdOf(HealthStatusEvaluationsandOutcomesSection))"

Invariant: should-section-hpi
Description: "SHOULD contain a History of Present Illness Section"
Severity: #warning
Expression: "component.where(section.hasTemplateIdOf(HistoryofPresentIllnessSection))"

Invariant: should-section-medications
Description: "SHOULD contain a Medications Section"
Severity: #warning
Expression: "component.where(section.hasTemplateIdOf(MedicationsSection))"

Invariant: should-section-mental-status
Description: "SHOULD contain a Mental Status Section"
Severity: #warning
Expression: "component.where(section.hasTemplateIdOf(MentalStatusSection))"

Invariant: should-section-nutrition
Description: "SHOULD contain a Nutrition Section"
Severity: #warning
Expression: "component.where(section.hasTemplateIdOf(NutritionSection))"

Invariant: should-section-physical-exam
Description: "SHOULD contain a Physical Exam Section"
Severity: #warning
Expression: "component.where(section.hasTemplateIdOf(PhysicalExamSection))"

Invariant: should-section-plan-of-treatment
Description: "SHOULD contain a Plan of Treatment Section"
Severity: #warning
Expression: "component.where(section.hasTemplateIdOf(PlanofTreatmentSection))"

Invariant: should-section-procedures
Description: "SHOULD contain a Procedures Section"
Severity: #warning
Expression: "component.where(section.hasTemplateIdOf(ProceduresSection))"

Invariant: should-section-results
Description: "SHOULD contain a Results Section"
Severity: #warning
Expression: "component.where(section.hasTemplateIdOf(ResultsSection))"

Invariant: should-section-social-history
Description: "SHOULD contain a Social History Section"
Severity: #warning
Expression: "component.where(section.hasTemplateIdOf(SocialHistorySection))"

////////////////////////////////////////////////////////////
//                                                        //
//           Entry Requirements  - SHOULD                 //
//                                                        //
////////////////////////////////////////////////////////////

// Basically all identical; copy, paste, change (be sure to change entry type, too)
// Apply at top-level of section

Invariant: should-admission-medication
Description: "SHOULD contain Admission Medication"
Severity: #warning
Expression: "entry.where(act.hasTemplateIdOf(AdmissionMedication))"

Invariant: should-care-team-org
Description: "SHOULD contain Care Team Organizer"
Severity: #warning
Expression: "entry.where(organizer.hasTemplateIdOf(CareTeamOrganizer))"

Invariant: should-coverage-activity
Description: "SHOULD contain Coverage Activity"
Severity: #warning
Expression: "entry.where(act.hasTemplateIdOf(CoverageActivity))"

Invariant: should-health-status-obs
Description: "SHOULD contain Health Status Observation"
Severity: #warning
Expression: "entry.where(observation.hasTemplateIdOf(HealthStatusObservation))"

Invariant: should-intervention-act
Description: "SHOULD contain Intervention Act"
Severity: #warning
Expression: "entry.where(act.hasTemplateIdOf(InterventionAct))"

Invariant: should-non-med-supply
Description: "SHOULD contain Non-Medicinal Supply Activity"
Severity: #warning
Expression: "entry.where(supply.hasTemplateIdOf(NonMedicinalSupplyActivity))"

Invariant: should-nutritional-status-obs
Description: "SHOULD contain Nutritional Status Observation"
Severity: #warning
Expression: "entry.where(observation.hasTemplateIdOf(NutritionalStatusObservation))"

Invariant: should-planned-intervention-act
Description: "SHOULD contain Planned Intervention Act"
Severity: #warning
Expression: "entry.where(act.hasTemplateIdOf(PlannedInterventionAct))"

Invariant: should-post-procedure-dx
Description: "SHOULD contain Postprocedure Diagnosis"
Severity: #warning
Expression: "entry.where(act.hasTemplateIdOf(PostprocedureDiagnosis))"

Invariant: should-preop-dx
Description: "SHOULD contain Preoperative Diagnosis"
Severity: #warning
Expression: "entry.where(act.hasTemplateIdOf(PreoperativeDiagnosis))"

Invariant: should-procedure-act-procedure
Description: "SHOULD contain Procedure Activity Procedure"
Severity: #warning
Expression: "entry.where(procedure.hasTemplateIdOf(ProcedureActivityProcedure))"

Invariant: should-smoking-status
Description: "SHOULD contain Smoking Status - Meaningful Use"
Severity: #warning
Expression: "entry.where(observation.hasTemplateIdOf(SmokingStatusMeaningfulUse))"


////////////////////////////////////////////////////////////
//                                                        //
//                 Entry Requirements                     //
//                                                        //
////////////////////////////////////////////////////////////

Invariant: shall-adv-directive-organizer
Description: "If section/@nullFlavor is not present, SHALL contain at least one Advance Directive Organizer"
Severity: #error
Expression: "nullFlavor.exists() or entry.where(organizer.hasTemplateIdOf(AdvanceDirectiveOrganizer))"

Invariant: shall-allergy-concern
Description: "If section/@nullFlavor is not present, SHALL contain at least one Allergy Concern Act"
Severity: #error
Expression: "nullFlavor.exists() or entry.where(act.hasTemplateIdOf(AllergyConcernAct))"

Invariant: shall-discharge-med
Description: "If section/@nullFlavor is not present, SHALL contain at least one Discharge Medication"
Severity: #error
Expression: "nullFlavor.exists() or entry.where(act.hasTemplateIdOf(DischargeMedication))"

Invariant: shall-encounter-activity
Description: "If section/@nullFlavor is not present, SHALL contain at least one Encounter Activity"
Severity: #error
Expression: "nullFlavor.exists() or entry.where(encounter.hasTemplateIdOf(EncounterActivity))"

Invariant: shall-goal-obs
Description: "If section/@nullFlavor is not present, SHALL contain at least one Goal Observation"
Severity: #error
Expression: "nullFlavor.exists() or entry.where(observation.hasTemplateIdOf(GoalObservation))"

Invariant: shall-health-concern-act
Description: "If section/@nullFlavor is not present, SHALL contain at least one Health Concern Act"
Severity: #error
Expression: "nullFlavor.exists() or entry.where(act.hasTemplateIdOf(HealthConcernAct))"

Invariant: shall-immunization-activity
Description: "If section/@nullFlavor is not present, SHALL contain at least one Immunization Activity"
Severity: #error
Expression: "nullFlavor.exists() or entry.where(substanceAdministration.hasTemplateIdOf(ImmunizationActivity))"

Invariant: shall-instruction
Description: "If section/@nullFlavor is not present, SHALL contain at least one Instruction"
Severity: #error
Expression: "nullFlavor.exists() or entry.where(act.hasTemplateIdOf(Instruction))"

Invariant: shall-med-activity
Description: "If section/@nullFlavor is not present, SHALL contain at least one Medication Activity"
Severity: #error
Expression: "nullFlavor.exists() or entry.where(substanceAdministration.hasTemplateIdOf(MedicationActivity))"

Invariant: shall-note-activity
Description: "If section/@nullFlavor is not present, SHALL contain at least one Note Activity"
Severity: #error
Expression: "nullFlavor.exists() or entry.where(act.hasTemplateIdOf(NoteActivity))"

Invariant: shall-outcome-obs
Description: "If section/@nullFlavor is not present, SHALL contain at least one Outcome Observation"
Severity: #error
Expression: "nullFlavor.exists() or entry.where(observation.hasTemplateIdOf(OutcomeObservation))"

Invariant: shall-procedure-act-procedure
Description: "If section/@nullFlavor is not present, SHALL contain at least one Procedure Activity Procedure"
Severity: #error
Expression: "nullFlavor.exists() or entry.where(procedure.hasTemplateIdOf(ProcedureActivityProcedure))"

Invariant: shall-problem-concern-act
Description: "If section/@nullFlavor is not present, SHALL contain at least one Problem Concern Act"
Severity: #error
Expression: "nullFlavor.exists() or entry.where(act.hasTemplateIdOf(ProblemConcernAct))"

Invariant: shall-result-org
Description: "If section/@nullFlavor is not present, SHALL contain at least one Result Organizer"
Severity: #error
Expression: "nullFlavor.exists() or entry.where(organizer.hasTemplateIdOf(ResultOrganizer))"

Invariant: shall-vital-signs-org
Description: "If section/@nullFlavor is not present, SHALL contain at least one Vital Signs Organizer or Average Blood Pressure Organizer"
Severity: #error
Expression: "nullFlavor.exists() or entry.where(organizer.hasTemplateIdOf(VitalSignsOrganizer)) or entry.where(organizer.hasTemplateIdOf(AverageBloodPressureOrganizer))"