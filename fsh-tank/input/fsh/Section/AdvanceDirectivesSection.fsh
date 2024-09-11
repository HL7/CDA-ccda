Profile: AdvanceDirectivesSection
Parent: $Section
Id: AdvanceDirectivesSection
Title: "Advance Directives Section"
Description: """This section contains information describing the patient’s advance healthcare directives.  It provides references to the supporting documentation, including all kinds of advance directive source document types (e.g., Living Will, Healthcare Power of Attorney, Personal Advance Care Plan, DNR Order, Portable Medical Order).

Information about each advance healthcare directive document is contained in a separate Advance Directive Organizer. The organizer describes the type of advance healthcare directive document and supplies a reference identifier for that document. It also may include a summary of relevant types of advance directive content available in the document with provenance information explaining who authored the information and who verified it with the patient or healthcare agent.

An observation made by a clinician or practitioner regarding a patient’s DNR Status based on referenced documentation or regarding another type of order placed in the local EHR based on advance healthcare directives is contained in a distinct Advance Directive Observation (one that is not used in the context of an Advance Directive Organizer."""

* nullFlavor ^short = "If a required section contains no information, the @nullFlavor MAY be set to NI"

* insert Section(#42348-3, Advance directives, 2.16.840.1.113883.10.20.22.2.21.1, 2022-02-14)
* entry 0..*
  * ^slicing.discriminator[0].type = #profile
  * ^slicing.discriminator[=].path = "observation"
  * ^slicing.discriminator[+].type = #profile
  * ^slicing.discriminator[=].path = "organizer"
  * ^slicing.rules = #open
  * ^comment = "SHALL contain at least one [1..*] entry (CONF:1198-30235) such that it"
* entry contains
    observation 0..* and
    organizer 0..*
* entry[organizer] ^comment = "SHALL contain one or more [1.*] entry such that it"
  * organizer 1..1
  * organizer only AdvanceDirectiveOrganizer
    * ^comment = "SHALL contain exactly one [1..1] Advance Directive Organizer (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.4.108:2022-02-14)."
* entry[observation] ^comment = "MAY contain zero or more [0..*] entry such that it"
  * observation 1..1
  * observation only AdvanceDirectiveObservation
    * ^comment = "SHALL contain exactly one [1..1] Advance Directive Observation (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.4.48:2022-02-14) (CONF:1198-15443)."
* obeys shall-adv-directive-organizer
