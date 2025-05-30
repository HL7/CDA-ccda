Profile: ProvenanceAuthorParticipation
Parent: $Author
Id: ProvenanceAuthorParticipation
Title: "Provenance - Author Participation"
Description: """This template represents the key information to record Provenance in an Author Participation.

This Participation is appropriate at any place CDA allows an author. For example, at the CDA Header, CDA Section, CDA Entry, or within a CDA entry (e.g. Organizer and contained Observation(s)).

This template is consistent with the C-CDA Author Participation, however, it doesnt use a formal conforms to relationship. All constraints for conformance are defined in this template which specializes the Author Participation (2.16.840.1.113883.10.20.22.4.119).

This template is used to identify primary authorship for an entry. An entry may have many authors, but recipients need a single authoritative point of contact for resolving issues. This is typically the last provider to make substantive changes to the entry If two providers are simultaneously involved in that activity, the implementer must choose one, ideally in a repeatable way.

The `assignedAuthor/id` may be set equal to (a pointer to) an id on a participant elsewhere in the document (header or entries) or a new author participant can be described here.

Note: The Provenance template title includes a version 2 to support moving from the 'Basic Provenance' guide to the this Companion Guide, so the templateId has not changed."""

// !! If this root or extension changes, be sure to update 4515-64 Expression as well !!
* insert LogicalModelTemplate(provenance-author, 2.16.840.1.113883.10.20.22.5.6, 2019-10-01)

* time 1..1
  * insert USCDI([[Author Time Stamp]])
  * ^comment = "SHALL contain exactly one [1..1] time (CONF:4515-32983)."
* assignedAuthor 1..1
  * ^comment = "SHALL contain exactly one [1..1] assignedAuthor (CONF:4515-32975)."
  * obeys author-details and 4515-64
  * id ..*
    * ^slicing.discriminator[0].type = #value
    * ^slicing.discriminator[=].path = "root"
    * ^slicing.rules = #open
    * ^comment = "This assignedAuthor SHALL contain exactly one [1..1] id (CONF:4515-20) such that. it This assignedAuthor SHALL contain at least one [1..*] id (CONF:4515-2)."
    //"</element>"
    //"SG 20230601 Not a slice"
    //"<element id=\"Author.assignedAuthor.id\"><path value=\"Author.assignedAuthor.id\" /><short value=\"id\" /><comment value=\"This assignedAuthor SHALL contain at least one [1..*] id (CONF:4515-2).\" />"
  * id contains npi 1..1
  * id[npi]
    * ^comment = "This assignedAuthor SHALL contain exactly one [1..1] id (CONF:4515-20) such that it"
    * nullFlavor ^short = "If NPI is unknown, set @nullFlavor to UNK"
    * root 1..1
    * root = "2.16.840.1.113883.4.6"
      * ^comment = "SHALL contain exactly one [1..1] @root=\"2.16.840.1.113883.4.6\" National Provider Identifier (CONF:4515-22)."
    * extension 0..1
      * ^comment = "SHOULD contain zero or one [0..1] @extension (CONF:4515-23)."
  * obeys should-code
  * code 0..1
    * insert USCDI([[Author Role - When the author is a person who is not acting in the role of a clinician, this code encodes the personal or legal relationship between author and the patient.]])
    * ^comment = "This assignedAuthor SHOULD contain zero or one [0..1] code (CONF:4515-32979)." // auto-should
    * ^binding.description = "See additional bindings"
    * insert AdditionalBinding(preferred, $2.16.840.1.114222.4.11.1066, Providers, [[If the content is provider authored, the code SHOULD be selected from ValueSet Healthcare Provider Taxonomy urn:oid:2.16.840.1.114222.4.11.1066 DYNAMIC (CONF:4515-56).]])
    * insert AdditionalBinding(preferred, $2.16.840.1.113883.11.20.12.1, Non-clinicians, [[If the author is a person who is not acting in the role of a clinician, the code SHOULD be selected from ValueSet Personal And Legal Relationship Role Type urn:oid:2.16.840.1.113883.11.20.12.1 DYNAMIC (CONF:4515-57).]])
  * addr 0..*
  * addr only USRealmAddress
    * ^short = "Required on at least one instance of this author in the document"
  * telecom 0..*
    * ^short = "Required on at least one instance of this author in the document"
  * assignedPerson 0..1
    * insert USCDI([[Author - assignedPerson/name or assignedAuthoringDevice/manufacturerModelName is required on at least one instance of this author in the document]])
    * name 1..*
      * ^comment = "The assignedPerson, if present, SHALL contain at least one [1..*] name (CONF:4515-32977)."
      * obeys shall-family
      * item.family ^short = "Family required"
        * ^comment = "Such names SHALL contain exactly one [1..1] family (CONF:4515-17)."
      * obeys should-given
      * item.given ^short = "SHOULD contain given"
        * ^comment = "Such names SHOULD contain zero or more [0..*] given (CONF:4515-18)." // auto-should
  * assignedAuthoringDevice 0..1
    * ^comment = "This assignedAuthor MAY contain zero or one [0..1] assignedAuthoringDevice (CONF:4515-32)."
  * representedOrganization 0..1
    * obeys provenance-org-details
    * provenance-should-org-details
    * insert USCDI([[Author Organization]])
    * ^comment = "If the assignedAuthor/id is not referencing a Provenance Author described elsewhere in the document with a representedOrganization populated, this assignedAuthor SHALL contain exactly one [1..1] representedOrganization (See - CONF:4440-64).  This assignedAuthor MAY contain zero or one [0..1] representedOrganization (CONF:4515-32978)."
    * nullFlavor 0..1
      * ^short = "A nullFlavor of \"NA\" is allowed If the assignedAuthor is not a clinician"
      * ^comment = "The representedOrganization, if present, MAY contain zero or one [0..1] @nullFlavor (CONF:4515-35)."
    * id 0..*
      * ^slicing.discriminator[0].type = #value
      * ^slicing.discriminator[=].path = "root"
      * ^slicing.rules = #open
      * ^comment = "The representedOrganization, if present, SHALL contain exactly one [1..1] id (CONF:4515-28) such that it. The representedOrganization, if present, SHALL contain at least one [1..*] id (CONF:4515-32981)."
    * id contains
        taxId 0..1 and
        npi 0..1
    * id[taxId]
      * ^comment = "The representedOrganization, if present, SHALL contain exactly one [1..1] id (CONF:4515-24) such that it"
      * nullFlavor ^short = "If Tax ID Number is unknown, set @nullFlavor to UNK"
      * root 1..1
      * root = "2.16.840.1.113883.4.2"
        * ^comment = "SHALL contain exactly one [1..1] @root=\"2.16.840.1.113883.4.2\" Tax ID Number (CONF:4515-26)."
      * extension 0..1
        * ^comment = "SHOULD contain zero or one [0..1] @extension (CONF:4515-32982)."
    * id[npi]
      * ^comment = "The representedOrganization, if present, SHALL contain exactly one [1..1] id (CONF:4515-28) such that it"
      * nullFlavor ^short = "If NPI is unknown, set @nullFlavor to UNK"
      * root 1..1
      * root = "2.16.840.1.113883.4.6"
        * ^comment = "SHALL contain exactly one [1..1] @root=\"2.16.840.1.113883.4.6\" National Provider Identifier  (CONF:4515-30)."
      * extension 0..1
        * ^comment = "SHOULD contain zero or one [0..1] @extension (CONF:4515-31)."
    * name 0..1
      * ^comment = "The representedOrganization, if present, SHALL contain exactly one [1..1] name (CONF:4515-11)."
    * telecom 0..*
      * ^comment = "The representedOrganization, if present, SHOULD contain zero or more [0..*] telecom (CONF:4515-12)." // auto-should

Invariant: 4515-64
Description: "If the assignedAuthor/id is not referencing a Provenance Author described elsewhere in the document with a representedOrganization populated, this assignedAuthor SHALL contain exactly one [1..1] representedOrganization (CONF:4515-64)."
Severity: #error
Expression: "representedOrganization.exists() or (%resource.descendants().ofType(CDA.Author).where(templateId.exists($this.root = '2.16.840.1.113883.10.20.22.5.6' and $this.extension = '2019-10-01') and assignedAuthor.representedOrganization.exists() and assignedAuthor.id.exists($this.root = %context.id.first().root and $this.extension ~ %context.id.first().extension)))"
/*
representedOrganization.exists() or 
(
  %resource.descendants().ofType(CDA.Author).where(
    templateId.exists(
      $this.root = '2.16.840.1.113883.10.20.22.5.6' and
      $this.extension = '2019-10-01'
    ) and
    assignedAuthor.representedOrganization.exists() and
    assignedAuthor.id.exists(
      $this.root = %context.id.first().root and 
      $this.extension ~ %context.id.first().extension
    )
  )
)
*/

Invariant: provenance-org-details
Description: "If the author is not a clinician, set nullFlavor='NA'. Otherwise, the taxId, npi, and name are required."
Severity: #error
Expression: "nullFlavor = 'NA' or (id.where(root='2.16.840.1.113883.4.2').exists() and id.where(root='2.16.840.1.113883.4.6').exists() and name.exists())"

Invariant: provenance-should-org-details
Description: "If the author is not a clinician, set nullFlavor='NA'. Otherwise, the taxId, npi, and name are required."
Severity: #warning
Expression: "nullFlavor = 'NA' or telecom.exists()"
