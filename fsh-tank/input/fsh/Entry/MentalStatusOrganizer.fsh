Profile: MentalStatusOrganizer
Parent: $Organizer
Id: MentalStatusOrganizer
Title: "Mental Status Organizer"
Description: "The Mental Status Organizer template may be used to group related Mental Status Observations (e.g., results of mental tests) and associated Assessment Scale Observations into subcategories and/or groupings by time. Subcategories can be things such as Mood and Affect, Behavior, Thought Process, Perception, Cognition, etc."

* insert LogicalModelTemplate(mental-status-org, 2.16.840.1.113883.10.20.22.4.75, 2015-08-01)

* classCode 1..1
* classCode = #CLUSTER (exactly)
  * ^comment = "SHALL contain exactly one [1..1] @classCode=\"CLUSTER\" Cluster (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:1198-14369)."
* moodCode 1..1
  * ^comment = "SHALL contain exactly one [1..1] @moodCode=\"EVN\" Event (CodeSystem: HL7ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:1198-14371)."
* id 1..*
  * ^comment = "SHALL contain at least one [1..*] id (CONF:1198-14377)."
* code 1..1
  * ^short = "The code selected indicates the category that groups the contained mental status observations (e.g., communication, learning and applying knowledge)."
  * ^comment = "SHALL contain exactly one [1..1] code (CONF:1198-14378)."
  * code 1..1
    * obeys 1198-14698
    * ^comment = "This code SHALL contain exactly one [1..1] @code (CONF:1198-14697)."
* statusCode 1..1
  * ^comment = "SHALL contain exactly one [1..1] statusCode (CONF:1198-14372)."
  * code 1..1
  * code from $2.16.840.1.113762.1.4.1240.6 (required)
  * ^comment = "This statusCode SHALL contain exactly one [1..1] @code, which SHALL be selected from ValueSet Completed or Nullified Act Status urn:oid:2.16.840.1.113762.1.4.1240.6."
* effectiveTime 0..1
  * ^short = "The effectiveTime is an interval that spans the effectiveTimes of the contained mental status observations. Because all contained mental status observations have a required time stamp, it is not required that this effectiveTime be populated."
  * ^comment = "SHOULD contain zero or one [0..1] effectiveTime (CONF:1198-32424)."
* component ^slicing.discriminator[0].type = #profile
  * ^slicing.discriminator[=].path = "observation"
  * ^slicing.rules = #open
* component contains mentalStatus 1..*
* component[mentalStatus] ^comment = "SHALL contain at least one [1..*] component (CONF:1198-14373) such that it"
  * observation 1..1
  * observation only MentalStatusObservation
    * ^comment = "SHALL contain exactly one [1..1] Mental Status Observation (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.4.74:2015-08-01) (CONF:1198-14381)."

Invariant: 1198-14698
Description: "**SHOULD** be selected from ICF (codeSystem 2.16.840.1.113883.6.254) *OR* LOINC (codeSystem 2.16.840.1.113883.6.96) (CONF:1198-14698)."
Severity: #warning
