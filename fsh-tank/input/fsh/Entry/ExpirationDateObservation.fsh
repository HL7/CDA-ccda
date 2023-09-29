Profile: ExpirationDateObservation
Parent: $Observation
Id: ExpirationDateObservation
Title: "Expiration Date Observation"
Description: "This template is intended to be used in addition to the **Product Instance** template urn:oid:2.16.840.1.113883.10.20.22.4.37 to exchange the **Expiration Date** of the device.  The expiration date is parsed from the UDI value, if present."
* ^meta.versionId = "4"
* ^meta.lastUpdated = "2023-07-11T23:41:39.993Z"
* insert LogicalModelNA
* ^identifier.value = "urn:hl7ii:2.16.840.1.113883.10.20.22.4.309:2019-06-21"
* ^version = "2019-06-21"
* templateId 1..1
  * ^comment = "SHALL contain exactly one [1..1] templateId (CONF:4437-3393)."
  * root 1..1
  * root = "2.16.840.1.113883.10.20.22.4.309"
    * ^short = "template oid"
    * ^comment = "This templateId SHALL contain exactly one [1..1] @root=\"2.16.840.1.113883.10.20.22.4.309\" (CONF:4437-3396)."
  * extension 1..1
  * extension = "2019-06-21"
    * ^comment = "This templateId SHALL contain exactly one [1..1] @extension=\"2019-06-21\" (CONF:4437-3397)."
* code 1..1
  * ^short = "Code for \"Expiration Date\""
  * ^comment = "SHALL contain exactly one [1..1] code (CONF:4437-3394)."
  * code 1..1
  * code = #C101670
    * ^short = "Expiration Date code"
    * ^comment = "This code SHALL contain exactly one [1..1] @code=\"C101670\" Expiration Date (CodeSystem: NCI Thesaurus (NCIt) urn:oid:2.16.840.1.113883.3.26.1.1 STATIC) (CONF:4437-3398)."
  * codeSystem 1..1
  * codeSystem = "2.16.840.1.113883.3.26.1.1"
    * ^comment = "This code SHALL contain exactly one [1..1] @codeSystem=\"2.16.840.1.113883.3.26.1.1\" (CONF:4437-3399)."
  * codeSystemName 0..1
  * codeSystemName = "NCI Thesaurus"
    * ^comment = "This code MAY contain zero or one [0..1] @codeSystemName=\"NCI Thesaurus\" (CONF:4437-3400)."
  * displayName 0..1
  * displayName = "Expiration Date"
    * ^comment = "This code MAY contain zero or one [0..1] @displayName=\"Expiration Date\" (CONF:4437-3401)."
* value 1..1
* value only $TS
  * ^short = " Expiration Date as a time stamp"
  * ^comment = "SHALL contain exactly one [1..1] value with @xsi:type=\"TS\" (CONF:4437-3395)."
  * value 1..1
    * ^comment = "This value SHALL contain exactly one [1..1] @value (CONF:4437-3402)."