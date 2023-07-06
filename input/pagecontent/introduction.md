### Purpose: Essential Guidance for Advancing Interoperability

This companion guide titled, “Companion Guide to Consolidated Clinical Document Architecture (C-CDA) R2,”
provides essential implementer guidance to continuously expand interoperability for clinical information shared
via structured clinical notes. The guidance supplements specifications established in the Health Level Seven (HL7)
CDA® R2 IG: C-CDA Templates for Clinical Notes. This additional guidance is intended to make implementers aware
of emerging expectations and best practices for C-CDA document exchange. The objective is to increase
consistency and expand interoperability across the community of data sharing partners who utilize C-CDA for
information exchange.

The guide provides additional technical clarification and practical guidance for implementers interested in
supporting current best practices for interoperability and for those who wish to explore advancing guidance from
stakeholders throughout the C-CDA implementer community. It is part of a larger strategy to expand the level of
interoperability within the healthcare ecosystem over time. The strategy involves regularly balloting a Companion
Guide via the HL7 ballot process to document rising expectations for interoperability being driven from within the
C- CDA implementer community. Then, regularly incorporating the consensus conformance expectations into the
base C-CDA specification through the HL7 STU Update process. Over time, this new approach provides a pathway
for continuous improvement and expansion of C-CDA based information exchange.

<table><tr><td><img src="Figure1CompanionGuide.png" /></td></tr></table>
_Figure 1: Continuous Improvement Strategy_

The Companion Guide is intended to:

- Explain basic CDA concepts that are important to understand, when creating or consuming C-CDA
    documents.
- Provide guidance on best practices for consistent representation of information that is essential for
    interoperability across systems.
- Offer additional guidance that is relevant for implementers given emerging regulations and rising
    expectations for sharing information via C-CDA documents.

Guidance included in this Companion Guide is consistent with and augments the guidance and specifications
defined in the Health Level Seven (HL7) CDA® R2 IG: C-CDA Templates for Clinical Notes STU Release 2.
implementation guide. It is an integral part of the maturation process driving the growth an improvement of C-CDA
and supports the shift away from using early specifications such as C32 and C-CDA 1.1.

### The Genesis and Evolution of C-CDA

Consolidated CDA (C-CDA) is a library of CDA templates developed by HL7. It leverages prior efforts from HL7,
Integrating the Healthcare Enterprise (IHE), and Health Information Technology Standards Panel (HITSP). It
harmonizes that work and consolidates implementation guides developed under the HL7 Health Story Project. C-
CDA was originally developed within the ONC’s Standards and Interoperability (S&I) Framework to provide a
definitive set of harmonized CDA templates for the US Realm. C-CDA has evolved over time as additional
implementer guidance has been developed through the HL7 ballot process to contribute new templates that
supplement the available template library. The C-CDA R2.1 implementation guide (IG) is the currently available
version of these templates. However, additional IGs have been developed, balloted and published within the C-
CDA implementer community to supplement and expand the number of available templates. This collection of
work continues to evolve as a major enabler of information exchange and interoperability.

#### The Maturation Process for C-CDA

Currently, C- CDA R2.1 is an HL7 Standard for Trial Use that is working toward Normative.^1 The HL7 classification of
“Standard for Trial Use” (STU) classifies C-CDA R2.1 within the standards development process at HL7.^2 In order to
be useful, standards need to evolve and mature. At the same time, the evolution of standards needs to be
predictable and manageable for the implementation community. The C-CDA Companion Guide introduces an
Informative standard that contributes to the maturation of C-CDA. This section describes how HL7 develops a
standard so that implementers know what to expect as the standard evolves.

HL7 has four classifications that describe the level of stability and implementation readiness associated with
evolving specifications. They are summarized in the table below.

| Standard Level | Description |
| -------- | -------- |
| **Normative**     | This content has been subject to review and production implementation in a wide variety of environments. The content is stable and has been 'locked', subjecting it to HL7® Essential Requirements. While changes are possible, they are expected to be infrequent and are tightly constrained.     | 
| **Trial Use**     | This content has been well reviewed and is considered by the authors to be ready for use in production systems. It has been subjected to ballot and approved as an official standard. However, it has not yet seen widespread use in production across the full spectrum of environments it is which it is intended to be used. In some cases, there may be documented known issues that require implementation experience to determine appropriate resolutions.     | 
| **Informative**     | This portion of the specification is provided for implementer assistance and does not make rules that implementers are required to follow. Typical examples of this content in this specification are tables of contents, registries, examples, and implementer advice.     | 
| **Draft**     | This portion of the specification is not considered to be complete enough or sufficiently reviewed to be safe for implementation. It may have known issues or still be in the "in development" stage. It is included in the publication as a place-holder, to solicit feedback from the implementation community and/or to give implementers some insight as to functionality likely to be included in future versions of the specification. Content at this level should only be implemented “at your own risk." The content that is Draft that will usually be elevated to Trial Use once review and correction is complete after it has been subjected to ballot.     | 
{:.grid}
**Table 1: Classifications of specifications**
<br/>
^1 Normative HL7 standards are subject to accreditation by the American National Standards Institute (ANSI) and must comply with policies defined in HL7® Essential Requirements at: https://www.hl7.org/documentcenter/public/procedures/HL7_Essential_Requirements.pdf<br/>
^2 Policies for non-normative standards are defined in the HL7® Governance and Operations Manual (GOM) at: https://www.hl7.org/documentcenter/public/membership/HL7_Governance_and_Operations_Manual.pdf<br/>

Certain templates within C-CDA are more mature than others. HL7 FHIR supports a process that allows a large standard to classify component parts with different levels of maturity.^3 The CDA Management team is working to apply a maturity model to C-CDA templates.<br/>
Implementers are encouraged to submit comments regarding issues discovered in the published standard. Currently STU comments are posted on the HL7 website. See the HL7 Confluence page on [Specification Feedback](https://confluence.hl7.org/display/HL7/Specification+Feedback) for details on how to report and monitor issues discovered with standards.<br/>
Implementer comments are reviewed by the HL7 Structured Documents Work Group and disposed of on a regular basis. Periodic STU updates take into consideration balloted supplemental and companion guidance, emerging best practices, and implementer comments.

#### C-CDA Errata Process

C- CDA is regularly updated to include technical corrections and clarifications. These published updates are called
Technical Errata Releases. They are published on the HL7.org website. Only those comments with a disposition of
persuasive are considered errata. The HL7 Structured Documents Work Group reviews implementer comments on
a periodic basis and publishes an errata package to report changes that have been approved as technical
corrections. A C-CDA implementation SHALL incorporate all published errata applicable to the templates used.
When an errata package is published, it is announced through HL7 and errata packages are published on the
HL7.org website.^4 The errata package is published in the download kit for the standard. It includes a letter from
HL7 summarizing the errata, a spreadsheet list of approved errata and the base Implementation Guide to which
the errata must be applied.
<br/>
^3 HL7 FHIR. Maturity Levels. https://www.hl7.org/fhir/versions.html#std-process<br/>
^4 For more information on errata packages, visit http://www.hl7.org/implement/standards/product_brief.cfm?product_id=492<br/>

Implementers should note that to maintain a current list of the approved technical errata for C-CDA the errata
packages need to be downloaded regularly from the HL7.org website.^5

The errata version of the C-CDA Implementation Guide includes text changes to implement the errata changes.
However, it should be noted that the C-CDA Schematron is not always up-to-date with C-CDA Errata and may
contain errors of its own. Issues uncovered by use of Schematron validation must be investigated to determine if
they are true validation errors, Schematron errors, or unimplemented errata. These issues should be reported to
the HL7 Structured Documents Work Group.

#### C-CDA STU Updates

HL7 supports a Review Ballot process called, STU Update, that supports updating a standard in the trial use category. The process entails several steps summarized in the table below.

| Process Step | Summary of Activity |
| -------- | -------- |
| **Initiate an update review**     | The Technical Steering Committee (TSC), in compliance with its defined processes, may initiate the review of the subject matter of the proposed STU. Once initiated, the review ballot shall remain active until such time as the subject matter of the proposed STU has been approved or withdrawn from consideration.     |
| **Form a Consensus Group**     | All current members shall be notified of the intent to form a consensus group and ballot the content of a proposed standard for trial use. This notification shall occur via the various HL7 newsletters and member list servers and shall include the dates of enrollment in the consensus group. Members shall indicate their interest by enrolling in the appropriate consensus group via the HL7 Ballot Desktop during the enrollment period which shall end with the opening of the ballot period. The minimum consensus group shall be ten current individual members or individuals representing at least three current organizational members. The ballot shall not commence if the minimum consensus group requirement is not met. Nonmembers who wish to participate in a STU consensus group must register their intent with HL7 Headquarters during the stated enrollment period by completing the Non-Member Enrollment process through the HL7 Ballot Desktop. Nonmembers shall be assessed a fee established by HL7 for such participation.     |
| **Ballot the updated standard**     | The ballot package shall be available to all members of the consensus group for thirty days following the opening of the ballot period. Reviewers are encouraged to provide constructive comments for improving the content or language of the subject matter under review.     |
| **Handle comments**     | At the close of the review ballot the responsible Work Group (WG) shall capture all comments using the HL7 Ballot Spreadsheet unless the WG has petitioned for and been granted a waiver of such use by the Technical Steering Committee (TSC). The responsible WG shall consider all comments with the intent of improving the quality and clarity of the proposed standard. While not on a par with a normative reconciliation package, the results of the Work Group’s consideration of the comments submitted as recorded on the Ballot Spreadsheet shall be posted to the Ballot Desktop. A negative without comment shall be considered as “no response” and shall not be factored into the numerical requirements for approval. No effort shall be made to solicit comments from the submitter of a negative without comment. The process of consideration of the comments is not as complete or rigorous as normative reconciliation. There is no requirement to resolve negative comments and seek withdrawal of the negative. Nevertheless, the responsible Work Group is expected to annotate each negative comment on the reconciliation spreadsheet with a disposition of “Persuasive”, “Not Persuasive”, “Considered for Future Use”, or “Not Related” with a recorded vote and an explanation for the Work Group’s decision in accordance with the Work Group’s Decision-making Practices (DMP) to maintain transparency on decisions made. A negative ballot withdrawn at the request of the submitter shall be recorded as an affirmative. The issue of substantive change shall not be applicable to a STU. In the instance of an approved STU with substantive change resulting from review, it is left to the discretion of the responsible Work Group to either submit to another review ballot or move forward with a request to the TSC to release the revised content as a standard for trial use.    |
| **Approve**     | The proposed STU shall be considered approved if sixty percent (60%) of the combined affirmative and negative votes cast by the review group are affirmative. Upon approval and posting of the ballot reconciliation the responsible Work Group shall vote to submit a Publication Request Template to the TSC Project Manager, who shall include an item on the agenda of the next scheduled TSC meeting for the consideration of affirmation of release for publication. The Work Group vote shall be recorded in the minutes and reported on the Publication Request Template. If the proposed STU fails to be approved, it again falls to the discretion of the responsible Work Group, after appropriate revision if necessary, to either submit to another review ballot, withdraw the document from consideration, or repackage the content and submit it to the TSC for consideration as a normative ballot.     |
{:.grid}
**Table 2: Review Ballot process**
<br/>
^5 Visit http://www.hl7.org

### Semantic Interoperability: C-CDA Value Set Management

Through a community consensus process, the Healthcare Information and Management Systems Society (HIMSS)
developed the following definition for Interoperability:

|   Interoperability is the ability of different information systems, devices or applications to connect, in a
|   coordinated manner, within and across organizational boundaries to access, exchange and cooperatively
|   use data amongst stakeholders, with the goal of optimizing the health of individuals and populations that
|   characterizes four aspects to interoperability: foundational, structural, semantic, and organizational. The
|   table below summarizes the four concepts.^6


| Aspect | Relationship to Interoperability |
| -------- | -------- |
| **Foundational**     | Foundation interoperability develops the building blocks of information exchange between disparate systems by establishing the inter-connectivity requirements needed for one system or application to share data with and receive data from another. It does not outline the ability for the receiving information technology system to interpret the data without interventions from the end user or other technologies.     |
| **Structural**     | Structural interoperability defines the structure or format of data exchange (i.e., the message format standards) where there is uniform movement of healthcare data from one system to another such that the clinical or operational purpose and meaning of the data is preserved and unaltered. Structural interoperability defines the syntax of the data exchange. It ensures that data exchanges between information technology systems can be interpreted at the data field level.     |
| **Semantic**     | Semantic interoperability is the ability of two or more systems to exchange information and to interpret and use that information. Semantic interoperability takes advantage of both the structuring of the data exchange and the codification of the data, including standard, publicly available vocabulary, so that the receiving information management systems can interpret the data. Semantic interoperability supports the electronic exchange of patient data and information among authorized parties via potentially disparate health information and technology systems and products to improve quality, costs, safety, efficiency, experience and efficacy of healthcare delivery.     |
| **Operational**     | Operational interoperability encompasses the technical components as well as clear policy, social and organizational components. These components facilitate the secure, seamless and timely communication and use of data within and between organizations and individuals. Inclusion of these non-technical considerations enables interoperability that is integrated into end-user processes and workflows in a manner that supports efficiencies, relationships and overall health and wellness through cooperative use of shared data both across and within organizational boundaries.     |
{:.grid}
**Table 3: Aspects of Interoperability**
<br/>
^6 HIMSS. 2018. What Is Interoperability? https://www.himss.org/resources/interoperability-healthcare#Part1.

C- CDA Templates address both structural and semantic aspects of interoperability. The Value Sets defined and
used in the C-CDA templates constrain the semantic meaning associated with each defined template. The
combination of meaningful coded concepts in the context of meaningful data structure creates robust “clinical
statement patterns” that convey the semantic meaning of the human-readable information exchanged in the
document. The HL7 Clinical Statement model is designed to be used within multiple HL7 V3 domain models. A
Clinical Statement is intended to facilitate the consistent design of communications that convey clinical
information to meet specific use cases. The notion is applicable across all information exchange domains. A Clinical
Statement model provides a pattern that can be used by various domains to propagate commonality in the core
clinical act domain space, while allowing for controlled extensions for select participations.

Value Sets used by C-CDA play a critical role in supporting semantic interoperability.

The C-CDA implementer community works together over the course of an annual cycle to review and update the
Value Sets used in C-CDA. In some cases, specific organizations with subject matter expertise in a corresponding
area act as a Value Set steward and proactively manage the continual evolution of the Value Set as its definition
and expansions members change over time with the changing base code systems used to define the Value Set. In
other cases, HL7 acts as the steward in maintaining the Value Sets.

For ease of use they are published through the Value Set Authority Center (VSAC) maintained by the National
Library of Medicine (NLM). A Unified Medical Language System (UMLS) license is required to download the C-CDA
Value Set Release Package. The C-CDA Value Set Release Package is updated annually and published at the end of
June each year.^7

^7 https://vsac.nlm.nih.gov/

Value Set stewards and implementers need to report issues with the concepts included in or missing from a Value
Set used by C-CDA templates. The HL7 STU Comment process supports reporting issues regarding value set
definitions. Only through on-going and regular Value Set updates can the semantic interoperability of C-CDA be
maintained.

Value Set maintenance also impacts C-CDA validation.

**Reference:** [C- CDA STU Updates](introduction.html#c-cda-stu-updates); [C-CDA Templates and Schematron Validation](understanding_c-cda_and_the_c-cda_companion_guide.html#c-cda-templates-and-schematron-validation); [DisplayNameRepresentation](representation_of_discrete_data.html#displayname-representation)

### Audience

The audience for this Companion Guide includes, but is not limited to, software developers, vendors, and other
health IT implementers wishing to share information through the use of C-CDA documents. It also includes Health
IT stakeholders who receive information via C-CDA documents, such as Payers, other support service providers,
registries and researchers. This guide also includes educational content and resource references to assist general
audiences in understanding C-CDA, the base HL7 Clinical Document Architecture (CDA) standard which C-CDA is
built upon, and other implementation guidance resources available within the C-CDA community.

### Requisite Knowledge

Readers of the Companion Guide are assumed to have functional knowledge of HL7 concepts including the base
CDA specification and the Reference Information Model (RIM), as well as knowledge of value sets and data types.
Readers should also have knowledge of Extensible Markup Language (XML)^8 and XPath^9 syntax. Additionally,
readers should understand terminologies such as SNOMED CT®, LOINC®, CPT®, ICD®, and RxNorm®.

Readers of the Companion Guide also are assumed to have rudimentary knowledge of document workflow
concepts and practices associated with the creation, transport, consumption, and registration of C-CDA
documents. Many of these practices are documented by communities engaged in widespread use of C-CDA
documents for information exchange such as, eHealth Exchange, Car _e_ quality, CommonWell, Integrating the
Healthcare Enterprise (IHE.net)^10 , HIMSS Health Story Project and other HL7 Workgroup such as the Attachments
Work Group and the Clinical Quality Information (CQI) Work Group. Organizations such as Integrating the
Healthcare Enterprise and DirectTrust^11 also maintain standards that address document management, transport,
and exchange, and are included in the Interoperability Standards Advisory. Prior familiarity with the growing body
of specifications for C-CDA is not required. The Companion Guide introduces implementers to the expanding
available guidance and explains where additional guidance may be relevant to address current interoperability
challenges.

**Reference:** [Resources](resources.html#)

### Contents of this Guide

This guide is organized into six chapters and appendices as follows:

- **Chapter 1** : **Introduction** (this chapter)
- **Chapter 2** : **Understanding C-CDA and the C-CDA Companion Guide.** This chapter contains high-level
    information on foundational topics such as the HL7 Clinical Document Architecture (CDA) standard,
    CDA Schema, CDA Templates, and Schematron. It explains general concepts that are relevant for C-
    CDA documents, like structured versus unstructured documents and what it means for a document
    template to be an open template. It covers select topics from the base CDA standard and other
    general topics that are relevant for understanding the C-CDA templates and C-CDA Document
    exchange. It describes the continuous improvement strategy supported by the C- CDA Companion
    Guide and explains how implementers can use this guidance to help expand interoperability over
    time.
- **Chapter 3** : **Document-Level Guidance.** This chapter provides guidance regarding information that is
    carried in the header of C-CDA documents.
- **Chapter 4** : **Structure Document Content.** This chapter provides general guidance pertinent to the
    section-level templates used to represent information in a structured C-CDA document. It also
    includes clarification and consensus recommendation for implementing specific types.
- **Chapter 5** : **Representation of Discrete Data.** This chapter covers general guidance relevant to
    including discrete data within the body of a structured C-CDA document. It also includes clarifications
    and consensus recommendations for implementing specific types of discrete data entries within C-
    CDA sections.
- **Chapter 6** : **USCDI Guidance.** This chapter provides guidance on where information corresponding to
    ONC US Core Data for Interoperability (USCDI)^12 data classes and data elements belong within C-CDA
    documents. This includes explicit traceability to the appropriate template to use, as well as the
    explicit XPath to where the data should reside within that template.
- **Chapter 7** : **Resources.** This section provides references to additional resources for understanding C-
    CDA documents and common practices associated with sharing information via this HL7 standard.
- **Appendix A** : **Additional C-CDA Templates.** This appendix includes template definitions that have
    emerged through community collaboration to enable and expand interoperability of essential
    information. The templates augment the set of templates defined in the current version of C-CDA. As
    the C-CDA implementation guide evolves and matures, templates defined in the Companion Guide
    will be considered for incorporation with the core C-CDA specification.
- **Appendix B** : **UDI Organizer Template.** This appendix includes template definitions that define an
    organizer structure for representing the individual Universal Device Identifier (UDI) components of a
    device. The templates are designed to supplement templates in C-CDA used to represent medical
    equipment (including implantable devices) and non-medicinal supplies.
    
^8 For more information on Extensible Markup Language, visit http://www.w3.org/TR/xml/.<br/>
^9 For more information on XPath syntax, visit http://www.w3.org/TR/xpath/.<br/>
^10 For more information on Integrating the Healthcare Enterprise, visit https://www.ihe.net/ <br/>
^11 For more information on DirectTrust, visit https://www.directtrust.org/<br/>