Profile: PhysicalExamSection
Parent: $Section
Id: PhysicalExamSection
Title: "Physical Exam Section"
Description: """The section includes direct observations made by a clinician. The examination may include the use of simple instruments and may also describe simple maneuvers performed directly on the patient's body.

It also includes observations made by the examining clinician using only inspection, palpation, auscultation, and percussion. It does not include laboratory or imaging findings.

The exam may be limited to pertinent body systems based on the patient's chief complaint or it may include a comprehensive examination. The examination may be reported as a collection of random clinical statements or it may be reported categorically.

The Physical Exam Section may contain multiple nested subsections."""
* insert LogicalModelNA
* ^identifier.value = "urn:hl7ii:2.16.840.1.113883.10.20.2.10:2015-08-01"
* ^version = "2015-08-01"
* templateId ^slicing.discriminator[0].type = #value
  * ^slicing.discriminator[=].path = "root"
  * ^slicing.discriminator[+].type = #value
  * ^slicing.discriminator[=].path = "extension"
  * ^slicing.rules = #open
* templateId contains primary 1..1
* templateId[primary] ^comment = "SHALL contain exactly one [1..1] templateId (CONF:1198-7806) such that it"
  * root 1..1
  * root = "2.16.840.1.113883.10.20.2.10"
    * ^comment = "SHALL contain exactly one [1..1] @root=\"2.16.840.1.113883.10.20.2.10\" (CONF:1198-10465)."
  * extension 1..1
  * extension = "2015-08-01"
    * ^comment = "SHALL contain exactly one [1..1] @extension=\"2015-08-01\" (CONF:1198-32587)."
* code 1..1
  * ^comment = "SHALL contain exactly one [1..1] code (CONF:1198-15397)."
  * code 1..1
  * code = #29545-1
    * ^comment = "This code SHALL contain exactly one [1..1] @code=\"29545-1\" Physical Findings (CONF:1198-15398)."
  * codeSystem 1..1
  * codeSystem = "2.16.840.1.113883.6.1"
    * ^comment = "This code SHALL contain exactly one [1..1] @codeSystem=\"2.16.840.1.113883.6.1\" (CodeSystem: LOINC urn:oid:2.16.840.1.113883.6.1) (CONF:1198-30931)."
* title 1..1
  * ^comment = "SHALL contain exactly one [1..1] title (CONF:1198-7808)."
* text 1..1
  * ^comment = "SHALL contain exactly one [1..1] text (CONF:1198-7809)."
* entry ^slicing.discriminator[0].type = #type
  * ^slicing.discriminator[=].path = "$this"
  * ^slicing.rules = #open
* entry contains longCareWound 0..*
* entry[longCareWound] ^comment = "MAY contain zero or more [0..*] entry (CONF:1198-31926) such that it"
  * observation 1..1
  * observation only LongitudinalCareWoundObservation
    * ^comment = "SHALL contain exactly one [1..1] Longitudinal Care Wound Observation (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.4.114:2015-08-01) (CONF:1198-31927)."
* component ^slicing.discriminator[0].type = #value
  * ^slicing.discriminator[=].path = "section"
  * ^slicing.rules = #open
* component contains component1 0..*
* component[component1] ^comment = "MAY contain zero or more [0..*] component (CONF:1198-32434) such that it"
  * section 1..1
    * ^comment = "SHALL contain exactly one [1..1] section (CONF:1198-32435)."
    * code 1..1
    * code from $2.16.840.1.113883.11.20.9.65 (preferred)
      * ^comment = "This section SHALL contain exactly one [1..1] code, which SHOULD be selected from ValueSet Physical Exam Type urn:oid:2.16.840.1.113883.11.20.9.65 DYNAMIC (CONF:1198-32436)."
    * title 1..1
      * ^comment = "This section SHALL contain exactly one [1..1] title (CONF:1198-32437)."
    * text 1..1
      * ^comment = "This section SHALL contain exactly one [1..1] text (CONF:1198-32438)."