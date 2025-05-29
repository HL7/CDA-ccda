The guidance here is drawn from [US Core - Basic Provenance](https://build.fhir.org/ig/HL7/US-Core/basic-provenance.html) tailored for C-CDA.
In C-CDA, data provenance is captured using existing participation templates specifically:

* **[Provenance - Author Participation](StructureDefinition-ProvenanceAuthorParticipation.html)** records who created or asserted a clinical statement or section.
* **[Provenance - Assembler Participation](StructureDefinition-ProvenanceAssemblerParticipation.html)** records the entity (often a system or organization) that compiled or assembled the document or section, especially from multiple sources.

These templates serve a similar purpose to the [US Core Provenance Profile](https://build.fhir.org/ig/HL7/US-Core/StructureDefinition-us-core-provenance.html) by identifying *who was involved, what their role was, and when the information was created or compiled*. Provenance in C-CDA is essential to support traceability, accountability, and appropriate use of health information.

### Organizational Level Provenance

The C-CDA approach to provenance also prioritizes what US Core describes as the "last hop"—identifying the organization most recently responsible for making a meaningful clinical update or compiling the data. In C-CDA, this is represented using a combination of the **Provenance - Author Participation** (for organizational authorship) and **Provenance - Assembler Participation** (for content assembly).
While full provenance-including all intermediaries and original sources is theoretically valuable, current implementer and end-user priorities focus on identifying:

* The **organization that last made a clinically relevant change** to the data, and
* The **system or organization that most recently transmitted or compiled** the data.


This aligns with community consensus (including HL7 Security and Argonaut participants) that end-user display should emphasize the most recent accountable organization. In C-CDA, this is achieved by:

* Using **Provenance - Author Participation** to capture the last entity responsible for creating or updating a specific entry or section.
* Optionally including **Provenance - Assembler Participation** to indicate the system or organization that most recently packaged the data into a document or section for sharing.

When a Provider is responsible for the content, you will have an Provenance - Author Participation template with a reference to an Organization (i.e. representedOrganization present). This covers both ‘Organization-level Provenance’ and ‘Individual-level Provenance’ in a single Provenance - Author Participation.

While future HL7 efforts introduce new requirements to represent the full provenance chain, keeping track of every organization and provider that handled the data, current C-CDA implementation guidance supports recording the "last hop" using these existing templates in a practical and scalable way.

For additional detail on the design thinking behind this approach see [US Core Basic Provenance](https://build.fhir.org/ig/HL7/US-Core/basic-provenance.html#basic-provenance) and the [Basic Provenance Project](https://confluence.hl7.org/display/SEC/Basic+Provenance+Implementation+Guide).

### Individual-Level Provenance

The purpose of individual-level provenance in C-CDA is to record who authored a particular clinical statement and when it was created. This is essential for understanding the origin of specific data elements-especially when multiple contributors or systems are involved in care delivery.

In C-CDA, this is accomplished using the Provenance - Author Participation template. It captures the identity of the individual (e.g., nurse, physician, patient) or system that originally created the content. It also includes a timestamp indicating when the data was authored, which may differ from when it was assembled into a document.

When a Patient is responsible for the content, you will have an Provenance - Author Participation template with the Patient (assignedPerson) without a reference to an Organization (i.e. no representedOrganization)

When a Provider is responsible for the content, you will have an Provenance - Author Participation template with a Provider (assignedPerson) and a reference to an Organization (i.e. representedOrganization present)

This template may be used at the entry, section, or document level, depending on how precisely the origin of the content needs to be tracked.


#### Author and Author Role Data Elements

The following C-CDA entries are typically not associated with individual authorship and not expected to include a provenance participation:

* Care Team Organizer (aligned with CareTeam Profile)
* Coverage Activity (aligned with Coverage Profile)
* Encounter Activity / Planned Encounter
* UDI Organizer and Contained Observations
* Service Delivery Location (as part of Encounter or Performer)
* Personal Relationship (in Guardian or Next of Kin)

This list only covers USCDI prioritized data elements. 

In FHIR, systems can attach the Provenance resource to any Resource, or even elements within a Resource. FHIR allows this additional flexibility, however, [US Core notes](https://build.fhir.org/ig/HL7/US-Core/basic-provenance.html#author-and-author-role-data-elements) which uses are unlikely. In C-CDA, the Author Participation is not available for use in every C-CDA template.  For example, the following C-CDA structures are not mentioned above since they do not allow an Author participation:

* Medication Information (manufacturedProduct)
* Patient (US Realm Header/recordTarget)
