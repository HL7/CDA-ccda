Profile: AssessmentSection
Parent: $Section
Id: AssessmentSection
Title: "Assessment Section"
Description: """The Assessment Section (also referred to as \"impression\" or \"diagnoses\" outside of the context of CDA) represents the clinician's conclusions and working assumptions that will guide treatment of the patient. The assessment may be a list of specific disease entities or a narrative block.

Wrapping the text of this section in a Note Activity will support ingestion.
"""
* insert OldSection(#51848-0, Evaluation note, 2.16.840.1.113883.10.20.22.2.8)

* entry 
  * ^slicing.discriminator[0].type = #profile
  * ^slicing.discriminator[=].path = "act"
  * ^slicing.rules = #open
* entry contains notes 0..*
* entry[notes] ^comment = "MAY contain zero or more [0..*] entry such that it"
  * act 1..1
  * act only NoteActivity
    * ^comment = "SHALL contain exactly one [1..1] Notes Activity (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.4.202,2016-11-01)."
