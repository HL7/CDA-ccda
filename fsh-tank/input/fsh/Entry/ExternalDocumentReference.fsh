Profile: ExternalDocumentReference
Parent: $ExternalDocument
Id: ExternalDocumentReference
Title: "External Document Reference"
Description: "Where it is necessary to reference an external clinical document, the External Document Reference template can be used to reference this external document. However, if the containing document is appending to or replacing another document in the same set, that relationship is set in the header, using ClinicalDocument/relatedDocument."
* insert LogicalModelNA
* ^identifier.value = "urn:hl7ii:2.16.840.1.113883.10.20.22.4.115:2014-06-09"
* ^version = "2014-06-09"
* classCode 1..1
* classCode = #DOCCLIN (exactly)
  * ^comment = "SHALL contain exactly one [1..1] @classCode=\"DOCCLIN\" Clinical Document (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:1098-31931)."
* moodCode 1..1
* moodCode = #EVN (exactly)
  * ^comment = "SHALL contain exactly one [1..1] @moodCode=\"EVN\" Event (CodeSystem: HL7ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:1098-31932)."
* templateId ^slicing.discriminator[0].type = #value
  * ^slicing.discriminator[=].path = "root"
  * ^slicing.discriminator[+].type = #value
  * ^slicing.discriminator[=].path = "extension"
  * ^slicing.rules = #open
* templateId contains primary 1..1
* templateId[primary] ^comment = "SHALL contain exactly one [1..1] templateId (CONF:1098-32748) such that it"
  * root 1..1
  * root = "2.16.840.1.113883.10.20.22.4.115"
    * ^comment = "SHALL contain exactly one [1..1] @root=\"2.16.840.1.113883.10.20.22.4.115\" (CONF:1098-32750)."
  * extension 1..1
  * extension = "2014-06-09"
    * ^comment = "SHALL contain exactly one [1..1] @extension=\"2014-06-09\" (CONF:1098-32749)."
* id 1..1
  * ^comment = "SHALL contain exactly one [1..1] id (CONF:1098-32751)."
* code 1..1
  * ^comment = "SHALL contain exactly one [1..1] code (CONF:1098-31933)."
* setId 0..1
  * ^comment = "SHOULD contain zero or one [0..1] setId (CONF:1098-32752)."
* versionNumber 0..1
  * ^comment = "SHOULD contain zero or one [0..1] versionNumber (CONF:1098-32753)."