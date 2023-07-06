Consolidated CDA (C-CDA) is a library of CDA templates developed by HL7. It leverages prior efforts from HL7,
Integrating the Healthcare Enterprise (IHE), and Health Information Technology Standards Panel (HITSP). It
harmonizes that work and consolidates implementation guides developed under the HL7 Health Story Project. C-
CDA was originally developed within the ONC’s Standards and Interoperability (S&I) Framework to provide a
definitive set of harmonized CDA templates for the US Realm. C-CDA has evolved over time as additional
implementer guidance has been developed through the HL7 ballot process to contribute new templates that
supplement the available template library. The C-CDA R2.1 implementation guide (IG) is the currently available
version of these templates. However, additional IGs have been developed, balloted and published within the C-
CDA implementer community to supplement and expand the number of available templates.

The C-CDA Companion Guide (“Companion Guide”) augments guidance provided in C-CDA to improve and expand
the exchange of clinical note information through use of HL7 Clinical Document Architecture (CDA) documents.
The Companion Guide augments the C-CDA implementation guide to address emerging requirements stemming
from new regulations and rising expectations within the implementer community to support interoperability. It
provides implementers with additional guidance consistent with accepted best practices that help to drive
adoption of additional data elements that are essential for core information exchange use cases in the US. It
reinforces certain fundamental information especially relevant to the additional guidance. It exposes implementers
to additional guidance and templates available to address the growing need for greater levels of interoperability.

### Layered Constraints, Rising Expectations

We acknowledge that best practices may in time become certification requirements. Certification requirements
should always be confirmed with the certifying organization.

The C-CDA Companion Guide offers a layered approach to conformance requirements. By adopting guidance
provided in the C-CDA Companion Guide, implementers can increase their information exchange capabilities as
expectations for interoperability expand.

The HL7 CDA R2 (Normative Web Edition 2010) forms the lowest level of conformance requirement. Implementers
may reference CDA R2 if they are developing new templates or are seeking to understand a requirement. The HL
CDA R2 standard includes extensions that have been defined to meet implementer needs.

C- CDA adds an additional requirement layer on top of the base standard. This may include use of certain available
CDA R2 extensions.

Periodically, C-CDA is amended to adjust for technical corrections. The errata releases may introduce additional or
updated requirements.

Over time, to keep pace with change, the Companion Guide is updated to keep implementers informed of
emerging changes and rising expectations for consistency and greater levels of interoperability. The C-CDA
Companion Guide provides insight on emerging conformance specification so implementers can prepare for
change, plan for greater consistency, and deliver higher quality C-CDA documents. Conforming to guidance
provided in the Companion Guide is optional, but helps implementers prepare for coming changes.

<table><tr><td><img src="Figure 2-CDA CCDA Errata Relationships.png" /></td></tr></table>
**Figure 2: CDA, C-CDA, Errata and Companion Guide Relationships**

For example, to determine if a C-CDA document conforms to industry best practices, the following verification
steps would be confirmed:

1. Document validates under the CDA_SDTC schema^13; and
2. Document meets constraints as defined in C-CDA; and
3. Document conforms to relevant technical corrections published in the C-CDA Errata; and
4. Document conforms to C-CDA Content Rubric based upon C-CDA Companion Guide guidance.

**Reference:** [C- CDA Errata Process](introduction.html#c-cda-errata-process); [C- CDA Companion Guide and C-CDA Rubric Rules](understanding_c-cda_and_the_c-cda_companion_guide.html#c-cda-companion-guide-and-c-cda-rubric-rules)

Throughout the C-CDA Companion Guide, implementer best practice guidance is summarized using a visual
conformance block callout like you see below. If the implementer best practice guidance is machine testable, and
therefore implementable in the rubric rules supported by validation tools such as the Scorecard tool, then the
visual conformance block callout is labeled with “CONF” preceding the identifying number. Otherwise, the
conformance block callout is labeled with “BP” preceding the identifying number. Readers cannot rely on the
callouts alone to summarize the full range of best practice guidance provided in the Companion Guide.

<table style="border-collapse:collapse;margin-left:27.91pt"
                            cellspacing="0">
                            <tr style="height:32pt">
                                <td
                                    style="width:450pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"
                                    bgcolor="#C5D9F0"><p class="s19"
                                        style="padding-left: 39pt;text-indent: 1pt;text-align: left;"
                                        >A C-CDA implementer SHOULD support the standards maturation
                                        process to advance the evolution of the C-CDA specification.
                                            <b>[BP-001]</b></p></td>
                            </tr>
                            <tr style="height:32pt">
                                <td
                                    style="width:450pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"
                                    bgcolor="#C5D9F0"><p class="s19"
                                        style="padding-left: 40pt;text-indent: 0pt;text-align: left;"
                                        >A C-CDA implementation SHALL incorporate all published
                                        errata applicable to the templates used.
                                        <b>[CONF-002]</b></p></td>
                            </tr>
                            <tr style="height:32pt">
                                <td
                                    style="width:450pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"
                                    bgcolor="#C5D9F0"><p class="s19"
                                        style="padding-left: 39pt;padding-right: 8pt;text-indent: 1pt;text-align: left;"
                                        >Implementers wishing to create C-CDA documents according to
                                        current industry best practices MAY conform to guidance
                                        specified in the C-CDA Companion Guide.
                                    <b>[BP-003]</b></p></td>
                            </tr>
                        </table>


It is important to note that all guidance provided in the C-CDA Companion Guide is considered optional, regardless
of the modal verb used.

^13 Available from the HL7 GitHub, https://hl7.org/permalink/?CDAR2.0schema

**Reference:** [C- CDA Errata Process](introduction.html#c-cda-errata-process);  [C- CDA Companion Guide and C-CDA Rubric Rules](understanding_c-cda_and_the_c-cda_companion_guide.html#c-cda-companion-guide-and-c-cda-rubric-rules); [Best Practice
Guidance for Higher Levels of Interoperability](understanding_c-cda_and_the_c-cda_companion_guide.html#best-practice-guidance-for-higher-levels-of-interoperability); [Guidance Language and Expectations](understanding_c-cda_and_the_c-cda_companion_guide.html#guidance-language-and-expectations)

### CDA R2 Schema and Schema Validation

CDA defines a standard schema, based on the HL7 RIM, for all CDA documents. When there is a need to
communicate information where there is no suitable representation in the schema, the CDA standard permits
extensions to be developed. These extensions are described in the context of the section where they are used.

The HL7 Structured Documents Work Group (SDWG) maintains a complete list of CDA R2 extensions that are
approved for use within the sdtc namespace.^14 The base CDA R2 schema (with approved extensions) can be found
on the HL7 CDA Core GitGub repository.^15 The schema/normative folder contains the original published CDA
Schema. This is the schema which is published with the base/core standard. This is mainly used for historical
reference. The schema/extensions folder contains an SDTC folder which has the updated CDA schema with all
SDTC extensions that are approved by HL7.

To perform schema validation on a CDA document instance properly, it is necessary to use the schema that
includes the CDA R2 schema extensions. All extensions will use the namespace **urn:hl7-org:sdtc**. As a document
consumer, the possibility of schema extensions needs to be considered.

**Reference:** [CDA Schema, C-CDA Schematrons, Sample Stylesheet](resources.html#cda-schema,-c-cda-schematrons,-sample-stylesheet)

#### CDA R2 Schema Extensions Used by C-CDA

The table below lists the extensions to CDA R2 that have been defined to support requirements in C-CDA.

| **Extension** [Cardinality] | Definition |
| -------- | -------- |
| **sdtc:admissionReferralSourceCode**  [0..1]    | This element is a coded concept that represents the type of referral. Its RIM source class is PatientEncounter. <br/>Adds to: <br/>     * componentOf/encompassingEncounter     |
| **sdtc:alternateIdentification**     | The [alternateIdentification](https://confluence.hl7.org/download/attachments/58656440/POCD_HD000040-alternateIdentifier.xls?version=1&modificationDate=1599159672937&api=v2) extension provides additional information about an identifier found in the linked role. The extensions augment the id information in the linked role. The id in the alternateIdentification extension SHALL match an id in the linked role. The alternateIdentification provides additional information about a particular identifier, such as its type. As an extension it needs to be safe for implementers to ignore this additional information. <br/>       * identifiedBy Cardinality is [0..*] <br/>      * identifiedBy.typeCode = REL <br/>     * See slide 8 in [attached ppt](https://confluence.hl7.org/download/attachments/58656440/C-CDA%20IAT%20Alternate%20Identifier%2020200904.pptx?version=1&modificationDate=1599159663059&api=v2). <br/>       * [POCD_HD000040-alternateIdentifier.xls](https://confluence.hl7.org/download/attachments/58656440/POCD_HD000040-alternateIdentifier.xls?version=1&modificationDate=1599159672937&api=v2)    |
| **sdtc:asPatientRelationship**  [0..1]    | Each participant role other than an informant/relatedEntity may have zero or more relationship roles with the patient. Each of these roles can be expressed with an asPatientRelationship element which further describes the type of role using a code element. The informant/relatedEntity participant role already supports specification of the relationship between the informant and the patient via the RelatedEntity classCode, and therefore should not include this extension. (CCD) <br/>Adds to: <br/>        * Person     |
| **sdtc:birthTime**     | The sdtc:birthTime element allows for the birth date of any person to be recorded. The purpose of this extension is to allow the recording of the subscriber or member of a health plan in cases where the health plan eligibility system has different information on file than the provider does for the patient.     |
| **sdtc:deceasedInd**  [0..1]    | The deceasedInd extension is used to record that the recordTarget or subjectPerson is deceased. <br/>Adds to: <br/>     * recordTarget/patientRole/patient <br/>        * subject/relatedSubject/subject     |
| **sdtc:deceasedTime**  [0..1]    | The deceasedTime extension is used to record the time of death for the recordTarget or subjectPerson. <br/>Adds to: <br/>      * recordTarget/patientRole/patient <br/>        * subject/relatedSubject/subject     |
| **sdtc:desc**  [0..1]    | The desc extension allows multimedia depictions of patients, healthcare providers, or other individuals to be included in a CDA document. It may be used in any person (or derived) entity and appears after the entity name. <br/>Adds to: <br/>      * recordTarget/patientRole/patient <br/>        * subject/relatedSubject/subject <br/>      * person     |
| **sdtc:dischargeDispositionCode**     | The sdtc:dischargeDispositionCode element allows the discharge disposition to be recorded for an encounter act.     |
| **sdtc:ethnicGroupCode**  [0..*]    | This ethnicGroupCode extension is used to record additional ethnicity groups for the recordTarget or subjectPerson. <br/>Adds to: <br/>     * recordTarget/patientRole/patient <br/>        * subject/relatedSubject/subject     |
| **sdtc:functionCode**  [0..1]    | The sdtc:functionCode extension element allows the function that the participant is doing to be recorded. <br/>Adds to: <br/>      * performer and participant for entries. It currently is available <br/>for these data elements in the header and just needs to be added for entry representation.     |
| **sdtc:id**  [0..*]    | This id extension is used to record the subject's medical record number or other id. <br/><br/>The id extension in the family history organizer on the related subject allows for unique identification of the family member(s). (C-CDA) CDA Release 2.0 does not provide a mechanism to determine when two participants in different roles are in fact the same entity (i.e., an entity can be a person, organization or device). A CDA Document identifies each participant through the application of a role identifier. This identifier can be used to trace the participation of an entity in a given role but cannot necessarily be used to determine that two entities are the same. While more role identities could be provided whose intended use is to unify the entities, this is better modeled through the use of an entity identifier. Therefore, to facilitate this capability, this guide defines an extension to CDA Release 2.0 that allows the person or organization playing the role to be uniquely identified, by the inclusion of an identifier on the entity. <br/>Adds to: <br/>       * subject/relatedSubject     |
| **sdtc:inFulfillmentOf1**  [0..1]    | This is an actRelationship called inFulfillmentOf1 that represents the Fulfills General Relationship Operator in QDM 4.1.x in QDM-Base QRDA Category 1, R3 (uses FLFS actRelationship type which is not an allowed actRelationship (entryRelationship) type in CDA). Also create ActReference to contain the pointer to already existing class. <br/>Adds to: <br/>        * Observation <br/>     * Substance Administration <br/>        * Supply <br/>      * Procedure <br/>       * Encounter <br/>       * Act <br/>Extension will be a pointer (reference) to an already existing order or recommendation. The id of the existing order or recommendation will be used to allow pointing to the already existing data without repeating it in the relationship (ActReference). InFulfillmentOf1 is the relationship between the act that is fulfilling the order/recommendation and that order/recommendation.     |
| **sdtc:multipleBirthInd**  [0..1]    | The multipleBirthInd extension is used to record that the recordTarget or subjectPerson is part of a multiple birth. <br/>Adds to: <br/>       * recordTarget/patientRole/patient <br/>        * subject/relatedSubject/subject     |
| **sdtc:multipleBirthOrderNumber**  [0..1]    | The multipleBirthOrderNumber extension is used to record the order number within a multiple birth that the recordTarget or subjectPerson was born in. <br/>Adds to: <br/>      * recordTarget/patientRole/patient <br/>        * subject/relatedSubject/subject     |
| **sdtc:negationInd**  [0..1]    | The Quality Measures need to be able to state that something did not happen and the reason why that thing did not happen. This is accomplished by setting negationInd=”true” and stating the reason (rationale) in a contained Reason template. This is needed for supply and encounters, however CDA has constrained the negationInd out of supply and encounter. (i.e. this device was not supplied because of reason x or this encounter did not happen because of reason y). On 4/23/2015 this proposal was withdrawn. Despite the argument for a consistent approach for negation on all act classes and acknowledgement of the issues unique to negation for observation acts, the proposal was withdrawn based on the requirement in the CDA R2 standard, Chapter 1.4 CDA Extensibility, “These extensions should not change the meaning of any of the standard data items, and receivers must be able to safely ignore these elements. Document recipients must be able to faithfully render the CDA document while ignoring extensions.” <br/>Adds to: <br/>       * Supply <br/>      * Encounter     |
| **sdtc:patient**  [0..1]    | The sdtc:patient extension element allows for the patient’s identifier, used by a given provider, to be reported. The provider in their role as an assigned entity is related to the patient. <br/>Adds to: <br/>       * AssignedEntity     |
| **sdtc:precondition1**  [0..*]    | The sdtc:precondition1 extension allows for the association of a criterion with a reference range (ObservationRange), which allows the expression in a laboratory report that a reference range is conditional on some criterion such as patient sex or age (or a combination of criterion). <br/>Adds to: <br/>      * observationRange     |
| **sdtc:priorityNumber**  [0..1]    | The sdtc:priorityNumber extension element allows the priority order of a set of acts to be reported through the use of this element in the component actRelationship of an organizer source act that holds the set of acts being ranked. The RIM states, that priorityNumber is an integer specifying the relative preference for considering this relationship before other like-typed relationships having the same source Act. Relationships with lower priorityNumber values are considered before and above those with higher values. <br/>Adds to: <br/>       * organizer/component     |
| **sdtc:raceCode**    | The raceCode extension allows for multiple races to be reported for a patient. <br/>Adds to: <br/>     * recordTarget/patientRole/patient     |
| **sdtc:raceCode**  [0..*]  | The raceCode extension is used to record additional race codes for the subject. <br/>Adds to: <br/>      * subject/relatedSubject/subject     |
| **sdtc:signatureText**   | The signatureText extension adds an attribute for authenticator and legalAuthenticator to record encoded digital signature information.     |
| **sdtc:statusCode**    | The statusCode extension attribute allows the implementer to identify a ClinicalDocument that is in other than the completed state. It was created to support the Structured Form Definition IG to identify that the document itself is an unfinished product currently being completed for a patient.     |
| **sdtc:text**  [0..1]    | The text extension adds the text element to the organizer act. Every other act has a text element, so this was needed to make the organizer act consistent with other acts. It also is needed to support mapping between the organizer act in CDA and the list resource in FHIR. <br/>Adds to: <br/>       * organizer     |
| **sdtc:valueSet**      | The valueSet extension adds an attribute for elements with a dataType which indicates the particular value set constraining the coded concept.     |
| **sdtc:valueSetVersion**      | The valueSetVersion extension adds an attribute for elements with a CD dataType which indicates the version of the particular value set constraining the coded concept.     |
{:.grid}
**Table 4: CDA R2 Extensions Used by C-CDA**

^14 For more information on CDA R2 Extensions, visit https://confluence.hl7.org/display/SD/CDA+Extensions<br/>
^15For more information on base CDA R2 schema, visit, https://hl7.org/permalink/?CDAR2.0schema<br/>

### C-CDA Templates and Schematron Validation

The C-CDA IG defines templates that specify conformance statements for representing structured clinical notes.
CDA templates are defined for document, section, entry, and entry relationship content. Inclusion of a template
ID in a CDA document does not convey semantic meaning. A template declaration in a CDA document indicates an
expectation that the associated XML conforms to the rules defined by that template.

<table><tr><td><img src="Figure3Companion.png" /></td></tr></table>
**Figure 3: Template Structure of C-CDA**

CDA documents may declare template conformance at the header level to express conformance expectations for
the content before the `<structuredBody>` tag in a structured CDA document or before the `<nonXMLBody>` tag in an unstructured CDA document. A CDA document also may declare template conformance at the document level to
express conformance expectations for the sections that will be included within the `<structuredBody>` tag.

A structured CDA document additionally may declare template conformance at the section level. A template
declaration at the section-level establishes conformance expectations for the section itself and for the discrete
entries that may be included in the section.

Templates also may be declared at the entry level to express conformance expectations for the discrete data that
is represented in the machine processable entry. Template declarations also may be nested within the structural
components of an entry to convey conformance expectations about sub-parts of the entry structure.

The presence of a template declaration in a C-CDA document is to define the constraints which stipulate what may,
should, or shall be populated in an instance of the document.

Conformance to a template from C-CDA R1.1 (defined prior to the practice of template versioning) is expressed by
declaring the templateId of the version of the template published under C-CDA R1.1 in the root attribute with no
version information included in the extension attribute.

Schematron is a rule-based validation language for confirming declarations about the presence or absence of
patterns in XML trees. Schematron is capable of expressing constraints above and beyond what is possible with
XML Schema.

Schematron can be used to:

- Extend structural validation by testing for co-occurrence constraints, non-regular constraints, and
    inter-document constraints; and
- Express rules about complex structures within an XML document.

Each template in the C-CDA library of templates has a corresponding Schematron validation package based upon
the conformance constraints defined in the template. This Schematron package can be used to confirm if a CDA
document conforms to the constraints required by C-CDA R2.1. The C-CDA Schematron package is updated when
errata releases for C-CDA are published. A Schematron package for C-CDA R2.1 is available on the HL7
International Structured Documents Work Group GitHub repository.^16 The C-CDA Schematron packages available
at time of publication are included in the Publication Package as a convenience for users. To access the current
version of an available Schematron, utilize the versions posted in the GitHub repository.

**Reference:** [Structured Header](document_level_guidance.html#structured-header)

#### Declaring Template Conformance

C- CDA templates are identified with a templateId. The templateId is a two-part identifier that consists of a root
and an extension. The root identifies the named template and the extension identifies the version of that
template. Initially C-CDA templates did not include versions. The templateId/@extension attribute was not used.
Many of those original templates are still used in C-CDA R2.1.

Chapter 3.1.2 of the Consolidated CDA Implementation Guide discusses the use of templateIds and what needs to
be included in a C-CDA document:

- To assert conformance with C-CDA R2.1, declare the templateId of the version of the template
    defined in C-CDA R2.1.
- To assert conformance with C-CDA R1.1, declare the templateId of the version of the template
    defined in C-CDA R1.1.

^16 https://github.com/HL7/cda-ccda-2.1/blob/master/schematron/Consolidation.sch

<table
                                    style="border-collapse:collapse;margin-left:24.01pt"
                                    cellspacing="0">
                                    <tr style="height:27pt">
                                        <td
                                            style="width:468pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"
                                                bgcolor="#C5D9F0"><p class="s19"
                                                style="padding-left: 41pt;padding-right: 8pt;text-indent: 0pt;text-align: left;"
                                                >C-CDA R2.1 Content Creators SHOULD NOT declare conformance to
                                    irrelevant templates <b>[BP- 004]</b></p><p
                                    style="padding-top: 6pt;padding-left: 69pt;text-indent: 0pt;text-align: left;"
                                    >Note: Testability requires business decisions to be made
                                    regarding which templates arenot relevant.</p>
                                    </td>
                                    </tr>
                                </table>
                                    
To avoid confusion and minimize inclusion of unnecessary information in C-CDA documents, implementers should
avoid including duplicate or irrelevant templateId declarations.

It is important to note that including the 2.1 templateid and the 1.1 template id is not duplication and is valid to
describe the content as conformant to both the 1.1 and 2.1 versions of C-CDA.

### C-CDA Companion Guide and C-CDA Rubric Rules

Based on emerging implementation expectations for C-CDA based interoperability, a set of criteria are compiled
and balloted through HL7 to inform the C-CDA community of additional rubric rules to consider when assessing the
quality of C-CDA documents.

The rubric criteria are created through an ongoing project in the HL7 Structured Documents Work Group (SDWG),
originating in 2016. HL7 members continually update the rubric which is periodically balloted and then published.

Rubric criteria are created to address key problematic interoperability issues identified in real system-generated C-
CDA documents where the community has determined that data is represented inconsistently or incompletely,
adversely impacting interoperability. The rubric rules are designed to improve the ability of systems to reliably
share and compare data. The goal is to create rubric rules above and beyond the conformance constraints required
by CDA and C-CDA to promote best practices by allowing providers and health IT developers to identify and resolve
issues in C-CDA documents. Implementers can use the published C-CDA rubric rules to improve data
representation in their health IT systems, thereby promoting interoperability and expanding the use of clinical data
exchanged in C-CDA documents.

#### Best Practice Guidance for Higher Levels of Interoperability

Interoperability is an ever-expanding capability. As new use cases for information exchange emerge and
expectations for data sharing rise, additional guidance is needed for implementers to maintain interoperability.
Specifications such as C-CDA are published periodically and may not include the most recent developments and
growing best practices determined to be needed by the community engaged in information exchange. The C-CDA
Companion Guide is produced and published more frequently in order to document and share guidance that has
been determined to be essential for interoperability. Best practices documented in the C-CDA Companion Guide
inform the C-CDA Content Rubric available for verifying the content of C-CDA documents. The C-CDA Companion
Guide also informs the update process used to advance the C-CDA specification. It provides a continuous
improvement mechanism for folding essential expanding implementer guidance into the published C-CDA
standard.

#### Guidance Language and Expectations

The following guidance language is not specific to C-CDA templates. It is used in all CDA templates to communicate
guidance that applies to creating conformant documents. Conformance statements also are used within the C-CDA
Companion Guide to clearly communicate best practice implementer guidance that has emerged as essential for
interoperability.

The Companion Guide does not replace or repeat conformance requirements specified in referenced source
specifications.

<table
                                    style="border-collapse:collapse;margin-left:24.01pt"
                                    cellspacing="0">
                                    <tr style="height:27pt">
                                        <td
                                            style="width:468pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"
                                                bgcolor="#C5D9F0"><p class="s19"
                                                style="padding-left: 41pt;padding-right: 8pt;text-indent: 0pt;text-align: left;"
                                                >The Companion Guide only provides optional guidance
                                                that implementer MAY choose to follow as part of
                                                their own path toward higher levels of
                                                interoperability. <b>[BP-005]</b></p></td>
                                    </tr>
                                </table>
                                
In some cases, the Companion Guide provides guidance suggesting that an optional conformance requirement in a
source specification should be tightened and become the requirement in order to achieve interoperability.
**_Although the additional guidance suggests a MAY or SHOULD conformance from an underlying specification be
elevated to a SHALL, the Companion Guide guidance is still considered optional._**

<table
                                    style="border-collapse:collapse;margin-left:24.01pt"
                                    cellspacing="0">
                                    <tr style="height:27pt">
                                        <td
                                            style="width:468pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"
                                                bgcolor="#C5D9F0"><p class="s19"
                                                style="padding-left: 41pt;padding-right: 8pt;text-indent: 2pt;text-align: left;"
                                                >C-CDA documents that do not conform to guidance
                                                specified in the Companion Guide SHALL NOT be deemed
                                                non-conformant with C-CDA R2.1.
                                            <b>[BP-006]</b></p></td>
                                    </tr>
                                </table>

##### Conformance Statements

CDA templates impose constraints based on conformance verbs defined in the HL7 Version 3 Publishing
Facilitator’s Guide.^17 Relevant conformance verbs are:

- SHALL – This word, or the term “REQUIRED”, means that the definition is an absolute requirement of
    the specification.
- SHALL NOT – an absolute prohibition against inclusion. No data are permitted.
- SHOULD/SHOULD NOT — best practice or recommendation. There may be valid reasons to ignore an
    item or include an item, but the full implications must be understood and carefully weighed before
    choosing a different course.
- MAY/NEED NOT: truly optional; can be included or omitted as the author decides with no
    implications. The mandate that there are no implications on the author decision to include or not
    some MAY data means that interoperability between systems shall not be affected by presence or
    absence of this content. Inclusion or exclusion may vary from document to document, even for
    documents for the same patient from the same organization.

<table
                                                  style="border-collapse:collapse;margin-left:24.01pt"
                                                  cellspacing="0">
                                                  <tr style="height:62pt">
                                                  <td
                                                  style="width:468pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"
                                                  bgcolor="#C5D9F0"><p class="s19"
                                                  style="padding-left: 41pt;padding-right: 8pt;text-indent: 0pt;text-align: left;"
                                                  >Schematron and other C-CDA Document Validators
                                                  SHALL indicate Schema and Schematron conformance
                                                  errors as follows:</p><p class="s19"
                                                  style="padding-left: 126pt;padding-right: 216pt;text-indent: 0pt;text-align: left;"
                                                  >SHALL violation (error) SHOULD violation (warning)</p><p class="s19"
                                                  style="padding-left: 126pt;text-indent: 0pt;line-height: 11pt;text-align: left;"
                                                  >MAY violation (not checked unless present)
                                                  <b>[CONF-007]</b></p></td>
                                                  </tr>
                                                </table>

The table below shows the relationship between conformance verb usage, minimum cardinality and permitted use of nullFlavor.

| **Conformance Verb**   | **Minimum Cardinality**    | **nullFlavor Permitted?**    |
| ---- | ------ | ------ |
| **SHALL**   | 1  | Y (unless explicitly disallowed)^18 |
| **SHOULD**   | 0  | Y |
| **MAY**   | 0  | Y |
{:.grid}
**Table 5: Conformance Verbs, Cardinality and Use of nullFlavor**

^17 http://www.hl7.org/v3ballot/html/help/pfg/pfg.htm<br/>
^18 Any SHALL, SHOULD or MAY conformance statement may use nullFlavor, unless the nullFlavor is explicitly disallowed (e.g., through another conformance statement which includes a SHALL conformance for a vocabulary binding to the @code attribute, or through an explicit SHALL NOT allow use of nullFlavor conformance).

#### Best Practice Rubric and Validation

Guidance published in the C-CDA Companion Guide is used to develop best practice Rubric which are balloted
within the HL7 C-CDA community and adopted as accepted rules for validating content in C-CDA documents.
Published C-CDA Rubric are implemented by document validation tools such as the ONC Scorecard to provide
feedback on CDA document conformance to the layer of conformance criteria considered by the C-CDA community
to be best practice and essential for interoperability.

<table
                                    style="border-collapse:collapse;margin-left:24.01pt"
                                    cellspacing="0">
                                    <tr style="height:26pt">
                                        <td
                                            style="width:468pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"
                                            bgcolor="#C5D9F0"><p class="s19"
                                                style="padding-left: 41pt;padding-right: 8pt;text-indent: 0pt;text-align: left;"
                                                >C-CDA Document Validators MAY support validation of
                                                all the layers of conformance described in Chapter
                                                2.3.1 Declaring Template Conformance.
                                                  <b>[BP-008]</b></p></td>
                                    </tr>
                                    </table>
                                    <br/>
                                    <table>
                                    <tr style="height:49pt">
                                        <td
                                            style="width:468pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"
                                            bgcolor="#C5D9F0"><p class="s19"
                                                style="padding-left: 95pt;padding-right: 47pt;text-indent: -54pt;text-align: left;"
                                                >C-CDA Document Validators SHALL indicate best
                                                practice guideline violations as follows: <span
                                                  style=" color: #00133A;">SHALL violation
                                                  (warning)</span></p><p class="s49"
                                                style="padding-left: 95pt;text-indent: 0pt;text-align: left;"
                                                >SHOULD violation (not checked unless present)</p><p
                                                class="s49"
                                                style="padding-left: 95pt;text-indent: 0pt;line-height: 11pt;text-align: left;"
                                                >MAY violation (not checked unless present) <span
                                                  class="s31"><b>[CONF-009]</b></span></p></td>
                                    </tr>
                                </table>

### Fundamental Concepts for Document-Based Exchange

The following chapters reinforce and explain fundamental information especially relevant to the guidance included
in the Companion Guide.

#### CDA and C-CDA Templates

The HL7 Clinical Document Architecture (CDA) is a document markup standard that specifies the structure and
semantics of “clinical documents” for the purpose of exchange. A clinical document is documentation of clinical
observations and services, with the following characteristics:

- Persistence – A clinical document continues to exist in an unaltered state, for a time period defined by
    local and regulatory requirements (NOTE: There is a distinct scope of persistence for a clinical document,
    independent of the persistence of any XML-encoded CDA document instance).
- Stewardship – A clinical document is maintained by an organization entrusted with its care.
- Potential for authentication – A clinical document is an assemblage of information that is intended to be
    legally authenticated.
- Context – A clinical document establishes the default context for its contents.
- Wholeness – Authentication of a clinical document applies to the whole and does not apply to portions of
    the document without the full context of the document.
- Human readability – A clinical document is human readable.

A CDA document is a defined and complete information object that can include text, images, sounds, and other
multimedia content.^19

^19 HL7 Clinical Document Architecture, R2.0, Normative Web Edition 2010.<br/>

Key aspects of CDA include:

- CDA documents are encoded in Extensible Markup
    Language (XML). (NOTE: When alternate implementations are feasible, suitable conformance
    requirements will be issued so that in future the syntax may not be limited to XML.)
- CDA documents derive their machine processable meaning from the HL7 Reference Information Model
    (RIM) and use the HL7 Version 3 Data Types.

- The CDA specification is richly expressive and flexible.
    Document-level, section-level and entry-level templates
    can be used to constrain the generic CDA specification.^20

**Document templates** define header requirements as well as section
template requirements; they specify a header template as well as
section templates as needed. The header template describes the
scope and intended use of the document. The header includes the
metadata that details contextual information, such as who created
the document, encounter information, and patient demographics.

**Section templates** revolve around a common clinical concept, such
as _Procedures_ or _Encounters_ – i.e. the _Procedures_ section template
captures information relative to patient procedures.

Section templates are defined globally and may be used by more
than one document template. For example, the template defining
the Medications section are used in both a CCD and Referral Note.
A section template may contain zero, one or many entry templates.

**Entry templates** represent individual clinical statements through
structured data elements, such as a specific medication or
procedure. Entry templates may also have requirements for certain
data elements to be coded. Entries are very specific templates
intended to capture an event, action, or observation relative to the
information captured in the section or parent entry. An entry-level
template may be used within multiple section-level templates.

Templates are identified using a special Object Identifier (OID). An
OID is a globally unique ISO [(International Organization for
Standardization)](https://www.iso.org/home.html) identifier. Within the context of HL7 C-CDA, OIDs
are represented in the following way:
urn:oid:2.16.840.1.113883.10.20.15.3.1 (closed). Often the
“urn:oid” is omitted when identifying a specific template.

<table><tr><td><img src="Structured Document 251.png" /></td></tr></table>

#### Structured Versus Unstructured Documents

For the purposes of this guide, a CDA document with a structured
header paired with a structuredBody element will be referred to as a
“structured document” and a CDA document with a structured header
paired with a nonXMLBody element will be referred to as an
“unstructured document”. The structured header for either type of
document permits computer processing (parsing) to occur on its
content.

Unstructured documents fill an important role where structured
information is inappropriate, impractical, or unavailable. Use of
unstructured documents facilitates exchange for information that does
not yet have standardized representation specifications or when
processing of structured data is not yet available at recipient systems.^21

<table><tr><td><img src="Unstructured Document 252.png" /></td></tr></table>

^20 HL7 Clinical Document Architecture, R2.0, Normative Web Edition 2010.<br/>
^21 HL7 CDA R2 Attachments IG: Exchange of C-CDA Based Documents, R1 – US Realm, pages 16-19<br/>

NOTE: The Unstructured Document template defined in C-CDA does not restrict the type of content that can be
represented. Thus, it may prove to be useful for systems with limited capability to create fully structured
documents.^22

^22HL7 CDA R2 Attachments IG: Exchange of C-CDA Based Documents, R1 – US Realm, pages 18, 25<br/>

**Example 1: Pathology Narrative Note**
A Pathology Narrative Note represented in a minimally structured CDA document which asserts conformance
to the C-CDA US Realm Header template and then uses standard LOINC codes for the document type and its
narrative sections.

```
<ClinicalDocument xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns="urn:hl7-org:v3" xmlns:cda="urn:hl7-org:v3" xmlns:sdtc="urn:hl7-org:sdtc"> <realmCode code="US"/> <typeId root="2.16.840.1.113883.1.3" extension="POCD_HD000040"/> <!-- US Realm Header --> <templateId root="2.16.840.1.113883.10.20.22.1.1" extension="2015-08-01"/> <id root="2.16.840.1.113883.3.3208.101.1" extension="20130607100315-CCDA-CCD"/> <code code="90371-6" displayName="Clinical pathology Note" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/> <title>Pathology Note</title>
    …
    The rest of the header here.
    …
    <component> <structuredBody> <component> <section> <code code="81192-7" codeSystem="2.16.840.1.113883.6.1"/> <title>Clinical Pathology Consult Note</title> <text>
        …
        The narrative note appears here.
        … </text>
    </section>
    </component>
        …
        Additional narrative sections appear here, if appropriate.
        …
    </structuredBody>
    </component
</ClinicalDocument>
```

#### Open Versus Closed Templates

The exchange documents defined in C-CDA use “open templates” in that they permit additional sections to be
included when needed to exchange available clinical information.

In open templates, all of the features of the CDA R2 base specification are allowed except as constrained by the
templates. By contrast, a closed template specifies everything that is allowed, and nothing further may be
included. Open templates allow HL7 implementers to include additional structured content not constrained by the
asserted template(s).

At this time, few if any closed templates exist in the specifications referenced by the C-CDA Companion Guide.

HL7 encourages implementers to bring forward use cases that require additional data elements to be included in
C- CDA templates. This practice fuels advances in interoperability and maximizes the development of shared
semantics as candidate requirements become formalized in subsequent versions of the standard.

##### Other Templates Available for Use in C-CDA Documents

As the library of available CDA templates grows and implementers become more experienced using the standard,
implementers may use templates developed in other CDA implementation guides which are compatible with C-
CDA. Employing additional C-CDA compatible templates will expand the range of interoperable information
available for exchange and help address emerging use cases for data exchange.

<table
                                            style="border-collapse:collapse;margin-left:24.01pt"
                                            cellspacing="0">
                                            <tr style="height:26pt">
                                                <td
                                                  style="width:468pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"
                                                  bgcolor="#C5D9F0"><p class="s19"
                                                  style="padding-left: 41pt;padding-right: 8pt;text-indent: 0pt;text-align: left;"
                                                  >C-CDA Content Creators MAY include other C-CDA
                                                  compatible templates defined in other
                                                  implementation guides. <b>[BP-010]</b></p></td>
                                            </tr>
                                        </table>
                                        
A C-CDA compatible template is a template that further constrains a template defined in C-CDA or a template that
does not conflict with templates defined in C-CDA. Determining if a template is C-CDA compliant may require
human discernment and consensus building within the C-CDA implementer community.

#### Encounter Summary Versus Patient Summary

The set of twelve document templates defined in C-CDA R2.1 can be summarized in the following groupings
explained in the following chapters.

##### Encounter Summaries

An encounter summary document is primarily a clinician authored collection of information specific to a single
patient interaction with a clinician, care team or hospitalization. The document may be provided to a patient
immediately upon, or soon after, the conclusion of their encounter even if all the information related to that
encounter is not yet available.^23

Encounter summaries are used to exchange clinical information that was gathered during an encounter with the
patient. The header allows information about the encompassing encounter to be included as structured data,
including who was the responsible party for the rendered care and where the encounter took place. For encounter
summaries, this information SHOULD be included to support emerging use cases for data from C-CDA documents
to support quality measure assessment.<br/>

^23 Concise Consolidated CDA: Deploying Encounter Summary Documents with Clinical Notes. Car_e_quality and CommonWell Work Groups. 2018. Page 7.

##### Patient Summaries

Patient summaries are used to exchange clinical information about a patient’s care over time. A patient summary
is not specific to a particular encounter. The context of the document is a span of time over which care services
have been provided.

##### Other Categories of Clinical and Patient-Generated Documents

Other types of clinical information exchange documents used to share information that supports care delivery,
planning, and transitions of care.

| **Encounter Summary Documents**   | **Patient Summary Documents**    | **Other Categories of Clinical and Patient-Generated Documents**    |
| ---- | ------ | ------ |
| Consultation Note<br />Discharge Summary<br />History and Physical Note<br />Progress Note   | Continuity of Care Document (CCD)<br />Transfer Summary  | Care Plan<br />Diagnostic Imaging Report<br />Operative Note<br />Procedure Note<br />Referral Note<br />Patient Generated Document  | 
|<td colspan="3">**NOTE: Unstructured Documents are classified based upon the document type associated with the LOINC code in the ClinicalDocument/code element in the header of the document.**|

{:.grid}
**Table 6: Document templates defined in C-CDA R2.1, sorted by category.**<br />


A great deal of clarity was added in the recent Car*e*quality CommonWell Joint Document Content Work Group
implementation guide to explain the difference between an Encounter Summary document and a Patient
Summary document.

An Encounter Summary provides a snapshot of the patient’s condition at the time of the encounter as authored by
the clinician. A Patient Summary on the other hand provides a historical view of the information available in the
sending system for a span of time which may cross multiple encounters. While the workgroup primarily focused on
the importance of creating Encounter Summary documents to complement Patient Summary documents, the work
group acknowledged that some systems create CCD documents when requested, based on the IHE XDS Query
parameters of the requestor. Systems that support this capability may continue to produce CCD documents in this
manner, however, the Joint Document Content Work Group recommends that future development by systems
that don’t support this capability focus on implementing Encounter Summary documents, not enhancing CCD
generation to match time range parameters of the requestor.^24

**Reference:** [The Joint Document Content Work Group](resources.html#the-joint-document-content-work-group)

### General Guidance on Document-Based Exchange

The HL7 CDA standard was designed to permit information to be exchanged using a document paradigm. The
scope of the CDA is the standardization of clinical documents for exchange. The data format of clinical documents
outside of the exchange context ( _e.g.,_ the data format used to store clinical documents) is not addressed. CDA
documents can be transmitted in HL7 messages designed to transfer clinical documents. While the detailed
specification for such messages is outside of the scope of the CDA, this specification does impose requirements
upon the packaging of CDA documents in HL7 messages. Consult the HL7 CDA standard for additional information
about requirements for CDA document exchange.^25

HL7 CDA does not specify the creation or management of documents, only their exchange markup. Document
management is critically interdependent with the CDA specifications, but the specification of document
management messages is outside the scope of the CDA.^26

In a chapter titled “Smart Senders and Resilient Receivers”, the Car*e*quality CommonWell Joint Workgroup’s
Concise Consolidated CDA implementation guide states:


> Successful document exchange relies on layers of rules from CDA document specifications, C-CDA 2.1
specification, and the C-CDA 2.1 companion guide. Despite every effort by implementers, and the HL7
community, to document all the important topics for successful exchange, the Joint Content Work Group
discussed many other areas that would benefit from additional guidance. The Smart Senders and Resilient
Receivers sections are not an exhaustive list of best practices, but instead is a list of the best practices that
captured the group’s attention.


The following chapters summarize best practices identified for C-CDA document Content Creators (Senders) and C-
CDA document Content Consumers (Receivers).

**Reference:** [LOINC Coding for Clinical Notes](understanding_c-cda_and_the_c-cda_companion_guide.html#loinc-coding-for-clinical-notes)
<br/>
^24 Concise Consolidated CDA: Deploying Encounter Summary Documents with Clinical Notes. Car_e_quality and CommonWell Work Groups. 2018. Page 23.<br/>
^25 HL7 Clinical Document Architecture, R2.0, Normative Web Edition 2010, CDA Document Exchange in HL7 Messages, chapter 3.<br/>
^26 HL7 Clinical Document Architecture, R2.0. Normative Web Edition 2010. Scope of the CDA, chapter 1.1.2.

#### Content Creator Responsibilities

> Volume 1 of C-CDA R2.1 includes an explicit requirement to support narrative text linking, which states:
The C-CDA R1.1 release recommended that clinical statements include a link between the narrative
(section.text) and coded clinical data (entry). Rather than repeat these constraints in every applicable
entry, SDWG agreed in C- CDA R2.0 to apply the following constraint to all entry templates, unless
explicitly prohibited.

<table
                                    style="border-collapse:collapse;margin-left:18.61pt"
                                    cellspacing="0">
                                    <tr style="height:184pt">
                                        <td
                                            style="width:463pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"
                                                bgcolor="#C5D9F0"><p class="s19"
                                                style="padding-left: 41pt;text-indent: 0pt;text-align: left;"
                                                >C-CDA Content Creators SHOULD support narrative
                                                text linking when creating documents that include
                                                sections with discrete data. The primary act of each
                                                templated entry:</p><p class="s19"
                                                style="padding-left: 77pt;text-indent: 0pt;line-height: 12pt;text-align: left;"
                                                >SHOULD contain zero or one [0..1] text
                                                (CONF:XXXX).</p><p class="s19"
                                                style="padding-left: 95pt;text-indent: 0pt;text-align: left;"
                                                >a. The text, if present, SHOULD contain zero or one [0..1] reference/@value (CONF: XXXX).</p><p class="s19"
                                                style="padding-left: 77pt;padding-right: 11pt;text-indent: 36pt;text-align: left;"
                                                >i. This reference/@value SHALL begin with a '#' and SHALL point to its
                                                corresponding narrative (using the approach defined in CDA R2.0,
                                                section 4.3.5.1) (CONF: XXXX).</p><p class="s19"
                                                style="padding-left: 77pt;text-indent: 0pt;line-height: 12pt;text-align: left;"
                                                >MAY contain zero or one [0..1] originalText
                                                (CONF:XXXX).</p><p class="s19"
                                                style="padding-left: 95pt;text-indent: 0pt;text-align: left;"
                                                >a. The originalText, if present, SHOULD contain
                                                zero or one [0..1] reference/@value
                                                (CONF:XXXX).</p><p class="s19"
                                                style="padding-left: 77pt;padding-right: 11pt;text-indent: 36pt;text-align: left;"
                                                >i. This reference/@value SHALL begin with a
                                                &#39;#&#39; and SHALL point to its corresponding
                                                narrative (using the approach defined in CDA
                                                R2.0, section 4.3.5.1)^27 (CONF:XXXX).
                                                <b>[CONF-011]</b></p></td>
                                    </tr>
                                </table>

The Joint Document Content Work Group identified this capability as, [“extremely important for processing and
validating C-CDA documents that include machine-processable entries.”](http://www.commonwellalliance.org/wp-content/uploads/2018/07/Carequality_CommonWell_Improve_C-CDA_06-15-)
2018_V1.pdf) The narrative text linkages are the
mechanism that associate human readable information in the narrative text of each section to the entries carrying
that information for machine processing. Without proper narrative text linking, it is impossible to accurately
validate if the machine-readable entries and the human-readable representation of that information accurately
reflect the [same semantic meaning](http://www.commonwellalliance.org/wp-content/uploads/2018/07/Carequality_CommonWell_Improve_C-CDA_06-15-)
2018_V1.pdf).

Resources for more information:

- [How to create narrative text linking in sections that contain machine-processable entries](https://docs.google.com/document/d/1r1qBuzPQNkLiNpLkTOIv4RHXQHkyx7_N7_Es3MiHUek/edit).
- See narrative reference examples in the General section of [HL7 Example](http://cdasearch.hl7.org/) Task Force.
- See sample documents provided with this Companion Guide.

<table
                                    style="border-collapse:collapse;margin-left:24.01pt"
                                    cellspacing="0">
                                    <tr style="height:29pt">
                                        <td
                                            style="width:468pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"
                                                bgcolor="#C5D9F0"><p class="s19"
                                                style="padding-left: 41pt;text-indent: 0pt;line-height: 12pt;text-align: left;"
                                                >C-CDA Content Creators SHOULD maintain
                                                act/observation IDs across documents.
                                                  <b>[BP-012]</b></p></td>
                                    </tr>
                                </table>

Many entry templates in C-CDA require an identifier (ID) on an entry.

**Reference:** [Use of Consistent Identifiers](representation_of_discrete_data.html#use-of-consistent-identifiers)

The Joint Document Content Work Group implementation guide states, “Maintaining consistent IDs enables
receivers who machine-process documents to de-duplicate the information and accurately identify data that has
been previously reported. For any entry where an ID is required, systems SHALL maintain consistent IDs whether
sending the entry in an Encounter Summary Document, a Patient Summary document or any other CDA document
types.”^32

The C-CDA R2.1 specification does not include a conformance requirement addressing the need for this practice of
maintaining act/observation IDs. The Joint Document Content Work Group’s guidance adopts the practice as a
strict requirement.^33 This Companion Guide recommends that implementers follow this guidance as a best
practice.

<table
                                    style="border-collapse:collapse;margin-left:24.01pt"
                                    cellspacing="0">
                                    <tr style="height:29pt">
                                        <td
                                            style="width:468pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"
                                                bgcolor="#C5D9F0"><p class="s19"
                                                style="padding-left: 41pt;text-indent: 0pt;text-align: left;"
                                                >C-CDA Content Creators SHOULD support document
                                                versioning. <b>[BP-013]</b></p></td>
                                    </tr>
                                </table>
                                
There are many situations where a document may be updated. For example, a pending laboratory result or a
missing note may trigger an update. The base CDA standard provides a mechanism to replace or append a
previously sent document through the parentDocument relationship.^34 Since senders will not know what a receiver
stored, it is preferable to always send a complete document that replaces the prior document, then indicate the
parent document being replaced by including it with the replace relationship (typeCode=”RPLC”).^35

<table
                                    style="border-collapse:collapse;margin-left:24.01pt"
                                    cellspacing="0">
                                    <tr style="height:26pt">
                                        <td
                                            style="width:468pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"
                                            bgcolor="#C5D9F0"><p class="s19"
                                                style="padding-left: 41pt;padding-right: 8pt;text-indent: 0pt;text-align: left;"
                                                >C-CDA Content Creators SHOULD send a complete
                                                document and use the replace relationship
                                                (typeCode=”RPLC”) when sending a new version of a
                                                previously shared document. <b>[BP-014]</b></p></td>
                                    </tr>
                                    <tr style="height:26pt">
                                        <td
                                            style="width:468pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"
                                            bgcolor="#C5D9F0"><p class="s19"
                                                style="padding-left: 41pt;padding-right: 8pt;text-indent: 0pt;text-align: left;"
                                                >C-CDA Content Consumers SHOULD support replacing a
                                                prior version of a document when a document is
                                                received that indicates it is a replacement for a
                                                prior document. <b>[BP-015]</b></p></td>
                                    </tr>
                                </table>
                                
Chapter 7 of the HL7 CDA R2 Attachment IG: Exchange of C-CDA Based Documents, R1 – US Realm identifies
conformance requirements when using C-CDA documents for attachments shared with Payers.^36 Chapter 7.5
establishes this conformance rule which applies to Content Consumers for handling document succession:

^31 [http://cdasearch.hl7.org/](http://cdasearch.hl7.org/)
^32 [Concise Consolidated CDA: Deploying Encounter Summary Documents with Clinical Notes. Car _e_ quality and
CommonWell Work Groups. 2018. Page 26.](http://www.commonwellalliance.org/wp-content/uploads/2018/07/Carequality_CommonWell_Improve_C-CDA_06-15-2018_V1.pdf)
^33 [Concise Consolidated CDA: Deploying Encounter Summary Documents with Clinical Notes. Car _e_ quality and CommonWell Work](http://www.commonwellalliance.org/wp-content/uploads/2018/07/Carequality_CommonWell_Improve_C-CDA_06-15-2018_V1.pdf)
Groups Chapter 5.1.2 Maintain act/observation IDs across documents.
^34 [Concise Consolidated CDA: Deploying Encounter Summary Documents with Clinical Notes. Car _e_ quality and CommonWell Work Groups.](http://www.commonwellalliance.org/wp-content/uploads/2018/07/Carequality_CommonWell_Improve_C-CDA_06-15-2018_V1.pdf)
2018. Page 26.
^35 [Concise Consolidated CDA: Deploying Encounter Summary Documents with Clinical Notes. Car _e_ quality and CommonWell Work Groups.](http://www.commonwellalliance.org/wp-content/uploads/2018/07/Carequality_CommonWell_Improve_C-CDA_06-15-2018_V1.pdf) 2018. Page 27.
^36 https://www.hl7.org/implement/standards/product_matrix.cfm

<table
                                    style="border-collapse:collapse;margin-left:24.01pt"
                                    cellspacing="0">
                                    <tr style="height:43pt">
                                        <td
                                            style="width:468pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"
                                                bgcolor="#C5D9F0"><p class="s19"
                                                style="padding-left: 40pt;padding-right: 5pt;text-indent: 0pt;text-align: left;"
                                                >Document creators SHOULD use the setId and version
                                                in the US Realm Header to identify a specific
                                                document (document type, patient and visit) the
                                                initial version and any successor documents shall
                                                use the same setId and increment the version.
                                                  <b>[AIGEX-DS1]</b></p></td>
                                    </tr>
                                </table><p style="text-indent: 0pt;text-align: left;"
                                    ><br /></p><table
                                    style="border-collapse:collapse;margin-left:24.01pt"
                                    cellspacing="0">
                                    <tr style="height:26pt">
                                        <td
                                            style="width:468pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"
                                            bgcolor="#BCD5ED"><p class="s19"
                                                style="padding-left: 41pt;padding-right: 8pt;text-indent: 0pt;text-align: left;"
                                                >C-CDA Content Creators SHOULD use setId and
                                                versionNumber to identify document version
                                                  succession<b>. [CONF-016]</b></p></td>
                                    </tr>
                                    <tr style="height:26pt">
                                        <td
                                            style="width:468pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"
                                            bgcolor="#C5D9F0"><p class="s19"
                                                style="padding-left: 41pt;text-indent: 0pt;text-align: left;"
                                                >C-CDA Content Creators MAY indicate section content
                                                was reconciled using the Reconciliation Act Entry
                                                (1.3.6.1.4.1.19376.1.5.3.1.1.24.3.1).
                                                  <b>[BP-017]</b></p></td>
                                    </tr>
                                </table>

The Joint Document Content Work Group implementation guide allows sending systems to indicate that a
particular list was reconciled using the IHE Reconciliation Act Entry content module
(1.3.6.1.4.1.19376.1.5.3.1.1.24.3.1). The IHE Reconciliation Act Entry defines an entry template to indicate the
information in a section has been reconciled.

NOTE: IHE calls CDA templates “content modules”.

The guidance states, “While not required, systems should consider including this act, or a similar indicator, to
explicitly state a list has been reconciled.” The guidance also notes, “Only include if the system is confident a user
reconciled the list. This should not be included if a clinician simply reviewed the list and did not reconcile it.”^37

<table
                                    style="border-collapse:collapse;margin-left:24.01pt"
                                    cellspacing="0">
                                    <tr style="height:26pt">
                                        <td
                                            style="width:468pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"
                                                bgcolor="#C5D9F0"><p class="s19"
                                                style="padding-left: 41pt;text-indent: 0pt;text-align: left;"
                                                >C-CDA Content Creators SHOULD include the Section
                                                Time Range entry in a section when business logic
                                                dictates the range of information that is included.
                                                  <b>[BP-018]</b></p></td>
                                    </tr>
                                </table>

**Reference:** [Declaring Business Rules that Limit Section Content](section_level_guidance.html#declaring-business-rules-that-limit-section-content);  [Specifying Time Intervals for Sections with Limits](representation_of_discrete_data.html#specifying-time-interval-for-sections-with-limits);
with Limits

#### Content Consumer Responsibilities

<table
                                    style="border-collapse:collapse;margin-left:24.01pt"
                                    cellspacing="0">
                                    <tr style="height:26pt">
                                        <td
                                            style="width:468pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"
                                                bgcolor="#C5D9F0"><p class="s19"
                                                style="padding-left: 41pt;text-indent: 0pt;text-align: left;"
                                                >C C-CDA Content Consumers MAY validate documents
                                                prior to importing them. <b>[BP-019]</b></p></td>
                                    </tr>
                                </table>

Chapter 7 of the HL7 CDA R2 Attachment IG: Exchange of C-CDA Based Documents, R1 – US Realm identifies
conformance requirements when using C-CDA documents for attachments shared with Payers.^38 Chapter 7.4
establishes these conformance rules which apply to Content Consumers for handling document validation:


<table
                                    style="border-collapse:collapse;margin-left:24.01pt"
                                    cellspacing="0">
                                    <tr style="height:32pt">
                                        <td
                                            style="width:464pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"
                                            bgcolor="#C5D9F0"><p class="s19"
                                                style="padding-left: 40pt;text-indent: 0pt;line-height: 12pt;text-align: left;"
                                                >All documents SHALL conform to the CDA R2 schema
                                                for CDA (XSD) with sdtc extensions included.</p><p
                                                class="s31"
                                                style="padding-left: 41pt;text-indent: 0pt;text-align: left;"
                                                ><b>[AIGEX-VR1]</b></p></td>
                                    </tr>
                                    <tr style="height:43pt">
                                        <td
                                            style="width:464pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"
                                            bgcolor="#C5D9F0"><p class="s19"
                                                style="padding-left: 41pt;padding-right: 6pt;text-indent: 0pt;text-align: left;"
                                                >All documents SHALL conform to the published HL7
                                                implementation guide conformance specifications for
                                                the specific document template (including
                                                incorporated section and entry templates) as defined
                                                for the specific templateId and extension.
                                                  <b>[AIGEX-VR2]</b></p></td>
                                    </tr>
                                    <tr style="height:32pt">
                                        <td
                                            style="width:464pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"
                                            bgcolor="#C5D9F0"><p class="s19"
                                                style="padding-left: 41pt;padding-right: 6pt;text-indent: 0pt;text-align: left;"
                                                >All documents SHALL pass defined as no errors the
                                                validation requirements in VR1 and VR2. <b>[AIGEX-
                                                  VR3]</b></p></td>
                                    </tr>
                                    <tr style="height:32pt">
                                        <td
                                            style="width:464pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"
                                                bgcolor="#C5D9F0"><p class="s19"
                                                style="padding-left: 41pt;padding-right: 6pt;text-indent: 0pt;text-align: left;"
                                                >Documents that do not meet the validation criteria
                                                SHALL NOT be considered a valid attachment for the
                                                purpose of this Guide. <b>[AIGEX-VR4]</b></p></td>
                                    </tr>
                                </table>

^37 [Concise Consolidated CDA: Deploying Encounter Summary Documents with Clinical Notes.](http://www.commonwellalliance.org/wp-content/uploads/2018/07/Carequality_CommonWell_Improve_C-CDA_06-15-2018_V1.pdf) Car*e*quality and CommonWell Work
Groups. 2018. Page 28.
^38 https://www.hl7.org/documentcenter/public_temp_E3F202CB-1C23-BA17-0C6B02F543752C9B/standards/dstu/CDAR2_AIG_CCDA_EXCHANGE_R1_STU_2017AUG.pdf Page 48.


Previously some implementer communities took a different stance suggesting that any C-CDA document that
passed CDA Schema validation should, at a minimum, be accepted and systems SHOULD support rendering the
section.text information present in the document. The position suggested Content Consumers SHOULD NOT reject
documents that did not conform to the C-CDA R2.1 specification for the declared Document templates.

Content Consumers SHOULD be tolerant of accepting non-conformant C-CDA documents because rejecting
documents for non-conformance may reduce or delay availability of valuable clinical data. However, Content
Consumers may reject non-conformant C-CDA documents. For example, if a document cannot be rendered. Local
trading partners may establish additional requirements for accepting documents.

<table
                                    style="border-collapse:collapse;margin-left:24.01pt"
                                    cellspacing="0">
                                    <tr style="height:48pt">
                                        <td
                                            style="width:468pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"
                                            bgcolor="#C5D9F0"><p class="s19"
                                                style="padding-left: 41pt;padding-right: 8pt;text-indent: 0pt;text-align: left;"
                                                >Consumers SHOULD be tolerant of accepting
                                                non-conformant C-CDA documents when possible.
                                                However, rejecting documents based on an entity’s
                                                validation rules or for structural issues may reduce
                                                or delay availability of valid clinical data.
                                                  <b>[BP-020]</b></p></td>
                                    </tr>
                                    <tr style="height:26pt">
                                        <td
                                            style="width:468pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"
                                            bgcolor="#C5D9F0"><p class="s19"
                                                style="padding-left: 41pt;text-indent: 0pt;line-height: 12pt;text-align: left;"
                                                >C-CDA Content Consumers SHOULD be able to replace a
                                                prior version of a document.
                                            <b>[CONF-021]</b></p></td>
                                    </tr>
                                </table>

Additionally, there are regulatory (Certification) requirements to support sequencing and hiding sections based on
a provider’s preferences. A system must allow restricted viewing and support the ability of providers to tailor
restricted views as a possible solution for large unusable documents. Use of the C-CDA CDA XSL style sheet will not
be sufficient to meet the certification requirements.^39

<table
                                    style="border-collapse:collapse;margin-left:24.01pt"
                                    cellspacing="0">
                                    <tr style="height:42pt">
                                        <td
                                            style="width:468pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"
                                                bgcolor="#C5D9F0"><p class="s19"
                                                style="padding-left: 41pt;padding-right: 8pt;text-indent: 0pt;text-align: left;"
                                                >Content Consumers SHALL support sequencing and
                                                hiding sections based on a provider’s preferences
                                                and SHALL allow restricted viewing and support the
                                                ability of providers to tailor restricted views as a
                                                possible solution for large unusable documents.
                                                  <b>[BP-022]</b></p></td>
                                    </tr>
                                </table>

The receiving system’s ability to replace a parent document should be maintained regardless of the mechanism of
exchange ( _e.g._ via Direct, query, etc.). Some systems cannot link to prior versions using
relatedDocument/parentDocument/id. Due to this inconsistent implementation of linking to parent documents,
receiving systems may link to prior versions by using encompassingEncounter/id.^40

**Reference:** [Options for Temporarily Unavailable Data](understanding_c-cda_and_the_c-cda_companion_guide.html#options-for-temporarily-unavailable-data)

<table
                                    style="border-collapse:collapse;margin-left:24.01pt"
                                    cellspacing="0">
                                    <tr style="height:26pt">
                                        <td
                                            style="width:468pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"
                                                bgcolor="#C5D9F0"><p class="s19"
                                                style="padding-left: 41pt;text-indent: 0pt;line-height: 12pt;text-align: left;"
                                                >C-CDA Content Consumers SHOULD use setId and
                                                versionNumber to manage document succession.<b>[CONF-023]</b></p></td>
                                    </tr>
                                </table>

When using C-CDA documents for attachments shared with Payers, additional conformance requirements were set
forth in HL7 CDA R2 Attachment IG: Exchange of C-CDA Based Documents, R1 – US Realm. Chapter 7.5 addresses
how Content Consumers should handle document succession:

<table
                                    style="border-collapse:collapse;margin-left:24.01pt"
                                    cellspacing="0">
                                    <tr style="height:28pt">
                                        <td
                                            style="width:468pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"
                                                bgcolor="#C5D9F0"><p class="s19"
                                                style="padding-left: 41pt;padding-right: 5pt;text-indent: 0pt;text-align: left;"
                                                >Document recipients SHOULD recognize, associate,
                                                and make available versions of documents as defined
                                                by the setId and version in the US Realm Header.
                                                  <b>[AIGEX-DS2]</b></p></td>
                                    </tr>
                                    <tr style="height:28pt">
                                        <td
                                            style="width:468pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"
                                                bgcolor="#C5D9F0"><p class="s19"
                                                style="padding-left: 41pt;text-indent: 0pt;text-align: left;"
                                                >Document recipients SHOULD apply any document
                                                retention policies to all versions of a document as
                                                defined by setId and version.><b>[AIGEX-DS3]</b><a href="#bookmark113"
                                                  class="s57">41</a></p></td>
                                    </tr>
                                </table>
                                <br/>
                                 </table><p style="text-indent: 0pt;text-align: left;"
                                    ><br /></p><table
                                    style="border-collapse:collapse;margin-left:24.01pt"
                                    cellspacing="0">
                                    <tr style="height:26pt">
                                        <td
                                            style="width:468pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"
                                            bgcolor="#C5D9F0"><p class="s19"
                                                style="padding-left: 41pt;padding-right: 8pt;text-indent: 0pt;text-align: left;"
                                                >C-CDA Content Consumers SHOULD display useful
                                                document metadata when showing available documents
                                                for retrieval or retrieved documents.
                                                  <b>[BP-024]</b></p></td>
                                    </tr>
                                    <tr style="height:26pt">
                                        <td
                                            style="width:468pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"
                                            bgcolor="#C5D9F0"><p class="s19"
                                                style="padding-left: 41pt;text-indent: 0pt;line-height: 12pt;text-align: left;"
                                                >C-CDA Content Consumers SHOULD enable display of
                                                all unrestricted sections of a valid CDA
                                                Document.</p><p class="s31"
                                                style="padding-left: 41pt;text-indent: 0pt;line-height: 12pt;text-align: left;"
                                                >[BP-025]</p></td>
                                    </tr>
                                </table>

^39 80 FR 62634
^40 [Concise Consolidated CDA: Deploying Encounter Summary Documents with Clinical Notes.](http://www.commonwellalliance.org/wp-content/uploads/2018/07/Carequality_CommonWell_Improve_C-CDA_06-15-2018_V1.pdf) Car*e*quality and CommonWell Work
Groups. 2018. Page 27.


The Joint Document Content Work Group implementation guide states, “The base CDA standard is designed so
that every section’s section.text element is displayable in a basic browser using the base CDA stylesheet, cda.xsl.
While receivers are allowed to implement complex processing to apply their own display styles to a section, a
system SHALL never hide a section if it does not recognize the LOINC section code. Every properly formatted
section SHALL be displayed, or an option given, to allow the user to view the full unrestricted document.”^42

This guidance, combined with the guidance regarding Content Consumer capabilities to limit and customize the
rendering of content in a C-CDA document, shows that implementer best practices for Content Consumers
includes a wide range of rendering possibilities.

When presenting users with a list of available documents, implementer best practice includes displaying metadata
based on guidance included in the Sequoia Project - [eHealth Exchange Content Testing Program Guide](https://s3.amazonaws.com/seqprojectehex/wp-content/uploads/2018/09/12194149/eHealthExchange-Content-Testing-Guide-2018v1.pdf) with the
additions of Date and Title by the Joint Document Content Work Group.

Shown below is “Figure 18 Document Information Available during the IHE Query and in the stored C-CDA from the Joint Work Group implementation guide which summarizes key data elements available in the IHE Document Query transaction (ITI-18) and in the C-CDA document header^43

> When displaying available documents for retrieval or retrieved documents, systems
should display corresponding document information. This information may be
obtained from the IHE query/retrieve transaction (i.e., the same as what was
displayed in the “list of available documents” during the query) or may be obtained
(parsed) from within the C-CDA document header^44.

^41 https://www.hl7.org/documentcenter/public_temp_E3F202CB-1C23-BA17-0C6B02F543752C9B/standards/dstu/CDAR2_AIG_CCDA_EXCHANGE_R1_STU_2017AUG.pdf Page 49
^42 [Concise Consolidated CDA: Deploying Encounter Summary Documents with Clinical Notes.](http://www.commonwellalliance.org/wp-content/uploads/2018/07/Carequality_CommonWell_Improve_C-CDA_06-15-2018_V1.pdf) Car*e*quality and CommonWell Work
Groups. 2018. Page 31.
^43 [Concise Consolidated CDA: Deploying Encounter Summary Documents with Clinical Notes.](http://www.commonwellalliance.org/wp-content/uploads/2018/07/Carequality_CommonWell_Improve_C-CDA_06-15-2018_V1.pdf) Car*e*quality and CommonWell Work
Groups. 2018. Page 30-31.
^44 While this section focuses on query/retrieve, documents received via Direct **SHOULD** follow the recommended metadata for display



<table
                                    style="border-collapse:collapse;margin-left:24.01pt"
                                    cellspacing="0">
                                    <tr style="height:11pt">
                                        <td
                                            style="width:65pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"
                                            bgcolor="#BEBEBE"><p class="s67"
                                                style="padding-left: 4pt;text-indent: 0pt;line-height: 10pt;text-align: left;"
                                                >Document Info</p></td>
                                        <td
                                            style="width:52pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"
                                            bgcolor="#BEBEBE"><p class="s67"
                                                style="padding-left: 5pt;text-indent: 0pt;line-height: 10pt;text-align: left;"
                                                >Availability</p></td>
                                        <td
                                            style="width:372pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"
                                            bgcolor="#BEBEBE"><p class="s67"
                                                style="padding-left: 3pt;text-indent: 0pt;line-height: 10pt;text-align: left;"
                                                >Location</p></td>
                                    </tr>
                                    <tr style="height:29pt">
                                        <td
                                            style="width:65pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"
                                            rowspan="3"><p
                                                style="text-indent: 0pt;text-align: left;"
                                                ><br /></p><p class="s68"
                                                style="padding-left: 7pt;text-indent: 0pt;text-align: left;"
                                                >Date range</p></td>
                                        <td
                                            style="width:52pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"
                                                ><p class="s69"
                                                style="padding-top: 3pt;padding-left: 3pt;text-indent: 0pt;text-align: left;"
                                                >IHE</p><p class="s69"
                                                style="padding-left: 3pt;text-indent: 0pt;text-align: left;"
                                                >Metadata</p></td>
                                        <td
                                            style="width:372pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"
                                                ><p class="s70"
                                                style="padding-top: 3pt;padding-left: 3pt;padding-right: 20pt;text-indent: 0pt;text-align: left;"
                                                  >DocumentEntry.<span style=" color: #000;"
                                                  >serviceStartTime </span>DocumentEntry.<span
                                                  style=" color: #000;"
                                            >serviceStopTime</span></p></td>
                                    </tr>
                                    <tr style="height:53pt">
                                        <td
                                            style="width:52pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"
                                                ><p class="s69"
                                                style="padding-top: 4pt;padding-left: 3pt;padding-right: 10pt;text-indent: 0pt;text-align: left;"
                                                >Encounter Summary C-CDA</p><p class="s69"
                                                style="padding-left: 3pt;text-indent: 0pt;line-height: 11pt;text-align: left;"
                                                >Header</p></td>
                                        <td
                                            style="width:372pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"
                                                ><p class="s71"
                                                style="padding-top: 3pt;padding-left: 3pt;text-indent: 0pt;text-align: left;"
                                                >ClinicalDocument/componentOf/encompassingEncounter/
                                                effectiveTime/low
                                                ClinicalDocument/componentOf/encompassingEncounter/
                                                effectiveTime/high</p></td>
                                    </tr>
                                    <tr style="height:44pt">
                                        <td
                                            style="width:52pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"
                                                ><p class="s69"
                                                style="padding-left: 3pt;padding-right: 13pt;text-indent: 0pt;text-align: left;"
                                                >Patient Summary C-CDA</p><p class="s69"
                                                style="padding-left: 3pt;text-indent: 0pt;line-height: 10pt;text-align: left;"
                                                >Header</p></td>
                                        <td
                                            style="width:372pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"
                                                ><p style="text-indent: 0pt;text-align: left;"
                                                ><br /></p><p class="s72"
                                                style="padding-left: 3pt;text-indent: 0pt;text-align: left;"
                                                >ClinicalDocument/documentationOf/serviceEvent/effectiveTime/low
                                                ClinicalDocument/documentationOf/serviceEvent/effectiveTime/high</p></td>
                                    </tr>
                                
                                    <tr style="height:25pt">
                                        <td
                                            style="width:65pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"
                                            rowspan="2"><p
                                                style="text-indent: 0pt;text-align: left;"
                                                ><br /></p><p class="s68"
                                                style="padding-left: 21pt;padding-right: 21pt;text-indent: 0pt;text-align: center;"
                                                >Title</p></td>
                                        <td
                                            style="width:52pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"
                                                ><p class="s69"
                                                style="padding-top: 1pt;padding-left: 3pt;text-indent: 0pt;text-align: left;"
                                                >IHE</p><p class="s69"
                                                style="padding-left: 3pt;text-indent: 0pt;text-align: left;"
                                                >Metadata</p></td>
                                        <td
                                            style="width:372pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"
                                                ><p class="s70"
                                                style="padding-top: 6pt;padding-left: 3pt;text-indent: 0pt;text-align: left;"
                                                  >DocumentEntry.<span style=" color: #000;"
                                                  >title</span></p></td>
                                    </tr>
                                    <tr style="height:22pt">
                                        <td
                                            style="width:52pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"
                                                ><p class="s69"
                                                style="padding-left: 3pt;text-indent: 0pt;text-align: left;"
                                                >C-CDA</p><p class="s69"
                                                style="padding-left: 3pt;text-indent: 0pt;line-height: 10pt;text-align: left;"
                                                >Header</p></td>
                                        <td
                                            style="width:372pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"
                                                ><p class="s72"
                                                style="padding-top: 5pt;padding-left: 3pt;text-indent: 0pt;text-align: left;"
                                                  >ClinicalDocument<span class="s73"
                                                >/title</span></p></td>
                                    </tr>
                                    <tr style="height:24pt">
                                        <td
                                            style="width:65pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"
                                            rowspan="2"><p class="s68"
                                                style="padding-top: 9pt;padding-left: 21pt;padding-right: 8pt;text-indent: -12pt;text-align: left;"
                                                >Document Type</p></td>
                                        <td
                                            style="width:52pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"
                                                ><p class="s69"
                                                style="padding-left: 3pt;text-indent: 0pt;text-align: left;"
                                                >IHE</p><p class="s69"
                                                style="padding-left: 3pt;text-indent: 0pt;line-height: 11pt;text-align: left;"
                                                >Metadata</p></td>
                                        <td
                                            style="width:372pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"
                                                ><p class="s70"
                                                style="padding-top: 6pt;padding-left: 3pt;text-indent: 0pt;text-align: left;"
                                                  >DocumentEntry.<span style=" color: #000;"
                                                  >typeCode</span></p></td>
                                    </tr>
                                    <tr style="height:22pt">
                                        <td
                                            style="width:52pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"
                                                ><p class="s69"
                                                style="padding-left: 3pt;text-indent: 0pt;text-align: left;"
                                                >C-CDA</p><p class="s69"
                                                style="padding-left: 3pt;text-indent: 0pt;line-height: 10pt;text-align: left;"
                                                >Header</p></td>
                                        <td
                                            style="width:372pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"
                                                ><p class="s71"
                                                style="padding-top: 5pt;padding-left: 3pt;text-indent: 0pt;text-align: left;"
                                                >ClinicalDocument/code</p></td>
                                    </tr>
                                    <tr style="height:23pt">
                                        <td
                                            style="width:65pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"
                                            rowspan="2"><p
                                                style="text-indent: 0pt;text-align: left;"
                                                ><br /></p><p class="s68"
                                                style="padding-left: 16pt;text-indent: 0pt;text-align: left;"
                                                >Author</p></td>
                                        <td
                                            style="width:52pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"
                                                ><p class="s69"
                                                style="padding-left: 3pt;text-indent: 0pt;text-align: left;"
                                                >IHE</p><p class="s69"
                                                style="padding-left: 3pt;text-indent: 0pt;line-height: 10pt;text-align: left;"
                                                >Metadata</p></td>
                                        <td
                                            style="width:372pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"
                                                ><p class="s70"
                                                style="padding-top: 5pt;padding-left: 3pt;text-indent: 0pt;text-align: left;"
                                                  >DocumentEntry.<span style=" color: #000;"
                                                  >authorPerson</span></p></td>
                                    </tr>
                                    <tr style="height:26pt">
                                        <td
                                            style="width:52pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"
                                                ><p class="s69"
                                                style="padding-top: 2pt;padding-left: 3pt;text-indent: 0pt;text-align: left;"
                                                >C-CDA</p><p class="s69"
                                                style="padding-left: 3pt;text-indent: 0pt;text-align: left;"
                                                >Header</p></td>
                                        <td
                                            style="width:372pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"
                                                ><p class="s71"
                                                style="padding-top: 7pt;padding-left: 3pt;text-indent: 0pt;text-align: left;"
                                                >ClinicalDocument/author/assignedAuthor/assignedPerson</p></td>
                                    </tr>
                                    <tr style="height:23pt">
                                        <td
                                            style="width:65pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"
                                            rowspan="2"><p
                                                style="text-indent: 0pt;text-align: left;"
                                                ><br /></p><p class="s68"
                                                style="padding-left: 3pt;text-indent: 13pt;text-align: left;"
                                                >Author Organization</p></td>
                                        <td
                                            style="width:52pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"
                                                ><p class="s69"
                                                style="padding-left: 3pt;text-indent: 0pt;text-align: left;"
                                                >IHE</p><p class="s69"
                                                style="padding-left: 3pt;text-indent: 0pt;line-height: 10pt;text-align: left;"
                                                >Metadata</p></td>
                                        <td
                                            style="width:372pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"
                                                ><p class="s70"
                                                style="padding-top: 5pt;padding-left: 3pt;text-indent: 0pt;text-align: left;"
                                                  >DocumentEntry.<span style=" color: #000;"
                                                  >authorInstitution</span></p></td>
                                    </tr>
                                    <tr style="height:36pt">
                                        <td
                                            style="width:52pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"
                                                ><p class="s69"
                                                style="padding-top: 6pt;padding-left: 3pt;text-indent: 0pt;text-align: left;"
                                                >C-CDA</p><p class="s69"
                                                style="padding-left: 3pt;text-indent: 0pt;text-align: left;"
                                                >Header</p></td>
                                        <td
                                            style="width:372pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"
                                                ><p class="s71"
                                                style="padding-left: 3pt;text-indent: 0pt;text-align: left;"
                                                >ClinicalDocument/author/assignedAuthor/
                                                representedOrganization/name</p></td>
                                    </tr>
                                    <tr style="height:24pt">
                                        <td
                                            style="width:65pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"
                                            rowspan="3"><p
                                                style="text-indent: 0pt;text-align: left;"
                                                ><br /></p><p class="s68"
                                                style="padding-left: 14pt;padding-right: 13pt;text-indent: 4pt;text-align: left;"
                                                >List of Services</p></td>
                                        <td
                                            style="width:52pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"
                                                ><p class="s69"
                                                style="padding-left: 3pt;text-indent: 0pt;text-align: left;"
                                                >IHE</p><p class="s69"
                                                style="padding-left: 3pt;text-indent: 0pt;line-height: 11pt;text-align: left;"
                                                >Metadata</p></td>
                                        <td
                                            style="width:372pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"
                                                ><p class="s70"
                                                style="padding-top: 6pt;padding-left: 3pt;text-indent: 0pt;text-align: left;"
                                                  >DocumentEntry.<span style=" color: #000;"
                                                  >eventCodeList</span></p></td>
                                    </tr>
                                    <tr style="height:33pt">
                                        <td
                                            style="width:52pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"
                                                ><p class="s69"
                                                style="padding-left: 3pt;padding-right: 3pt;text-indent: 0pt;line-height: 11pt;text-align: left;"
                                                >Encounter Summary C- CDA Header</p></td>
                                        <td
                                            style="width:372pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"
                                                ><p style="text-indent: 0pt;text-align: left;"
                                                ><br /></p><p class="s71"
                                                style="padding-left: 3pt;text-indent: 0pt;text-align: left;"
                                                >ClinicalDocument/documentationOf/serviceEvent/code</p></td>
                                    </tr>
                                    <tr style="height:46pt">
                                        <td
                                            style="width:52pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"
                                                ><p class="s69"
                                                style="padding-left: 3pt;padding-right: 13pt;text-indent: 0pt;text-align: left;"
                                                >Patient Summary C-CDA</p><p class="s69"
                                                style="padding-left: 3pt;text-indent: 0pt;line-height: 11pt;text-align: left;"
                                                >Header</p></td>
                                        <td
                                            style="width:372pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"
                                                ><p class="s71"
                                                style="padding-left: 3pt;text-indent: 0pt;text-align: left;"
                                                >Not Applicable - the service event information in a
                                                patient summary is restricted to “Provision of
                                                Care”. The document</p><p class="s71"
                                                style="padding-left: 3pt;text-indent: 0pt;line-height: 11pt;text-align: left;"
                                                >does not contain details about the services
                                                provided during the span of time covered by the
                                                document.</p></td>
                                    </tr>
                                    <tr style="height:24pt">
                                        <td
                                            style="width:65pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"
                                            rowspan="3"><p
                                                style="text-indent: 0pt;text-align: left;"
                                                ><br /></p><p class="s74"
                                                style="padding-left: 21pt;text-indent: -7pt;text-align: left;"
                                                >Practice Type</p></td>
                                        <td
                                            style="width:52pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"
                                                ><p class="s69"
                                                style="padding-left: 3pt;text-indent: 0pt;text-align: left;"
                                                >IHE</p><p class="s69"
                                                style="padding-left: 3pt;text-indent: 0pt;line-height: 11pt;text-align: left;"
                                                >Metadata</p></td>
                                        <td
                                            style="width:372pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"
                                                ><p class="s70"
                                                style="padding-top: 6pt;padding-left: 3pt;text-indent: 0pt;text-align: left;"
                                                  >DocumentEntry.<span style=" color: #000;"
                                                  >practiceSettingCode</span></p></td>
                                    </tr>
                                    <tr style="height:35pt">
                                        <td
                                            style="width:52pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"
                                                ><p class="s69"
                                                style="padding-left: 3pt;padding-right: 3pt;text-indent: 0pt;line-height: 11pt;text-align: left;"
                                                >Encounter Summary C- CDA Header</p></td>
                                        <td
                                            style="width:372pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"
                                                ><p class="s71"
                                                style="padding-left: 3pt;text-indent: 0pt;text-align: left;"
                                                >ClinicalDocument/componentOf/encompassingEncounter/
                                                location/healthcareFacility</p></td>
                                    </tr>
                                    <tr style="height:44pt">
                                        <td
                                            style="width:52pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"
                                                ><p class="s69"
                                                style="padding-left: 3pt;padding-right: 13pt;text-indent: 0pt;text-align: left;"
                                                >Patient Summary C-CDA</p><p class="s69"
                                                style="padding-left: 3pt;text-indent: 0pt;line-height: 10pt;text-align: left;"
                                                >Header</p></td>
                                        <td
                                            style="width:372pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"
                                                ><p style="text-indent: 0pt;text-align: left;"
                                                ><br /></p><p class="s71"
                                                style="padding-left: 3pt;text-indent: 0pt;text-align: left;"
                                                >Not Applicable - Patient Summary may multiple
                                                practice types</p></td>
                                    </tr>
                                    <tr style="height:25pt">
                                        <td
                                            style="width:65pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"
                                            rowspan="2"><p
                                                style="text-indent: 0pt;text-align: left;"
                                                ><br /></p><p class="s74"
                                                style="padding-left: 3pt;text-indent: 0pt;text-align: left;"
                                                >Format Code</p></td>
                                        <td
                                            style="width:52pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"
                                                ><p class="s69"
                                                style="padding-top: 1pt;padding-left: 3pt;text-indent: 0pt;text-align: left;"
                                                >IHE</p><p class="s69"
                                                style="padding-left: 3pt;text-indent: 0pt;text-align: left;"
                                                >Metadata</p></td>
                                        <td
                                            style="width:372pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"
                                                ><p class="s70"
                                                style="padding-top: 6pt;padding-left: 3pt;text-indent: 0pt;text-align: left;"
                                                  >DocumentEntry.<span style=" color: #000;"
                                                  >formatCode</span></p></td>
                                    </tr>
                                    <tr style="height:23pt">
                                        <td
                                            style="width:52pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"
                                                ><p class="s69"
                                                style="padding-left: 3pt;text-indent: 0pt;text-align: left;"
                                                >C-CDA</p><p class="s69"
                                                style="padding-left: 3pt;text-indent: 0pt;line-height: 10pt;text-align: left;"
                                                >Header</p></td>
                                        <td
                                            style="width:372pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"
                                                ><p class="s71"
                                                style="padding-left: 3pt;text-indent: 0pt;line-height: 11pt;text-align: left;"
                                                >Not Applicable - the formatCode is inferred by
                                                the</p><p class="s71"
                                                style="padding-left: 3pt;text-indent: 0pt;line-height: 10pt;text-align: left;"
                                                >templateIDs asserted in the Header</p></td>
                                    </tr>
                                </table>
**Table 7: from Concise Consolidated CDA: Deploying Encounter Summary Documents with Clinical Notes. Document Information Available during the IHE Query and in the stored C-CDA**<br/>
The meta data mapping provides best practice guidance for use with query/retrieve operations. It also applies to best practices for display of documents received via Direct. Display of these metadata elements offer useful information when selecting documents for retrieval or review.

### Clinical Notes

The term “clinical note” can be used to mean different things, depending on the context of use.

For example, the term “clinical note” can refer to an entire C-CDA document. A C-CDA document is a clinical note
in that it includes all the clinical information that is relevant and pertinent to a care encounter, a span of time
when care services have been delivered, or a point in time when clinical information about a patient needs to be
shared across systems. C-CDA, in fact, was developed to exchange clinical notes in this sense of the term.

Additionally, the term clinical note is often used to describe a document authored by a clinician to capture the
health story of a patient – this may include their past and current health as well as planned next steps to improve
their health. Clinical notes are a critical part of the patient record. Prior to the formation of the Joint Document
Content Work Group the independent Car _e_ quality and CommonWell content work groups were discussing
methods to exchange clinical notes in C-CDA. Additionally, in response to requirements within the 21st Century
Cures Act, to identify a common set of data for exchange, the Office of the National Coordinator (ONC) has
included Clinical Notes in U.S. Core Data for Interoperability (USCDI). The exchange of clinical notes is also a high
priority for the further development of the Fast Healthcare Interoperability Resources (FHIR) specification as
supported through the Argonaut Project.^45

Within EHR systems, a clinical note may refer to narrative information that is entered by a clinician in a patient’s
record. This type of clinical note is clinical information that is not captured as structured data. It exists within the
context of a patient’s record and is part of the documentation gathered during an encounter or related to a
specific care event. A clinical note of this type could be a single sentence to record an impression, or it could be a
paragraph of information that tells a larger story. It is part of the larger clinical note produced to tell the whole
story of the encounter.

Regardless of the granularity, clinical note information can be categorized by the type of information contained in
the note. Several common categories of clinical notes exist to help classify and organize much of the clinical
information exchange today. The categories can apply to collections of information gathered as a whole
document, a Notes Section within a larger document, or a single Note Activity entry that holds a narrative clinical
note that appears within a standard structured section.

A clinical note created and managed in an EHR system may be represented for exchange with other systems using
a C-CDA document template designed for that type of clinical note. The document templates defined in C-CDA
establish the section structure for several common types of structured clinical notes. Not all systems used by
practitioners to generate clinical notes maintain internal information structures sufficient to classify clinical note
information into the structured sections defined for C-CDA structured documents.

To address the challenge that clinical notes in an EHR systems have varying levels of identifiable structure, C-CDA
defines clinical note templates at different levels.

Clinical note information that can be represented as a complete document using the section structures required
and recommended by C-CDA document-level templates may be exchanged as a structured clinical note document.

Clinical note information which does not contain all the structure required for a C-CDA document may be
represented within a section-level template in the context of a larger collection of information pulled together to
complete the content required by the document-level template. A Notes Section is used when the type of clinical
note information that needs to be shared isn’t specifically aligned with one of the standard sections defined for the
document.

An entry-level template called the Note Activity template is defined to represent narrative clinical note information
from the originating system. A Note Activity entry is used to represent clinical note information within a document
section in a machine processable format.

This layered approach to representing clinical notes in C-CDA enables the wide range of information gathered in
EHR systems to represented and shared via a CDA Document. Narrative note information as well as discrete data
can be included and encoded in a structure way that facilitates both human readability and machine processing.

**Reference:** [Clinical Note](representation_of_discrete_data.html#clinical-note); [The Joint Document Content Work Group](resources.html#the-joint-document-content-work-group); [Appendix A: Templates Defined in C-CDA R2.1 Companion Guide](resources.html#appendix-a:-templates-defined-in-c-cda-r2.1-companion-guide)

#### LOINC Coding for Clinical Notes

Logical Observation Identifiers Names and Codes (LOINC) is an international standard code set developed and
maintained by the Regenstrief Institute for identifying clinical information.^46 Since its inception, Regenstrief has
developed LOINC as an open standard and is available at no cost. LOINC is used worldwide for the exchange and
pooling of clinical results for care delivery, outcomes management, public health reporting, document
management, and research. Used in conjunction with standards for messages, documents, and APIs, LOINC
supports efficient processing and storage of data from disparate sources. When exchanging clinical information
between providers and with payers, attachment requests and attachment submissions use LOINC codes to identify
the type of information desired and the information provided.^47

The LOINC terminology includes thousands of different clinical note types.^48 These codes can be used at the
document, section, or entry level to categorize the type of clinical note information being shared. To focus the
industry, the Argonaut participants and the Department of Veterans Affairs contributed their most commonly used
note types to develop the following list of most frequently created clinical note documents.^49 The table below
includes the clinical note type, the most general LOINC code available for this type of document, and the value set
listing the full range of LOINC codes available for the clinical notes of that type.

The clinical note type value sets are established by the HL7 Payer/Provider Information Exchange Work Group. The
value sets use LOINC document codes, are maintained by Regenstrief Institute, and are published through the US
National Library of Medicine Value Set Authority Center (VSAC).^50 Each value set is identified by a unique object
identifier (OID). These value sets  are included in the C-CDA value set expansion package available as a VSAC
downloadable resource.^51

^46 For more information on LOINC, visit https://loinc.org
^47 [HL7 CDA R2 Attachments IG: Exchange of C-CDA Based Documents, R1](https://www.hl7.org/implement/standards/product_matrix.cfm) – US Realm, Page 22.
^48 LOINC website Regenstrief administers: https://loinc.org/
^49 Concise Consolidated CDA: Deploying Encounter Summary Documents with Clinical Notes. Carequality and CommonWell Work Groups. 2018. Page 14.
^50 https://vsac.nlm.nih.gov/
^51 https://vsac.nlm.nih.gov/valueset/expansions?pr=ccda

| **Clinical Note Type**   | **Most General LOINC Code**    | **LOINC Long Name**    | **Complete Note Type Value Set**    |
| ---- | ------ | ------ | ------ |
| **Discharge Summary Note**   | 18842-5  | Discharge summary | DischargeSummaryDocumentType<br />2.16.840.1.113883.11.20.4.1 |
| **Consultation Note**   | 11488-4  | Consult Note | ConsultDocumentType<br />2.16.840.1.113883.11.20.9.31 |
| **Imaging Narrative Note**   | 18748-4  | Diagnostic imaging study | CompleteNoteType<br />1.3.6.1.4.1.12009.10.2.5 |
| **Laboratory Narrative Note**   | 11502-2  | Laboratory report | Note Types<br />2.16.840.1.113883.11.20.9.68 |
| **Pathology Narrative Note**   | 11526-1  | Pathology study | Note Types<br />2.16.840.1.113883.11.20.9.68 |
| **History & Physical Note**   | 34117-2  | History and physical note | HPDocumentType<br />2.16.840.1.113883.1.11.20.22 |
| **Progress Note**   | 11506-3  | Progress note | ProgressNoteDocumentType<br />2.16.840.1.113883.11.20.8.1 |
| **Procedures Note**   | 28570-0  | Procedure note | ProcedureNoteDocumentType<br />2.16.840.1.113883.11.20.6.1 |
{:.grid}
**Table 8: LOINC Coding for Document Level clinical note types**

The list was not provided in a priority order, nor was it intended to represent the exclusive list of what systems can
and will support. Guidance from the Joint Document Content Work Group encouraged support for C-CDA
document templates of these clinical note types.

<table
                                    style="border-collapse:collapse;margin-left:24.01pt"
                                    cellspacing="0">
                                    <tr style="height:26pt">
                                        <td
                                            style="width:468pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"
                                                bgcolor="#C5D9F0"><p class="s19"
                                                style="padding-left: 41pt;text-indent: 0pt;line-height: 12pt;text-align: left;"
                                                >C-CDA Content Creators SHOULD support creation of
                                                C-CDA documents for multiple clinical note
                                                types.<b>[BP-002]</b></p></td>
                                    </tr>
                                </table>

Guidance from the Joint Content Document Work Group also encouraged support for the Notes Section template
which covers the standardized clinical note sections for use in C-CDA structured documents shown below.

The table below includes common categories of clinical note information. These LOINC codes are used to identify
a section that includes narrative clinical notes of this type. These LOINC codes also are used to identify an
individual clinical note when it is included as a machine processable entry within a standard C-CDA section. The
Note Types value set (2.16.840.1.113883.11.20.9.68) identifies the full set of LOINC Codes that can be used with
the Notes Section and the Note Activity entry.

| **Type of Narrative Clinical Note Information**   | **LOINC Code for Note Section and/or Note Activity Entry**    |
| ---- | ------ |
| **Consultation Note**   | 11488-4  |
| **Discharge Summary Note**   | 18842-5  |
| **History & Physical Note**   | 34117-2  |
| **Imaging Narrative Note**   | Appropriate LOINC Code with Scale = DOC |
| **Laboratory Narrative Note**   | 11502-2 |
| **Note**   | 34109-9  |
| **Nurse Note**   | 34746-8  |
| **Pathology Narrative Note**   | 11526-1  |
| **Patient Note**   | 51855-5  |
| **Procedures Note**   | 28570-0  |
| **Progress Note**   | 11506-3  |
| **Referral Note**   | 57133-1  |
| **Surgical Operation Note**   | 11504-8  |
| **Transfer Summary Note**   | 18761-7  |
{:.grid}
**Table 9: LOINC Codes for section- and entry- level clinical notes**


<table
                                    style="border-collapse:collapse;margin-left:24.01pt"
                                    cellspacing="0">
                                    <tr style="height:26pt">
                                        <td
                                            style="width:468pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"
                                                bgcolor="#C5D9F0"><p class="s19"
                                                style="padding-left: 41pt;text-indent: 0pt;line-height: 12pt;text-align: left;"
                                                >C-CDA Content Creators SHOULD support inclusion of narrative clinical note information 
                                                in structured sections of C-CDA documents.<b>[BP-027]</b></p></td>
                                    </tr>
                                </table>


**Reference:** [Sections Defined in C-CDA (ordered using SOAP framework)](section_level_guidance.html#sections-defined-in-c-cda-(ordered-using-soap-framework)); [Clinical Note](representation_of_discrete_data.html#clinical-note);

### Options for Temporarily Unavailable Data

There may be situations when information is not available at the time a CDA document is created. In these cases, a
document containing available information may be sent. If the document type being sent requires a section for
which the information is not yet available, the required section should be coded at the section-level to indicate the
information for that section is “not available” using the ”null”Flavor="NAV" attribute. If the document type being
sent indicates the section for which information is not yet available is an optional section, then inclusion of that
section is not needed.

At a later point in time, when the information becomes available to complete the document, a new version of the
document may be created and marked to communicate that it supersedes the previous version of the document.
Specifically, the new document is identified with a globally unique identifier in the clinicalDocument.id field. The
relatedDocument/typeCode=“RPLC” and the relatedDocument/typeCode=”RPLC”/parentDocument/id element
will be set to reference the prior document’s clinicalDocument.id.

The setId and versionNumber fields are only used to indicate that the new document is not considered a new
document, but rather is considered a new version of a prior document. One use case for using issuing a new
version of an existing document would be when correcting an error in the content of the document. Another
example might be when distributing the same document to more or different information recipients. Business
rules determine the circumstances when a document instance is a new document or a new version of an existing
document.

An example includes the requirement of a Hospital Course section within a Discharge Summary. Typically, this
section is not available at the time of a hospital discharge. However, but the Discharge Summary document type
may still be used to meet the objective for transmitting health information within 36 hours of the hospital
discharge. In this example, the incomplete Discharge Summary may be sent at the time of discharge and a new
Discharge Summary may be sent later to communicate the updated information.

**Example 2: Discharge Summary with no Hospital Course information (see replacement document below).**
```
<ClinicalDocument xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sdtc="urn:hl7-
    org:sdtc" classCode="DOCCLIN" moodCode="EVN" xmlns="urn:hl7-org:v3">
    <realmCode code="US" />
    <typeId root="2.16.840.1.113883.1.3" extension="POCD_HD000040" />
    <templateId root="2.16.840.1.113883.10.20.22.1.1" extension="2015-08- 01" />
    <templateId root="2.16.840.1.113883.10.20.22.1.8" extension="2015-08- 01" />
    <id root="2.16.840.1.113883.19.5.99999.1" extension="20160414014447" />
    <code codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC" code="18842-5"
        displayName="Discharge Summary" />
    <title>Health Summary</title>
    <effectiveTime value="20160414014447-0500" />
    <confidentialityCode codeSystem="2.16.840.1.113883.5.25" code="N" />
    <languageCode code="en-US" />
    <setId extension="20160414014447" root="2.16.840.1.113883.19.5.99999.19" />
    <versionNumber value="1" />
    ...
    <section nullFlavor="NAV">
        <templateId root="1.3.6.1.4.1.19376.1.5.3.1.3.5"/>
        <code code="8648-8"
            displayName="HOSPITAL COURSE"
            codeSystem="2.16.840.1.113883.6.1"
            codeSystemName="LOINC"/>
        <title>Hospital Course</title>
        <text>Information Not Available</text>
    </section>
    ...
</ClinicalDocument>
```

**Example 3: Replacement Discharge Summary document with Hospital Course information.**

> The addition of Hospital Course information is not an errata correction, so it does not generate a new
version of the document. The new document is indicated to wholly replace the prior document.
```
<ClinicalDocument xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sdtc="urn:hl7-
    org:sdtc" classCode="DOCCLIN" moodCode="EVN" xmlns="urn:hl7-org:v3">
    <realmCode code="US" />
    <typeId root="2.16.840.1.113883.1.3" extension="POCD_HD000040" />
    <templateId root="2.16.840.1.113883.10.20.22.1.1" extension="2015-08- 01" />
    <templateId root="2.16.840.1.113883.10.20.22.1.8" extension="2015-08- 01" />
    <id root="2.16.840.1.113883.19.5.99999.1" extension="20160414145050" />
    <code codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC" code="18842-5"
        displayName="Discharge Summary" />
    <title>Health Summary</title>
    <effectiveTime value="20160414145050-0500" />
    <confidentialityCode codeSystem="2.16.840.1.113883.5.25" code="N" />
    <languageCode code="en-US" />
    <setId extension="20160414014447" root="2.16.840.1.113883.19.5.99999.19" />
    <versionNumber value="2" />
    <relatedDocument typeCode="RPLC">
        <parentDocument>
            <id root="2.16.840.1.113883.19.5.99999.1" extension="20160414014447" />
            <code codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC" code="18842-5"
                displayName="Discharge Summary" />
            <setId extension="20160414014447" root="2.16.840.1.113883.19.5.99999.19" />
            <versionNumber value="1" />
        </parentDocument>
    </relatedDocument>
    <section>
        <templateId root="1.3.6.1.4.1.19376.1.5.3.1.3.5"/>
        <code code="8648-8"
            displayName="HOSPITAL COURSE"
            codeSystem="2.16.840.1.113883.6.1"
            codeSystemName="LOINC"/>
        <title>Hospital Course</title>
        <text>The patient was admitted and started on Lovenox and nitroglycerin paste. ...</text>
    </section>
</ClinicalDocument>
```