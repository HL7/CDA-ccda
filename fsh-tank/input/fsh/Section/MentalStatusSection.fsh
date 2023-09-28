Profile: MentalStatusSection
Parent: $Section
Id: MentalStatusSection
Title: "Mental Status Section"
Description: """The Mental Status Section contains observations and evaluations related to a patient's psychological and mental competency and deficits including, but not limited to any of the following types of information:
*  Appearance (e.g., unusual grooming, clothing or body modifications)
*  Attitude (e.g., cooperative, guarded, hostile)
*  Behavior/psychomotor (e.g., abnormal movements, eye contact, tics)
*  Mood and affect (e.g., anxious, angry, euphoric)
*  Speech and Language (e.g., pressured speech, perseveration)
*  Thought process (e.g., logic, coherence)
*  Thought content (e.g., delusions, phobias)
*  Perception (e.g., voices, hallucinations)
*  Cognition (e.g., memory, alertness/consciousness, attention, orientation)  which were included in Cognitive Status Observation in earlier publications of C-CDA.
*  Insight and judgment (e.g., understanding of condition, decision making)"""
* insert LogicalModelNA
* ^identifier.value = "urn:hl7ii:2.16.840.1.113883.10.20.22.2.56:2015-08-01"
* ^version = "2015-08-01"
* templateId ^slicing.discriminator[0].type = #value
  * ^slicing.discriminator[=].path = "extension"
  * ^slicing.discriminator[+].type = #value
  * ^slicing.discriminator[=].path = "root"
  * ^slicing.rules = #open
* templateId contains primary 1..1
* templateId[primary] ^comment = "SHALL contain exactly one [1..1] templateId (CONF:1198-28293) such that it"
  * root 1..1
  * root = "2.16.840.1.113883.10.20.22.2.56"
    * ^comment = "SHALL contain exactly one [1..1] @root=\"2.16.840.1.113883.10.20.22.2.56\" (CONF:1198-28294)."
  * extension 1..1
  * extension = "2015-08-01"
    * ^comment = "SHALL contain exactly one [1..1] @extension=\"2015-08-01\" (CONF:1198-32793)."
* code 1..1
  * ^comment = "SHALL contain exactly one [1..1] code (CONF:1198-28295)."
  * code 1..1
  * code = #10190-7
    * ^comment = "This code SHALL contain exactly one [1..1] @code=\"10190-7\" Mental Status (CONF:1198-28296)."
  * codeSystem 1..1
  * codeSystem = "2.16.840.1.113883.6.1"
    * ^comment = "This code SHALL contain exactly one [1..1] @codeSystem=\"2.16.840.1.113883.6.1\" (CodeSystem: LOINC urn:oid:2.16.840.1.113883.6.1) (CONF:1198-30826)."
* title 1..1
  * ^comment = "SHALL contain exactly one [1..1] title (CONF:1198-28297)."
* text 1..1
  * ^comment = "SHALL contain exactly one [1..1] text (CONF:1198-28298)."
* entry ..*
  * ^slicing.discriminator[0].type = #profile
  * ^slicing.discriminator[=].path = "organizer"
  * ^slicing.discriminator[+].type = #profile
  * ^slicing.discriminator[=].path = "observation"
  * ^slicing.rules = #open
* entry contains
    mentalStatusOrganizer 0..* and
    mentalStatusObs 0..* and
    assessmentScale 0..*
* entry[mentalStatusOrganizer] ^comment = "MAY contain zero or more [0..*] entry (CONF:1198-28301) such that it"
  * organizer 1..1
  * organizer only MentalStatusOrganizer
    * ^comment = "SHALL contain exactly one [1..1] Mental Status Organizer (identifier: urn:hl7ii:2.\n                16.840.1.113883.10.20.22.4.75:2015-08-01) (CONF:1198-28302)."
* entry[mentalStatusObs] ^comment = "MAY contain zero or more [0..*] entry (CONF:1198-28305) such that it"
  * observation 1..1
  * observation only MentalStatusObservation
    * ^comment = "SHALL contain exactly one [1..1] Mental Status Observation (identifier: urn:hl7ii:\n                2.16.840.1.113883.10.20.22.4.74:2015-08-01) (CONF:1198-28306)."
* entry[assessmentScale] ^comment = "MAY contain zero or more [0..*] entry (CONF:1198-28313) such that it"
  * observation 1..1
  * observation only AssessmentScaleObservation
    * ^comment = "SHALL contain exactly one [1..1] Assessment Scale Observation (identifier: urn:oid:2.16\n                .840.1.113883.10.20.22.4.69) (CONF:1198-28314)."