Profile: MRISafetyObservation
Parent: $Observation
Id: MRISafetyObservation
Title: "MRI Safety Observation"
Description: "This template is intended to be used in addition to the **Product Instance** template urn:oid:2.16.840.1.113883.10.20.22.4.37 to exchange the MRI Safety Status of the patient's medical device. The UDI-DI of the medical device may be used to retrieve the **MRI Safety Status** in accessGUDID, which should be considered the source of truth."
* ^meta.versionId = "4"
* ^meta.lastUpdated = "2023-07-11T23:41:42.369Z"
* insert LogicalModelNA
* ^identifier.value = "urn:hl7ii:2.16.840.1.113883.10.20.22.4.318:2019-06-21"
* ^version = "2019-06-21"
* templateId 1..1
  * ^comment = "SHALL contain exactly one [1..1] templateId (CONF:4437-3469)."
  * root 1..1
  * root = "2.16.840.1.113883.10.20.22.4.318"
    * ^short = "template oid"
    * ^comment = "This templateId SHALL contain exactly one [1..1] @root=\"2.16.840.1.113883.10.20.22.4.318\" (CONF:4437-3471)."
  * extension 1..1
  * extension = "2019-06-21"
    * ^comment = "This templateId SHALL contain exactly one [1..1] @extension=\"2019-06-21\" (CONF:4437-3472)."
* code 1..1
  * ^short = "Code for \"MRI Safety Status\""
  * ^comment = "SHALL contain exactly one [1..1] code (CONF:4437-3470)."
  * code 1..1
  * code = #C106044
    * ^comment = "This code SHALL contain exactly one [1..1] @code=\"C106044\" MRI Safety (CodeSystem: NCI Thesaurus (NCIt) urn:oid:2.16.840.1.113883.3.26.1.1 STATIC) (CONF:4437-3473)."
  * codeSystem 1..1
  * codeSystem = "2.16.840.1.113883.3.26.1.1"
    * ^comment = "This code SHALL contain exactly one [1..1] @codeSystem=\"2.16.840.1.113883.3.26.1.1\" (CONF:4437-3474)."
  * codeSystemName 0..1
  * codeSystemName = "NCI Thesaurus"
    * ^comment = "This code MAY contain zero or one [0..1] @codeSystemName=\"NCI Thesaurus\" (CONF:4437-3475)."
  * displayName 0..1
  * displayName = "MRI Safety"
    * ^comment = "This code MAY contain zero or one [0..1] @displayName=\"MRI Safety\" (CONF:4437-3476)."
* value 1..1
* value only $CD
* value from $2.16.840.1.113762.1.4.1021.46 (required)
  * ^comment = "SHALL contain exactly one [1..1] value with @xsi:type=\"CD\", where the code SHALL be selected from ValueSet Device Magnetic resonance (MR) Safety urn:oid:2.16.840.1.113762.1.4.1021.46 STATIC 2019-06-21 (CONF:4437-3477)."
  * code 1..1
    * ^comment = "This value SHALL contain exactly one [1..1] @code (CONF:4437-3478)."
  * codeSystem 1..1
    * ^comment = "This value SHALL contain exactly one [1..1] @codeSystem (CONF:4437-3479)."