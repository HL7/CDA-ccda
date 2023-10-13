Profile: ImplantableDeviceStatusObservation
Parent: $Observation
Id: ImplantableDeviceStatusObservation
Title: "Implantable Device Status Observation"
Description: "This template is intended to be used in addition to the **Product Instance** template urn:oid:2.16.840.1.113883.10.20.22.4.37  to augment the parsed data from the a Unique Device Identifier (UDI). This template is used to exchange the status of the patient's implantable medical device.  This status is only relevant to medical devices implanted in the patient's body."

* insert LogicalModelTemplate(implant-device-status-obs, 2.16.840.1.113883.10.20.22.4.305, 2019-06-21)

* code 1..1
  * ^short = "Code for \"Implantable Device Status\""
  * ^comment = "SHALL contain exactly one [1..1] code (CONF:4437-3503)."
  * code 1..1
  * code = #C160939
    * ^comment = "This code SHALL contain exactly one [1..1] @code=\"C160939\" Implantable Device Status (CodeSystem: NCI Thesaurus (NCIt) urn:oid:2.16.840.1.113883.3.26.1.1 STATIC) (CONF:4437-3507)."
  * codeSystem 1..1
  * codeSystem = "2.16.840.1.113883.3.26.1.1"
    * ^comment = "This code SHALL contain exactly one [1..1] @codeSystem=\"2.16.840.1.113883.3.26.1.1\" (CONF:4437-3508)."
  * codeSystemName ^short = "MAY be set to 'NCI Thesaurus'"
    * ^comment = "This code MAY contain zero or one [0..1] @codeSystemName=\"NCI Thesaurus\" (CONF:4437-3509)."
  * displayName ^short = "MAY be set to 'Implantable Device Status'"
    * ^comment = "This code MAY contain zero or one [0..1] @displayName=\"Implantable Device Status\" (CONF:4437-3510)."
* value 1..1
* value only $CD
* value from $2.16.840.1.113762.1.4.1021.48 (required)
  * ^comment = "SHALL contain exactly one [1..1] value with @xsi:type=\"CD\", where the code SHALL be selected from ValueSet Implantable Device Status urn:oid:2.16.840.1.113762.1.4.1021.48 STATIC 2019-06-21 (CONF:4437-3504)."
  * code 1..1
    * ^comment = "This value SHALL contain exactly one [1..1] @code (CONF:4437-3511)."
  * codeSystem 1..1
    * ^comment = "This value SHALL contain exactly one [1..1] @codeSystem (CONF:4437-3512)."