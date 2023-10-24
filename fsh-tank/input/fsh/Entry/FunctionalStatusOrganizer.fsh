Profile: FunctionalStatusOrganizer
Parent: $Organizer
Id: FunctionalStatusOrganizer
Title: "Functional Status Organizer"
Description: "This template groups related functional status observations into categories (e.g., mobility, self-care)."

* insert LogicalModelTemplate(functional-status-org, 2.16.840.1.113883.10.20.22.4.66, 2014-06-09)

* classCode 1..1
* classCode = #CLUSTER (exactly)
  * ^comment = "SHALL contain exactly one [1..1] @classCode=\"CLUSTER\" Cluster (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:1098-14355)."
* moodCode 1..1
* moodCode = #EVN (exactly)
  * ^comment = "SHALL contain exactly one [1..1] @moodCode=\"EVN\" Event (CodeSystem: HL7ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:1098-14357)."
* id 1..*
  * ^comment = "SHALL contain at least one [1..*] id (CONF:1098-14363)."
* code 1..1
  // TODO - remove the obeys and invariant and replace with value set preferred binding to VS containing ICF and LOINC
  * obeys 1098-31417
  * ^short = "The code selected should indicate the category that groups the contained functional status evaluation observations (e.g., mobility, self-care, communication)."
  * ^comment = "SHALL contain exactly one [1..1] code (CONF:1098-14364)."
* statusCode 1..1
  * ^comment = "SHALL contain exactly one [1..1] statusCode (CONF:1098-14358)."
  * code 1..1
  * code from $2.16.840.1.113762.1.4.1240.6 (required)
  * ^comment = "This statusCode SHALL contain exactly one [1..1] @code, which SHALL be selected from ValueSet Completed or Nullified Act Status urn:oid:2.16.840.1.113762.1.4.1240.6."
* author 0..*
* author only AuthorParticipation
  * ^comment = "SHOULD contain zero or more [0..*] Author Participation (identifier: urn:oid:2.16.840.1.113883.10.20.22.4.119) (CONF:1098-31585)."
* component 1..
  * ^slicing.discriminator[0].type = #profile
  * ^slicing.discriminator[=].path = "observation"
  * ^slicing.rules = #open
* component contains
    functionalStatus 1..* and
    selfCare 1..*
* component[functionalStatus] ^comment = "SHALL contain at least one [1..*] component (CONF:1098-14359) such that it"
  * observation 1..1
  * observation only FunctionalStatusObservation
    * ^comment = "SHALL contain exactly one [1..1] Functional Status Observation (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.4.67:2014-06-09) (CONF:1098-14368)."
* component[selfCare] ^comment = "SHALL contain at least one [1..*] component (CONF:1098-31432) such that it"
  * observation 1..1
  * observation only SelfCareActivitiesADLandIADL
    * ^comment = "SHALL contain exactly one [1..1] Self-Care Activities (ADL and IADL) (identifier: urn:oid:2.16.840.1.113883.10.20.22.4.128) (CONF:1098-31433)."

Invariant: 1098-31417
Description: "**SHOULD** be selected from ICF (codeSystem 2.16.840.1.113883.6.254) *OR* LOINC (2.16.840.1.113883.6.1) (CONF:1098-31417)."
Severity: #warning
Expression: "codeSystem = '2.16.840.1.113883.6.254' or codeSystem = '2.16.840.1.113883.6.1'"