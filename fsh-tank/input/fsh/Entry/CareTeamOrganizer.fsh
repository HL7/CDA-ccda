Profile: CareTeamOrganizer
Parent: $Organizer
Id: CareTeamOrganizer
Title: "Care Team Organizer"
Description: """This organizer template contains information about a single care team. 
The author of the organizer is the person who documented the care team information.
The participants of the organizer are the care team lead(s) and the care team organization.

The components of the organizer contain the following information:
* The encounter that caused the care team to be formed
* Narrative information about the care team
* The care team members
* Reasons for the care team
* The care team type(s) - a care team can have multiple care team types 

"""

* insert LogicalModelTemplate(care-team-org, 2.16.840.1.113883.10.20.22.4.500, 2022-06-01)
* insert NarrativeLinkOrganizer

* classCode 1..1
* classCode = #CLUSTER (exactly)
  * ^comment = "SHALL contain exactly one [1..1] @classCode=\"CLUSTER\" CLUSTER (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:4515-124)."
* moodCode 1..1
* moodCode = #EVN (exactly)
  * ^comment = "SHALL contain exactly one [1..1] @moodCode=\"EVN\" Event (CodeSystem: HL7ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:4515-125)."
* id 1..*
  * ^comment = "SHALL contain at least one [1..*] id (CONF:4515-126)."
* code 1..1
  * ^comment = "SHALL contain exactly one [1..1] code (CONF:4515-114)."
  * code 1..1
  * code = #86744-0
    * ^comment = "This code SHALL contain exactly one [1..1] @code=\"86744-0\" Care Team (CONF:4515-120)."
  * codeSystem 1..1
  * codeSystem = "2.16.840.1.113883.6.1"
    * ^comment = "This code SHALL contain exactly one [1..1] @codeSystem=\"2.16.840.1.113883.6.1\" LOINC (CodeSystem: LOINC urn:oid:2.16.840.1.113883.6.1) (CONF:4515-121)."
  * originalText 0..1
    * ^comment = "This code SHOULD contain zero or one [0..1] originalText (CONF:4515-154) such that it"
    * reference 1..1
      * ^comment = "SHALL contain exactly one [1..1] reference (CONF:4515-155)."
      * value 1..1
        * ^short = "The value attribute references the narrative in section.text where the care team name is rendered. The intention of this reference is to clarify which care team this Organizer refers to."
        * ^comment = "This reference SHALL contain exactly one [1..1] @value (CONF:4515-156)."
* statusCode 1..1
  * ^comment = "SHALL contain exactly one [1..1] statusCode (CONF:4515-113)."
  * insert BindAtCode(ActStatus, required)
  * ^short = "When statusCode has a value set, its value MAY be rendered in the narrative."
* effectiveTime 1..1
  * ^comment = "SHALL contain exactly one [1..1] effectiveTime (CONF:4515-127)."
  * low 1..1
    * ^comment = "This effectiveTime SHALL contain exactly one [1..1] low (CONF:4515-157)."
  * high 0..1
    * ^comment = "This effectiveTime MAY contain zero or one [0..1] high (CONF:4515-158)."
* obeys should-author
* author 0..*
* author only AuthorParticipation
  * ^comment = "SHOULD contain zero or more [0..*] Author Participation (identifier: urn:oid:2.16.840.1.113883.10.20.22.4.119) (CONF:4515-116)." // man-should
* participant ^slicing.discriminator[0].type = #value
  * ^slicing.discriminator[=].path = "typeCode"
  * ^slicing.rules = #open
* participant contains
    lead 0..* and
    location 0..*
* participant[lead] ^short = "This Participant represents the Care Team lead."
  * ^comment = "SHOULD contain zero or more [0..*] participant (CONF:4515-128) such that it"
  * typeCode 1..1
  * typeCode = #PPRF (exactly)
    * ^comment = "SHALL contain exactly one [1..1] @typeCode=\"PPRF\" Primary Performer (CodeSystem: HL7ParticipationType urn:oid:2.16.840.1.113883.5.90) (CONF:4515-129)."
  * sdtcFunctionCode 0..1
  * sdtcFunctionCode from $2.16.840.1.113762.1.4.1099.30 (preferred)
    * ^short = "Describes the person's, caregiver's or health care provider's functional role on the care team."
    * ^comment = "MAY contain zero or one [0..1] sdtc:functionCode, which SHOULD be selected from ValueSet Care Team Member Function urn:oid:2.16.840.1.113762.1.4.1099.30 DYNAMIC (CONF:4515-130)."
  * participantRole 1..1
    * ^comment = "SHALL contain exactly one [1..1] participantRole (CONF:4515-131)."
    * id 1..*
      * obeys 4515-133
      * ^comment = "This participantRole SHALL contain at least one [1..*] id (CONF:4515-132)."
* participant[location] ^short = "participant"
  * ^comment = "MAY contain zero or more [0..*] participant (CONF:4515-134) such that it"
  * typeCode 1..1
  * typeCode = #LOC (exactly)
    * ^comment = "SHALL contain exactly one [1..1] @typeCode=\"LOC\" Location (CodeSystem: HL7ParticipationType urn:oid:2.16.840.1.113883.5.90) (CONF:4515-137)."
  * participantRole 1..1
    * ^comment = "SHALL contain exactly one [1..1] participantRole (CONF:4515-135)."
    * id 1..*
      * ^comment = "This participantRole SHALL contain at least one [1..*] id (CONF:4515-138)."
    * obeys should-addr
    * addr 0..1
    * addr only USRealmAddress
      * ^comment = "This participantRole SHOULD contain zero or one [0..1] addr (CONF:4515-139)." // auto-should
    * obeys should-telecom
    * telecom 0..*
      * ^comment = "This participantRole SHOULD contain zero or more [0..*] telecom (CONF:4515-140)." // auto-should
    * playingEntity 1..1
      * ^comment = "This participantRole SHALL contain exactly one [1..1] playingEntity (CONF:4515-136)."
      * classCode 1..1
      * classCode = #PLC (exactly)
        * ^comment = "This playingEntity SHALL contain exactly one [1..1] @classCode=\"PLC\" Place (CodeSystem: HL7EntityClass urn:oid:2.16.840.1.113883.5.41) (CONF:4515-141)."
      * name 1..1
        * ^comment = "This playingEntity SHALL contain exactly one [1..1] name (CONF:4515-142)."
* component 
  * ^slicing.discriminator[0].type = #profile
  * ^slicing.discriminator[=].path = "act"
  * ^slicing.discriminator[+].type = #profile
  * ^slicing.discriminator[=].path = "observation"
  * ^slicing.discriminator[+].type = #exists
  * ^slicing.discriminator[=].path = "encounter"
  * ^slicing.rules = #open
  * ^comment = "SHALL contain at least one [1..*] component (CONF:4515-152) such that it"
* component contains
    type 0..* and
    entryReference 0..* and
    encounter 0..* and
    note 0..1 and
    member 1..*
* component[type] ^short = "component"
  * ^comment = "MAY contain zero or more [0..*] component (CONF:4515-110) such that it"
  * act 0..0
  * encounter 0..0
  * observation 1..1
  * observation only CareTeamTypeObservation
    * ^comment = "SHALL contain exactly one [1..1] Care Team Type Observation (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.4.500.2:2019-07-01) (CONF:4515-163)."
* component[entryReference] ^short = "The following components represent the reasons for the existence of the care team. These entry references are typically a health concern, risk concern or problem but can also be some other entry present in the document."
  * ^comment = "MAY contain zero or more [0..*] component (CONF:4515-146) such that it"
  * observation 0..0
  * encounter 0..0
  * act 1..1
  * act only EntryReference
    * ^comment = "SHALL contain exactly one [1..1] Entry Reference (identifier: urn:oid:2.16.840.1.113883.10.20.22.4.122) (CONF:4515-147)."
* component[encounter] ^short = "component"
  * ^comment = "MAY contain zero or more [0..*] component (CONF:4515-148) such that it"
  * act 0..0
  * observation 0..0
  * encounter 1..1
    * ^comment = "SHALL contain exactly one [1..1] encounter (CONF:4515-164)."
    * id 1..*
      * ^short = "1.\tIf the id does not match an encounter/id from an encounter elsewhere within the same document and the id does not contain @nullFlavor=NA, then this entry SHALL conform to the Encounter Activity (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.4.49:2015-08-01) (CONF:4435-145)."
      * ^comment = "This encounter SHALL contain at least one [1..*] id (CONF:4515-165)."
* component[note] ^short = "component"
  * ^comment = "MAY contain zero or one [0..1] component (CONF:4515-150) such that it"
  * observation 0..0
  * encounter 0..0
  * act 1..1
  * act only NoteActivity
    * ^comment = "SHALL contain exactly one [1..1] Note Activity (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.4.202:2016-11-01) (CONF:4515-151)."
* component[member] ^short = "component"
  * ^comment = "SHALL contain at least one [1..*] component (CONF:4515-152) such that it"
  * observation 0..0
  * encounter 0..0
  * act 1..1
  * act only CareTeamMemberAct
    * ^comment = "SHALL contain exactly one [1..1] Care Team Member Act (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.4.500.1:2022-06-01) (CONF:4515-166)."

Invariant: 4515-133
Description: "This id **SHALL** match a performer/assignedEntity/id of at least one Care Team Member described in component/act (CONF:4515-133)."
Severity: #error
// Possible first crazy-draft attempt at this expression
// Expression: "(participant.where(typeCode='PPRF').select(participantRole.id.first().select(root + extension))).where(%context.component.where(act.code.code='85847-2').act.id.where((root + extension) = $this)).allTrue()"