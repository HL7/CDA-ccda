Profile: PlannedProcedureSection
Parent: $Section
Id: PlannedProcedureSection
Title: "Planned Procedure Section"
Description: "This section contains the procedure(s) that a clinician planned based on the preoperative assessment."

* insert Section(#59772-4, Planned Procedure, 2.16.840.1.113883.10.20.22.2.30, 2014-06-09)
* entry ^slicing.discriminator[0].type = #profile
  * ^slicing.discriminator[=].path = "procedure"
  * ^slicing.rules = #open
* entry contains plannedProcedure 0..*
* entry[plannedProcedure] ^comment = "MAY contain zero or more [0..*] entry (CONF:1098-8744) such that it"
  * procedure 1..1
  * procedure only PlannedProcedure
    * ^comment = "SHALL contain exactly one [1..1] Planned Procedure (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.4.41:2014-06-09) (CONF:1098-15502)."