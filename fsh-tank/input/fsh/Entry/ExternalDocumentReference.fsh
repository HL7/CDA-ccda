Profile: ExternalDocumentReference
Parent: $ExternalDocument
Id: ExternalDocumentReference
Title: "External Document Reference"
Description: "Where it is necessary to reference an external clinical document, the External Document Reference template can be used to reference this external document. However, if the containing document is appending to or replacing another document in the same set, that relationship is set in the header, using ClinicalDocument/relatedDocument."

* insert LogicalModelTemplate(external-doc-ref, 2.16.840.1.113883.10.20.22.4.115, 2014-06-09)

* classCode 1..1
* classCode = #DOCCLIN (exactly)
  * ^comment = "SHALL contain exactly one [1..1] @classCode=\"DOCCLIN\" Clinical Document (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:1098-31931)."
* moodCode 1..1
* moodCode = #EVN (exactly)
  * ^comment = "SHALL contain exactly one [1..1] @moodCode=\"EVN\" Event (CodeSystem: HL7ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:1098-31932)."
* id 1..1
  * ^comment = "SHALL contain exactly one [1..1] id (CONF:1098-32751)."
* code 1..1
  * ^comment = "SHALL contain exactly one [1..1] code (CONF:1098-31933)."
* setId 0..1
  * ^comment = "SHOULD contain zero or one [0..1] setId (CONF:1098-32752)."
* versionNumber 0..1
  * ^comment = "SHOULD contain zero or one [0..1] versionNumber (CONF:1098-32753)."