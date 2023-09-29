Profile: FunctionalStatusObservation
Parent: $Observation
Id: FunctionalStatusObservation
Title: "Functional Status Observation"
Description: "This template represents the patient's physical function (e.g., mobility status, instrumental activities of daily living, self-care status) and problems that limit function (dyspnea, dysphagia). The template may include assessment scale observations, identify supporting caregivers, and provide information about non-medicinal supplies. This template is used to represent physical or developmental function of all patient populations."
* insert LogicalModelNA
* ^identifier.value = "urn:hl7ii:2.16.840.1.113883.10.20.22.4.67:2014-06-09"
* ^version = "2014-06-09"
* classCode 1..1
* classCode = #OBS (exactly)
  * ^comment = "SHALL contain exactly one [1..1] @classCode=\"OBS\" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:1098-13905)."
* moodCode 1..1
* moodCode = #EVN (exactly)
  * ^comment = "SHALL contain exactly one [1..1] @moodCode=\"EVN\" (CodeSystem: HL7ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:1098-13906)."
* templateId ^slicing.discriminator[0].type = #value
  * ^slicing.discriminator[=].path = "root"
  * ^slicing.discriminator[+].type = #value
  * ^slicing.discriminator[=].path = "extension"
  * ^slicing.rules = #open
* templateId contains primary 1..1
* templateId[primary] ^comment = "SHALL contain exactly one [1..1] templateId (CONF:1098-13889) such that it"
  * root 1..1
  * root = "2.16.840.1.113883.10.20.22.4.67"
    * ^comment = "SHALL contain exactly one [1..1] @root=\"2.16.840.1.113883.10.20.22.4.67\" (CONF:1098-13890)."
  * extension 1..1
  * extension = "2014-06-09"
    * ^comment = "SHALL contain exactly one [1..1] @extension=\"2014-06-09\" (CONF:1098-32568)."
* id 1..*
  * ^comment = "SHALL contain at least one [1..*] id (CONF:1098-13907)."
* code 1..1
  * ^comment = "SHALL contain exactly one [1..1] code (CONF:1098-13908)."
  * code 1..1
  * code = #54522-8
    * ^comment = "This code SHALL contain exactly one [1..1] @code=\"54522-8\" Functional status (CONF:1098-31522)."
  * codeSystem 1..1
  * codeSystem = "2.16.840.1.113883.6.1"
    * ^comment = "This code SHALL contain exactly one [1..1] @codeSystem=\"2.16.840.1.113883.6.1\" (CodeSystem: LOINC urn:oid:2.16.840.1.113883.6.1) (CONF:1098-31523)."
* statusCode 1..1
  * ^comment = "SHALL contain exactly one [1..1] statusCode (CONF:1098-13929)."
  * code 1..1
  * code = #completed (exactly)
    * ^comment = "This statusCode SHALL contain exactly one [1..1] @code=\"completed\" Completed (CodeSystem: HL7ActStatus urn:oid:2.16.840.1.113883.5.14 STATIC) (CONF:1098-19101)."
* effectiveTime 1..1
  * ^comment = "SHALL contain exactly one [1..1] effectiveTime (CONF:1098-13930)."
* value 1..1
  * obeys 1098-14234
  * ^comment = "SHALL contain exactly one [1..1] value (CONF:1098-13932)."
* author 0..*
* author only AuthorParticipation
  * ^comment = "SHOULD contain zero or more [0..*] Author Participation (identifier: urn:oid:2.16.840.1.113883.10.20.22.4.119) (CONF:1098-13936)."
* entryRelationship ^slicing.discriminator[0].type = #profile
  * ^slicing.discriminator[=].path = "supply"
  * ^slicing.discriminator[+].type = #profile
  * ^slicing.discriminator[=].path = "observation"
  * ^slicing.rules = #open
* entryRelationship contains
    nonMedSupply 0..1 and
    caregiverCharacteristics 0..1 and
    assessmentScaleObservation 0..1
* entryRelationship[nonMedSupply] ^comment = "MAY contain zero or one [0..1] entryRelationship (CONF:1098-13892) such that it"
  * typeCode 1..1
  * typeCode = #REFR (exactly)
    * ^comment = "SHALL contain exactly one [1..1] @typeCode=\"REFR\" refers to (CONF:1098-14596)."
  * supply 1..1
  * supply only NonMedicinalSupplyActivity
    * ^comment = "SHALL contain exactly one [1..1] Non-Medicinal Supply Activity (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.4.50:2014-06-09) (CONF:1098-14218)."
* entryRelationship[caregiverCharacteristics] ^comment = "MAY contain zero or one [0..1] entryRelationship (CONF:1098-13895) such that it"
  * typeCode 1..1
  * typeCode = #REFR (exactly)
    * ^comment = "SHALL contain exactly one [1..1] @typeCode=\"REFR\" refers to (CONF:1098-14597)."
  * observation 1..1
  * observation only CaregiverCharacteristics
    * ^comment = "SHALL contain exactly one [1..1] Caregiver Characteristics (identifier: urn:oid:2.16.840.1.113883.10.20.22.4.72) (CONF:1098-13897)."
* entryRelationship[assessmentScaleObservation] ^comment = "MAY contain zero or one [0..1] entryRelationship (CONF:1098-14465) such that it"
  * typeCode 1..1
  * typeCode = #COMP (exactly)
    * ^comment = "SHALL contain exactly one [1..1] @typeCode=\"COMP\" has component (CONF:1098-14598)."
  * observation 1..1
  * observation only AssessmentScaleObservation
    * ^comment = "SHALL contain exactly one [1..1] Assessment Scale Observation (identifier: urn:oid:2.16.840.1.113883.10.20.22.4.69) (CONF:1098-14466)."
* referenceRange 0..*
  * ^short = "referenceRange could be used to represent normal or expected capability for the function being evaluated."
  * ^comment = "MAY contain zero or more [0..*] referenceRange (CONF:1098-13937)."

Invariant: 1098-14234
Description: "If xsi:type=“CD”, **SHOULD** contain a code from SNOMED CT (CodeSystem: 2.16.840.1.113883.6.96) (CONF:1098-14234)."
Severity: #warning