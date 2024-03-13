Profile: VitalSignsOrganizer
Parent: $Organizer
Id: VitalSignsOrganizer
Title: "Vital Signs Organizer"
Description: """This template provides a mechanism for grouping vital signs (e.g., grouping systolic blood pressure and diastolic blood pressure).
"""

* insert LogicalModelTemplate(vital-signs-org, 2.16.840.1.113883.10.20.22.4.26, 2015-08-01)
* insert NarrativeLinkOrganizer

* classCode 1..1
* classCode = #CLUSTER (exactly)
  * ^comment = "SHALL contain exactly one [1..1] @classCode=\"CLUSTER\" CLUSTER (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:1198-7279)."
* moodCode 1..1
  * ^comment = "SHALL contain exactly one [1..1] @moodCode=\"EVN\" Event (CodeSystem: HL7ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:1198-7280)."
* id 1..*
  * ^comment = "SHALL contain at least one [1..*] id (CONF:1198-7282)."
* code 1..1
  * ^short = "Vital Signs"
  * ^comment = "SHALL contain exactly one [1..1] code (CONF:1198-32740)."
  * code 1..1
  * codeSystem 1..1
  * codeSystem = "2.16.840.1.113883.6.96"
    * ^comment = "This code SHALL contain exactly one [1..1] @codeSystem=\"2.16.840.1.113883.6.96\" SNOMED CT (CodeSystem: SNOMED CT urn:oid:2.16.840.1.113883.6.96) (CONF:1198-32742)."
  * translation ^slicing.discriminator[0].type = #value
    * ^slicing.discriminator[=].path = "codeSystem"
    * ^slicing.discriminator[+].type = #value
    * ^slicing.discriminator[=].path = "code"
    * ^slicing.rules = #open
  * translation contains translation1 1..1
  * translation[translation1] ^comment = "This code SHALL contain exactly one [1..1] translation (CONF:1198-32743) such that it"
    * ^short = "Vital signs, weight, height, head circumference, oximetry, BMI, and BSA panel"
    * code 1..1
    * code = #74728-7
      * ^comment = "SHALL contain exactly one [1..1] @code=\"74728-7\" Vital signs, weight, height, head circumference, oximetry, BMI, and BSA panel - HL7.CCDAr1.1 (CodeSystem: LOINC urn:oid:2.16.840.1.113883.6.1) (CONF:1198-32744)."
    * codeSystem 1..1
    * codeSystem = "2.16.840.1.113883.6.1"
      * ^comment = "SHALL contain exactly one [1..1] @codeSystem=\"2.16.840.1.113883.6.1\" LOINC (CodeSystem: LOINC urn:oid:2.16.840.1.113883.6.1) (CONF:1198-32746)."
* statusCode 1..1
  * ^comment = "SHALL contain exactly one [1..1] statusCode (CONF:1198-7284)."
  * code 1..1
  * code = #completed (exactly)
    * ^comment = "This statusCode SHALL contain exactly one [1..1] @code=\"completed\" Completed (CodeSystem: HL7ActStatus urn:oid:2.16.840.1.113883.5.14 STATIC) (CONF:1198-19120)."
* effectiveTime 1..1
  * ^short = "The effectiveTime may be a timestamp or an interval that spans the effectiveTimes of the contained vital signs observations."
  * ^comment = "SHALL contain exactly one [1..1] effectiveTime (CONF:1198-7288)."
* obeys should-author
* author 0..*
* author only AuthorParticipation
  * ^comment = "SHOULD contain zero or more [0..*] Author Participation (identifier: urn:oid:2.16.840.1.113883.10.20.22.4.119) (CONF:1198-31153)." // man-should
* component ^slicing.discriminator[0].type = #profile
  * ^slicing.discriminator[=].path = "observation"
  * ^slicing.rules = #open
* component contains component1 1..*
* component[component1] ^comment = "SHALL contain at least one [1..*] component (CONF:1198-7285) such that it"
  * observation 1..1
  * observation only VitalSignObservation
    * ^comment = "SHALL contain exactly one [1..1] Vital Sign Observation (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.4.27:2014-06-09) (CONF:1198-15946)."