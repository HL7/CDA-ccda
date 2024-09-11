Profile: NotesSection
Parent: $Section
Id: NotesSection
Title: "Notes Section"
Description: """The Notes Section allow for inclusion of clinical documentation which does not fit precisely within any other C-CDA section. Multiple Notes sections may be included in a document provided they each include different types of note content as indicated by a different section.code.
The Notes Section SHOULD NOT be used in place of a more specific C-CDA section. For example, notes about procedure should be placed within the Procedures Section, not a Notes Section.
When a Notes Section is present, Note Activity entries contain structured information about the note information allowing it to be more machine processable. 
"""

* insert _SectionNoCode(2.16.840.1.113883.10.20.22.2.65, 2016-11-01)

* title ^short = "This title should reflect the kind of notes included in this section, corresponding to the code."
* text ^short = """The narrative SHOULD contain human-readable representations using standard CDA narrative markup of each note to ensure widest compatibility with receivers.

While allowed by CDA, the use of renderMultiMedia elements, which contain a referencedObject attribute pointing to an observationMedia or regionOfInterest element in the discrete entries, is discouraged in Note Sections because rendering support for these elements is not widespread."""

* code 1..1
* code from $2.16.840.1.113883.11.20.9.68 (preferred)
  * ^comment = "SHALL contain exactly one [1..1] code, which SHOULD be selected from ValueSet Note Types urn:oid:2.16.840.1.113883.11.20.9.68 DYNAMIC (CONF:3250-16892)."

* entry ^slicing.discriminator[0].type = #profile
  * ^slicing.discriminator[=].path = "act"
  * ^slicing.rules = #open
  * ^comment = "SHALL contain at least one [1..*] entry (CONF:3250-16904) such that it"
* entry contains note 0..*
* entry[note] ^short = "If section/@nullFlavor is not present:"
  * ^comment = "SHALL contain at least one [1..*] entry (CONF:3250-16904) such that it"
  * act 1..1
  * act only NoteActivity
    * ^comment = "SHALL contain exactly one [1..1] Note Activity (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.4.202:2016-11-01) (CONF:3250-16905)."
* obeys shall-note-activity