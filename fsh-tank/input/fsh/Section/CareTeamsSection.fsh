Profile: CareTeamsSection
Parent: $Section
Id: CareTeamsSection
Title: "Care Teams Section"
Description: """The Care Teams Section is used to share historical and current Care Team information. 

The Care Team Section may be included in any type of C-CDA structured document that is an open template.

An individual can have more than one Care Team.  A Care Team can exist over time such as a longitudinal care team which includes historical members that may be active or inactive on the care team as needed. Or a Care Team, such as a rehabilitation team, may exist to address a person's needs associated with a particular care event, or a team can be based on addressing a specific condition. 

The Care Team Organizer entry template used in the C-CDA Care Teams Section is meant to support the foundation of effective communication, interaction channels and maintenance of current clinical context awareness for the patient, caregivers and care providers to promote care coordination. 

"""

* insert Section(#85847-2, Patient Care team information, 2.16.840.1.113883.10.20.22.2.500, 2022-06-01)
* entry ^slicing.discriminator[0].type = #profile
  * ^slicing.discriminator[=].path = "organizer"
  * ^slicing.rules = #open
  * ^comment = "SHOULD contain zero or more [0..*] entry (CONF:4515-1) such that it"
* entry contains primary 0..*
* entry[primary] ^short = "entry"
  * ^condition = "should-care-team-org"
  * ^comment = "SHOULD contain zero or more [0..*] entry (CONF:4515-1) such that it"
  * organizer 1..1
  * organizer only CareTeamOrganizer
    * ^comment = "SHALL contain exactly one [1..1] Care Team Organizer (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.4.500:2022-06-01) (CONF:4515-159)."
* obeys should-care-team-org