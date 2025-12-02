Profile: ProceduresSection
Parent: $Section
Id: ProceduresSection
Title: "Procedures Section"
Description: """This section describes all historical or current interventional, surgical, diagnostic, or therapeutic procedures or treatments pertinent to the patient at the time the document is generated. The section should include notable procedures, but can contain all procedures for the period of time being summarized.

Subsections MAY be used to partition the entries into different categories. For example, a subsection with the Loinc code of 18748-4 (Diagnostic Imaging) MAY be used to group DI procedures. Similarly 11502-2 (Clinical Laboratory) MAY be used to group laboratory procedures."""

* nullFlavor ^short = "If a required section contains no information, the @nullFlavor MAY be set to NI"

* insert Section(#47519-4, History of Procedures Document, 2.16.840.1.113883.10.20.22.2.7.1, 2014-06-09)
* entry 0..*
  * ^slicing.discriminator[0].type = #profile
  * ^slicing.discriminator[=].path = "procedure"
  * ^slicing.rules = #open
  * ^short = "If section/@nullFlavor is not present there SHALL be at least one entry conformant to Procedure Activity Procedure (templateId: 2.16.840.1.113883.10.20.22.4.14:2014-06-09)"
  * ^comment = "SHALL contain at least one [1..*] entry (CONF:1098-7895) such that it"
* entry contains entryProcedure 0..*
* entry[entryProcedure] ^comment = "SHALL contain exactly one [1..1] Procedure Activity Procedure (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.4.14:2014-06-09) (CONF:1098-15509)."
  * ^condition = "shall-procedure-act-procedure"
  * procedure 1..1
  * procedure only ProcedureActivityProcedure
* obeys shall-procedure-act-procedure