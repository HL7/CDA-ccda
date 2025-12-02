Profile: AdvanceDirectivesSection
Parent: $Section
Id: AdvanceDirectivesSection
Title: "Advance Directives Section"
Description: """This section contains details about the patient’s advance healthcare directives, including references to supporting documents such as Living Wills, Healthcare Power of Attorney, Personal Advance Care Plans, DNR Orders, and Portable Medical Orders. Each type of advance directive document is represented by an individual Advance Directive Observation within a single Advance Directive Existence Observation. Each Advance Directive Observation specifies the type of advance directive and provides a unique reference for the document. Additionally, the Advance Directive Observation may include information about the document’s author and any individuals who verified the information with the patient or their healthcare agent."""

* nullFlavor ^short = "If a required section contains no information, the @nullFlavor MAY be set to NI"

* insert Section(#42348-3, Advance directives, 2.16.840.1.113883.10.20.22.2.21.1, 2022-02-14)
* entry 0..*
  * ^slicing.discriminator[0].type = #profile
  * ^slicing.discriminator[=].path = "observation"
  * ^slicing.discriminator[+].type = #profile
  * ^slicing.discriminator[=].path = "organizer"
  * ^slicing.rules = #open
  * ^comment = "SHALL contain at least one [1..*] entry (CONF:1198-30235) such that it"
* entry contains AdvDirExistanceObservation 0..*
* entry[AdvDirExistanceObservation] ^comment = "MAY contain zero or more [0..*] entry such that it"
  * ^condition = "shall-adv-directive-existence"
  * observation 1..1
  * observation only AdvanceDirectiveExistenceObservation
    * ^comment = "SHALL contain exactly one [1..1] Advance Directive Existence Observation (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.4.513:2025-05-01)."
    * insert USCDI([[Advance Directive Existence Observation]])
* obeys shall-adv-directive-existence