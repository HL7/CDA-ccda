Profile: CompanyNameObservation
Parent: $Observation
Id: CompanyNameObservation
Title: "Company Name Observation"
Description: "This template is intended to be used in addition to the **Product Instance** template urn:oid:2.16.840.1.113883.10.20.22.4.37 to exchange the **Company Name**.  The UDI-DI of the medical device may be used to retrieve the **Company Name** in accessGUDID, which should be considered the source of truth."
* ^meta.versionId = "4"
* ^meta.lastUpdated = "2023-07-11T23:41:38.642Z"
* insert LogicalModelNA
* ^identifier.value = "urn:hl7ii:2.16.840.1.113883.10.20.22.4.303:2019-06-21"
* ^version = "2019-06-21"
* templateId 1..1
  * ^comment = "SHALL contain exactly one [1..1] templateId (CONF:4437-3441)."
  * root 1..1
  * root = "2.16.840.1.113883.10.20.22.4.303"
    * ^short = "template oid"
    * ^comment = "This templateId SHALL contain exactly one [1..1] @root=\"2.16.840.1.113883.10.20.22.4.303\" (CONF:4437-3443)."
  * extension 1..1
  * extension = "2019-06-21"
    * ^comment = "This templateId SHALL contain exactly one [1..1] @extension=\"2019-06-21\" (CONF:4437-3444)."
* code 1..1
  * ^short = "Code for \"Company Name\""
  * ^comment = "SHALL contain exactly one [1..1] code (CONF:4437-3442)."
  * code 1..1
  * code = #C54131
    * ^comment = "This code SHALL contain exactly one [1..1] @code=\"C54131\" Company Name  (CodeSystem: NCI Thesaurus (NCIt) urn:oid:2.16.840.1.113883.3.26.1.1 STATIC) (CONF:4437-3445)."
  * codeSystem 1..1
  * codeSystem = "2.16.840.1.113883.3.26.1.1"
    * ^comment = "This code SHALL contain exactly one [1..1] @codeSystem=\"2.16.840.1.113883.3.26.1.1\" (CONF:4437-3446)."
  * codeSystemName 0..1
  * codeSystemName = "NCI Thesaurus"
    * ^comment = "This code MAY contain zero or one [0..1] @codeSystemName=\"NCI Thesaurus\" (CONF:4437-3447)."
  * displayName 0..1
  * displayName = "Company Name"
    * ^comment = "This code MAY contain zero or one [0..1] @displayName=\"Company Name\" (CONF:4437-3448)."
* value 1..1
* value only $ED
  * ^comment = "SHALL contain exactly one [1..1] value with @xsi:type=\"ED\" (CONF:4437-3449)."