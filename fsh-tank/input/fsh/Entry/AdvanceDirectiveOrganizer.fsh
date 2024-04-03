Profile: AdvanceDirectiveOrganizer
Parent: $Organizer
Id: AdvanceDirectiveOrganizer
Title: "Advance Directive Organizer"
Description: """The Advance Directive Organizer includes information about who verified the content available in each advance healthcare directive source document or other verified source documentation. 
When documenting the existence of advance healthcare directive document(s), the organizer contains an observation which includes information about the kind of advance healthcare directive source document (e.g., Living Will, Personal Advance Care Plan, Portable Medical Order).  This observation provides identifier references to the external source advance healthcare directive document.

If a person has appointed healthcare agent(s), the organizer includes the current healthcare agent(s) information, and a reference to the external document which contains the healthcare agent appointment decisions. 
Additional observations summarizing the type of content included in the advance directive source documents also can be included. Treatment Intervention Preferences, Care Experience Preferences, Upon Death Preferencesand Personal Health Goals may be considered relevant by the organization rendering care services to the patient and  included in the organizer as well although duplicating information is discouraged.

When the existing advance healthcare directive document is a portable medical order, Advance Directive Observations are used to summarize the types of portable orders in the verified document. This provides new summary “structured data” for portable medical orders that often are still exchanged as scanned images.

Provenance information such as author, performer, informant and participant can be used with the Organizer to minimize redundancy on each component Observation."""

* insert LogicalModelTemplate(advance-directive-org, 2.16.840.1.113883.10.20.22.4.108, 2022-02-14)
* insert NarrativeLinkOrganizer

* classCode 1..1
* classCode = #CLUSTER (exactly)
  * ^comment = "SHALL contain exactly one [1..1] @classCode=\"CLUSTER\" Cluster (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:1198-28410)."
* moodCode 1..1
* moodCode = #EVN (exactly)
  * ^comment = "SHALL contain exactly one [1..1] @moodCode=\"EVN\" Event (CodeSystem: HL7ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:1198-28411)."
* id 1..*
  * ^comment = "SHALL contain at least one [1..*] id (CONF:1198-28414)."
* code 1..1
  * insert CodedLoinc(45473-6, [[Advance directive/living will completed]])
  * ^comment = "This code SHALL contain exactly one [1..1] @code=\"45473-6\" Advance directive - living will  (CONF:1198-31230)."
* statusCode 1..1
  * ^comment = "SHALL contain exactly one [1..1] statusCode (CONF:1198-28418)."
  * code 1..1
  * code = #completed (exactly)
    * ^comment = "This statusCode SHALL contain exactly one [1..1] @code=\"completed\" (CodeSystem: HL7ActStatus urn:oid:2.16.840.1.113883.5.14) (CONF:1198-31346)."
* obeys should-author
* author 0..*
* author only AuthorParticipation
  * ^comment = "SHOULD contain zero or more [0..*] Author Participation (identifier: urn:oid:2.16.840.1.113883.10.20.22.4.119) (CONF:1198-32407)." // man-should
* obeys should-informant
* informant ^short = "SHOULD contain informant" // man-should
* obeys should-participant
* participant ^short = "SHOULD contain participant" // man-should
* component ^slicing.discriminator[0].type = #profile
  * ^slicing.discriminator[=].path = "observation"
  * ^slicing.rules = #open
* component contains component1 1..*
* component[component1] ^comment = "SHALL contain at least one [1..*] component (CONF:1198-28420) such that it"
  * observation 1..1
  * observation only AdvanceDirectiveObservation
    * ^comment = "SHALL contain exactly one [1..1] Advance Directive Observation (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.4.48:2022-02-14) (CONF:1198-28421)."