////////////////////////////////////////////////////////////
//                                                        //
//           Entry Requirements  - SHOULD                 //
//                                                        //
////////////////////////////////////////////////////////////

// Basically all identical; copy, paste, change
// Apply at top-level of section

Invariant: should-intervention-act
Description: "SHOULD contain Intervention Act"
Severity: #warning
Expression: "entry.where(act.hasTemplateIdOf(InterventionAct))"

Invariant: should-admission-medication
Description: "SHOULD contain Admission Medication"
Severity: #warning
Expression: "entry.where(act.hasTemplateIdOf(AdmissionMedication))"

Invariant: should-planned-intervention-act
Description: "SHOULD contain Planned Intervention Act"
Severity: #warning
Expression: "entry.where(act.hasTemplateIdOf(PlannedInterventionAct))"


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