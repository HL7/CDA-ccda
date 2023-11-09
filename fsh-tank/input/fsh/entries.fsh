////////////////////////////////////////////////////////////
//                                                        //
//           Entry Requirements  - SHOULD                 //
//                                                        //
////////////////////////////////////////////////////////////

// Basically all identical; copy, paste, change
// Apply at top-level of section

Invariant: should-admission-medication
Description: "SHOULD contain Admission Medication"
Severity: #warning
Expression: "entry.where(act.hasTemplateIdOf(AdmissionMedication))"

Invariant: should-care-team-org
Description: "SHOULD contain Care Team Organizer"
Severity: #warning
Expression: "entry.where(act.hasTemplateIdOf(CareTeamOrganizer))"

Invariant: should-coverage-activity
Description: "SHOULD contain Coverage Activity"
Severity: #warning
Expression: "entry.where(act.hasTemplateIdOf(CoverageActivity))"

Invariant: should-health-status-obs
Description: "SHOULD contain Health Status Observation"
Severity: #warning
Expression: "entry.where(act.hasTemplateIdOf(HealthStatusObservation))"

Invariant: should-intervention-act
Description: "SHOULD contain Intervention Act"
Severity: #warning
Expression: "entry.where(act.hasTemplateIdOf(InterventionAct))"

Invariant: should-non-med-supply
Description: "SHOULD contain Non-Medicinal Supply Activity"
Severity: #warning
Expression: "entry.where(act.hasTemplateIdOf(NonMedicinalSupplyActivity))"

Invariant: should-nutritional-status-obs
Description: "SHOULD contain Nutritional Status Observation"
Severity: #warning
Expression: "entry.where(act.hasTemplateIdOf(NutritionalStatusObservation))"

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
Expression: "entry.where(act.hasTemplateIdOf(ProcedureActivityProcedure))"

Invariant: should-smoking-status
Description: "SHOULD contain Smoking Status - Meaningful Use"
Severity: #warning
Expression: "entry.where(act.hasTemplateIdOf(SmokingStatusMeaningfulUse))"


////////////////////////////////////////////////////////////
//                                                        //
//                 Entry Requirements                     //
//                                                        //
////////////////////////////////////////////////////////////

Invariant: shall-adv-directive-organizer
Description: "SHALL contain at least one Advance Directive Organizer"
Severity: #error
Expression: "nullFlavor.exists() or entry.where(act.hasTemplateIdOf(AdvanceDirectiveOrganizer))"

Invariant: shall-allergy-concern
Description: "SHALL contain at least one Advance Directive Organizer"
Severity: #error
Expression: "nullFlavor.exists() or entry.where(act.hasTemplateIdOf(AllergyConcernAct))"

Invariant: shall-discharge-med
Description: "SHALL contain at least one Discharge Medication"
Severity: #error
Expression: "nullFlavor.exists() or entry.where(act.hasTemplateIdOf(DischargeMedication))"

Invariant: shall-encounter-activity
Description: "SHALL contain at least one Encounter Activity"
Severity: #error
Expression: "nullFlavor.exists() or entry.where(act.hasTemplateIdOf(EncounterActivity))"

Invariant: shall-goal-obs
Description: "SHALL contain at least one Goal Observation"
Severity: #error
Expression: "nullFlavor.exists() or entry.where(act.hasTemplateIdOf(GoalObservation))"

Invariant: shall-health-concern-act
Description: "SHALL contain at least one Health Concern Act"
Severity: #error
Expression: "nullFlavor.exists() or entry.where(act.hasTemplateIdOf(HealthConcernAct))"

Invariant: shall-immunization-activity
Description: "SHALL contain at least one Immunization Activity"
Severity: #error
Expression: "nullFlavor.exists() or entry.where(act.hasTemplateIdOf(ImmunizationActivity))"

Invariant: shall-instruction
Description: "SHALL contain at least one Instruction"
Severity: #error
Expression: "nullFlavor.exists() or entry.where(act.hasTemplateIdOf(Instruction))"

Invariant: shall-med-activity
Description: "SHALL contain at least one Medication Activity"
Severity: #error
Expression: "nullFlavor.exists() or entry.where(act.hasTemplateIdOf(MedicationActivity))"

Invariant: shall-note-activity
Description: "SHALL contain at least one Note Activity"
Severity: #error
Expression: "nullFlavor.exists() or entry.where(act.hasTemplateIdOf(NoteActivity))"

Invariant: shall-outcome-obs
Description: "SHALL contain at least one Outcome Observation"
Severity: #error
Expression: "nullFlavor.exists() or entry.where(act.hasTemplateIdOf(OutcomeObservation))"

Invariant: shall-procedure-act-procedure
Description: "SHALL contain at least one Procedure Activity Procedure"
Severity: #error
Expression: "nullFlavor.exists() or entry.where(act.hasTemplateIdOf(ProcedureActivityProcedure))"

Invariant: shall-problem-concern-act
Description: "SHALL contain at least one Problem Concern Act"
Severity: #error
Expression: "nullFlavor.exists() or entry.where(act.hasTemplateIdOf(ProblemConcernAct))"

Invariant: shall-result-org
Description: "SHALL contain at least one Result Organizer"
Severity: #error
Expression: "nullFlavor.exists() or entry.where(act.hasTemplateIdOf(ResultOrganizer))"

Invariant: shall-vital-signs-org
Description: "SHALL contain at least one Vital Signs Organizer"
Severity: #error
Expression: "nullFlavor.exists() or entry.where(act.hasTemplateIdOf(VitalSignsOrganizer))"