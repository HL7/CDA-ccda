Profile: DeviceIdentifierObservation
Parent: $Observation
Id: DeviceIdentifierObservation
Title: "Device Identifier Observation"
Description: """This template is intended to be used in addition to the **Product Instance** template urn:oid:2.16.840.1.113883.10.20.22.4.37 to exchange the **Device Identifier** (also known as the "Primary DI Number") for a medical device marketed in the US. The device identifier is parsed from the UDI value.

The Device Identifier number can be used as a key to look-up device identification information in the publicly available version of the US FDA Global UDI Database (GUDID) - the AccessGUDID: https://accessgudid.nlm.nih.gov/resources/home"""

* insert LogicalModelTemplate(device-id-obs, 2.16.840.1.113883.10.20.22.4.304, 2022-06-01)
* insert NarrativeLink

* code 1..1
  * ^short = "Primary DI Number Code from NCIt"
  * ^comment = "SHALL contain exactly one [1..1] code (CONF:4524-3422)."
  * code 1..1
  * code = #C101722
    * ^comment = "This code SHALL contain exactly one [1..1] @code=\"C101722\" Primary DI Number (CodeSystem: NCI Thesaurus (NCIt) urn:oid:2.16.840.1.113883.3.26.1.1 STATIC) (CONF:4524-3426)."
  * codeSystem 1..1
  * codeSystem = "2.16.840.1.113883.3.26.1.1"
    * ^comment = "This code SHALL contain exactly one [1..1] @codeSystem=\"2.16.840.1.113883.3.26.1.1\" (CONF:4524-3427)."
  * codeSystemName ^short = "MAY be set to 'NCI Thesaurus'"
    * ^comment = "This code MAY contain zero or one [0..1] @codeSystemName=\"NCI Thesaurus\" (CONF:4524-3428)."
  * displayName ^short = "MAY be set to 'Primary DI Number'"
    * ^comment = "This code MAY contain zero or one [0..1] @displayName=\"Primary DI Number\" (CONF:4524-3429)."
* value 1..1
* value only $II
  * ^short = "This value is assigned by the Manufacturer by using an FDA-accredited UDI-issuing agency"
  * ^comment = "SHALL contain exactly one [1..1] value with @xsi:type=\"II\" (CONF:4524-3423)."
  * displayable 1..1
  * displayable = true
    * ^comment = "This value SHALL contain exactly one [1..1] @displayable=\"true\" (CONF:4524-3540)."
  * root 1..1
    * ^comment = "This value SHALL contain exactly one [1..1] @root (CONF:4524-3430)."
  * obeys should-extension
  * extension 0..1
    * ^comment = "This value SHOULD contain zero or one [0..1] @extension (CONF:4524-3431)." // man-should