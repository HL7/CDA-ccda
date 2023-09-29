Profile: FunctionalStatusSection
Parent: $Section
Id: FunctionalStatusSection
Title: "Functional Status Section"
Description: "The Functional Status Section contains observations and assessments of a patient's physical abilities. A patient's functional status may include information regarding the patient's ability to perform Activities of Daily Living (ADLs) in areas such as Mobility (e.g., ambulation), Self-Care (e.g., bathing, dressing, feeding, grooming) or Instrumental Activities of Daily Living (IADLs) (e.g., shopping, using a telephone, balancing a check book). Problems that impact function (e.g., dyspnea, dysphagia) can be contained in the section."
* insert LogicalModelNA
* ^identifier.value = "urn:hl7ii:2.16.840.1.113883.10.20.22.2.14:2014-06-09"
* ^version = "2014-06-09"
* templateId ^slicing.discriminator[0].type = #value
  * ^slicing.discriminator[=].path = "root"
  * ^slicing.discriminator[+].type = #value
  * ^slicing.discriminator[=].path = "extension"
  * ^slicing.rules = #open
* templateId contains primary 1..1
* templateId[primary] ^comment = "SHALL contain exactly one [1..1] templateId (CONF:1098-7920) such that it"
  * root 1..1
  * root = "2.16.840.1.113883.10.20.22.2.14"
    * ^comment = "SHALL contain exactly one [1..1] @root=\"2.16.840.1.113883.10.20.22.2.14\" (CONF:1098-10389)."
  * extension 1..1
  * extension = "2014-06-09"
    * ^comment = "SHALL contain exactly one [1..1] @extension=\"2014-06-09\" (CONF:1098-32567)."
* code 1..1
  * ^comment = "SHALL contain exactly one [1..1] code (CONF:1098-14578)."
  * code 1..1
  * code = #47420-5
    * ^comment = "This code SHALL contain exactly one [1..1] @code=\"47420-5\" Functional Status (CONF:1098-14579)."
  * codeSystem 1..1
  * codeSystem = "2.16.840.1.113883.6.1"
    * ^comment = "This code SHALL contain exactly one [1..1] @codeSystem=\"2.16.840.1.113883.6.1\" (CodeSystem: LOINC urn:oid:2.16.840.1.113883.6.1) (CONF:1098-30866)."
* title 1..1
  * ^comment = "SHALL contain exactly one [1..1] title (CONF:1098-7922)."
* text 1..1
  * ^comment = "SHALL contain exactly one [1..1] text (CONF:1098-7923)."
* entry ..*
  * ^slicing.discriminator[0].type = #profile
  * ^slicing.discriminator[=].path = "organizer"
  * ^slicing.discriminator[+].type = #profile
  * ^slicing.discriminator[=].path = "observation"
  * ^slicing.discriminator[+].type = #profile
  * ^slicing.discriminator[=].path = "supply"
  * ^slicing.rules = #open
* entry contains
    funcStatusOrganizer 0..* and
    funcStatusObs 0..* and
    caregiverCharacteristics 0..* and
    assessmentScale 0..* and
    nonMedSupply 0..* and
    selfCareActivity 0..* and
    sensoryStatus 0..*
* entry[funcStatusOrganizer] ^comment = "MAY contain zero or more [0..*] entry (CONF:1098-14414) such that it"
  * organizer 1..1
  * organizer only FunctionalStatusOrganizer
    * ^comment = "SHALL contain exactly one [1..1] Functional Status Organizer (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.4.66:2014-06-09) (CONF:1098-14415)."
* entry[funcStatusObs] ^comment = "MAY contain zero or more [0..*] entry (CONF:1098-14418) such that it"
  * observation 1..1
  * observation only FunctionalStatusObservation
    * ^comment = "SHALL contain exactly one [1..1] Functional Status Observation (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.4.67:2014-06-09) (CONF:1098-14419)."
* entry[caregiverCharacteristics] ^comment = "MAY contain zero or more [0..*] entry (CONF:1098-14426) such that it"
  * observation 1..1
  * observation only CaregiverCharacteristics
    * ^comment = "SHALL contain exactly one [1..1] Caregiver Characteristics (identifier: urn:oid:2.16.840.1.113883.10.20.22.4.72) (CONF:1098-14427)."
* entry[assessmentScale] ^comment = "MAY contain zero or more [0..*] entry (CONF:1098-14580) such that it"
  * observation 1..1
  * observation only AssessmentScaleObservation
    * ^comment = "SHALL contain exactly one [1..1] Assessment Scale Observation (identifier: urn:oid:2.16.840.1.113883.10.20.22.4.69) (CONF:1098-14581)."
* entry[nonMedSupply] ^comment = "MAY contain zero or more [0..*] entry (CONF:1098-14582) such that it"
  * supply 1..1
  * supply only NonMedicinalSupplyActivity
    * ^comment = "SHALL contain exactly one [1..1] Non-Medicinal Supply Activity (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.4.50:2014-06-09) (CONF:1098-30783)."
* entry[selfCareActivity] ^comment = "MAY contain zero or more [0..*] entry (CONF:1098-32792) such that it"
  * observation 1..1
  * observation only SelfCareActivitiesADLandIADL
    * ^comment = "SHALL contain exactly one [1..1] Self-Care Activities (ADL and IADL) (identifier: urn:oid:2.16.840.1.113883.10.20.22.4.128) (CONF:1098-31009)."
* entry[sensoryStatus] ^comment = "MAY contain zero or more [0..*] entry (CONF:1098-16779) such that it"
  * observation 1..1
  * observation only SensoryStatus
    * ^comment = "SHALL contain exactly one [1..1] Sensory Status (identifier: urn:oid:2.16.840.1.113883.10.20.22.4.127) (CONF:1098-31011)."