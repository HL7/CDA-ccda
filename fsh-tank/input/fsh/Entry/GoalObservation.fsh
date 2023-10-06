Profile: GoalObservation
Parent: $Observation
Id: GoalObservation
Title: "Goal Observation"
Description: """This template represents a patient health goal. A Goal Observation template may have related components that are acts, encounters, observations, procedures, substance administrations, or supplies. A goal identifies a future desired condition or state. Goals are often related to physical or mental health conditions or diseases, but also may be related to a Social Determinant of Health (SDOH) risks or states. For example, to have adequate quality meals and snacks, gain transportation security - able to access health and social needs). SDOH data relate to conditions in which people live, learn, work, and play and their effects on health risks and outcomes.  A Goal is established by the patient or provider. 

A goal may be a patient or provider goal. If the author is set to the recordTarget (patient), this is a patient goal. If the author is set to a provider, this is a provider goal. If both patient and provider are set as authors, this is a negotiated goal.

A goal usually has a related health concern and/or risk.

A goal may have components consisting of other goals (milestones). These milestones are related to the overall goal through entryRelationships."""

* insert LogicalModelTemplate(goal-obs, 2.16.840.1.113883.10.20.22.4.121, 2022-06-01)

* classCode 1..1
* classCode = #OBS (exactly)
  * ^comment = "SHALL contain exactly one [1..1] @classCode=\"OBS\" Observation (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:4515-30418)."
* moodCode 1..1
* moodCode = #GOL (exactly)
  * ^comment = "SHALL contain exactly one [1..1] @moodCode=\"GOL\" Goal (CodeSystem: HL7ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:4515-30419)."
* id 1..*
  * ^comment = "SHALL contain at least one [1..*] id (CONF:4515-32332)."
* code 1..1
  * obeys 4515-32887
  * ^comment = "SHALL contain exactly one [1..1] code, which SHOULD be selected from CodeSystem LOINC (urn:oid:2.16.840.1.113883.6.1) (CONF:4515-30784)."
* statusCode 1..1
  * ^comment = "SHALL contain exactly one [1..1] statusCode (CONF:4515-32333)."
  * code 1..1
  * code from ActStatus (required)
    * ^comment = "This statusCode SHALL contain exactly one [1..1] @code, which SHALL be selected from ValueSet ActStatus urn:oid:2.16.840.1.113883.1.11.15933 STATIC (CONF:4515-32334)."
* effectiveTime 0..1
  * ^comment = "SHOULD contain zero or one [0..1] effectiveTime (CONF:4515-32335)."
* value 0..1
  * obeys 4515-32963
* author 0..*
* author only AuthorParticipation
  * ^comment = "SHOULD contain zero or more [0..*] Author Participation (identifier: urn:oid:2.16.840.1.113883.10.20.22.4.119) (CONF:4515-30995)."
* entryRelationship ^slicing.discriminator[0].type = #value
  * ^slicing.discriminator[=].path = "act"
  * ^slicing.discriminator[+].type = #value
  * ^slicing.discriminator[=].path = "typeCode"
  * ^slicing.rules = #open
  * ^comment = "MAY contain zero or more [0..*] entryRelationship (CONF:4515-31559) such that it"
* entryRelationship contains
    entryRelationship1 0..* and
    entryRelationship2 0..* and
    entryRelationship3 0..1 and
    entryRelationship4 0..* and
    entryRelationship5 0..* and
    entryRelationship6 0..*
* entryRelationship[entryRelationship1] ^short = "entryRelationship"
  * ^comment = "MAY contain zero or more [0..*] entryRelationship (CONF:4515-30701) such that it"
  * typeCode 1..1
  * typeCode = #REFR (exactly)
    * ^comment = "SHALL contain exactly one [1..1] @typeCode=\"REFR\" Refers to (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:4515-30702)."
  * act 1..1
  * act only EntryReference
    * ^comment = "SHALL contain exactly one [1..1] Entry Reference (identifier: urn:oid:2.16.840.1.113883.10.20.22.4.122) (CONF:4515-30703)."
* entryRelationship[entryRelationship2] ^short = "entryRelationship"
  * ^comment = "MAY contain zero or more [0..*] entryRelationship (CONF:4515-30704) such that it"
  * typeCode 1..1
  * typeCode = #COMP (exactly)
    * ^comment = "SHALL contain exactly one [1..1] @typeCode=\"COMP\" Has component (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:4515-30705)."
  * act 1..1
  * act only EntryReference
    * ^comment = "SHALL contain exactly one [1..1] Entry Reference (identifier: urn:oid:2.16.840.1.113883.10.20.22.4.122) (CONF:4515-32879)."
* entryRelationship[entryRelationship3] ^short = "entryRelationship"
  * ^comment = "SHOULD contain zero or one [0..1] entryRelationship (CONF:4515-30785) such that it"
  * typeCode 1..1
  * typeCode = #REFR (exactly)
    * ^comment = "SHALL contain exactly one [1..1] @typeCode=\"REFR\" Refers to (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:4515-30786)."
  * observation 1..1
  * observation only PriorityPreference
    * ^comment = "SHALL contain exactly one [1..1] Priority Preference (identifier: urn:oid:2.16.840.1.113883.10.20.22.4.143) (CONF:4515-30787)."
* entryRelationship[entryRelationship4] ^short = "entryRelationship"
  * ^comment = "MAY contain zero or more [0..*] entryRelationship (CONF:4515-31448) such that it"
  * typeCode 1..1
  * typeCode = #COMP (exactly)
    * ^comment = "SHALL contain exactly one [1..1] @typeCode=\"COMP\" Has component (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:4515-31449)."
  * observation 1..1
  * observation only GoalObservation
    * ^comment = "SHALL contain exactly one [1..1] Goal Observation (identifier: urn:oid:2.16.840.1.113883.10.20.22.4.121) (CONF:4515-32880)."
* entryRelationship[entryRelationship5] ^short = "entryRelationship"
  * ^comment = "MAY contain zero or more [0..*] entryRelationship (CONF:4515-31559) such that it"
  * typeCode 1..1
  * typeCode = #REFR (exactly)
    * ^comment = "SHALL contain exactly one [1..1] @typeCode=\"REFR\" Refers to (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:4515-31560)."
  * act 1..1
  * act only EntryReference
    * ^comment = "SHALL contain exactly one [1..1] Entry Reference (identifier: urn:oid:2.16.840.1.113883.10.20.22.4.122) (CONF:4515-31588)."
* entryRelationship[entryRelationship6] ^short = "entryRelationship"
  * ^comment = "MAY contain zero or more [0..*] entryRelationship such that it"
  * typeCode 1..1
  * typeCode = #REFR (exactly)
    * ^comment = "SHALL contain exactly one [1..1] @typeCode=\"REFR\" Refers to (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:4515-31560)."
  * observation 1..1
  * observation only ProgressTowardGoalObservation
    * ^short = "act"
    * ^comment = "SHALL contain exactly one [1..1] Progress Toward Goal Observation (identifier: urn:oid:2.16.840.1.113883.10.20.22.4.110)."
* reference 0..*
  * ^comment = "MAY contain zero or more [0..*] reference (CONF:4515-32754)."
  * typeCode 1..1
  * typeCode = #REFR (exactly)
    * ^comment = "The reference, if present, SHALL contain exactly one [1..1] @typeCode=\"REFR\" Refers to (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:4515-32755)."
  * externalDocument 1..1
  * externalDocument only ExternalDocumentReference
    * ^comment = "The reference, if present, SHALL contain exactly one [1..1] External Document Reference (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.4.115:2014-06-09) (CONF:4515-32756)."

Invariant: 4515-32887
Description: "When the Goal is Social Determinant of Health Goal, the observation/code **SHOULD** contain exactly one [1..1] code, which  **SHOULD** contain exactly one [1..1] @code=\"8689-2 \"History of Social function” This code **SHALL** contain exactly one [1..1] @codeSystem=\"2.16.840.1.113883.6.1\" (CodeSystem: LOINC 2.16.840.1.113883.6.1) (CONF:4515-32887)."
Severity: #warning

Invariant: 4515-32963
Description: "When the Goal is Social Determinant of Health Goal, the observation/value **SHOULD** be selected from ValueSet [Social Determinant of Health Goals](https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.71/expansion) **DYNAMIC** (CONF:4515-32963)."
Severity: #warning