Profile: ModelNumberObservation
Parent: $Observation
Id: ModelNumberObservation
Title: "Model Number Observation"
Description: "This template is intended to be used in addition to the **Product Instance** template urn:oid:2.16.840.1.113883.10.20.22.4.37 to exchange the **Model Number** associated with the device.  The UDI-DI of the medical device may be used to retrieve the **Model Number** in accessGUDID, which should be considered the source of truth."

* insert LogicalModelTemplate(model-num-obs, 2.16.840.1.113883.10.20.22.4.317, 2019-06-21)

* code 1..1
  * ^short = "Code for \"Device Model Number\""
  * ^comment = "SHALL contain exactly one [1..1] code (CONF:4437-3413)."
  * code 1..1
  * code = #C99285
    * ^comment = "This code SHALL contain exactly one [1..1] @code=\"C99285\" Model Number (CodeSystem: NCI Thesaurus (NCIt) urn:oid:2.16.840.1.113883.3.26.1.1 STATIC) (CONF:4437-3416)."
  * codeSystem 1..1
  * codeSystem = "2.16.840.1.113883.3.26.1.1"
    * ^comment = "This code SHALL contain exactly one [1..1] @codeSystem=\"2.16.840.1.113883.3.26.1.1\" (CONF:4437-3417)."
  * codeSystemName ^short = "MAY be set to 'NCI Thesaurus'"
    * ^comment = "This code MAY contain zero or one [0..1] @codeSystemName=\"NCI Thesaurus\" (CONF:4437-3418)."
  * displayName ^short = "MAY be set to 'Model Number'"
    * ^comment = "This code MAY contain zero or one [0..1] @displayName=\"Model Number\" (CONF:4437-3419)."
* value 1..1
* value only $ED
  * ^comment = "SHALL contain exactly one [1..1] value with @xsi:type=\"ED\" (CONF:4437-3420)."