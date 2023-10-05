Profile: HandoffCommunicationParticipants
Parent: $Act
Id: HandoffCommunicationParticipants
Title: "Handoff Communication Participants"
Description: "This template represents the sender (author) and receivers (participants) of a handoff communication in a plan of treatment. It does not convey details about the communication. The \"handoff\" process involves senders, those transmitting the patient's information and releasing the care of that patient to the next clinician, and receivers, those who accept the patient information and care of that patient."

* insert LogicalModelTemplateRootOnly(handoffCommunicationParticipants, 2.16.840.1.113883.10.20.22.4.141)

* classCode 1..1
* classCode = #ACT (exactly)
  * ^comment = "SHALL contain exactly one [1..1] @classCode=\"ACT\" Act (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:1098-30832)."
* moodCode 1..1
* moodCode = #EVN (exactly)
  * ^comment = "SHALL contain exactly one [1..1] @moodCode=\"EVN\" (CodeSystem: HL7ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:1098-30833)."
* code 1..1
  * ^comment = "SHALL contain exactly one [1..1] code (CONF:1098-30836)."
  * code 1..1
  * code = #432138007
    * ^comment = "This code SHALL contain exactly one [1..1] @code=\"432138007\" handoff communication (procedure) (CONF:1098-30837)."
  * codeSystem 1..1
  * codeSystem = "2.16.840.1.113883.6.96"
    * ^comment = "This code SHALL contain exactly one [1..1] @codeSystem=\"2.16.840.1.113883.6.96\" (CodeSystem: SNOMED CT urn:oid:2.16.840.1.113883.6.96) (CONF:1098-30838)."
* statusCode 1..1
  * ^comment = "SHALL contain exactly one [1..1] statusCode (CONF:1098-31668)."
  * code 1..1
  * code = #completed (exactly)
    * ^comment = "This statusCode SHALL contain exactly one [1..1] @code=\"completed\" Completed (CodeSystem: HL7ActStatus urn:oid:2.16.840.1.113883.5.14) (CONF:1098-31669)."
* effectiveTime 1..1
  * ^short = "The effective time is the time when the handoff process took place between the sender and receiver of the patient information. This could be the time the information was transmitted, released, or verbally communicated to the next clinician."
  * ^comment = "SHALL contain exactly one [1..1] effectiveTime (CONF:1098-31670)."
* author 1..*
* author only AuthorParticipation
  * ^short = "The Author Participant contains the sender's contact information and is a resource for the Information Recipient for any follow-up questions."
  * ^comment = "SHALL contain at least one [1..*] Author Participation (identifier: urn:oid:2.16.840.1.113883.10.20.22.4.119) (CONF:1098-31672)."
* participant ^slicing.discriminator.type = #value
  * ^slicing.discriminator.path = "typeCode"
  * ^slicing.rules = #open
  * ^short = "Documentation of the Information Recipient's name and address verifies that the information was exchanged."
* participant contains infoRecipient 1..*
* participant[infoRecipient] ^comment = "SHALL contain at least one [1..*] participant (CONF:1098-31673) such that it"
  * typeCode 1..1
  * typeCode = #IRCP (exactly)
    * ^comment = "SHALL contain exactly one [1..1] @typeCode=\"IRCP\" Information Recipient (CodeSystem: HL7RoleClass urn:oid:2.16.840.1.113883.5.110) (CONF:1098-31674)."
  * participantRole 1..1
    * ^comment = "SHALL contain exactly one [1..1] participantRole (CONF:1098-31675)."
    * id 1..*
      * ^comment = "This participantRole SHALL contain at least one [1..*] id (CONF:1098-32422)."
    * code 0..1
    * code from $2.16.840.1.114222.4.11.1066 (preferred)
      * ^comment = "This participantRole SHOULD contain zero or one [0..1] code, which SHOULD be selected from ValueSet Healthcare Provider Taxonomy urn:oid:2.16.840.1.114222.4.11.1066 DYNAMIC (CONF:1098-31676)."
    * addr 1..*
      * ^comment = "This participantRole SHALL contain at least one [1..*] addr (CONF:1098-32392)."
    * playingEntity 0..1
      * ^comment = "This participantRole MAY contain zero or one [0..1] playingEntity (CONF:1098-32393)."
      * name 1..*
        * ^comment = "The playingEntity, if present, SHALL contain at least one [1..*] name (CONF:1098-32394)."