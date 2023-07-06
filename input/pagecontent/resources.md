The following resources are available to the C- CDA implementer community to support the growing use of this
important information exchange standard for interoperability.

### Sample C-CDA Files

There are sample C-CDA files for a variety of Clinical Note types. Sample documents are posted in Github where
they are incrementally improved by the CDA Examples Task Force. Reference the C-CDA Sample Document
registry for the current version of these sample documents.^140

(^140) https://github.com/HL7/CDA-ccda-companion/tree/9832019cd7a324c445057e5f44c50897cb7e475b/examples/xml

| **Type**   | **C-CDA Sample File Name and brief description**    |
| ---- | ------ |
| **Discharge Summary showing USCDI v2 Data Elements**   | DischargeSummary-USCDI-v2.xml<br /><br />This sample file represents new and revised templates necessary to convey USCDI V2 data elements.  |
| **CCD Patient Summary**   | CCD.xml<br /><br />This sample demonstrates sections relevant to creating a summary of essential clinical data to exchange from a patient’s health record.  |
| **Discharge Summary**   | DischargeSummary.xml<br /><br />This sample demonstrates sections relevant to creating a summary of information that supports a transfer of care following an inpatient discharge.  |
| **Referral Note**   | ReferralNote.xml<br /><br />This sample demonstrates sections relevant when initiating a referral to support a transfer of care to another care provider.  |
| **Progress Note**   | ProgressNote.xml<br /><br />This sample demonstrates sections relevant for documenting a patient’s progress during an ongoing episode of care.  |
| **Care Plan**   | CarePlan.xml<br /><br />This sample demonstrates the organization of care plan information for exchange. It shows the relationships between health concerns, goals, interventions and health assessment and outcome evaluation information are expressed.  |
| **Unstructured Document**   | UnstructuredDocument.xml<br /><br />This sample demonstrates use of the <nonXMLbody> option for a C-CDA document.  |
| **Legal Authenticator-signed**   | LegalAuthenticator-signed.xml<br /><br />This sample demonstrates use of the HL7 Digital Signature standard for digitally signing a C-CDA document as the Legal Authenticator.  |
{:.grid}
**Table 77: Sample Document Files**

### Published HL7 CDA and C-CDA Specifications

The HL7 Version 3 Clinical Document Architecture (CDA®) is a document markup standard that specifies the
structure and semantics of "clinical documents" for the purpose of exchange between healthcare providers and
patients. It defines a clinical document as having the following six characteristics: 1) Persistence, 2) Stewardship, 3)
Potential for authentication, 4) Context, 5) Wholeness and 6) Human readability.

CDA R2.0 is the currently release normative version of the HL7 CDA standard. However, implementers are
encouraged to begin educating themselves about the improvements offered by the new CDA R2.1. CDA R2.1 is a
minor enhancement of the base Clinical Document Architecture standard that is backward compatible to the
existing CDA R2.0 standard and provides optional improvements which natively support most previous extensions
used in implementation guides worldwide.

Notable extensions have been added to the patient reference and classes in the clinical statement model used for
machine process-ability. The documentation has been improved and updated to explain how CDA can be
constrained using templating to support any number of use cases found in healthcare using a base schema just like
CDA R2.0.

A CDA document can be used to represent any type of clinical content -- a CDA document could be used to
represent a Discharge Summary, Imaging Report, Admission & Physical, Pathology Report and more. The most
popular use is for inter-enterprise information exchange, such as is envisioned for a US Health Information
Exchange (HIE). The HL7 C-CDA Implementation Guide constrains the base CDA standard to meet the use cases for
information exchange of common types of clinical notes.

As the demand for interoperable information exchange in healthcare grows, stakeholders across the C-CDA
implementer community continue to develop and publish additional templating guidance to supplement the set of
templates defined in C-CDA. Supplemental C-CDA implementation guides are balloted through the HL7 consensus
process and published together with C-CDA on the HL7 Master Grid of Standards. Supplemental C-CDA
implementation guides define additional templates and new versions of templates in C-CDA. All templates in
Supplemental C-CDA implementation guides are considered for optional use.

<pre>
<b>Source:</b> HL7 CDA® Release 2
<b>Resource:</b> <a href="https://www.hl7.org/implement/standards/product_brief.cfm?product_id=7">https://www.hl7.org/implement/standards/product_brief.cfm?product_id=7</a>
<b>Description:</b> This package includes additional publications such as Datatypes, HL7 Value Sets, and other detailed
information required for proper implementation of CDA.
</pre>

<pre>
<b>Source:</b> CDA Management Group Listserv for HL7 CDA® Release 2.1
<b>Resource:</b> <a href="http://www.hl7.org/Special/committees/cdamg/index.cfm">http://www.hl7.org/Special/committees/cdamg/index.cfm</a>
<b>Description:</b> At this time, there are no plans to migrate to the new version of CDA within the US. However, the
CDA Management Group will begin an information gathering campaign in 2020 to allow the implementer
community to explore and discuss the pros and cons of introducing CDA R2.1 into production.
</pre>

<pre>
<b>Source:</b> C-CDA (HL7 CDA® R2 Implementation Guide: Consolidated CDA Templates for Clinical Notes - US Realm
R2.1)
<b>Resource:</b> <a href="http://www.hl7.org/implement/standards/product_brief.cfm?product_id=492">http://www.hl7.org/implement/standards/product_brief.cfm?product_id=492</a>
<b>Description:</b> The HL7 Consolidated CDA is an implementation guide which specifies a library of templates and
prescribes their use for a set of specific document types. The Consolidated CDA (C-CDA) implementation guide
contains a library of CDA templates, incorporating and harmonizing previous efforts from Health Level Seven
(HL7), Integrating the Healthcare Enterprise (IHE), and Health Information Technology Standards Panel (HITSP).
It represents harmonization of the HL7 Health Story guides, HITSP C32, related components of IHE Patient Care
Coordination (IHE PCC), and Continuity of Care (CCD). C-CDA Release 1 included all required CDA templates in
Final Rules for Stage 1 Meaningful Use and 45 CFR Part 170 – Health Information Technology: Initial Set of
Standards, Implementation Specifications, and Certification Criteria for Electronic Health Record Technology;
Final Rule. C-CDA R2.1 guide was developed and produced by the HL7 Structured Documents Workgroup. It
updates the C-CDA R2 (2014) guide to support “on-the-wire” compatibility with R1.1 systems. The C-CDA
Release 2.1 implementation guide, in conjunction with this Companion Guide, the published C-CDA R2.1
Supplemental Guides, and the HL7 CDA Release 2 (CDA R2) standard, are to be used for implementing the
following CDA documents and header constraints for clinical notes: Care Plan including Home Health Plan of
Care (HHPoC), Consultation Note, Continuity of Care Document (CCD), Diagnostic Imaging Reports (DIR),
Discharge Summary, History and Physical (H&P), Operative Note, Procedure Note, Progress Note, Referral Note,
Transfer Summary, as well as patient generated documents and all types of unstructured documents classified
under the LOINC document ontology.
</pre>

<pre>
<b>Source:</b> C-CDA R2.1; Advance Directives Templates, Release 1 – US Realm
<b>Resource:</b> <a href="https://www.hl7.org/implement/standards/product_brief.cfm?product_id=473">https://www.hl7.org/implement/standards/product_brief.cfm?product_id=473</a>
<b>Description:</b> Advance Directive Templates are important components of the C-CDA standard, yet to date, their
usage in the standard has been optional. New focus within the industry on patient-centered care plans and
value-based care has raised implementer interest in care planning and advance care planning. As implementers
have started to include advance directive information, it became clear that additional guidance was needed and
that the template designs required refinement. Also, the new standard was developed to represent personal
advance care planning information have been developed to communicate health goals and treatment
preferences expressed by the patient. The older Advance Directive templates needed revisions to take the
newer work into consideration.
<br/>

As advance care planning information began to be shared, concern increased about the possibility that clinicians
might misinterpret patient wishes in a way that would result in errors that risk patient safety or that violate
patient intent. Information context is crucial when it comes to interpreting advance directives. Directives should
always be maintained in their original form - not chopped up and stored as structured data. There is a very high
risk that the conversion from text to structure will lose critical information. Changes were needed to the
templates to clarify that these observations DO NOT convert patient wishes into structured data that acts as a
decision or an order. The structured data is used to document WHAT TYPE of CONTENT is present in the source
document that describes the patient's wishes, health goals, and treatment preferences. Fixing this issue was a
critical need.
<br/>
For these reasons, the earlier versions of the Consolidated CDA Advance Directive Templates needed to be
clarified and revised, and some additional templates needed to be added.
</pre>

<pre>
<b>Source:</b> HL7 CDA R2 Implementation Guide: C-CDA R2.1 Supplemental Templates for Nutrition, Release 1 – US
Realm
<b>Resource:</b> <a href="http://www.hl7.org/implement/standards/product_brief.cfm?product_id=478">http://www.hl7.org/implement/standards/product_brief.cfm?product_id=478</a>
<b>Description:</b> The Nutrition Care Process (NCP) is used by Registered Dietitians Nutritionists (RDN) and other
nutrition and dietetics professionals as a systematic approach to providing high quality nutrition care. Templates
in this guide are specific to the four steps of the Nutrition Care Process: Nutrition Assessment and
Reassessment, Nutrition Diagnosis, Nutrition Intervention, and Nutrition Monitoring and Evaluation. These
templates are intended to promote nutrition interoperability across care settings and will create information
suitable for reuse in transitions of care, quality measurement, public health reporting, research and
reimbursement.
</pre>

<pre>
<b>Source:</b> HL7 CDA R2 Implementation Guide: C-CDA R2.1 Supplemental Templates for Pregnancy Status, Release
1 – US Realm
<b>Resource:</b> <a href="http://www.hl7.org/implement/standards/product_brief.cfm?product_id=494">http://www.hl7.org/implement/standards/product_brief.cfm?product_id=494</a>
<b>Description:</b> This implementation guide provides consistent guidance for capturing key pregnancy status
information in healthcare information technology (HIT) products and contains optional supplemental pregnancy
status templates for current C-CDA document types.
</pre>

<pre>
<b>Source:</b> HL7 CDA® R2 Implementation Guide: C-CDA R2.1 Supplemental Templates for Occupational Data for
Health Release 1, STU Release 1.1 – US Realm
<b>Resource:</b> <a href="https://www.hl7.org/implement/standards/product_brief.cfm?product_id=522">https://www.hl7.org/implement/standards/product_brief.cfm?product_id=522</a>
<b>Description:</b> This IG contains guidance, supporting material and new templates to implement support for
Occupational Data for Health (ODH). ODH is primarily designed to facilitate clinical care, including population
health; ODH also can be used to support public health reporting, population health, and similar value-based
care. ODH is not designed to support billing activities. The scope of the work information includes:
<br/>
- Employment Status
- Retirement Date
- Combat Zone Period
- Past or Present Job for the patient or a household member
- Usual Work of the patient or a household member
</pre>

<pre>
<b>Source:</b> HL7 CDA® R2 Implementation Guide: C-CDA R2.1 Supplemental Templates for Infectious Disease,
Release 1 – US Realm
<b>Resource:</b> <a href="https://www.hl7.org/implement/standards/product_brief.cfm?product_id=502">https://www.hl7.org/implement/standards/product_brief.cfm?product_id=502</a>
<b>Description:</b> This guide defines optional additions to the C-CDA R2.1 Continuity of Care Document (CCD),
Transfer Summary, and Discharge Summary standards. These additional templates are available for use in any
other CDA document-type where needed. They specify infectious disease data that should be included in the
above-mentioned documents or any other relevant CDA document-type when patients are transferred between
healthcare facilities, discharged home, or discharged to locations other than home (e.g. law enforcement).
</pre>

<pre>
<b>Source:</b> HL7 Implementation Guide: Data Segmentation for Privacy (DS4P), Release 1
<b>Resource:</b> <a href="http://www.hl7.org/implement/standards/product_brief.cfm?product_id=280">http://www.hl7.org/implement/standards/product_brief.cfm?product_id=280</a>
<b>Description:</b> This implementation guide defines constraints on the HL7 CDA standard to support Meaningful
Use in provide data representation specifications that are consistent with federal and state privacy policies. The
guidance enables the exchange of protected/sensitive personal health information. It supports secure exchange
of health information and privacy annotations applied to documents, messages, or atomic data elementsHIT)
products and contains optional supplemental pregnancy status templates for current C-CDA document types.
</pre>

<pre>
<b>Source:</b> HL7 CDA® R2 Implementation Guide: Privacy Consent Directives, Release 1
<b>Resource:</b> <a href="http://www.hl7.org/implement/standards/product_brief.cfm?product_id=354">http://www.hl7.org/implement/standards/product_brief.cfm?product_id=354</a>
<b>Description:</b> This implementation guide defines a CDA representation of privacy consents (e.g. authorization to
disclose health information, consent for research) which enables the exchange of computable consents across
EHRs. It supports the display of consents to end-users based on existing CDA infrastructure and applications. It
also supports Data Use and Reciprocal Support Agreement (DURSA) opt-in and other opt-in consent
agreements. This specification enhances IHE BPPC (Basic Patient Privacy Consent). his implementation guide
defines constraints on the HL7 CDA standard to support Meaningful Use in provide data.
</pre>


### Published C-CDA Implementer Community Guidance

Below are brief descriptions of additional specifications relevant for C-CDA based information exchange.

#### The Joint Document Content Work Group

The Joint Document Content Work Group was established in 2018 as a cooperative effort between Car _e_ quality and
CommonWell initiatives.^141 The outcome was the white paper “Concise Consolidated CDA: Deploying Encounter
Summary CDA Documents with Clinical Notes” which provides recommendations to improve content in C-CDA for
document-based information exchange including the following topics: inclusion of Encounter Summary
Documents, best practices for Clinical Notes, and document display guidance for Smart Senders and Resilient
Receivers.


<pre>
<b>Source:</b> Concise Consolidated CDA: Deploying Encounter Summary CDA Documents with Clinical Notes
<b>Resource:</b> <a href="https://www.commonwellalliance.org/wp-content/uploads/2019/01/Improve-Joint-Document-
Content-Whitepaper.pdf">https://www.commonwellalliance.org/wp-content/uploads/2019/01/Improve-Joint-Document-
Content-Whitepaper.pdf</a>
<b>Description:</b> Provides recommendations to improved content in C-CDA.
</pre>

#### Integrating the Healthcare Enterprise (IHE)

IHE is an initiative by healthcare professionals and industry to improve the way computer systems in healthcare
share information. IHE promotes the coordinated use of established standards such as DICOM and HL7 to address
specific clinical needs in support of optimal patient care.


<pre>
<b>Source:</b> Integrating the Healthcare Enterprise (IHE) Patient Care Coordination Technical Framework Supplement:
CDA Document Summary Sections (CDA-DSS)
<b>Resource:</b> <a href="https://www.ihe.net/uploadedFiles/Documents/PCC/IHE_PCC_Suppl_CDA_DSS.pdf">https://www.ihe.net/uploadedFiles/Documents/PCC/IHE_PCC_Suppl_CDA_DSS.pdf</a>
<b>Description:</b> Provides a method to summarize and communicate specific information to the reader ( e.g.,
provider and/or patient) in a concise and useful manner. This profile can be added to any CDA document that is
an open template and allows a relevant and pertinent information in a section to be available to the reader
while including the large amount of data in a CDA document.
</pre>



<pre>
<b>Source:</b> Integrating the Healthcare Enterprise (IHE) Patient Care Coordination Technical Framework Supplement:
Multiple Content Views (MCV)
<b>Resource:</b> <a href="https://www.ihe.net/uploadedFiles/Documents/PCC/IHE_PCC_Suppl_MCV.pdf">https://www.ihe.net/uploadedFiles/Documents/PCC/IHE_PCC_Suppl_MCV.pdf</a>
<b>Description:</b> Provides guidance on how to tag text in CDA documents for rendering of the narrative for different
Document Consumers and their specific viewing requirements.
</pre>

(^141) https://www.commonwellalliance.org/wp-content/uploads/2019/01/Improve-Joint-Document-Content-Whitepaper.pdf


<pre>
<b>Source:</b> Integrating the Healthcare Enterprise (IHE) Patient Care Coordination Technical Framework Supplement:
Reconciliation of Clinical Content and Care Providers (RECON)
<b>Resource:</b> <a href="http://ihe.net/uploadedFiles/Documents/PCC/IHE_PCC_Suppl_RECON.pdf">http://ihe.net/uploadedFiles/Documents/PCC/IHE_PCC_Suppl_RECON.pdf</a>
<b>Description:</b> This profile enables Health Information Systems and Exchanges to support automation of
reconciliation of tasks and clinical workflows and the ability to communicate lists of reconciled clinical data,
when they were reconciled and who did the reconciliation using CDA constructs and FHIR Resource attributes.
</pre>

#### The Payer Community

A joint effort of the HL7 Attachments Work Group, the HL7 Structured Documents Work Group, the Centers for
Medicare & Medicaid Services (CMS), and the Office of the National Coordinator (ONC) Standards and
Interoperability (S&I) Framework Electronic Submission of Medical Documentation (esMD) Initiative that addresses
the need for additional documentation to support data required for processing claims.


<pre>
<b>Source:</b> HL7 CDA® Release 2 Implementation Guide: Additional CDA R2 Templates – Clinical Documents for
Payers Set 1, Release 1 – US Realm
<b>Resource:</b> <a href="http://www.hl7.org/implement/standards/product_brief.cfm?product_id=410">http://www.hl7.org/implement/standards/product_brief.cfm?product_id=410</a>
<b>Description:</b> Provides guidance on structured documentation templates to exchange clinical and administrative
information to support bi-lateral communication between providers and payers to expedite processing of
claims.
</pre>

#### Quality Community

The Quality Reporting Document Architecture (QRDA) project is developing a standard for communicating health
care quality measurement information. It continues to be co-sponsored by the HL7 Structured Documents and
Child Health Work Groups and is supported by the Centers for Medicare & Medicaid Services (CMS).

The Phase IV effort was launched in Summer 2014 to develop and ballot QRDA Category I, Release 3. It is co-
sponsored by the HL7 Clinical Quality Information (CQI) WG and Structured Documents Work Groups and
continues to be supported by CMS. The scope of this effort will include the following:

- Update templates to align with the QDM version 4.1.1.
- Review and triage QRDA Category I, Release 2 DSTU comments that were considered New Feature
    Requests and determine whether they are appropriate for inclusion in Release 3.
- Review the Consolidated CDA (C-CDA) templates that were used in the QRDA Category I, Release 2 DSTU,
    and where applicable, update the templates to align with the C-CDA R2 templates.


<pre>
<b>Source:</b> QRDA I Release 1, STU Release 5.1, Supports QDM v5.4
<b>Resource:</b> <a href="http://www.hl7.org/implement/standards/product_brief.cfm?product_id=35">http://www.hl7.org/implement/standards/product_brief.cfm?product_id=35</a>
<b>Description:</b> Defines the requirements for sending and receiving standards-based electronic attachments.
Defines the set of attachment documents as those that contain the minimum standard metadata to support
basic document management functions including identification of patients and providers, the type of document,
date of creation, encounter information, and a globally unique document identifier.
</pre>


<pre>
<b>Source:</b> HL7 Clinical Quality Information Workgroup
<b>Resource:</b> <a href="https://confluence.hl7.org/display/CQIWC/Clinical+Quality+Information+WG+%28CQI%29+Home">https://confluence.hl7.org/display/CQIWC/Clinical+Quality+Information+WG+%28CQI%29+Home</a>
<b>Description:</b> The Clinical Quality Information (CQI) Work Group creates and maintains HL7 standards supporting
quality measuring, evaluating, and reporting of quality data. Specific areas of interest include the measurement
and reporting of quality and its dimensions including: safe, effective, patient-centered, timely, efficient, and
equitable as defined by the Institute of Medicine (now the US Academy of Medicine).
</pre>

### Tools

Below are brief descriptions of tools available to support C-CDA development.

#### CDA Schema, C-CDA Schematrons, Sample Stylesheet

HL7 makes available resources that support implementers with their use of the CDA base standard and published
implementation guides. The resources are currently housed in the HL7 gForge repository.


<pre>
<b>Source:</b> CDA R2 Schema File
<b>Resource:</b> <a href="https://hl7.org/permalink/?CDAR2.0schema">https://hl7.org/permalink/?CDAR2.0schema</a>
<b>Description:</b> This folder contains the CDA R2 Schema file with updates that contain approved extensions.
</pre>

<pre>
<b>Source:</b> C-CDA Schematron Validation Files
<b>Resource:</b> <a href="https://github.com/HL7/cda-ccda-2.1/blob/master/schematron/Consolidation.sch">https://github.com/HL7/cda-ccda-2.1/blob/master/schematron/Consolidation.sch</a>
<b>Description:</b> This folder contains Schematron validation files for C-CDA templates and any C-CDA supplemental
templates. Note: Schematron is an optional quality criteria at this time.
</pre>

<pre>
<b>Source:</b> CDA Sample Stylesheet
<b>Resource:</b> <a href="https://hl7.org/permalink/?CDAStyleSheet">https://hl7.org/permalink/?CDAStyleSheet</a>
<b>Description:</b> This folder contains a sample stylesheet developed to expose the structured header elements and
attestable content (the section.text Narrative Block in each section) for a CDA document.
</pre>

#### ONC Validation Testing and C-CDA Scorecard Resources

The Standards Implementation & Testing Environment (SITE) is a centralized collection of testing tools and
resources designed to assist health IT developers and health IT users fully evaluate specific technical standards and
maximize the potential of their health IT implementations. SITE is organized in a collection of sandboxes that
provide test tools, sample data, collaboration resources, and useful links.


<pre>
<b>Source:</b> SITE Validation
<b>Resource:</b> <a href="https://site.healthit.gov/sandbox-ccda">https://site.healthit.gov/sandbox-ccda</a>
<b>Description:</b> The C-CDA Sandbox contains resources and tools for the HL7 Consolidated Clinical Document
Architecture (C-CDA) implementation guides. These tools will help in testing of C-CDA documents for
conformance to the C-CDA IG, the ONC 2014 Edition and ONC 2015 Edition C-CDA objectives and also help with
quantitative assessment of the data quality using the Scorecard.
</pre>

<pre>
<b>Source:</b> C-CDA Scorecard
<b>Resource:</b> <a href="https://ccda.healthit.gov/scorecard/">https://ccda.healthit.gov/scorecard/</a>
<b>Description:</b> The ONC Scorecard tool is used to compare a C-CDA R2.1 document against a rubric of best practice
guidance developed by the HL7 C-CDA implementer community and vetted through the HL7 ballot process. The
C- CDA Scorecard does not retain your submitted C-CDA file as the file is deleted from the server immediately
after processing. However, we strongly suggest that you do not include any Protected Health Information (PHI)
or Personally Identifiable Information (PII) in your C-CDA file submissions to the Scorecard.
</pre>

#### Model Drive Health Tools (MDHT)

MDHT allows the creation of computable models of the templates in UML. These models can be used to produce
template specifications (DITA, XHTML, PDF, Other), validation tools, and model driven code generation. Thus far,
the project has built models from the specifications including Consolidated CDA, HITSP C83, and IHE Patient Care
Coordination Technical Framework.


<pre>
<b>Source:</b> Java Runtime MDHT
<b>Resource:</b> <a href="https://github.com/mdht/mdht-models">https://github.com/mdht/mdht-models</a>
<b>Description:</b> All MDHT projects supporting the various CDA based implementation guides including Consolidate
CDA.
</pre>

<pre>
<b>Source:</b> ECLIPSE MDHT
<b>Resource:</b> <a href="https://projects.eclipse.org/projects/modeling.mdht">https://projects.eclipse.org/projects/modeling.mdht</a>
<b>Description:</b> Eclipse MDHT delivers a standard object-oriented alternative to proprietary development
methodologies and tooling used to specify and implement most healthcare industry standards. The tool
generates domain-specific Java classes for templates/profiles/archetypes.
</pre>

### Educational and Support Resources

HL7 and the C-CDA implementer community offer educational and support resources to help build essential
implementer skills and production capacity for the use of C-CDA. Information on the HL7 Confluence sites for the
SDWG and CDA Management group keeps the community informed about all aspects of the management and
methodology associated with the CDA standard and its associated product families such as C-CDA.


<pre>
<b>Source:</b> HL7 Training
<b>Resource:</b> <a href="http://www.hl7.org/implement/training.cfm?ref=nav">http://www.hl7.org/implement/training.cfm?ref=nav</a>
<b>Description:</b> HL7 training programs provide knowledge and support to guide the healthcare industry through
successful implementation of HL7 standards. Certification testing is available for specific HL7 standards including
CDA.
</pre>

<pre>
<b>Source:</b> The CDA Book
<b>Resource:</b> <a href="http://www.amazon.com/The-CDA-book-Keith-
Boone/dp/0857293354/ref=sr_1_1?ie=UTF8&qid=1337020821&sr=8-1">http://www.amazon.com/The-CDA-book-Keith-
Boone/dp/0857293354/ref=sr_1_1?ie=UTF8&qid=1337020821&sr=8-1</a>
<b>Description:</b> Written by Keith W. Boone, The CDA Book provides clear and simplified guidance for the HL7 CDA
standard, the foundation of Consolidated CDA. The book is available for purchase through retailers and is highly
recommended to assist in understanding core concepts of the standard.
</pre>

<pre>
<b>Source:</b> HL7 CDA Management Group Confluence Space
<b>Resource:</b> <a href="https://confluence.hl7.org/display/CDA/CDA+Management+Group">https://confluence.hl7.org/display/CDA/CDA+Management+Group</a>
<b>Description:</b> The HL7 CDA Management Group (CMG) is responsible for the management of the CDA standard
and its derivative product families. This website is the primary repository for their projects and meetings.
</pre>

<pre>
<b>Source:</b> HL7 SDWG Confluence Space
<b>Resource:</b> <a href="https://confluence.hl7.org/display/SD/Structured+Documents">https://confluence.hl7.org/display/SD/Structured+Documents</a>
<b>Description:</b> The HL7 Structured Documents Work Group (SDWG) is responsible for the methodology used to
develop and sustain the CDA standard and its derivative product families. This website is the primary repository
for their projects and meetings.
</pre>

<pre>
<b>Source:</b> HL7 Listserv registration
<b>Resource:</b> <a href="http://www.hl7.org/myhl7/managelistservs.cfm">http://www.hl7.org/myhl7/managelistservs.cfm</a>
<b>Description:</b> Stakeholders within the CDA and C-CDA implementer community are encouraged to sign up for the
Structured Documents and CDA Management Group listservs to stay apprised of topics relevant to the
management and maintenance of these HL7 standards.
</pre>

<pre>
<b>Source:</b> HL7 CDA Example Search
<b>Resource:</b> <a href="https://cdasearch.hl7.org/">https://cdasearch.hl7.org/</a>
<b>Description:</b> The CDA Examples Task Force has created a large number of examples showing how to convey
information accurately in a C- CDA document. The CDA Example search tool allows users to find examples based
on keywords.
</pre>


## Appendix A: Templates Defined in C-CDA R2.1 Companion Guide

**Reference** : See the file named CDAR2_IG_CCDA_COMPANION_R4_D1_AppxA included in this Companion Guide
package for Templates that are defined in this Companion Guide.

## Appendix B: UDI Organizer Template from C-CDA

## Supplemental Templates for Unique Device Identifier (UDI)

**Reference:** See the file named CDAR2_IG_CCDA_COMPANION_R4_D1_AppxB included in this Companion Guide
package for the UDI Organizer template defined in HL7 CDA® R2 Implementation Guide: C-CDA Supplemental

### Templates for Unique Device Identifier (UDI) for Implantable Medical Devices, Release 1 - US Realm