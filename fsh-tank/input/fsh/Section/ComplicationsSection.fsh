Profile: ComplicationsSection
Parent: $Section
Id: ComplicationsSection
Title: "Complications Section"
Description: "This section contains problems that occurred during or around the time of a procedure. The complications may be known risks or unanticipated problems."

* insert Section(#55109-3, Complications, 2.16.840.1.113883.10.20.22.2.37, 2015-08-01)
* entry ^slicing.discriminator[0].type = #profile
  * ^slicing.discriminator[=].path = "observation"
  * ^slicing.rules = #open
* entry contains problem 0..*
* entry[problem] ^comment = "MAY contain zero or more [0..*] entry (CONF:1198-8795) such that it"
  * observation 1..1
  * observation only ProblemObservation
    * ^short = "When no coded entries or negation of entries are present, narrative section/text will be provided containing details of the complication(s) or that there were no complications."
    * ^comment = "SHALL contain exactly one [1..1] Problem Observation (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.4.4:2015-08-01) (CONF:1198-15455)."