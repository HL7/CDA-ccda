Profile: GoalObservation
Parent: $Observation
Id: GoalObservation
Title: "Goal Observation"
Description: """This template represents a patient health goal. A Goal Observation template may have related components that are acts, encounters, observations, procedures, substance administrations, or supplies. A goal identifies a future desired condition or state. Goals are often related to physical or mental health conditions or diseases, but also may be related to a Social Determinant of Health (SDOH) risks or states. For example, to have adequate quality meals and snacks, gain transportation security - able to access health and social needs). SDOH data relate to conditions in which people live, learn, work, and play and their effects on health risks and outcomes.  A Goal is established by the patient or provider or both. 

A goal may be a patient or provider goal. If the author is set to the recordTarget (patient), this is a patient goal. If the author is set to a provider, this is a provider goal. If both patient and provider are set as authors, this is called a negotiated or shared goal.

A goal usually has a related health concern and/or risk.

A goal may have components consisting of other goals (milestones). These milestones are related to the overall goal through entryRelationships."""

// !!! This templateId is referenced in an invariant below. If it changes (including the date), update that invariant's expression!!!
* insert LogicalModelTemplate(goal-obs, 2.16.840.1.113883.10.20.22.4.121, 2022-06-01)
* insert NarrativeLink

* classCode 1..1
* classCode = #OBS (exactly)
  * ^comment = "SHALL contain exactly one [1..1] @classCode=\"OBS\" Observation (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:4515-30418)."
* moodCode 1..1
* moodCode = #GOL (exactly)
  * ^comment = "SHALL contain exactly one [1..1] @moodCode=\"GOL\" Goal (CodeSystem: HL7ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:4515-30419)."
* id 1..*
  * ^comment = "SHALL contain at least one [1..*] id (CONF:4515-32332)."
* code 1..1
  * ^short = "When the Goal is Social Determinant of Health Goal, the observation/code SHOULD contain exactly one [1..1] code, which SHOULD contain exactly one [1..1] @code=\"8689-2 \"History of Social function"
  * ^comment = "This code SHALL contain exactly one [1..1] @codeSystem=\"2.16.840.1.113883.6.1\" (CodeSystem: LOINC 2.16.840.1.113883.6.1)."
* statusCode 1..1
  * ^comment = "SHALL contain exactly one [1..1] statusCode (CONF:4515-32333)."
  * insert BindAtCode(ActStatus, required)
* obeys should-effectiveTime
* effectiveTime 0..1
  * ^comment = "SHOULD contain zero or one [0..1] effectiveTime (CONF:4515-32335)." // auto-should
  * ^short = "effectiveTime/low represents when to start working on the goal. effectiveTime/high or effectiveTime/value represents when the goal should be met (i.e. a due date)"
* value 0..1
  * ^short = "When the Goal is Social Determinant of Health Goal, the observation/value **SHOULD** be selected from ValueSet Social Determinant of Health Goals urn:oid:2.16.840.1.113762.1.4.1247.71 DYNAMIC."
* obeys should-author
* author 0..*
* author only AuthorParticipation
  * ^short = "If the author is the recordTarget (patient), this is a patient goal.  If the author is a provider, this is a provider goal. If both patient and provider are authors, this is a negotiated goal. If no author is present, it is assumed the document or section author(s) is the author of this goal."
  * ^comment = "SHOULD contain zero or more [0..*] Author Participation (identifier: urn:oid:2.16.840.1.113883.10.20.22.4.119) (CONF:4515-30995)." // man-should
* entryRelationship ^slicing.discriminator[0].type = #profile
  * ^slicing.discriminator[=].path = "act"
  * ^slicing.discriminator[+].type = #profile
  * ^slicing.discriminator[=].path = "observation"
  * ^slicing.discriminator[+].type = #value
  * ^slicing.discriminator[=].path = "typeCode"
  * ^slicing.rules = #open
  * ^comment = "MAY contain zero or more [0..*] entryRelationship (CONF:4515-31559) such that it"
* entryRelationship contains
    refersTo 0..* and
    componentEntry 0..* and
    priorityPreference 0..1 and
    goal 0..* and
    progressTowardGoal 0..*
* entryRelationship[refersTo] ^short = "The following entryRelationship represents the relationship between a Goal Observation and another entry (usually a Health Concern Act) (Goal Observation REFERS TO Health Concern Act) already described in the CDA document instance. Rather than clone the whole entry, an Entry Reference may be used in this entryRelationship to reference this entry."
  * ^comment = "MAY contain zero or more [0..*] entryRelationship (CONF:4515-30701) such that it"
  * typeCode 1..1
  * typeCode = #REFR (exactly)
    * ^comment = "SHALL contain exactly one [1..1] @typeCode=\"REFR\" Refers to (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:4515-30702)."
  * act 1..1
  * act only EntryReference
    * ^comment = "SHALL contain exactly one [1..1] Entry Reference (identifier: urn:oid:2.16.840.1.113883.10.20.22.4.122) (CONF:4515-30703)."
* entryRelationship[componentEntry] ^short = "The following entryRelationship represents a planned component of the goal such as Planned Encounter (V2), Planned Procedure (V2), Planned Medication Activity (V2), Planned Supply (V2), Planned Act (V2) or Planned Immunization Activity. Because these entries are already described in the Interventions Section of the CDA document instance, rather than repeating the full content of the entries, the Entry Reference template may be used to reference the entries."
  * ^comment = "MAY contain zero or more [0..*] entryRelationship (CONF:4515-30704) such that it"
  * typeCode 1..1
  * typeCode = #COMP (exactly)
    * ^comment = "SHALL contain exactly one [1..1] @typeCode=\"COMP\" Has component (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:4515-30705)."
  * act 1..1
  * act only EntryReference
    * ^comment = "SHALL contain exactly one [1..1] Entry Reference (identifier: urn:oid:2.16.840.1.113883.10.20.22.4.122) (CONF:4515-32879)."
* entryRelationship[priorityPreference] ^short = "The following entryRelationship represents the priority that the patient or a provider puts on the goal."
  * ^comment = "SHOULD contain zero or one [0..1] entryRelationship (CONF:4515-30785) such that it"
  * typeCode 1..1
  * typeCode = #REFR (exactly)
    * ^comment = "SHALL contain exactly one [1..1] @typeCode=\"REFR\" Refers to (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:4515-30786)."
  * observation 1..1
  * observation only PriorityPreference
    * ^comment = "SHALL contain exactly one [1..1] Priority Preference (identifier: urn:oid:2.16.840.1.113883.10.20.22.4.143) (CONF:4515-30787)."
* entryRelationship[goal] ^short = "The following entryRelationship represents the relationship between two Goal Observations where the target is a component of the source (Goal Observation HAS COMPONENT Goal Observation). The component goal (target) is a Milestone."
  * ^comment = "MAY contain zero or more [0..*] entryRelationship (CONF:4515-31448) such that it"
  * typeCode 1..1
  * typeCode = #COMP (exactly)
    * ^comment = "SHALL contain exactly one [1..1] @typeCode=\"COMP\" Has component (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:4515-31449)."
  * observation 1..1
  * observation only GoalObservation
    * ^comment = "SHALL contain exactly one [1..1] Goal Observation (identifier: urn:oid:2.16.840.1.113883.10.20.22.4.121) (CONF:4515-32880)."
* entryRelationship[progressTowardGoal] ^short = "entryRelationship"
  * ^comment = "MAY contain zero or more [0..*] entryRelationship such that it"
  * typeCode 1..1
  * typeCode = #REFR (exactly)
    * ^comment = "SHALL contain exactly one [1..1] @typeCode=\"REFR\" Refers to (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:4515-31560)."
  * observation 1..1
  * observation only ProgressTowardGoalObservation
    * ^short = "act"
    * ^comment = "SHALL contain exactly one [1..1] Progress Toward Goal Observation (identifier: urn:oid:2.16.840.1.113883.10.20.22.4.110)."
* reference 0..*
  * ^short = "Where it is necessary to reference an external clinical document such a Referral document, Discharge Summary document etc., the External Document Reference template can be used to reference this document.  However, if this Care Plan document is replacing or appending another Care Plan document in the same set, that relationship is set in the header, using ClinicalDocument/relatedDocument."
  * ^comment = "MAY contain zero or more [0..*] reference (CONF:4515-32754)."
  * typeCode 1..1
  * typeCode = #REFR (exactly)
    * ^comment = "The reference, if present, SHALL contain exactly one [1..1] @typeCode=\"REFR\" Refers to (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:4515-32755)."
  * externalDocument 1..1
  * externalDocument only ExternalDocumentReference
    * ^comment = "The reference, if present, SHALL contain exactly one [1..1] External Document Reference (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.4.115:2014-06-09) (CONF:4515-32756)."


// Add on any entry/entryRelationship/component containing an EntryReference that must be a reference to a Goal Observation (see Planned Intervention, Outcome, etc)
Invariant: entry-ref-goal
Description: "This entryReference template **SHALL** reference an instance of a Goal Observation template."
Severity: #error
Expression: "%resource.descendants().ofType(CDA.Observation).where(templateId.exists($this.root = '2.16.840.1.113883.10.20.22.4.121' and $this.extension = '2022-06-01') and id.exists($this.root = %context.act.id.first().root and $this.extension ~ %context.act.id.first().extension))"
/*
%resource.descendants().ofType(CDA.Observation).where(
  templateId.exists(
    $this.root = '2.16.840.1.113883.10.20.22.4.121' and
    $this.extension = '2022-06-01'
  ) and
  id.exists(
    $this.root = %context.act.id.first().root and
    $this.extension ~ %context.act.id.first().extension
  )
)*/