Profile: ProceduresSection
Parent: $Section
Id: ProceduresSection
Title: "Procedures Section"
Description: "This section describes all interventional, surgical, diagnostic, or therapeutic procedures or treatments pertinent to the patient historically at the time the document is generated. The section should include notable procedures, but can contain all procedures for the period of time being summarized. The common notion of \"procedure\" is broader than that specified by the HL7 Version 3 Reference Information Model (RIM), therefore this section contains procedure templates represented with three RIM classes: Act, Observation, and Procedure. Procedure Activity Procedure is for procedures that alter the physical condition of a patient (e.g., splenectomy)."
* insert LogicalModelNA
* ^identifier.value = "urn:hl7ii:2.16.840.1.113883.10.20.22.2.7.1:2014-06-09"
* ^version = "2014-06-09"
* nullFlavor ^short = "If a required section contains no information, the @nullFlavor MAY be set to NI"
* templateId 2..
  * ^slicing.discriminator[0].type = #value
  * ^slicing.discriminator[=].path = "root"
  * ^slicing.discriminator[+].type = #value
  * ^slicing.discriminator[=].path = "extension"
  * ^slicing.rules = #open
* templateId contains secondary 1..1
* templateId[secondary] ^comment = "SHALL contain exactly one [1..1] templateId (CONF:1098-7891) such that it"
  * root 1..1
  * root = "2.16.840.1.113883.10.20.22.2.7.1"
    * ^comment = "SHALL contain exactly one [1..1] @root=\"2.16.840.1.113883.10.20.22.2.7.1\" (CONF:1098-10447)."
  * extension 1..1
  * extension = "2014-06-09"
    * ^comment = "SHALL contain exactly one [1..1] @extension=\"2014-06-09\" (CONF:1098-32533)."
* code 1..1
  * ^comment = "SHALL contain exactly one [1..1] code (CONF:1098-15425)."
  * code 1..1
  * code = #47519-4
    * ^comment = "This code SHALL contain exactly one [1..1] @code=\"47519-4\" History of Procedures (CONF:1098-15426)."
  * codeSystem 1..1
  * codeSystem = "2.16.840.1.113883.6.1"
    * ^comment = "This code SHALL contain exactly one [1..1] @codeSystem=\"2.16.840.1.113883.6.1\" (CodeSystem: LOINC urn:oid:2.16.840.1.113883.6.1) (CONF:1098-31138)."
* title 1..1
  * ^comment = "SHALL contain exactly one [1..1] title (CONF:1098-7893)."
* text 1..1
  * ^comment = "SHALL contain exactly one [1..1] text (CONF:1098-7894)."
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