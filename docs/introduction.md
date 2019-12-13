### Purpose

This two-volume implementation guide (IG) contains an overview of Clinical Document Architecture (CDA) markup standards, design, and use (Volume 1) and a consolidated library of CDA templates for clinical notes applicable to the US Realm (Volume 2). These two volumes comprise a Draft Standard for Trial Use (DSTU).
It has been adapted from the Release 2.0 version of the Consolidated CDA Templates for Clinical Notes to support backward compatibility “on the wire” with the 1.1 Release of the templates described in this guide. This will enable implementers of systems conforming to this guide to produce documents that can be understood by systems which only support the C-CDA Release 1.1 specification.
The consolidated library incorporates previous efforts from Health Level Seven (HL7), Integrating the Healthcare Enterprise (IHE), the Health Information Technology Standards Panel (HITSP), the HL7 Health Story guides, HITSP C32, and related components of IHE Patient Care Coordination (IHE PCC). It has additional or enhanced document types for greater expressivity and decrease ambiguity (see Volume 2 Summary of Changes). Volume 1 adds new general guidance (see Summary of Changes).
This guide, in conjunction with the HL7 CDA Release 2 (CDA R2) standard, is to be used for implementing the following CDA documents and header constraints for clinical notes.

* Care Plan including Home Health Plan of Care (HHPoC)
* Consultation Note
* Continuity of Care Document (CCD)
* Diagnostic Imaging Reports (DIR)
* Discharge Summary
* History and Physical (H&P)
* Operative Note
* Procedure Note
* Progress Note
* Referral Note
* Transfer Summary
* Unstructured Document
* Patient Generated Document (US Realm Header)

### Audience

The audience for this implementation guide includes architects and developers of healthcare information technology (HIT) systems in the US Realm that exchange patient clinical data. Business analysts and policy managers can also benefit from a basic understanding of the use of CDA templates across multiple implementation use cases.

### Organization of the Guide

This implementation guide is organized into two volumes. Volume 1 contains primarily narrative text describing the Consolidated CDA Release 2 (C-CDA R2) guide, whereas Volume 2 contains normative CDA template definitions.

#### Volume 1 Introductory Material

approach to implementation guide development.

* Chapter 3 - Design Considerations. This section includes design considerations that describe overarching principles that have been developed and applied across the CDA templates in this guide. Material in this section can be thought of as “heuristics”, as opposed to the formal and testable constraints found in Volume 2 of this guide.
* Chapter 4 - Using This Implementation Guide. This section describes the rules and formalisms used to constrain the CDA R2 standard. It describes the formal representation of CDA templates, the mechanism by which templates are bound to vocabulary, and additional information necessary to understand and correctly implement the normative content found in Volume 2 of this guide.
* Appendices - The Appendices include a high-level change log, a summary of extensions to CDA R2, an excerpt of the Claims Attachments Implementation Guide covering Mime Multipart/Related Messages, and additional information.

#### Volume 2 CDA Templates and Supporting Material

Volume 2 includes CDA templates and prescribes their use for a set of specific document types. The main chapters are:

* Chapter 1 - Document-Level Templates. This chapter defines the US Realm Header template for that applies across all of the consolidated document types. It defines each of the document types and header constraints specific to each as well as the section-level templates (required and optional) for each.
* Chapter 2 - Section-Level Templates. This chapter defines the section templates referenced within the document types. Sections are atomic units, and can be reused by future specifications.
* Chapter 3 - Entry-Level Templates. This chapter defines entry-level templates, called clinical statements. Machine processable data are sent in the entry templates. The entry templates are referenced by one or more section templates. Entry-level templates are always contained in section-level templates, and section-level templates are always contained in a document. Entries are atomic units, and can be reused by future specifications.
* Chapter 4 - Participation and Other Templates. This chapter defines templates for CDA participants (e.g., author, performer) and other fielded items (e.g., address, name) that cannot stand on their own without being nested in another template.
* Chapter 5 - Template Ids in This Guide
* Chapter 6 - Value Sets in This Guide
* Chapter 7 - Code Systems in This Guide

### Contents of the Package

The following files comprise this implementation guide package:

| Filename | Description | Standards Applicability |
| -------- | ----------- | ----------------------- |
| CDAR2_IG_CCDA_CLINNOTES_R1_DSTU2.1_2015AUG_Vol1_Introductory_Material.docx |Implementation Guide Introductory Material | Normative |
| CDAR2_IG_CCDA_CLINNOTES_R1_DSTU2.1_2015AUG_Vol2_Templates_and_Supporting_Material.docx | Implementation Guide Template Library and Supporting Material | Normative |
| C-CDA R1.1 vs 2.0 Reviews.zip | Detailed comparison of C-CDA R1.1 versus R2.0 and updates made for C-CDA R2.1 | Informative |
| C-CDA_R2-1_CCD.xml | Continuity of Care Document sample files | Informative |
| Link to SDWG SVN for other technical artifacts | | Informative |