Profile: BrandNameObservation
Parent: $Observation
Id: BrandNameObservation
Title: "Brand Name Observation"
Description: "This template is intended to be used in addition to the Product Instance template to exchange the Brand Name.  The UDI-DI of the medical device may be used to retrieve the **Brand Name** in accessGUDID, which should be considered the source of truth."

* insert LogicalModelTemplate(brand-name-obs, 2.16.840.1.113883.10.20.22.4.301, 2019-06-21)
* insert NarrativeLink

* code 1..1
  * ^short = "Code for \"Device Brand Name\""
  * ^comment = "SHALL contain exactly one [1..1] code (CONF:4437-3404)."
  * code 1..1
  * code = #C71898
    * ^comment = "This code SHALL contain exactly one [1..1] @code=\"C71898\" Brand Name (CodeSystem: NCI Thesaurus (NCIt) urn:oid:2.16.840.1.113883.3.26.1.1 STATIC) (CONF:4437-3407)."
  * codeSystem 1..1
  * codeSystem = "2.16.840.1.113883.3.26.1.1"
    * ^comment = "This code SHALL contain exactly one [1..1] @codeSystem=\"2.16.840.1.113883.3.26.1.1\" (CONF:4437-3408)."
  * codeSystemName ^short = "MAY be set to 'NCI Thesaurus'"
    * ^comment = "This code MAY contain zero or one [0..1] @codeSystemName=\"NCI Thesaurus\" (CONF:4437-3409)."
  * displayName ^short = "MAY be set to 'Brand Name'"
    * ^comment = "This code MAY contain zero or one [0..1] @displayName=\"Brand Name\" (CONF:4437-3410)."
* value 1..1
* value only $ED
  * ^comment = "SHALL contain exactly one [1..1] value with @xsi:type=\"ED\" (CONF:4437-3411)."