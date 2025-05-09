Profile: AuthorParticipation
Parent: $Author
Id: AuthorParticipation
Title: "Author Participation"
Description: """This template represents the Author Participation (including the author timestamp). CDA R2 requires that Author and Author timestamp be asserted in the document header. From there, authorship propagates to contained sections and contained entries, unless explicitly overridden.

The Author Participation template was added to those templates in scope for analysis in R2. Although it is not explicitly stated in all templates the Author Participation template can be used in any template."""

* insert LogicalModelTemplateRootOnly(author, 2.16.840.1.113883.10.20.22.4.119)

* time 1..1
  * ^comment = "SHALL contain exactly one [1..1] time (CONF:1098-31471)."
* assignedAuthor 1..1
  * ^comment = "SHALL contain exactly one [1..1] assignedAuthor (CONF:1098-31472)."
  * obeys author-details
  * id 1..*
    // * obeys 1098-32628
    * ^short = "The first id may be set equal to (a pointer to) an id on a participant elsewhere in the document (header or entries) or a new author participant can be described here. If the id is pointing to a participant already described elsewhere in the document, assignedAuthor/id is sufficient to identify this participant and none of the remaining details of assignedAuthor are required to be set. Application Software must be responsible for resolving the identifier back to its original object and then rendering the information in the correct place in the containing section's narrative text. This id must be a pointer to another author participant."
    * ^comment = "This assignedAuthor SHALL contain at least one [1..*] id (CONF:1098-31473)."
  * code 0..1
  * code from $2.16.840.1.114222.4.11.1066 (preferred)
    * ^comment = "This assignedAuthor SHOULD contain zero or one [0..1] code, which SHOULD be selected from ValueSet Healthcare Provider Taxonomy urn:oid:2.16.840.1.114222.4.11.1066 DYNAMIC (CONF:1098-31671)."
    * insert AdditionalBinding(preferred, $2.16.840.1.113883.11.20.12.1, Patient-authored content, [[If the content is patient authored the code **SHOULD** be selected from Personal And Legal Relationship Role Type (2.16.840.1.113883.11.20.12.1) (CONF:1098-32315).]])
  * addr 0..*
  * addr only USRealmAddress
    * ^short = "Required on at least one instance of this author in the document"
  * telecom 0..*
    * ^short = "Required on at least one instance of this author in the document"
  * assignedPerson 0..1
    * ^short = "assignedPerson/name or assignedAuthoringDevice/manufacturerModelName is required on at least one instance of this author in the document"
    * ^comment = "This assignedAuthor MAY contain zero or one [0..1] assignedPerson (CONF:1098-31474)."
    * name 0..*
      * ^comment = "The assignedPerson, if present, MAY contain zero or more [0..*] name (CONF:1098-31475)."
  * representedOrganization 0..1
    * ^short = "assignedPerson/name or representedOrganization/name is required on at least one instance of this author in the document"
    * ^comment = "This assignedAuthor MAY contain zero or one [0..1] representedOrganization (CONF:1098-31476)."
    * id 0..*
      * ^comment = "The representedOrganization, if present, MAY contain zero or more [0..*] id (CONF:1098-31478)."
    * name 0..*
      * ^comment = "The representedOrganization, if present, MAY contain zero or more [0..*] name (CONF:1098-31479)."
    * telecom 0..*
      * ^comment = "The representedOrganization, if present, MAY contain zero or more [0..*] telecom (CONF:1098-31480)."
    * addr 0..*
    * addr only USRealmAddress
      * ^comment = "The representedOrganization, if present, MAY contain zero or more [0..*] addr (CONF:1098-31481)."

Invariant: author-details
Severity: #error
Description: "Authors require addr, telecom, and either assignedPerson/name or assignedAuthoringDevice/manufacturerModelName. These may be present on this author or on another instance of an Author Participation in the document that has an id that matches the first id of this author."
Expression: "nullFlavor.exists() or (addr.exists() and telecom.exists() and (assignedPerson.name.exists() or assignedAuthoringDevice.manufacturerModelName.exists())) or (%resource.descendants().ofType(CDA.AssignedAuthor).where(id.exists($this.root = %context.id.first().root and $this.extension ~ %context.id.first().extension) and addr.exists() and telecom.exists() and (assignedPerson.name.exists() or assignedAuthoringDevice.manufacturerModelName.exists())))"
/*
nullFlavor.exists() or 
(
  addr.exists() 
  and telecom.exists() 
  and (
    assignedPerson.name.exists() or assignedAuthoringDevice.manufacturerModelName.exists()
  )
) or (
  %resource.descendants().ofType(CDA.AssignedAuthor).where(
    id.exists(
      $this.root = %context.id.first().root and 
      $this.extension ~ %context.id.first().extension
    )
    and addr.exists()
    and telecom.exists()
    and (
      assignedPerson.name.exists() or assignedAuthoringDevice.manufacturerModelName.exists()
    )
  )
)
*/
