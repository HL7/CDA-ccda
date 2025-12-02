### Introduction

This Consolidated Clinical Document Architecture (C-CDA) guide, in conjunction with the HL7 CDA Release 2 (CDA R2) standard, is to be used for implementing the following CDA documents and header constraints for clinical notes.

Header Constraints:

* <a href="StructureDefinition-USRealmHeader.html">US Realm Header</a>
* <a href="StructureDefinition-USRealmHeaderforPatientGeneratedDocument.html">Patient Generated Document (US Realm Header)</a>

Document Types:

* <a href="StructureDefinition-CarePlan.html">Care Plan</a>
* <a href="StructureDefinition-ConsultationNote.html">Consultation Note</a>
* <a href="StructureDefinition-ContinuityofCareDocumentCCD.html">Continuity of Care Document (CCD)</a>
* <a href="StructureDefinition-DischargeSummary.html">Discharge Summary</a>
* <a href="StructureDefinition-HistoryandPhysical.html">History and Physical (H&P)</a>
* <a href="StructureDefinition-OperativeNote.html">Operative Note</a>
* <a href="StructureDefinition-ProcedureNote.html">Procedure Note</a>
* <a href="StructureDefinition-ProgressNote.html">Progress Note</a>
* <a href="StructureDefinition-ReferralNote.html">Referral Note</a>
* <a href="StructureDefinition-TransferSummary.html">Transfer Summary</a>
* <a href="StructureDefinition-UnstructuredDocument.html">Unstructured Document</a>

Section templates, which help organize content within a document, and entry templates, that represent discrete computable data within sections, are defined in this implementation Guide.

The [Artifact Index page](artifacts.html) lists the C-CDA Templates that have been defined for this IG.

The Guidance pages provide USCDI guidance, call out key information from the underlying CDA standard, provide learnings gleaned from vendors and CDA Implementation-a-thons, and include other improvements added since C-CDA’s inception in 2011. The Guidance was drawn from  C-CDA 2.1 Introduction (Volume 1) Sept 2022 Errata  and  C-CDA 2.1 Companion Guide R4.1 June 2023 Publication and edited to be appropriate for this StructureDefinition publication and has been added to with new versions.

### Background
Consolidated CDA (C-CDA) is a library of CDA templates developed by HL7. It leveraged prior CDA implementation guides developed under the HL7 Health Story Project, Integrating the Healthcare Enterprise (IHE), and the Health Information Technology Standards Panel (HITSP). It harmonized and consolidated the templates into the C-CDA guide. The C-CDA guide was developed within the ONC’s Standards and Interoperability (S&I) Framework to provide a definitive set of harmonized CDA templates for the US Realm.

Since 2017, separate C-CDA Companion Guides were developed to provide supplemental implementer guidance and new templates, initially to meet Meaningful Use criteria, and then with designs and guidance for the USCDI annual data element releases. The C-CDA 2.1 guide has had only errata releases since 2015 and no new design.

### This Project

The latest C-CDA release consolidates prior specifications and guidance documents, incorporates enhancement requests, and introduces updated design and implementation guidance aligned with the current USCDI version. Future updates are planned annually to reflect new USCDI releases and respond to community feedback and implementation experience.

The guide represents C-CDA templates using HL7 FHIR StructureDefinition. It is built upon the underlying [CDA standard’s structures defined as Logical Models in CDA 2.0 StructureDefinition]({{site.data.fhir.cda}}). These FHIR Logical models are abstract data structures which have been instantiated into physical CDA templates to be implemented in CDA data exchange. As such, it adheres to the [CDA Release 2.0 standard](https://www.hl7.org/implement/standards/product_brief.cfm?product_id=7) and remains a CDA-based Implementation Guide (IG). 

<style>
	.important::before {
	  white-space: pre;
	  content: "NOTE\A ";
	  #background-color: yellow;
	  color: red;
	  font-weight: bold;
	}
	.important{
	    margin: 5px;
	    padding: 10px;
	    border-left-style: solid;
	}
</style>
<p class="important">
	This is a C-CDA specification that uses FHIR R5 StructureDefinitions and ElementDefinitions to define its templates.  It does not use any of the FHIR R5 resources nor any of the FHIR R5 General-Purpose Datatypes.  Thus it is based on FHIR R5 but not in a way that FHIR Implementation Guides would be based by profiling FHIR resources.  It is important and relevant to declare the version of FHIR structures that are being used for toolsmiths and others using those structures.
	Further, the specification is generated with the FHIR IG Publisher tooling.  Although the tooling allows for JSON and XML representations of structures, at this time, only XML is allowed for CDA documents.
</p>

### Acknowledgements

This C-CDA guide was developed and produced through the efforts of Health Level Seven (HL7).

The editors appreciate the support and sponsorship of the HL7 Structured Documents Working Group (SDWG), the HL7 Patient Care Work Group, the HL7 Cross Group Projects Work Group, the CDA Management Group, HL7’s Chief Standards Development Officer, and all volunteers and staff associated with the creation of this Implementation Guide.  Much appreciated are the many individual authors from those work groups who contributed to the design and build of C-CDA and CDA Implementation Guides since 2007.
This guide would not have been possible without the support of the [Office of the National Coordinator](https://www.healthit.gov), and the [Federal Electronic Health Record Modernization (FEHRM)](https://www.fehrm.gov).
	
### C-CDA Primary Authors

|Name|Organization|Email|
|Jean Duteau|Dogwood Health Consulting|jean.duteau@dogwoodhealthconsulting.com|
|Benjamin Flessner|Availity|benjamin.flessner@availity.com|
|Brett Marquard|Wave One Associates|brett@waveoneassociates.com|
|Gay Dolin|Namaste Informatics|gdolin@NamasteInformatics.com|
|Rosemary Hofstede|Dogwood Health Consulting|rosemary@duteaudesign.com|
