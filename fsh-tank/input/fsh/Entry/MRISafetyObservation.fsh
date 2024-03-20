Profile: MRISafetyObservation
Parent: $Observation
Id: MRISafetyObservation
Title: "MRI Safety Observation"
Description: "This template is intended to be used in addition to the Product Instance template to exchange the MRI Safety Status of the patient's medical device. The UDI-DI of the medical device may be used to retrieve the **MRI Safety Status** in accessGUDID, which should be considered the source of truth."

* insert LogicalModelTemplate(mri-safety-obs, 2.16.840.1.113883.10.20.22.4.318, 2019-06-21)
* insert NarrativeLink

* code 1..1
  * ^short = "Code for \"MRI Safety Status\""
  * ^comment = "SHALL contain exactly one [1..1] code (CONF:4437-3470)."
  * code 1..1
  * code = #C106044
    * ^comment = "This code SHALL contain exactly one [1..1] @code=\"C106044\" MRI Safety (CodeSystem: NCI Thesaurus (NCIt) urn:oid:2.16.840.1.113883.3.26.1.1 STATIC) (CONF:4437-3473)."
  * codeSystem 1..1
  * codeSystem = "2.16.840.1.113883.3.26.1.1"
    * ^comment = "This code SHALL contain exactly one [1..1] @codeSystem=\"2.16.840.1.113883.3.26.1.1\" (CONF:4437-3474)."
  * codeSystemName ^short = "MAY be set to 'NCI Thesaurus'"
    * ^comment = "This code MAY contain zero or one [0..1] @codeSystemName=\"NCI Thesaurus\" (CONF:4437-3475)."
  * displayName ^short = "MAY be set to 'MRI Safety'"
    * ^comment = "This code MAY contain zero or one [0..1] @displayName=\"MRI Safety\" (CONF:4437-3476)."
* value 1..1
* value only $CD
  * insert BindAtCode($2.16.840.1.113762.1.4.1021.46, required)