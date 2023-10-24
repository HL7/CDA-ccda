Profile: NoteActivity
Parent: $Act
Id: NoteActivity
Title: "Note Activity"
Description: """The Note Activity represents a clinical note. Notes require authorship, authentication, timing information, and references to other discrete data such as encounters. Similar to the Comment Activity, the Note Activity permits a more specific code to characterize the type of information available in the note. The Note Activity template SHOULD NOT be used in place of a more specific C-CDA entry. Note information included needs to be relevant and pertinent to the information being communicated in the document.
When the note information augments data represented in a more specific entry template, the Note Activity can be used in an entryRelationship to the associated standard C-CDA entry. For example, a Procedure Note added as an entryRelationship to a Procedure Activity Procedure entry). 
The Note Activity template can be used as a standalone entry within a standard C-CDA section (e.g., a note about various procedures which have occurred during a visit as an entry in the Procedures Section) when it does not augment another standard entry. It may also be used to provide additional data about the source of a currently narrative-only section, such as Hospital Course.
Finally, if the type of data in the note is not known or no single C-CDA section is appropriate enough, the Note Activity should be placed in a Notes Section. (e.g., a free-text consultation note or a note which includes subjective, objective, assessment, and plan information combined).
An alternative is to place the Note Activity as an entryRelationship to an Encounter Activity entry in the Encounters Section, but implementers may wish to group notes categorically into a separate location in CDA documents rather than overloading the Encounters Section."""
* ^meta.versionId = "4"
* ^meta.lastUpdated = "2023-07-11T23:41:34.630Z"

* insert LogicalModelTemplate(note-activity, 2.16.840.1.113883.10.20.22.4.202, 2016-11-01)

* classCode 1..1
* classCode = #ACT (exactly)
  * ^comment = "SHALL contain exactly one [1..1] @classCode=\"ACT\" Act (CONF:3250-16899)."
* moodCode 1..1
* moodCode = #EVN (exactly)
  * ^comment = "SHALL contain exactly one [1..1] @moodCode=\"EVN\" Event (CONF:3250-16900)."
* code 1..1
  * ^comment = "SHALL contain exactly one [1..1] code (CONF:3250-16895)."
  * code 1..1
  * code = #34109-9
    * ^comment = "This code SHALL contain exactly one [1..1] @code=\"34109-9\" Note (CodeSystem: LOINC urn:oid:2.16.840.1.113883.6.1) (CONF:3250-16940)."
  * codeSystem 1..1
  * codeSystem = "2.16.840.1.113883.6.1"
    * ^comment = "This code SHALL contain exactly one [1..1] @codeSystem=\"2.16.840.1.113883.6.1\" LOINC (CONF:3250-16941)."
  * translation 0..*
  * translation from $2.16.840.1.113883.11.20.9.68 (preferred)
    * ^short = "If the Note Activity is within a narrative-only section (e.g. Hospital Course), the translation MAY match the section code (CONF:3250-16943). If the Note Activity is within a Note Section, the translation SHOULD match or specialize the section code (CONF:3250-16942)."
    * ^comment = "This code SHOULD contain zero or more [0..*] translation, which SHOULD be selected from ValueSet Note Types urn:oid:2.16.840.1.113883.11.20.9.68 DYNAMIC (CONF:3250-16939)."
* text 1..1
  * ^comment = "SHALL contain exactly one [1..1] text (CONF:3250-16896)."
  * obeys 3250-16912
  * mediaType 0..1
  * mediaType from SupportedFileFormats (preferred)
    * ^short = "If the note was originally in another format, such as RTF, this element may also contain the base-64-encoded raw data of the note in addition to a reference to the narrative."
    * ^comment = "This text MAY contain zero or one [0..1] @mediaType, which SHOULD be selected from ValueSet SupportedFileFormats urn:oid:2.16.840.1.113883.11.20.7.1 DYNAMIC (CONF:3250-16906)."
  * reference 1..1
    * ^comment = "This text SHALL contain exactly one [1..1] reference (CONF:3250-16897)."
    * nullFlavor 0..0
      * ^short = "The note activity must reference human-readable content in the narrative, so this reference must not be null."
      * ^comment = "This reference SHALL NOT contain [0..0] @nullFlavor (CONF:3250-16920)."
    * obeys 3250-16902
    * value 1..1
      * ^comment = "This reference SHALL contain exactly one [1..1] @value (CONF:3250-16898)."
* statusCode 1..1
  * ^short = "Indicates the status of the note. The most common statusCode is completed indicating the note is signed and finalized."
  * ^comment = "SHALL contain exactly one [1..1] statusCode (CONF:3250-16916)."
* effectiveTime 1..1
  * ^short = "The effectiveTime represents the clinically relevant time of the note. The precise timestamp of creation / updating should be conveyed in author/time."
  * ^comment = "SHALL contain exactly one [1..1] effectiveTime (CONF:3250-16903)."
  * value 0..1
    * ^comment = "This effectiveTime SHOULD contain zero or one [0..1] @value (CONF:3250-16917)."
* author 1..*
* author only AuthorParticipation
  * ^short = "Represents the person(s) who wrote the note."
  * ^comment = "SHALL contain at least one [1..*] Author Participation (identifier: urn:oid:2.16.840.1.113883.10.20.22.4.119) (CONF:3250-16913)."
* participant ^slicing.discriminator[0].type = #value
  * ^slicing.discriminator[=].path = "typeCode"
  * ^slicing.rules = #open
  * ^comment = "MAY contain zero or more [0..*] participant (CONF:3250-16923) such that it"
* participant contains participant1 0..*
* participant[participant1] ^short = "Represents the person(s) legally responsible for the contents of the note."
  * ^comment = "MAY contain zero or more [0..*] participant (CONF:3250-16923) such that it"
  * typeCode 1..1
  * typeCode = #LA (exactly)
    * ^comment = "SHALL contain exactly one [1..1] @typeCode=\"LA\" Legal Authenticator (CONF:3250-16925)."
  * time 1..1
  * time only USRealmDateTimeInterval
    * ^short = "Indicates the time of signing the note."
    * ^comment = "SHALL contain exactly one [1..1] US Realm Date and Time (Interval) (identifier: urn:oid:2.16.840.1.113883.10.20.22.5.3) (CONF:3250-16926)."
    //"SG 20230602 Updated this from IVL_TS to IVL-TS"
  * participantRole 1..1
    * obeys 3250-16930
    * ^comment = "SHALL contain exactly one [1..1] participantRole (CONF:3250-16924)."
    * id 1..*
      * ^short = "This may be the ID of the note author. If so, no additional information in this participant is required."
      * ^comment = "This participantRole SHALL contain at least one [1..*] id (CONF:3250-16927)."
    * playingEntity 0..1
      * ^comment = "This participantRole MAY contain zero or one [0..1] playingEntity (CONF:3250-16928)."
      * name 1..*
      * name only USRealmPersonNamePNUSFIELDED
        * ^comment = "The playingEntity, if present, SHALL contain at least one [1..*] US Realm Person Name (PN.US.FIELDED) (identifier: urn:oid:2.16.840.1.113883.10.20.22.5.1.1) (CONF:3250-16929)."
* entryRelationship ^slicing.discriminator[0].type = #exists
  * ^slicing.discriminator[=].path = "encounter"
  * ^slicing.rules = #open
  * ^comment = "SHOULD contain zero or more [0..*] entryRelationship (CONF:3250-16907) such that it"
* entryRelationship contains entryRelationship1 0..*
* entryRelationship[entryRelationship1] ^short = "Links the note to an encounter. If the Note Activity is present within a document containing an encompassingEncounter, then this entryRelationship is optional and the note is associated with the encounter represented by the encompassingEncounter."
  * ^comment = "SHOULD contain zero or more [0..*] entryRelationship (CONF:3250-16907) such that it"
  * typeCode 1..1
  * typeCode = #COMP (exactly)
    * ^comment = "SHALL contain exactly one [1..1] @typeCode=\"COMP\" (CONF:3250-16921)."
  * inversionInd 1..1
  * inversionInd = true (exactly)
    * ^comment = "SHALL contain exactly one [1..1] @inversionInd=\"true\" (CONF:3250-16922)."
  * negationInd 0..1
    * ^short = "To communicate that the note is not associated with any encounter, this entryRelationship MAY be included with @negationInd=\"true\" and encounter/id/@nullFlavor=\"NA\". The negationInd + encounter indicate this note is not associated with any encounter."
    * ^comment = "MAY contain zero or one [0..1] @negationInd (CONF:3250-16931)."
  * encounter 1..1
    * ^comment = "SHALL contain exactly one [1..1] encounter (CONF:3250-16908)."
    * id 1..*
      * obeys 3250-16914
      * ^comment = "This encounter SHALL contain at least one [1..*] id (CONF:3250-16909)."
* reference ^slicing.discriminator[0].type = #exists
  * ^slicing.discriminator[=].path = "externalDocument"
  * ^slicing.rules = #open
  * ^comment = "MAY contain zero or more [0..*] reference (CONF:3250-16910) such that it"
* reference contains reference1 0..*
* reference[reference1] ^short = "Represents an unstructured C-CDA document containing the original contents of the note in the original format."
  * ^comment = "MAY contain zero or more [0..*] reference (CONF:3250-16910) such that it"
  * externalDocument 1..1
    * ^comment = "SHALL contain exactly one [1..1] externalDocument (CONF:3250-16911)."
    * id 1..1
      * ^comment = "This externalDocument SHALL contain exactly one [1..1] id (CONF:3250-16915)."
    * obeys should-code
    * code 0..1
      * ^comment = "This externalDocument SHOULD contain zero or one [0..1] code (CONF:3250-16918)." // auto-should

Invariant: 3250-16912
Description: "If @mediaType is present, the text SHALL contain exactly one [1..1] @representation=\"B64\" and mixed content corresponding to the contents of the note (CONF:3250-16912)."
Severity: #error
Expression: "mediaType.exists() implies (representation = 'B64' and xmlText.exists())"

Invariant: 3250-16902
Description: "This reference/@value SHALL begin with a '#' and SHALL point to its corresponding narrative (using the approach defined in CDA Release 2, section 4.3.5.1) (CONF:3250-16902)."
Severity: #error
Expression: "value.startsWith('#')"

Invariant: 3250-16930
Description: "If no id matches an author or participant elsewhere in the document, then playingEntity SHALL be present (CONF:3250-16930)."
Severity: #error

Invariant: 3250-16914
Description: "If the id does not match an encounter/id from the Encounters Section or encompassingEncounter within the same document and the id does not contain @nullFlavor=\"NA\", then this entry SHALL conform to the Encounter Activity (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.4.49:2015-08-01) (CONF:3250-16914)."
Severity: #error