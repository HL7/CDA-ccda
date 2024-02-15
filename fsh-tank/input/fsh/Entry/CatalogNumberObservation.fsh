Profile: CatalogNumberObservation
Parent: $Observation
Id: CatalogNumberObservation
Title: "Catalog Number Observation"
Description: "This template is intended to be used in addition to the Product Instance template to exchange the Catalog Number.  The UDI-DI of the medical device may be used to retrieve the Catalog Number in accessGUDID, which should be considered the source of truth."

* insert LogicalModelTemplate(catalog-num-obs, 2.16.840.1.113883.10.20.22.4.302, 2019-06-21)
* insert NarrativeLink

* code 1..1
  * ^short = "Code for \"Device Catalog Number\""
  * ^comment = "SHALL contain exactly one [1..1] code (CONF:4437-3433)."
  * code 1..1
  * code = #C99286
    * ^comment = "This code SHALL contain exactly one [1..1] @code=\"C99286\" Catalog Number (CodeSystem: NCI Thesaurus (NCIt) urn:oid:2.16.840.1.113883.3.26.1.1 STATIC) (CONF:4437-3436)."
  * codeSystem 1..1
  * codeSystem = "2.16.840.1.113883.3.26.1.1"
    * ^comment = "This code SHALL contain exactly one [1..1] @codeSystem=\"2.16.840.1.113883.3.26.1.1\" (CONF:4437-3437)."
  * codeSystemName ^short = "MAY be set to 'NCI Thesaurus'"
    * ^comment = "This code MAY contain zero or one [0..1] @codeSystemName=\"NCI Thesaurus\" (CONF:4437-3438)."
  * displayName ^short = "MAY be set to 'Catalog Number'"
    * ^comment = "This code MAY contain zero or one [0..1] @displayName=\"Catalog Number\" (CONF:4437-3439)."
* value 1..1
* value only $ED
  * ^comment = "SHALL contain exactly one [1..1] value with @xsi:type=\"ED\" (CONF:4437-3440)."