Profile: ProceduresSection
Parent: $Section
Id: ProceduresSection
Title: "Procedures Section"
Description: "This section describes all interventional, surgical, diagnostic, or therapeutic procedures or treatments pertinent to the patient historically at the time the document is generated. The section should include notable procedures, but can contain all procedures for the period of time being summarized. The common notion of \"procedure\" is broader than that specified by the HL7 Version 3 Reference Information Model (RIM), therefore this section contains procedure templates represented with three RIM classes: Act, Observation, and Procedure. Procedure Activity Procedure is for procedures that alter the physical condition of a patient (e.g., splenectomy)."
* nullFlavor ^short = "If a required section contains no information, the @nullFlavor MAY be set to NI"

* insert Section(#47519-4, History of Procedures, 2.16.840.1.113883.10.20.22.2.7.1, 2014-06-09)
* entry 1..*
  * ^slicing.discriminator[0].type = #profile
  * ^slicing.discriminator[=].path = "observation"
  * ^slicing.rules = #open
  * ^short = "If section/@nullFlavor is not present there SHALL be at least one entry conformant to Procedure Activity Procedure (templateId: 2.16.840.1.113883.10.20.22.4.14:2014-06-09)"
  * ^comment = "SHALL contain at least one [1..*] entry (CONF:1098-7895) such that it"
* entry contains entryProcedure 0..*
* entry[entryProcedure] ^comment = "SHALL contain exactly one [1..1] Procedure Activity Procedure (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.4.14:2014-06-09) (CONF:1098-15509)."
  * procedure 1..1
  * procedure only ProcedureActivityProcedure