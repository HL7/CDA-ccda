Profile: AssessmentandPlanSection
Parent: $Section
Id: AssessmentandPlanSection
Title: "Assessment and Plan Section"
Description: """This section represents the clinician's conclusions and working assumptions that will guide treatment of the patient. The Assessment and Plan Section may be combined or separated to meet local policy requirements.

See also the Assessment Section: templateId 2.16.840.1.113883.10.20.22.2.8 and Plan of Treatment Section: templateId 2.16.840.1.113883.10.20.22.2.10:2014-06-09"""

* insert Section(#51847-2, Assessment and Plan, 2.16.840.1.113883.10.20.22.2.9, 2014-06-09)
* entry ^slicing.discriminator[0].type = #profile
  * ^slicing.discriminator[=].path = "act"
  * ^slicing.rules = #open
* entry contains plannedAct 0..*
* entry[plannedAct] ^comment = "MAY contain zero or more [0..*] entry (CONF:1098-7708) such that it"
  * act 1..1
  * act only PlannedAct
    * ^comment = "SHALL contain exactly one [1..1] Planned Act (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.4.39:2014-06-09) (CONF:1098-15448)."
* obeys no-a-p

Invariant: no-a-p
Description: "When using this section, the Assessment Section and the Plan of Treatment Section SHALL NOT be used."
Severity: #error
Expression: "%resource.component.structuredBody.component.where(section.hasTemplateIdOf(AssessmentSection) or section.hasTemplateIdOf(PlanofTreatmentSection)).empty()"