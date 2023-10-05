Profile: UnstructuredDocument
Parent: USRealmHeader
Id: UnstructuredDocument
Title: "Unstructured Document"
Description: """An Unstructured Document (UD) document type can (1) include unstructured content, such as a graphic, directly in a text element with a mediaType attribute, or (2) reference a single document file, such as a word-processing document using a text/reference element.

For guidance on how to handle multiple files, on the selection of media types for this IG, and on the identification of external files, see the examples that follow the constraints below.

IHEs XDS-SD (Cross-Transaction Specifications and Content Specifications, Scanned Documents Module) profile addresses a similar, more restricted use case, specifically for scanned documents or documents electronically created from existing text sources, and limits content to PDF-A or text. This Unstructured Documents template is applicable not only for scanned documents in non-PDF formats, but also for clinical documents produced through word processing applications, etc. 

For conformance with both specifications, implementers need to ensure that their documents at a minimum conform with the SHALL constraints from either specification."""
* insert LogicalModelNA
* ^identifier.value = "urn:hl7ii:2.16.840.1.113883.10.20.22.1.10:2015-08-01"
* ^version = "2015-08-01"
* ^status = #active
* templateId contains primary 1..1
* templateId[primary] ^comment = "SHALL contain exactly one [1..1] templateId (CONF:1198-7710) such that it"
  * root 1..1
  * root = "2.16.840.1.113883.10.20.22.1.10"
    * ^comment = "SHALL contain exactly one [1..1] @root=\"2.16.840.1.113883.10.20.22.1.10\" (CONF:1198-10054)."
  * extension 1..1
  * extension = "2015-08-01"
    * ^comment = "SHALL contain exactly one [1..1] @extension=\"2015-08-01\" (CONF:1198-32522)."
* recordTarget 1..*
  * ^comment = "SHALL contain at least one [1..*] recordTarget (CONF:1198-31089)."
  * patientRole 1..1
    * ^comment = "Such recordTargets SHALL contain exactly one [1..1] patientRole (CONF:1198-31090)."
    * id 1..*
      * ^comment = "This patientRole SHALL contain at least one [1..*] id (CONF:1198-31091)."
* custodian 1..1
  * ^comment = "SHALL contain exactly one [1..1] custodian (CONF:1198-31096)."
  * assignedCustodian 1..1
    * ^comment = "This custodian SHALL contain exactly one [1..1] assignedCustodian (CONF:1198-31097)."
    * representedCustodianOrganization 1..1
      * ^comment = "This assignedCustodian SHALL contain exactly one [1..1] representedCustodianOrganization (CONF:1198-31098)."
* component 1..1
  * ^comment = "SHALL contain exactly one [1..1] component (CONF:1198-31085)."
  * nonXMLBody 1..1
    * ^short = "An Unstructured Document must include a nonXMLBody component with a single text element. The text element can reference an external file using a reference element, or include unstructured content directly with a mediaType attribute. The nonXMLBody/text element also has a \"compression\" attribute that can be used to indicate that the unstructured content was compressed before being Base64Encoded. At a minimum, a compression value of \"DF\" for the deflate compression algorithm (RFC 1951 [URL:http://www.ietf.org/rfc/rfc1951.txt]) must be supported although it is not required that content be compressed."
    * ^comment = "This component SHALL contain exactly one [1..1] nonXMLBody (CONF:1198-31086)."
    * text 1..1
      * obeys 1198-7624 and 1198-7623
      * ^comment = "This nonXMLBody SHALL contain exactly one [1..1] text (CONF:1198-31087)."

Invariant: 1198-7624
Description: "If the text element does not contain a reference element with a value attribute, then it **SHALL** contain exactly one [1..1] @representation=\"B64\" and exactly one [1..1] @mediaType (CONF:1198-7624)."
Severity: #error

Invariant: 1198-7623
Description: "The value of @mediaType, if present, **SHALL** be drawn from the value set 2.16.840.1.113883.11.20.7.1 SupportedFileFormats STATIC 2010-05-12 (CONF:1198-7623)."
Severity: #error