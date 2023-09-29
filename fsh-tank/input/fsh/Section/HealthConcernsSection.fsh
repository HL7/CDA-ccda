Profile: HealthConcernsSection
Parent: $Section
Id: HealthConcernsSection
Title: "Health Concerns Section"
Description: """This section contains data describing an interest or worry about a health state or process that could possibly require attention, intervention, or management. A Health Concern is a health related matter that is of interest, importance or worry to someone, who may be the patient, patient's family or patient's health care provider. Health concerns are derived from a variety of sources within an EHR (such as Problem List, Family History, Social History, Social Worker Note, etc.). Health concerns can be medical, surgical, nursing, allied health or patient-reported concerns.

Problem Concerns are a subset of Health Concerns that have risen to the level of importance that they typically would belong on a classic "Problem List", such as "Diabetes Mellitus" or "Family History of Melanoma" or "Tobacco abuse". These are of broad interest to multiple members of the care team. Examples of other Health Concerns that might not typically be considered a Problem Concern include "Risk of Hyperkalemia" for a patient taking an ACE-inhibitor medication, or "Transportation difficulties" for someone who doesn't drive and has trouble getting to appointments, or "Under-insured" for someone who doesn't have sufficient insurance to properly cover their medical needs such as medications. These are typically most important to just a limited number of care team members."""
* insert LogicalModelNA
* ^identifier.value = "urn:hl7ii:2.16.840.1.113883.10.20.22.2.58:2015-08-01"
* ^version = "2015-08-01"
* nullFlavor 0..1
* nullFlavor = #NI (exactly)
  * ^comment = "MAY contain zero or one [0..1] @nullFlavor=\"NI\" No information (CodeSystem: HL7NullFlavor urn:oid:2.16.840.1.113883.5.1008) (CONF:1198-32802)."
* templateId ^slicing.discriminator[0].type = #value
  * ^slicing.discriminator[=].path = "extension"
  * ^slicing.discriminator[+].type = #value
  * ^slicing.discriminator[=].path = "root"
  * ^slicing.rules = #open
* templateId contains primary 1..1
* templateId[primary] ^comment = "SHALL contain exactly one [1..1] templateId (CONF:1198-28804) such that it"
  * root 1..1
  * root = "2.16.840.1.113883.10.20.22.2.58"
    * ^comment = "SHALL contain exactly one [1..1] @root=\"2.16.840.1.113883.10.20.22.2.58\" (CONF:1198-28805)."
  * extension 1..1
  * extension = "2015-08-01"
    * ^comment = "SHALL contain exactly one [1..1] @extension=\"2015-08-01\" (CONF:1198-32862)."
* code 1..1
  * ^comment = "SHALL contain exactly one [1..1] code (CONF:1198-28806)."
  * code 1..1
  * code = #75310-3
    * ^comment = "This code SHALL contain exactly one [1..1] @code=\"75310-3\" Health concerns document (CONF:1198-28807)."
  * codeSystem 1..1
  * codeSystem = "2.16.840.1.113883.6.1"
    * ^comment = "This code SHALL contain exactly one [1..1] @codeSystem=\"2.16.840.1.113883.6.1\" (CodeSystem: LOINC urn:oid:2.16.840.1.113883.6.1) (CONF:1198-28808)."
* title 1..1
  * ^comment = "SHALL contain exactly one [1..1] title (CONF:1198-28809)."
* text 1..1
  * ^comment = "SHALL contain exactly one [1..1] text (CONF:1198-28810)."
* entry ..*
  * ^slicing.discriminator[0].type = #profile
  * ^slicing.discriminator[=].path = "observation.resolve()"
  * ^slicing.rules = #open
* entry contains
    healthStatus 0..* and
    healthConcern 1..* and
    riskConcern 0..*
* entry[healthStatus] ^comment = "SHOULD contain zero or more [0..*] entry (CONF:1198-30483)"
  * observation 1..1
  * observation only HealthStatusObservation
    * ^comment = "The entry, if present, SHALL contain exactly one [1..1] Health Status Observation (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.4.5:2014-06-09) (CONF:1198-30484)."
* entry[healthConcern] obeys sectionNullFlavorNotPresent
  * ^short = "If section/@nullFlavor is not present:"
  * ^comment = "SHALL contain at least one [1..*] entry (CONF:1198-30768)"
  * act 1..1
  * act only HealthConcernAct
    * ^comment = "SHALL contain exactly one [1..1] Health Concern Act (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.4.132:2015-08-01) (CONF:1198-30769)."
* entry[riskConcern] ^comment = "MAY contain zero or more [0..*] entry (CONF:1198-32308)"
  * act 1..1
  * act only RiskConcernAct
    * ^comment = "SHALL contain exactly one [1..1] Risk Concern Act (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.4.136:2015-08-01) (CONF:1198-32309)."

Invariant: sectionNullFlavorNotPresent
Description: "Required when section/@nullFlavor is not present."
Severity: #error