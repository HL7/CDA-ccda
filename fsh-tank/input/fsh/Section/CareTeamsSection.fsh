Profile: CareTeamsSection
Parent: $Section
Id: CareTeamsSection
Title: "Care Teams Section"
Description: """The Care Team Section is used to share historical and current Care Team information. 

The Care Team Section may be included in any type of C-CDA structured document that is an open template.

An individual can have more than one Care Team.  A Care Team can exist over time such as a longitudinal care team which includes historical members that may be active or inactive on the care team as needed. Or a Care Team, such as a rehabilitation team, may exist to address a person's needs associated with a particular care event, or a team can be based on addressing a specific condition. 

The Care Team Organizer entry template used in the C-CDA Care Teams Section is meant to support the foundation of effective communication, interaction channels and maintenance of current clinical context awareness for the patient, caregivers and care providers to promote care coordination. 

"""
* insert LogicalModelNA
* ^identifier.value = "urn:hl7ii:2.16.840.1.113883.10.20.22.2.500:2022-06-01"
* ^version = "2022-06-01"
* templateId ^slicing.discriminator[0].type = #value
  * ^slicing.discriminator[=].path = "root"
  * ^slicing.discriminator[+].type = #value
  * ^slicing.discriminator[=].path = "extension"
  * ^slicing.rules = #open
  * ^comment = "SHALL contain exactly one [1..1] templateId (CONF:4515-3) such that it"
* templateId contains primary 1..1
* templateId[primary] ^short = "templateId"
  * ^comment = "SHALL contain exactly one [1..1] templateId (CONF:4515-3) such that it"
  * root 1..1
  * root = "2.16.840.1.113883.10.20.22.2.500"
    * ^comment = "SHALL contain exactly one [1..1] @root=\"2.16.840.1.113883.10.20.22.2.500\" (CONF:4515-7)."
  * extension 1..1
  * extension = "2022-06-01"
    * ^comment = "SHALL contain exactly one [1..1] @extension=\"2022-06-01\" (CONF:4515-8)."
* code 1..1
  * ^comment = "SHALL contain exactly one [1..1] code (CONF:4515-5) such that it"
  * code 1..1
  * code = #85847-2
    * ^comment = "SHALL contain exactly one [1..1] @code=\"85847-2\" Patient Care team information (CodeSystem: LOINC urn:oid:2.16.840.1.113883.6.1) (CONF:4515-9)."
  * codeSystem 1..1
  * codeSystem = "2.16.840.1.113883.6.1"
    * ^comment = "SHALL contain exactly one [1..1] @codeSystem=\"2.16.840.1.113883.6.1\" (CodeSystem: LOINC urn:oid:2.16.840.1.113883.6.1) (CONF:4515-10)."
* title 1..1
  * ^comment = "SHALL contain exactly one [1..1] title (CONF:4515-4)."
* text 1..1
  * ^comment = "SHALL contain exactly one [1..1] text (CONF:4515-6)."
* entry ^slicing.discriminator[0].type = #value
  * ^slicing.discriminator[=].path = "organizer"
  * ^slicing.rules = #open
  * ^comment = "SHOULD contain zero or more [0..*] entry (CONF:4515-1) such that it"
* entry contains primary 0..*
* entry[primary] ^short = "entry"
  * ^comment = "SHOULD contain zero or more [0..*] entry (CONF:4515-1) such that it"
  * organizer 1..1
  * organizer only CareTeamOrganizer
    * ^comment = "SHALL contain exactly one [1..1] Care Team Organizer (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.4.500:2022-06-01) (CONF:4515-159)."