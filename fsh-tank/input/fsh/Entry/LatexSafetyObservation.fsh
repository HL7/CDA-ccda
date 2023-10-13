Profile: LatexSafetyObservation
Parent: $Observation
Id: LatexSafetyObservation
Title: "Latex Safety Observation"
Description: "This template is intended to be used in addition to the **Product Instance** template urn:oid:2.16.840.1.113883.10.20.22.4.37 to exchange the **Latex Safety Status** of the patient's medical device. The UDI-DI of the medical device may be used to retrieve the Latex Safety status in accessGUDID, which should be considered the source of truth."

* insert LogicalModelTemplate(latex-safety-obs, 2.16.840.1.113883.10.20.22.4.314, 2019-06-21)

* code 1..1
  * ^short = "Code for \"Latex Status\""
  * ^comment = "SHALL contain exactly one [1..1] code (CONF:4437-3492)."
  * code 1..1
  * code = #C160938
    * ^comment = "This code SHALL contain exactly one [1..1] @code=\"C160938\" Latex Safety Status (CodeSystem: NCI Thesaurus (NCIt) urn:oid:2.16.840.1.113883.3.26.1.1 STATIC) (CONF:4437-3496)."
  * codeSystem 1..1
  * codeSystem = "2.16.840.1.113883.3.26.1.1"
    * ^comment = "This code SHALL contain exactly one [1..1] @codeSystem=\"2.16.840.1.113883.3.26.1.1\" (CONF:4437-3497)."
  * codeSystemName ^short = "MAY be set to 'NCI Thesaurus'"
    * ^comment = "This code MAY contain zero or one [0..1] @codeSystemName=\"NCI Thesaurus\" (CONF:4437-3498)."
  * displayName ^short = "MAY be set to 'Latex Safety Status'"
    * ^comment = "This code MAY contain zero or one [0..1] @displayName=\"Latex Safety Status\" (CONF:4437-3499)."
* value 1..1
* value only $CD
* value from $2.16.840.1.113762.1.4.1021.47 (required)
  * ^comment = "SHALL contain exactly one [1..1] value with @xsi:type=\"CD\", where the code SHALL be selected from ValueSet Device Latex Safety urn:oid:2.16.840.1.113762.1.4.1021.47 STATIC 2019-06-21 (CONF:4437-3493)."
  * code 1..1
    * ^comment = "This value SHALL contain exactly one [1..1] @code (CONF:4437-3500)."
  * codeSystem 1..1
    * ^comment = "This value SHALL contain exactly one [1..1] @codeSystem (CONF:4437-3501)."