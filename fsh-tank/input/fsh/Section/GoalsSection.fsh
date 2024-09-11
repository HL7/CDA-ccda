Profile: GoalsSection
Parent: $Section
Id: GoalsSection
Title: "Goals Section"
Description: "This template represents patient Goals. A goal is a defined outcome or condition to be achieved in the process of patient care. Goals include patient-defined over-arching goals (e.g., alleviation of health concerns, desired/intended positive outcomes from interventions, longevity, function, symptom management, comfort) and health concern-specific or intervention-specific goals to achieve desired outcomes."
* nullFlavor ^short = "If a required section contains no information, the @nullFlavor MAY be set to NI"
* insert OldSection(#61146-7, Goals Narrative, 2.16.840.1.113883.10.20.22.2.60)

* entry ^slicing.discriminator.type = #profile
  * ^slicing.discriminator.path = "observation"
  * ^slicing.rules = #open
  * ^short = "If section/@nullFlavor is not present:"
* entry contains goal 0..*
* entry[goal] ^comment = "SHALL contain at least one [1..*] entry (CONF:1098-30719) such that it"
  * observation 1..1
  * observation only GoalObservation
    * ^comment = "SHALL contain exactly one [1..1] Goal Observation (identifier: urn:oid:2.16.840.1.113883.10.20.22.4.121) (CONF:1098-30720)."
* obeys shall-goal-obs