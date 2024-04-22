Profile: HealthStatusEvaluationsandOutcomesSection
Parent: $Section
Id: HealthStatusEvaluationsandOutcomesSection
Title: "Health Status Evaluations and Outcomes Section"
Description: "This template represents observations regarding the evaluation or assessment of the patient, and the outcome of care from the interventions used to treat the patient. These observations represent status information, at points in time, related to established goals or related to new care plan goals and/or interventions."
* nullFlavor ^short = "If a required section contains no information, the @nullFlavor MAY be set to NI"
* insert OldSection(#11383-7, Patient problem outcome Narrative, 2.16.840.1.113883.10.20.22.2.61)

* entry ^slicing.discriminator.type = #profile
  * ^slicing.discriminator.path = "observation"
  * ^slicing.rules = #open
  * ^short = "If section/@nullFlavor is not present:"
* entry contains outcome 0..*
* entry[outcome] ^comment = "SHALL contain at least one [1..*] entry (CONF:1098-31227) such that it"
  * observation 1..1
  * observation only OutcomeObservation
    * ^comment = "SHALL contain exactly one [1..1] Outcome Observation (identifier: urn:oid:2.16.840.1.113883.10.20.22.4.144) (CONF:1098-31228)."
* obeys shall-outcome-obs