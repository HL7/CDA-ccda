Profile: ProcedureFindingsSection
Parent: $Section
Id: ProcedureFindingsSection
Title: "Procedure Findings Section"
Description: "The Procedure Findings Section records clinically significant observations confirmed or discovered during a procedure or surgery."

* insert Section(#59776-5, Procedure findings Narrative, 2.16.840.1.113883.10.20.22.2.28, 2015-08-01)
* entry ^slicing.discriminator[0].type = #profile
  * ^slicing.discriminator[=].path = "observation"
  * ^slicing.rules = #open
* entry contains problem 0..*
* entry[problem] ^comment = "MAY contain zero or more [0..*] entry (CONF:1198-8090) such that it"
  * observation 1..1
  * observation only ProblemObservation
    * ^comment = "SHALL contain exactly one [1..1] Problem Observation (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.4.4:2015-08-01) (CONF:1198-15507)."