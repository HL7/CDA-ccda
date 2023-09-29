Profile: ManufacturingDateObservation
Parent: $Observation
Id: ManufacturingDateObservation
Title: "Manufacturing Date Observation"
Description: "This template is intended to be used in addition to the **Product Instance** template urn:oid:2.16.840.1.113883.10.20.22.4.37 to exchange the **Manufacturing Date** of the device.  The manufacturing date is parsed from the UDI value, if present."
* ^meta.versionId = "4"
* ^meta.lastUpdated = "2023-07-11T23:41:41.705Z"
* insert LogicalModelNA
* ^identifier.value = "urn:hl7ii:2.16.840.1.113883.10.20.22.4.316:2019-06-21"
* ^version = "2019-06-21"
* templateId 1..1
  * ^comment = "SHALL contain exactly one [1..1] templateId (CONF:4437-3459)."
  * root 1..1
  * root = "2.16.840.1.113883.10.20.22.4.316"
    * ^short = "template oid"
    * ^comment = "This templateId SHALL contain exactly one [1..1] @root=\"2.16.840.1.113883.10.20.22.4.316\" (CONF:4437-3462)."
  * extension 1..1
  * extension = "2019-06-21"
    * ^comment = "This templateId SHALL contain exactly one [1..1] @extension=\"2019-06-21\" (CONF:4437-3463)."
* code 1..1
  * ^short = "Code for \"Manufacturing Date\""
  * ^comment = "SHALL contain exactly one [1..1] code (CONF:4437-3460)."
  * code 1..1
  * code = #C101669
    * ^short = "Manufacturing Date code"
    * ^comment = "This code SHALL contain exactly one [1..1] @code=\"C101669\" Manufacturing Date  (CodeSystem: NCI Thesaurus (NCIt) urn:oid:2.16.840.1.113883.3.26.1.1 STATIC) (CONF:4437-3464)."
  * codeSystem 1..1
  * codeSystem = "2.16.840.1.113883.3.26.1.1"
    * ^comment = "This code SHALL contain exactly one [1..1] @codeSystem=\"2.16.840.1.113883.3.26.1.1\" (CONF:4437-3465)."
  * codeSystemName 0..1
  * codeSystemName = "NCI Thesaurus"
    * ^comment = "This code MAY contain zero or one [0..1] @codeSystemName=\"NCI Thesaurus\" (CONF:4437-3466)."
  * displayName 0..1
  * displayName = "Manufacturing Date"
    * ^comment = "This code MAY contain zero or one [0..1] @displayName=\"Manufacturing Date\" (CONF:4437-3467)."
* value 1..1
* value only $TS
  * ^short = " Manufacturing Date as a time stamp"
  * ^comment = "SHALL contain exactly one [1..1] value with @xsi:type=\"TS\" (CONF:4437-3461)."
  * value 1..1
    * ^comment = "This value SHALL contain exactly one [1..1] @value (CONF:4437-3468)."