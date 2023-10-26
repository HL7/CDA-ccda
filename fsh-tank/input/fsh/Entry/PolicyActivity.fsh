Profile: PolicyActivity
Parent: $Act
Id: PolicyActivity
Title: "Policy Activity"
Description: "A policy activity represents the policy or program providing the coverage. The person for whom payment is being provided (i.e., the patient) is the covered party. The subscriber of the policy or program is represented as a participant that is the holder of the coverage. The payer is represented as the performer of the policy activity."

* insert LogicalModelTemplate(policy-activity, 2.16.840.1.113883.10.20.22.4.61, 2023-05-01)
* insert NarrativeLink

* ^status = #draft
* classCode 1..1
* classCode = #ACT (exactly)
  * ^comment = "SHALL contain exactly one [1..1] @classCode=\"ACT\" Act (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:4537-8898)."
* moodCode 1..1
* moodCode = #EVN (exactly)
  * ^comment = "SHALL contain exactly one [1..1] @moodCode=\"EVN\" Event (CodeSystem: HL7ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:4537-8899)."
* id 1..*
  * ^short = "This id is a unique identifier for the policy or program providing the coverage"
  * ^comment = "SHALL contain at least one [1..*] id (CONF:4537-8901)."
* code 1..1
  * ^comment = "SHALL contain exactly one [1..1] code, which SHOULD be selected from CodeSystem X12N Insurance Type urn:oid:2.16.840.1.113883.6.255.1336 DYNAMIC (CONF:4537-8903)."
  * codeSystem 1..1
  * codeSystem = "2.16.840.1.113883.6.255.1336"
  * translation ^slicing.discriminator[0].type = #value
    * ^slicing.discriminator[=].path = "code"
    * ^slicing.rules = #open
    * ^comment = "This code SHALL contain at least one [1..*] translation (CONF:4537-32852) such that it"
  * translation contains translation1 1..*
  * translation[translation1] ^short = "translation"
    * ^comment = "This code SHALL contain at least one [1..*] translation (CONF:4537-32852) such that it"
    * code 0..1
    * code from $Payer (preferred)
      * ^comment = "SHOULD contain zero or one [0..1] @code, which SHOULD be selected from ValueSet Payer urn:oid:2.16.840.1.114222.4.11.3591 DYNAMIC (CONF:4537-33066)."
* statusCode 1..1
  * ^comment = "SHALL contain exactly one [1..1] statusCode (CONF:4537-8902)."
  * code 1..1
  * code from $2.16.840.1.113762.1.4.1240.6 (required)
  * ^comment = "This statusCode SHALL contain exactly one [1..1] @code, which SHALL be selected from ValueSet Completed or Nullified Act Status urn:oid:2.16.840.1.113762.1.4.1240.6."
* performer ^slicing.discriminator[0].type = #value
  * ^slicing.discriminator[=].path = "templateId.root"
  * ^slicing.rules = #open
  * ^comment = "SHOULD contain zero or more [0..*] performer (CONF:4537-8961) such that it"
* performer contains
    performer1 1..1 and
    performer2 0..*
* performer[performer1] ^short = "This performer represents the Payer."
  * ^comment = "SHALL contain exactly one [1..1] performer (CONF:4537-8906) such that it"
  * typeCode 1..1
  * typeCode = #PRF (exactly)
    * ^comment = "SHALL contain exactly one [1..1] @typeCode=\"PRF\" Performer (CodeSystem: HL7ParticipationType urn:oid:2.16.840.1.113883.5.90 STATIC) (CONF:4537-8907)."
  * templateId 1..1
    * ^comment = "SHALL contain exactly one [1..1] templateId (CONF:4537-16808), SHALL not contain [0..0] extension.."
    * root 1..1
    * root = "2.16.840.1.113883.10.20.22.4.87"
      * ^comment = "This templateId SHALL contain exactly one [1..1] @root=\"2.16.840.1.113883.10.20.22.4.87\" Payer Performer (CONF:4537-16809)."
    * extension 0..0
  * assignedEntity 1..1
    * ^comment = "SHALL contain exactly one [1..1] assignedEntity (CONF:4537-8908)."
    * id 1..*
      * ^short = "This is the Payer id. The root is a unique identifier to an openly available assigning authority, such as National Association of Insurance Commissioners (NAIC) (2.16.840.1.113883.6.300), and the extension identifiers the payer within that authority."
      * ^comment = "This assignedEntity SHALL contain at least one [1..*] id (CONF:4537-8909)."
    * obeys should-code
    * code 0..1
      * ^comment = "This assignedEntity SHOULD contain zero or one [0..1] code (CONF:4537-8914)." // auto-should
      * code 1..1
      * code from $2.16.840.1.113883.1.11.10416 (preferred)
        * ^comment = "The code, if present, SHALL contain exactly one [1..1] @code, which SHOULD be selected from ValueSet Financially Responsible Party Type Value Set urn:oid:2.16.840.1.113883.1.11.10416 DYNAMIC (CONF:4537-15992)."
    * addr 0..1
    * addr only USRealmAddressADUSFIELDED
      * ^comment = "This assignedEntity MAY contain zero or one [0..1] US Realm Address (AD.US.FIELDED) (identifier: urn:oid:2.16.840.1.113883.10.20.22.5.2) (CONF:4537-8910)."
    * telecom 0..*
      * ^comment = "This assignedEntity MAY contain zero or more [0..*] telecom (CONF:4537-8911)."
    * obeys should-representedOrganization
    * representedOrganization 0..1
      * ^comment = "This assignedEntity SHOULD contain zero or one [0..1] representedOrganization (CONF:4537-8912)." // auto-should
      * obeys should-name
      * name 0..1
        * ^comment = "The representedOrganization, if present, SHOULD contain zero or one [0..1] name (CONF:4537-8913)." // auto-should
* performer[performer2] ^short = "This performer represents the Guarantor."
  * ^comment = "SHOULD contain zero or more [0..*] performer (CONF:4537-8961) such that it"
  * typeCode 1..1
  * typeCode = #PRF (exactly)
    * ^comment = "SHALL contain exactly one [1..1] @typeCode=\"PRF\" Performer (CodeSystem: HL7ParticipationType urn:oid:2.16.840.1.113883.5.90) (CONF:4537-32971)."
  * templateId 1..1
    * ^comment = "SHALL contain exactly one [1..1] templateId (CONF:4537-16810), SHALL not contain [0..0] extension."
    * root 1..1
    * root = "2.16.840.1.113883.10.20.22.4.88"
      * ^comment = "This templateId SHALL contain exactly one [1..1] @root=\"2.16.840.1.113883.10.20.22.4.88\" Guarantor Performer (CONF:4537-16811)."
    * extension 0..0
  * obeys should-time
  * time 0..1
    * ^comment = "SHOULD contain zero or one [0..1] time (CONF:4537-8963)." // auto-should
  * assignedEntity 1..1
    * obeys 4537-8967
    * ^comment = "SHALL contain exactly one [1..1] assignedEntity (CONF:4537-8962)."
    * code 1..1
      * ^comment = "This assignedEntity SHALL contain exactly one [1..1] code (CONF:4537-8968)."
      * code 1..1
      * code = #GUAR
        * ^comment = "This code SHALL contain exactly one [1..1] @code=\"GUAR\" Guarantor (CONF:4537-16096)."
      * codeSystem 1..1
      * codeSystem = "2.16.840.1.113883.5.110"
        * ^comment = "This code SHALL contain exactly one [1..1] @codeSystem=\"2.16.840.1.113883.5.110\" (CONF:4537-32165)."
    * addr 0..1
    * addr only USRealmAddressADUSFIELDED
      * ^comment = "This assignedEntity SHOULD contain zero or one [0..1] US Realm Address (AD.US.FIELDED) (identifier: urn:oid:2.16.840.1.113883.10.20.22.5.2) (CONF:4537-8964)."
    * obeys should-telecom
    * telecom 0..*
      * ^comment = "This assignedEntity SHOULD contain zero or more [0..*] telecom (CONF:4537-8965)." // auto-should
* participant ^slicing.discriminator[0].type = #value
  * ^slicing.discriminator[=].path = "typeCode"
  * ^slicing.rules = #open
  * ^comment = "SHOULD contain zero or one [0..1] participant (CONF:4537-8934) such that it"
* participant contains
    coverage-target 1..1 and
    policy-holder 0..1
* participant[coverage-target] ^short = "participant"
  * ^comment = "SHALL contain exactly one [1..1] participant (CONF:4537-8916) such that it"
  * typeCode 1..1
  * typeCode = #COV (exactly)
    * ^comment = "SHALL contain exactly one [1..1] @typeCode=\"COV\" Coverage target (CodeSystem: HL7ParticipationType urn:oid:2.16.840.1.113883.5.90 STATIC) (CONF:4537-8917)."
  * templateId 1..1
    * ^comment = "SHALL contain exactly one [1..1] templateId (CONF:4537-16812), SHALL not contain [0..0] extension."
    * root 1..1
    * root = "2.16.840.1.113883.10.20.22.4.89"
      * ^comment = "This templateId SHALL contain exactly one [1..1] @root=\"2.16.840.1.113883.10.20.22.4.89\" Covered Party Participant (CONF:4537-16814)."
    * extension 0..0
  * obeys should-time
  * time 0..1
    * ^comment = "SHOULD contain zero or one [0..1] time (CONF:4537-8918)." // auto-should
    * obeys should-low
    * low 0..1
      * ^comment = "The time, if present, SHOULD contain zero or one [0..1] low (CONF:4537-8919)." // auto-should
    * obeys should-high
    * high 0..1
      * ^comment = "The time, if present, SHOULD contain zero or one [0..1] high (CONF:4537-8920)." // auto-should
  * participantRole 1..1
    * ^comment = "SHALL contain exactly one [1..1] participantRole (CONF:4537-8921)."
    * id 1..*
      * ^short = "This id is a unique identifier for  the covered party member. Implementers **SHOULD** use the same GUID for each instance of a member identifier from the same health plan (CONF:4537-8984)."
      * ^comment = "This participantRole SHALL contain at least one [1..*] id (CONF:4537-8922)."
    * code 1..1
      * ^comment = "This participantRole SHALL contain exactly one [1..1] code (CONF:4537-8923)."
      * code 0..1
      * code from $2.16.840.1.113883.1.11.18877 (preferred)
        * ^comment = "This code SHOULD contain zero or one [0..1] @code, which SHOULD be selected from ValueSet Coverage Role Type Value Set urn:oid:2.16.840.1.113883.1.11.18877 DYNAMIC (CONF:4537-16078)."
    * addr 0..1
    * addr only USRealmAddressADUSFIELDED
      * ^comment = "This participantRole SHOULD contain zero or one [0..1] US Realm Address (AD.US.FIELDED) (identifier: urn:oid:2.16.840.1.113883.10.20.22.5.2) (CONF:4537-8956)."
    * obeys should-playingEntity
    * playingEntity 0..1
      * ^short = "This playingEntity records the covered party name and birthTime as represented by the health plan. This could match the information in recordTarget, or be different due to marriage or other reasons."
      * ^comment = "This participantRole SHOULD contain zero or one [0..1] playingEntity (CONF:4537-8932)." // auto-should
      * name 1..1
        * ^comment = "The playingEntity, if present, SHALL contain exactly one [1..1] name (CONF:4537-8930)."
      * sdtcBirthTime 1..1
        * ^short = "sdtc:birthTime"
        * ^comment = "The playingEntity, if present, SHALL contain exactly one [1..1] sdtc:birthTime (CONF:4537-31344)."
* participant[policy-holder] obeys 4537-17139
  * ^short = "When the Subscriber is the patient, the participant element describing the subscriber *SHALL NOT* be present. This information will be recorded instead in the data elements used to record member information."
  * ^comment = "SHOULD contain zero or one [0..1] participant (CONF:4537-8934) such that it"
  * typeCode 1..1
  * typeCode = #HLD (exactly)
    * ^comment = "SHALL contain exactly one [1..1] @typeCode=\"HLD\" Holder (CodeSystem: HL7ParticipationType urn:oid:2.16.840.1.113883.5.90 STATIC) (CONF:4537-8935)."
  * templateId 1..1
    * ^comment = "SHALL contain exactly one [1..1] templateId (CONF:4537-16813), SHALL not contain [0..0] extension."
    * root 1..1
    * root = "2.16.840.1.113883.10.20.22.4.90"
      * ^comment = "This templateId SHALL contain exactly one [1..1] @root=\"2.16.840.1.113883.10.20.22.4.90\" Policy Holder Participant (CONF:4537-16815)."
    * extension 0..0
  * time 0..1
    * ^comment = "MAY contain zero or one [0..1] time (CONF:4537-8938)."
  * participantRole 1..1
    * ^comment = "SHALL contain exactly one [1..1] participantRole (CONF:4537-8936)."
    * id 1..*
      * ^short = "This id is a unique identifier for the subscriber of the coverage (CONF:4537-10120)."
      * ^comment = "This participantRole SHALL contain at least one [1..*] id (CONF:4537-8937)."
    * addr 0..1
    * addr only USRealmAddressADUSFIELDED
      * ^comment = "This participantRole SHOULD contain zero or one [0..1] US Realm Address (AD.US.FIELDED) (identifier: urn:oid:2.16.840.1.113883.10.20.22.5.2) (CONF:4537-8925)."
* entryRelationship ^slicing.discriminator[0].type = #value
  * ^slicing.discriminator[=].path = "act.moodCode"
  * ^slicing.rules = #open
* entryRelationship contains 
  authorization 0..* and
  plan 0..*
* entryRelationship[authorization]
  * ^short = "entryRelationship"
  * ^comment = "MAY contain one [0..*] entryRelationship (CONF:4537-8939) such that it"
  * typeCode 1..1
  * typeCode = #REFR (exactly)
    * ^comment = "SHALL contain exactly one [1..1] @typeCode=\"REFR\" Refers to (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002 STATIC) (CONF:4537-8940)."
  * act 1..1
  * act only AuthorizationActivity
    * moodCode = #EVN (exactly) // Copied from AuthorizationActivity
* entryRelationship[plan] ^short = "Represents the Coverage Plan"
  * typeCode 1..1
  * typeCode = #REFR (exactly)
  * act 1..1
    * ^comment = "A description of the coverage plan **SHALL** contain one or more act/id, to represent the plan identifier, and an act/text with the name of the plan (CONF:4537-8943)."
    * classCode = #ACT (exactly)
    * moodCode = #DEF (exactly)
    * id 1..*
      * ^short = "Plan identifier"
    * text 1..1
      * ^short = "Name of the plan"
    


Invariant: 4537-8967
Description: "**SHOULD** include assignedEntity/assignedPerson/name AND/OR assignedEntity/representedOrganization/name (CONF:4537-8967)."
Severity: #warning
Expression: "assignedPerson.name.exists() or representedOrganization.name.exists()"

// Slice check based on coverage-target.participantRole.code = SELF, then policy-holder slice should not exist
Invariant: 4537-17139
Description: "When the Subscriber is the patient, the participant element describing the subscriber **SHALL NOT** be present. This information will be recorded instead in the data elements used to record member information (CONF:4537-17139)."
Severity: #error
