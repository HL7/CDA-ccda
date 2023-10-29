Profile: SerialNumberObservation
Parent: $Observation
Id: SerialNumberObservation
Title: "Serial Number Observation"
Description: "This template is intended to be used in addition to the **Product Instance** template urn:oid:2.16.840.1.113883.10.20.22.4.37 to exchange the **Serial Number** of the device.  The serial number is parsed from the UDI value, if present."

* insert LogicalModelTemplate(serial-num-obs, 2.16.840.1.113883.10.20.22.4.319, 2019-06-21)
* insert NarrativeLink

* code 1..1
  * ^short = "Code for \"Serial Number\""
  * ^comment = "SHALL contain exactly one [1..1] code (CONF:4437-3374)."
  * code 1..1
  * code = #C101671
    * ^comment = "This code SHALL contain exactly one [1..1] @code=\"C101671\" Serial Number  (CodeSystem: NCI Thesaurus (NCIt) urn:oid:2.16.840.1.113883.3.26.1.1 STATIC) (CONF:4437-3378)."
  * codeSystem 1..1
  * codeSystem = "2.16.840.1.113883.3.26.1.1"
    * ^comment = "This code SHALL contain exactly one [1..1] @codeSystem=\"2.16.840.1.113883.3.26.1.1\" (CONF:4437-3369)."
  * codeSystemName ^short = "MAY be set to 'NCI Thesaurus"
    * ^comment = "This code MAY contain zero or one [0..1] @codeSystemName=\"NCI Thesaurus\" (CONF:4437-3370)."
  * displayName ^short = "MAY be set to 'Serial Number'"
    * ^comment = "This code MAY contain zero or one [0..1] @displayName=\"Serial Number\" (CONF:4437-3379)."
* value 1..1
* value only $ED
  * ^comment = "SHALL contain exactly one [1..1] value with @xsi:type=\"ED\" (CONF:4437-3372)."