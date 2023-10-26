Profile: LotOrBatchNumberObservation
Parent: $Observation
Id: LotOrBatchNumberObservation
Title: "Lot or Batch Number Observation"
Description: "This template is intended to be used in addition to the **Product Instance** template urn:oid:2.16.840.1.113883.10.20.22.4.37 to exchange the **Lot or Batch Number** of the device. The Lot or Batch Number is parsed from the UDI value, if present."

* insert LogicalModelTemplate(lot-batch-obs, 2.16.840.1.113883.10.20.22.4.315, 2019-06-21)
* insert NarrativeLink

* code 1..1
  * ^short = "Code for \"Lot or Batch Number\""
  * ^comment = "SHALL contain exactly one [1..1] code (CONF:4437-3451)."
  * code 1..1
  * code = #C101672
    * ^comment = "This code SHALL contain exactly one [1..1] @code=\"C101672\" Lot or Batch Number  (CodeSystem: NCI Thesaurus (NCIt) urn:oid:2.16.840.1.113883.3.26.1.1 STATIC) (CONF:4437-3454)."
  * codeSystem 1..1
  * codeSystem = "2.16.840.1.113883.3.26.1.1"
    * ^comment = "This code SHALL contain exactly one [1..1] @codeSystem=\"2.16.840.1.113883.3.26.1.1\" (CONF:4437-3455)."
  * codeSystemName ^short = "MAY be set to 'NCI Thesaurus'"
    * ^comment = "This code MAY contain zero or one [0..1] @codeSystemName=\"NCI Thesaurus\" (CONF:4437-3456)."
  * displayName ^short = "MAY be set to 'Lot or Batch Number'"
    * ^comment = "This code MAY contain zero or one [0..1] @displayName=\"Lot or Batch Number\" (CONF:4437-3457)."
* value 1..1
* value only $ED
  * ^comment = "SHALL contain exactly one [1..1] value with @xsi:type=\"ED\" (CONF:4437-3458)."