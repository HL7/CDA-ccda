Profile: DisabilityStatusObservation
Parent: $Observation
Id: DisabilityStatusObservation
Title: "Disability Status Observation"
Description: """This template represents an assessment of patients perception of their physical, cognitive, intellectual, or psychiatric disabilities. It may contain an Assessment Scale Observation that holds the six-item set of questions used on the American Community Survey (ACS) to gauge disability, defined here: [HHS Implementation Guidance on Data Collection Standards for Race, Ethnicity, Sex, Primary Language, and Disability Status](https://aspe.hhs.gov/basic-report/hhs-implementation-guidance-data-collection-standards-race-ethnicity-sex-primary-language-and-disability-status)
This template SHOULD be included zero or more times [0..*] in the Functional Status Section or the Functional Status Organizer.
"""
* ^meta.versionId = "4"
* ^meta.lastUpdated = "2023-07-11T23:41:52.905Z"

* insert LogicalModelTemplate(disability-status-obs, 2.16.840.1.113883.10.20.22.4.505, 2023-05-01)

* ^status = #draft
* classCode 1..1
* classCode = #OBS (exactly)
  * ^comment = "SHALL contain exactly one [1..1] @classCode=\"OBS\" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:4537-32620)."
* moodCode 1..1
* moodCode = #EVN (exactly)
  * ^comment = "SHALL contain exactly one [1..1] @moodCode=\"EVN\" (CodeSystem: HL7ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:4537-32621)."
* code 1..1
  * ^comment = "SHALL contain exactly one [1..1] code (CONF:4537-32624)."
  * code 1..1
  * code = #89571-4
    * ^comment = "This code SHALL contain exactly one [1..1] @code=\"89571-4\" Disability Status [CUBS] (CONF:4537-33023)."
  * codeSystem 1..1
  * codeSystem = "2.16.840.1.113883.6.1"
    * ^comment = "This code SHALL contain exactly one [1..1] @codeSystem=\"2.16.840.1.113883.6.1\" (CONF:4537-33024)."
* statusCode 1..1
  * ^comment = "SHALL contain exactly one [1..1] statusCode (CONF:4537-32625)."
  * code 1..1
  * code from $2.16.840.1.113762.1.4.1240.6 (required)
  * ^comment = "This statusCode SHALL contain exactly one [1..1] @code, which SHALL be selected from ValueSet Completed or Nullified Act Status urn:oid:2.16.840.1.113762.1.4.1240.6."
* effectiveTime 1..1
  * ^comment = "SHALL contain exactly one [1..1] effectiveTime (CONF:4537-32627)."
* value 1..1
* value only $CD
* value from $1.3.6.1.4.1.12009.10.1.3932 (example)
  * ^comment = "SHALL contain exactly one [1..1] value, which MAY be selected from ValueSet CUBS_Disability urn:oid:1.3.6.1.4.1.12009.10.1.3932 DYNAMIC (CONF:4537-32628)."
* entryRelationship ^slicing.discriminator[0].type = #value
  * ^slicing.discriminator[=].path = "observation"
  * ^slicing.discriminator[+].type = #value
  * ^slicing.discriminator[=].path = "typeCode"
  * ^slicing.rules = #open
  * ^comment = "MAY contain zero or more [0..*] entryRelationship (CONF:4537-32629) such that it"
* entryRelationship contains entryRelationship1 0..*
* entryRelationship[entryRelationship1] ^short = "entryRelationship"
  * ^comment = "MAY contain zero or more [0..*] entryRelationship (CONF:4537-32629) such that it"
  * typeCode 1..1
  * typeCode = #COMP (exactly)
    * ^comment = "SHALL contain exactly one [1..1] @typeCode=\"COMP\" has component (CONF:4537-32631)."
  * observation 1..1
  * observation only AssessmentScaleObservation
    * obeys 4537-33057
    * ^comment = "SHALL contain exactly one [1..1] Assessment Scale Observation (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.4.69:2022-06-01) (CONF:4537-32630)."

Invariant: 4537-33057
Description: "A system **MAY** record the six-item set of questions and their answers options from the American Community Survey (ACS) in the Assessment Scale Observation using the [Disability Status Assessment ](https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1099.49/expansion) value set (CONF:4537-33057)."
Severity: #warning