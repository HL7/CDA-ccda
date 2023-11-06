Profile: AdvanceDirectivesSection
Parent: $Section
Id: AdvanceDirectivesSection
Title: "Advance Directives Section"
Description: """This section contains information describing the patient’s advance directives. The description includes the kind of advance directive source documents and the type of advance directive content included in each kind of advance directive source document. The section includes information about who verified the content available in each advance directive source document, if applicable. It also includes information about who was the acting healthcare agent, if someone was acting on behalf of the patient during the encounter or during certain periods of time during the provision of care covered by the document. It provides references to the supporting documentation, including all kinds of advance directive source documents.

Treatment Preferences, Care Experience Preferences and Personal Health Goals considered relevant by the organization rendering care services to the patient's care during the encompassing encounter or considered relevant to the patient's care plan SHALL be included in the Advance Directives Section as documented by the patient or consented by the patient or the patient's healthcare agent. 

If a person has appointed healthcare agent(s), the Advance Directive Section SHALL include the current healthcare agent(s) information. and a reference to the external document which contains the healthcare agent appointment decisions. If a person has documented treatment preferences under certain health scenarios, the Advance Directive Section SHALL include information about who has reviewed and verified that documentation, and a reference to the external document which was reviewed. 

This section differentiates between an "advance care plan document" and an “advance care plan order.” It also distinguishes an advance directive that is a consent. Information in this section includes information about the person’s current/relevant goals and preferences, advance directive orders, or advance directive consents.
"""
* nullFlavor ^short = "If a required section contains no information, the @nullFlavor MAY be set to NI"

* insert Section(#42348-3, Advance Directives, 2.16.840.1.113883.10.20.22.2.21.1, 2022-02-14)
* entry 1..*
  * ^slicing.discriminator[0].type = #profile
  * ^slicing.discriminator[=].path = "observation"
  * ^slicing.discriminator[+].type = #profile
  * ^slicing.discriminator[=].path = "organizer"
  * ^slicing.rules = #open
  * ^short = "If section/@nullFlavor is not present SHALL contain an Advance Directive Observation OR an Advance Directive Organizer (NEW):"
  * ^comment = "SHALL contain at least one [1..*] entry (CONF:1198-30235) such that it"
* entry contains
    observation 0..* and
    organizer 1..*
* entry[organizer] ^comment = "SHALL contain one or more [1.*] entry such that it"
  * organizer 1..1
  * organizer only AdvanceDirectiveOrganizer
    * ^comment = "SHALL contain exactly one [1..1] Advance Directive Organizer (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.4.108:2022-02-14)."
* entry[observation] ^comment = "MAY contain zero or more [0..*] entry such that it"
  * observation 1..1
  * observation only AdvanceDirectiveObservation
    * ^comment = "SHALL contain exactly one [1..1] Advance Directive Observation (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.4.48:2022-02-14) (CONF:1198-15443)."
