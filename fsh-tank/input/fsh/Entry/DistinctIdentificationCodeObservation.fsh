Profile: DistinctIdentificationCodeObservation
Parent: $Observation
Id: DistinctIdentificationCodeObservation
Title: "Distinct Identification Code Observation"
Description: """This template is intended to be used in addition to the Product Instance template to exchange the Distinct Identification Code for an HCT/P product regulated as a device as cited in 21 CFR 1271.290(c). The distinct identification code is parsed from the UDI value, if present.

The distinct identification code may be equivalent to the serial number, lot or batch number, or the donation identification number. The appropriate value should be provided as the distinct identification code."""

* insert LogicalModelTemplate(distinct-id-code-obs, 2.16.840.1.113883.10.20.22.4.308, 2019-06-21)
* insert NarrativeLink

* code 1..1
  * ^short = "Distinct Identification Code from NCIt"
  * ^comment = "SHALL contain exactly one [1..1] code (CONF:4437-3349)."
  * code 1..1
  * code = #C113843
    * ^comment = "This code SHALL contain exactly one [1..1] @code=\"C113843\" Distinct Identification Code  (CodeSystem: NCI Thesaurus (NCIt) urn:oid:2.16.840.1.113883.3.26.1.1 STATIC) (CONF:4437-3355)."
  * codeSystem 1..1
  * codeSystem = "2.16.840.1.113883.3.26.1.1"
    * ^comment = "This code SHALL contain exactly one [1..1] @codeSystem=\"2.16.840.1.113883.3.26.1.1\" (CONF:4437-3352)."
  * codeSystemName ^short = "MAY be set to 'NCI Thesaurus'"
    * ^comment = "This code MAY contain zero or one [0..1] @codeSystemName=\"NCI Thesaurus\" (CONF:4437-3353)."
  * displayName ^short = "MAY be set to 'Distinct Identification Code'"
    * ^comment = "This code MAY contain zero or one [0..1] @displayName=\"Distinct Identification Code\" (CONF:4437-3354)."
* value 1..1
* value only $ED
  * ^comment = "SHALL contain exactly one [1..1] value with @xsi:type=\"ED\" (CONF:4437-3340)."