Profile: AdvanceDirectiveOrganizer
Parent: $Organizer
Id: AdvanceDirectiveOrganizer
Title: "Advance Directive Organizer"
Description: "This clinical statement groups a set of advance directive observations."

* insert LogicalModelTemplate(advance-directive-org, 2.16.840.1.113883.10.20.22.4.108, 2015-08-01)

* classCode 1..1
* classCode = #CLUSTER (exactly)
  * ^comment = "SHALL contain exactly one [1..1] @classCode=\"CLUSTER\" Cluster (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:1198-28410)."
* moodCode 1..1
* moodCode = #EVN (exactly)
  * ^comment = "SHALL contain exactly one [1..1] @moodCode=\"EVN\" Event (CodeSystem: HL7ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:1198-28411)."
* id 1..*
  * ^comment = "SHALL contain at least one [1..*] id (CONF:1198-28414)."
* code 1..1
  * ^comment = "SHALL contain exactly one [1..1] code (CONF:1198-28415)."
  * code 1..1
  * code = #45473-6
    * ^comment = "This code SHALL contain exactly one [1..1] @code=\"45473-6\" Advance directive - living will  (CONF:1198-31230)."
  * codeSystem 1..1
  * codeSystem = "2.16.840.1.113883.6.1"
    * ^comment = "This code SHALL contain exactly one [1..1] @codeSystem=\"2.16.840.1.113883.6.1\" (CodeSystem: LOINC urn:oid:2.16.840.1.113883.6.1 STATIC) (CONF:1198-31231)."
* statusCode 1..1
  * ^comment = "SHALL contain exactly one [1..1] statusCode (CONF:1198-28418)."
  * code 1..1
  * code = #completed (exactly)
    * ^comment = "This statusCode SHALL contain exactly one [1..1] @code=\"completed\" (CodeSystem: HL7ActStatus urn:oid:2.16.840.1.113883.5.14) (CONF:1198-31346)."
* author 0..*
* author only AuthorParticipation
  * ^comment = "SHOULD contain zero or more [0..*] Author Participation (identifier: urn:oid:2.16.840.1.113883.10.20.22.4.119) (CONF:1198-32407)."
* component ^slicing.discriminator[0].type = #profile
  * ^slicing.discriminator[=].path = "observation"
  * ^slicing.rules = #open
* component contains component1 1..*
* component[component1] ^comment = "SHALL contain at least one [1..*] component (CONF:1198-28420) such that it"
  * observation 1..1
  * observation only AdvanceDirectiveObservation
    * ^comment = "SHALL contain exactly one [1..1] Advance Directive Observation (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.4.48:2015-08-01) (CONF:1198-28421)."