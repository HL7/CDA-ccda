### A - Acronyms and Abbreviations

| Acronym | Description |
| ------- | ----------- |
| ADL | Activities of Daily Living |
| C-CDA R1, R1.1, R2 | Consolidated CDA (Release 1, 1.1, and 2) |
| CCD | Continuity of Care Document |
| CDA, CDA R2 | Clinical Document Architecture (Release 2) |
| CDC | Centers for Disease Control and Prevention |
| CFR | Code of Federal Regulations |
| CID | content identifier |
| CPT | Current Procedural Terminology |
| CVX | Codes for Vaccine Administered |
| DAM | Domain Analysis Model |
| DI | device identifier |
| DICOM | Digital Imaging and Communications in Medicine |
| CMET | Common Message Element Type |
| DIR | Diagnostic Imaging Report |
| DME | durable medical equipment |
| DRIV | is derived from |
| DSTU | Draft Standard for Trial Use |
| EHR | electronic health record |
| EMR | electronic medical record |
| EVN | event |
| FDA | Food and Drug Administration |
| FIPS | Federal Information Processing Standards |
| GOL | goal |
| H&P | History and Physical |
| HCT/P | Human Cell & Tissue Products |
| HHPoC | Home Health Plan of Care |
| HIBCC | Health Industry Business Communications Council |
| HIE | health information exchange |
| HISP | health information service provider |
| HIT | healthcare information technology |
| HITSP | Health Information Technology Standards Panel |
| HL7 | Health Level Seven |
| HTML | Hypertext Markup Language |
| IADL | Instrumental Activities of Daily Living |
| ICCBBA | International Council for Commonality in Blood Banking Automation, Inc. |
| ICD | International Classification of Diseases |
| ICF | International Classification of Functioning, Disability and Health |
| IG | implementation guide |
| IHE | Integrating the Healthcare Enterprise |
| PCC | Patient Care Coordination |
| IHTSDO | International Health Terminology Standard Development Organisation |
| RFC | Request for Comments |
| ITI | information technology infrastructure |
| LCC | Longitudinal Care Coordination |
| LCP | Longitudinal Care Plan |
| LOINC | Logical Observation Identifiers Names and Codes |
| LTPAC | Long-Term Post-Acute Care |
| MHTML | MIME HTML |
| MIME | Multipurpose Internet Mail Extensions |
| MPHO | Medical Products of Human Origin |
| NA | not applicable |
| NDC | National Drug Code |
| NDFRT | National Drug File Reference Terminology |
| NEMA | National Electrical Manufacturers Association |
| NHSN | National Healthcare Safety Network |
| NI | no information |
| NLM | National Library of Medicine |
| NPI | National Provider Identifier |
| NPO | nothing by mouth |
| NPP | non-physician provider |
| NUBC | National Uniform Billing Committee |
| NUCC | National Uniform Claim Committee |
| OID | object identifier |
| ONC | Office of National Coordinator |
| OTH | not an element in the value domain |
| PCDATA | Parsed Character Data |
| PCWG | Patient Care Work Group |
| PDF | Portable Document Format |
| PGD | Patient Generated Document |
| PGP | Pretty Good Privacy |
| PHQ | Patient Health Questionnaire |
| PHR | personal health record |
| PI | Production Identifier |
| PKCS#7 | public-key cryptography standard seven (Cryptographic Message Syntax Standard |
| RFC | request for comment |
| RIM | Reference Information Model |
| RMIM | Refined Message Information Model |
| RQO | request |
| RSNA | Radiological Society of North America |
| S&I | Standards and Interoperability |
| sdtc | Standard Duty Title Code |
| SDWG | Structured Documents Working Group |
| SMART | Substitutable Medical Applications & Reusable Technology |
| SNF | Skilled Nursing Facility |
| SNOMED CT | Systemized Nomenclature for Medicine – Clinical Terms |
| SOP | Service Object Pair |
| SPL | Structured Product Labeling |
| SR | Structured Report |
| SSN | Social Security Number |
| SWG | Sub Work Group |
| TPN | Total Parenteral Nutrition |
| UCUM | Unified Code for Units of Measure |
| UD | Unstructured Document |
| UDI | Unique Device Identification |
| UML | Unified Modeling Language |
| UNII | Unique Ingredient identifier |
| UNK | unknown |
| URL | uniform resource locator |
| URN | uniform resource name |
| UUID | universally unique identifier |
| VIS | Vaccine Information Statement |
| WADO | Web Access to Persistent DICOM Objects |
| XDS-SD | Cross Enterprise Sharing of Scanned Documents |
| XML | eXtensible Markup language |
| XML-DSIG | XML digital signature |
| XPath | XML Path Language |

### B - High-Level Change Log

This implementation guide builds on HL7 Implementation Guide for CDA® Release 2: Consolidated CDA Templates for Clinical Notes (US Realm), Release 2.0. (NOV 2014).

### C - Extensions to CDA R2

Where there is a need to communicate information for which there is no suitable representation in CDA R2, extensions to CDA R2 have been developed. These extensions are described above in the context of the section where they are used. This section serves to summarize the extensions and provide implementation guidance.
Extensions created for this guide include:

* sdtc:raceCode - The raceCode extension allows for multiple races to be reported for a patient.
* sdtc:ethnicGroupCode - The ethnicGroupCode extension allows for additional ethnicity groups for the recordTarget or subjectPerson.
* sdtc:id - The id extension in the family history organizer on the related subject allows for unique identification of the family member(s).
* sdtc:deceasedInd - The deceasedIndextension (= “true” or “false”) in the family history organizer on the related subject is used inside to indicate if a family member is deceased.
* sdtc:deceasedTime - The deceasedTime extension in the family history organizer on the related subject allows for reporting the date and time a family member died.
* sdtc:birthTime - The birthTime extension allows for the birth date of any person to be recorded. The purpose of this extension is to allow the recording of the subscriber or member of a health plan in cases where the health plan eligibility system has different information on file than the provider does for the patient.
* sdtc:dischargeDispositionCode - The dischargeDispositionCode extension allows the provider to record a discharge disposition in an encounter activity.
* sdtc:signatureText - The signatureText extension provides a location in CDA for a textual or multimedia depiction of the signature by which the participant endorses and accepts responsibility for his or her participation in the Act as specified in the Participation.typeCode. Details of what goes in the field are described in the HL7 Implementation Guide for CDA® Release 2: Digital Signatures and Delegation of Rights, Release 1.

To resolve issues that need to be addressed by extension, the developers of this guide chose to approach extensions as follows:

* An extension is a collection of element or attribute declarations and rules for their application to the CDA Release 2.0.
* All extensions are optional. An extension may be used, but need not be under this guide.
* A single namespace for all extension elements or attributes that may be used by this guide will be defined.
* The namespace for extensions created by the HL7 Structured Documents Working Group (formerly Structured Documents Technical Committee) shall be urn:hl7-org:sdtc.
* This namespace shall be used as the namespace for any extension elements or attributes that are defined by this implementation guide.
* Each extension element shall use the same HL7 vocabularies and data types used by CDA Release 2.0.
* Each extension element shall use the same conventions for order and naming as is used by the current HL7 tooling.
* An extension element shall appear in the XML where the expected RIM element of the same name would have appeared had that element not been otherwise constrained from appearing in the CDA XML schema.

### D - Mime Multipart/Related Messages

The following text is taken from the Claims Attachments Implementation Guide (AIS00000) in Section 2.4.15 For up-to-date guidance, refer to the latest edition of that specification.

**MIME Multipart/Related Messages**

An attachment is comprised of the CDA document, including any supporting files necessary to render the attested content of the document. Two Internet request for comments (RFCs) are needed to properly construct the mime multipart message. When supporting files are needed, the collection of information shall be organized using a MIME multipart/related package constructed according to RFC 2557. Within the MIME package, supporting files must be encoded using Base-64. RFC-4648 should be used when encoding the contents of the MIME package using Base-64. Finally, RFC-2392 may be used to reference other content that appears in the same X12 transaction to use the same content to answer multiple questions for a single claim. Internet RFCs can be downloaded from the RFC editor page at http://www.rfc-editor.org.

**RFC-2557 MIME Encapsulation of Aggregate Documents, Such as HTML (MHTML)**

This RFC describes how to construct a MIME multipart/related package, and how URLs are resolved within content items of that package. RFC-2557 can be obtained at: http://www.rfc-editor.org/rfc/rfc2557.txt

A MIME multipart/related package is made up of individual content items. Each content item has a MIME header identifying the item. Each content item is delimited from other content items using a string of application specified text. In addition, there must be an ending boundary. The actual content is recorded between these delimiter strings using a BASE-64 encoding of the content item. There is also a MIME header for the entire package.

The first content item of a multipart/related message supporting attachments is the CDA document, containing the header and structured or non-structured body. Subsequent content items included in this package will contain additional content that appears within the body of the document. The CDA document will reference these additional content items by their URLs.

**Referencing Supporting Files in Multipart/Related Messages**

Because the CDA document and its supporting files may have already existed in a clinical information system, references may already exist within the CDA document to URLs that are not accessible outside of the clinical information system that created the document. When the CDA document is sent via attachments, these URLs may no longer be accessible by the receiving information system. Therefore, each content item that is referenced by a URL within the CDA document must be included as a content item in the MIME package. Each content item may specify the URL by which it is known using the Content-Location header. The receiver of this MIME package shall translate URL references according the RFC-2557. This will ensure resolution of the original URL to the correct content item within the MIME package. Thus, URL references contained within an original document need not be rewritten when the CDA package is transmitted. Instead, these URLs are simply supplied as the value of the Content-Location header in the MIME package.

This capability allows for the same content item to be referred to more than once in a MIME multipart/related package without requiring the content item to be supplied twice. However, it does not allow a separate MIME multipart/related package to contain references to information sent in a previously recorded package.

**Referencing Documents from Other Multiparts within the Same X12 Transactions**

RFC-2392 is used when referencing content across MIME package boundaries, but still contained within the same X12 transaction (ST to SE). This can occur when the same document answers multiple questions for a single claim. Each component of a MIME package may be assigned a content identifier using the Content-ID header for the content item. For example, this header would appear as:

`Content-ID: <07EE4DAC-76C4-4a98-967E-F6EF9667DED1>`

This content identifier is a unique identifier for the content item, which means it must never be used to refer to any other content item. RFC-2392 defines the cid: URL scheme (http: and ftp: are two other URL schemes). This URL scheme allows for references by the Content-ID header to be resolved. The URL for the content item identified above would be:

`cid:07EE4DAC-76C4-4a98-967E-F6EF9667DED1`

Receivers of the MIME multipart message must be able to resolve a cid: URL to the content item that it identifies. Senders must ensure that they only refer to items that have already been transmitted to the receiver by their cid: URL. Thus, this implementation guide prohibits forward URL references using the cid: URL scheme.

Content items shall not be referenced across X12 transactions using the cid: URL scheme. For example, if the payer previously requested information using a 277, and the provider returned that information in a MIME multipart/related package in a 275, and then the payer requested additional information in another 277, the provider may not refer to the content item previously returned in the prior 275 transaction.
