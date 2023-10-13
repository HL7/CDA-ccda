Profile: ProcedureIndicationsSection
Parent: $Section
Id: ProcedureIndicationsSection
Title: "Procedure Indications Section"
Description: "This section contains the reason(s) for the procedure or surgery. This section may include the preprocedure diagnoses as well as symptoms contributing to the reason for the procedure."

* insert Section(#59768-2, Procedure Indications , 2.16.840.1.113883.10.20.22.2.29, 2014-06-09)
* entry ^slicing.discriminator[0].type = #value
  * ^slicing.discriminator[=].path = "observation"
  * ^slicing.rules = #open
* entry contains indication 0..*
* entry[indication] ^comment = "MAY contain zero or more [0..*] entry (CONF:1098-8743) such that it"
  * observation 1..1
  * observation only Indication
    * ^comment = "SHALL contain exactly one [1..1] Indication (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.4.19:2014-06-09) (CONF:1098-15508)."