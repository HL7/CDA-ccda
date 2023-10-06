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
        * ^comment = "This reference SHALL contain exactly one [1..1] @value (CONF:4515-156)."
* statusCode 1..1
  * ^comment = "SHALL contain exactly one [1..1] statusCode (CONF:4515-113)."
  * code 1..1
  * code from ActStatus (required)
    * ^short = "When statusCode has a value set, its value MAY be rendered in the narrative."
    * ^comment = "This statusCode SHALL contain exactly one [1..1] @code, which SHALL be selected from ValueSet ActStatus urn:oid:2.16.840.1.113883.1.11.15933 STATIC (CONF:4515-119)."
* effectiveTime 1..1
  * ^comment = "SHALL contain exactly one [1..1] effectiveTime (CONF:4515-127)."
  * low 1..1
    * ^comment = "This effectiveTime SHALL contain exactly one [1..1] low (CONF:4515-157)."
  * high 0..1
    * ^comment = "This effectiveTime MAY contain zero or one [0..1] high (CONF:4515-158)."
* author 0..*
* author only AuthorParticipation
  * ^comment = "SHOULD contain zero or more [0..*] Author Participation (identifier: urn:oid:2.16.840.1.113883.10.20.22.4.119) (CONF:4515-116)."
* participant ^slicing.discriminator[0].type = #value
  * ^slicing.discriminator[=].path = "participantRole"
  * ^slicing.discriminator[+].type = #value
  * ^slicing.discriminator[=].path = "typeCode"
  * ^slicing.rules = #open
  * ^comment = "MAY contain zero or more [0..*] participant (CONF:4515-134) such that it"
* participant contains
    participant1 0..* and
    participant2 0..*
* participant[participant1] ^short = "participant"
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
* participant[participant2] ^short = "participant"
  * ^comment = "MAY contain zero or more [0..*] participant (CONF:4515-134) such that it"
  * typeCode 1..1
  * typeCode = #LOC (exactly)
    * ^comment = "SHALL contain exactly one [1..1] @typeCode=\"LOC\" Location (CodeSystem: HL7ParticipationType urn:oid:2.16.840.1.113883.5.90) (CONF:4515-137)."
  * participantRole 1..1
    * ^comment = "SHALL contain exactly one [1..1] participantRole (CONF:4515-135)."
    * id 1..*
      * ^comment = "This participantRole SHALL contain at least one [1..*] id (CONF:4515-138)."
    * addr 0..1
      * ^comment = "This participantRole SHOULD contain zero or one [0..1] addr (CONF:4515-139)."
    * telecom 0..*
      * ^comment = "This participantRole SHOULD contain zero or more [0..*] telecom (CONF:4515-140)."
    * playingEntity 1..1
      * ^comment = "This participantRole SHALL contain exactly one [1..1] playingEntity (CONF:4515-136)."
      * classCode 1..1
      * classCode = #PLC (exactly)
        * ^comment = "This playingEntity SHALL contain exactly one [1..1] @classCode=\"PLC\" Place (CodeSystem: HL7EntityClass urn:oid:2.16.840.1.113883.5.41) (CONF:4515-141)."
      * name 1..1
        * ^comment = "This playingEntity SHALL contain exactly one [1..1] name (CONF:4515-142)."
* component ^slicing.discriminator[0].type = #value
  * ^slicing.discriminator[=].path = "act"
  * ^slicing.rules = #open
  * ^comment = "SHALL contain at least one [1..*] component (CONF:4515-152) such that it"
* component contains
    component1 0..* and
    component2 0..* and
    component3 0..* and
    component4 0..1 and
    component5 1..*
* component[component1] ^short = "component"
  * ^comment = "MAY contain zero or more [0..*] component (CONF:4515-110) such that it"
  * observation 1..1
  * observation only CareTeamTypeObservation
    * ^comment = "SHALL contain exactly one [1..1] Care Team Type Observation (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.4.500.2:2019-07-01) (CONF:4515-163)."
* component[component2] ^short = "component"
  * ^comment = "MAY contain zero or more [0..*] component (CONF:4515-146) such that it"
  * act 1..1
  * act only EntryReference
    * ^comment = "SHALL contain exactly one [1..1] Entry Reference (identifier: urn:oid:2.16.840.1.113883.10.20.22.4.122) (CONF:4515-147)."
* component[component3] ^short = "component"
  * ^comment = "MAY contain zero or more [0..*] component (CONF:4515-148) such that it"
  * encounter 1..1
    * ^comment = "SHALL contain exactly one [1..1] encounter (CONF:4515-164)."
    * id 1..*
      * ^short = "1.\tIf the id does not match an encounter/id from an encounter elsewhere within the same document and the id does not contain @nullFlavor=NA, then this entry SHALL conform to the Encounter Activity (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.4.49:2015-08-01) (CONF:4435-145)."
      * ^comment = "This encounter SHALL contain at least one [1..*] id (CONF:4515-165)."
* component[component4] ^short = "component"
  * ^comment = "MAY contain zero or one [0..1] component (CONF:4515-150) such that it"
  * act 1..1
  * act only NoteActivity
    * ^comment = "SHALL contain exactly one [1..1] Note Activity (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.4.202:2016-11-01) (CONF:4515-151)."
* component[component5] ^short = "component"
  * ^comment = "SHALL contain at least one [1..*] component (CONF:4515-152) such that it"
  * act 1..1
  * act only CareTeamMemberAct
    * ^comment = "SHALL contain exactly one [1..1] Care Team Member Act (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.4.500.1:2022-06-01) (CONF:4515-166)."

Invariant: 4515-133
Description: "This id **SHALL** match a performer/assignedEntity/id of at least one Care Team Member described in component/act (CONF:4515-133)."
Severity: #error