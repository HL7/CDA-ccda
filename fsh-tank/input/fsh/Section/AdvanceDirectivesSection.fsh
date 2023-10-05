Profile: AdvanceDirectivesSection
Parent: $Section
Id: AdvanceDirectivesSection
Title: "Advance Directives Section"
Description: """This section contains data defining the patient's advance directives and any reference to supporting documentation, including living wills, healthcare proxies, and CPR and resuscitation status. If the referenced documents are available, they can be included in the exchange package. 

The most recent directives are required, if known, and should be listed in as much detail as possible. 

This section differentiates between "advance directives" and "advance directive documents". The former is the directions to be followed whereas the latter refers to a legal document containing those directions.
"""
* nullFlavor ^short = "If a required section contains no information, the @nullFlavor MAY be set to NI"

* insert Section(#42348-3, Advance Directives, 2.16.840.1.113883.10.20.22.2.21.1, 2015-08-01)
* entry 1..*
  * obeys 1198-32881
  * ^slicing.discriminator[0].type = #exists
  * ^slicing.discriminator[=].path = "*"
  * ^slicing.rules = #open
  * ^short = "If section/@nullFlavor is not present SHALL contain an Advance Directive Observation OR an Advance Directive Organizer (NEW):"
  * ^comment = "SHALL contain at least one [1..*] entry (CONF:1198-30235) such that it"
* entry contains
    observation 0..* and
    organizer 0..*
* entry[observation] ^comment = "MAY contain zero or more [0..*] entry (CONF:1198-7957) such that it"
  * observation 1..1
  * observation only AdvanceDirectiveObservation
    * ^comment = "SHALL contain exactly one [1..1] Advance Directive Observation (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.4.48:2015-08-01) (CONF:1198-15443)."
* entry[organizer] ^comment = "MAY contain zero or more [0..*] entry (CONF:1198-32891) such that it"
  * organizer 1..1
  * organizer only AdvanceDirectiveOrganizer
    * ^comment = "SHALL contain exactly one [1..1] Advance Directive Organizer (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.4.108:2015-08-01) (CONF:1198-32892)."

Invariant: 1198-32881
Description: "This entry **SHALL** contain *EITHER* an Advance Directive Observation *OR* an Advance Directive Organizer (CONF:1198-32881)."
Severity: #error