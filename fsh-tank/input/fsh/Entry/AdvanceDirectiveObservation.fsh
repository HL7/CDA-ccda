Profile: AdvanceDirectiveObservation
Parent: $Observation
Id: AdvanceDirectiveObservation
Title: "Advance Directive Observation"
Description: """An Advance Directive Observation template is used to record information about a document authored by the person and containing goals, preferences, and priorities for care. The observation records that the document was available and may have been reviewed (verified). It records the kind (category) of advance directive document, where the document can be accessed, who verified it, and the type of content that was determined to be present. When a person has more than one advance directive document, each document is recorded using an Advance Directive Observation template. A set of Advance Directive Observations are grouped together using an Advance Directive Organizer. 

An Advance Directive Observation template is not used to record information about portable medical orders, such as Medical Orders for Life Sustaining Treatments (MOLST), Physician Orders for Life Sustaining Treatments (POLST), or out-of-hospital Do Not Resuscitate (DNR) Orders. Portable medical order documents are authored by physicians, not patients. They document medical treatment intervention decisions that have been made rather than goals, preferences and priorities that a patient intends to be used as guidance when making care decisions.

The Advance Directive Observation template differs from the Advance Care Planning Intervention template. The Advance Directive Observation template is used to record that a person’s advance directive document has been accessed and reviewed. The Advance Care Planning Intervention template is used to document interactions, such as discussions or education, with the patient about advance care planning and personal advance care plans.

The categories of advance directives source documents could include, but are not limited to, the following:
*    Personal advance care plan
*    Living Will
*    Durable Healthcare (Medical) Power of Attorney

Note: Under common law, a “power of attorney” was automatically revoked by the incompetency or incapacity of the principal, so the common law power of attorney was not useful as a planning for incapacity. Accordingly, states adopted “durable” power of attorney statutes allowing an agent to continue to act as empowered by a power of attorney even after the principal became disabled, incompetent or incapacitated.

The types of content in an advance directive could include, but are not limited to:
*    Healthcare agent consent
*    Antibiotics administration preference
*    Artificial nutrition and hydration administration preference
*    Intubation and Ventilation procedure preference
*    Resuscitation procedure preference
*    Diagnostic Testing procedure preference
*    Preferences relating to palliative care
*    Preferences relating to hospice care at the end of life
*    Organ donation preference
*    Autopsy procedure preference
*    Burial preference
*    Care preference that is general in nature which the patient wants care providers to take into consideration
*    Information about a personal goal, such as seeing a grandchild born, attending a child’s wedding, finding care for a beloved pet, or dying in a certain place.

Examples:
A person may have a durable healthcare power of attorney that appoints a Healthcare Power of Attorney. It may indicate that the person’s spouse has been established as the primary healthcare agent, and the person’s daughter as the first alternative healthcare agent. If the spouse was deceased, or was unavailable at the time, or unwilling to act as healthcare agent during the encounter being documented, then the person’s daughter would be identified as the acting healthcare agent at that time. In this example, “personal advance care plan” is the category of advance directive and “Healthcare Agent” is the type of advance directive content that is present. In this example, “durable healthcare power of attorney” is the category of advance directive and “Healthcare agent” is the type of advance directive content that is present. 

A personal advance care plan may contain information about a person’s treatment preferences regarding resuscitation. In this example, “personal advance care plan” is the category of advance directive and “Resuscitation” is the type of advance directive content that is present.

The author of the Advance Directive Observation is the person documenting that the directives were reviewed and verified. The verifier is the person who read the document and verified the advance directive information. The role of verifier and the role of author need not be fulfilled by the same person, so each role is documented separately. However, the author and the verifier often will be the same person. This template supports Context Conduction. The author of the organizer can be assumed to be the author of the Advance Directive Observations within the organizer unless explicitly overridden an observation. When author identity confidence is high, implementers should explicitly assert conformance to the Provenance Author Participation template.

When an Advance Directive Observation template indicates that the advance directives include healthcare agent appointment information, each healthcare agent can be included in a participation with @typeCode=”CST”. If the participation context (e.g. provenance) for an Advance Directive Observation is not established for the observation, then the participations for the encompassing Advance Directive Organizer apply to the observation.

Advance directives are effective over a range of time. The effectiveTime/low tells when they went into effect (or will go into effect) and the high tells when they ceased or will cease to be in effect. If the starting effective time is not known, effectiveTime/low is UNK, but this would still be considered "Active". If effectiveTime/high contains a value of "NA" or it is not valued, the advance directive remains active until some action is taken to make it inactive. (Explicit use of nullFlavor="NA" is the preferred approach for indicating an Advance Directive that is not time bounded.) That action may update the existing information with an effectiveTime/high or it may replace the open-ended entry with a new entry that includes the effectiveTime/high information. An advance directive is active so long as the effectiveTime/high has not been passed."""

* insert LogicalModelTemplate(advance-directive-obs, 2.16.840.1.113883.10.20.22.4.48, 2022-02-14)
* insert NarrativeLink

* classCode 1..1
* classCode = #OBS (exactly)
  * ^comment = "SHALL contain exactly one [1..1] @classCode=\"OBS\" Observation (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC)."
* moodCode 1..1
* moodCode = #EVN (exactly)
  * ^comment = "SHALL contain exactly one [1..1] @moodCode=\"EVN\" Event (CodeSystem: HL7ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC)."
* id 1..*
  * ^comment = "SHALL contain at least one [1..*] id."
* code 1..1
* code from $2.16.840.1.113883.11.20.9.69.4 (preferred)
  * ^comment = "SHALL contain exactly one [1..1] code, which SHOULD be selected from ValueSet Advance Directive Categories urn:oid:2.16.840.1.113883.11.20.9.69.4 DYNAMIC."
  * translation ^slicing.discriminator[0].type = #value
    * ^slicing.discriminator[=].path = "code"
    * ^slicing.discriminator[+].type = #value
    * ^slicing.discriminator[=].path = "codeSystem"
    * ^slicing.rules = #open
  * translation contains advanceDirective 1..1
  * translation[advanceDirective] ^comment = "This code SHALL contain exactly one [1..1] translation (CONF:1198-32842) such that it"
    * code 1..1
    * code = #75320-2
      * ^comment = "SHALL contain exactly one [1..1] @code=\"75320-2\" Advance directive."
    * codeSystem 1..1
    * codeSystem = "2.16.840.1.113883.6.1"
      * ^comment = "SHALL contain exactly one [1..1] @codeSystem=\"2.16.840.1.113883.6.1\" (CodeSystem: LOINC urn:oid:2.16.840.1.113883.6.1)."
* text 1..1
* statusCode 1..1
  * ^comment = "SHALL contain exactly one [1..1] statusCode (CONF:1198-8652)."
    * code 1..1
    * code from $2.16.840.1.113762.1.4.1240.6 (required)
    * ^comment = "This statusCode SHALL contain exactly one [1..1] @code, which SHALL be selected from ValueSet Completed or Nullified Act Status urn:oid:2.16.840.1.113762.1.4.1240.6."
* effectiveTime 1..1
  * ^comment = "SHALL contain exactly one [1..1] effectiveTime."
  * low 1..1
    * ^comment = "This effectiveTime SHALL contain exactly one [1..1] low."
  * high 1..1
    * obeys 1198-32449
    * ^comment = "This effectiveTime SHALL contain exactly one [1..1] high."
* value 1..1
  * ^comment = "SHALL contain exactly one [1..1] value (CONF:1198-30804)."
* value only CD
  * code from $2.16.840.1.113762.1.4.1115.5
  * codeSystem = "2.16.840.1.113883.6.96"
* author 0..*
* author only AuthorParticipation
  * ^comment = "SHOULD contain zero or more [0..*] Author Participation (identifier: urn:oid:2.16.840.1.113883.10.20.22.4.119)."
* participant ^slicing.discriminator[0].type = #value
  * ^slicing.discriminator[=].path = "participantRole"
  * ^slicing.discriminator[+].type = #value
  * ^slicing.discriminator[=].path = "typeCode"
  * ^slicing.rules = #open
* participant contains
    participant1 0..* and
    participant2 0..*
  * templateId ^slicing.discriminator[0].type = #value
    * ^slicing.discriminator[=].path = "root"
    * ^slicing.rules = #open
  * templateId contains primary 1..1
  * templateId[primary] ^comment = "SHALL contain exactly one [1..1] templateId (CONF:1198-8664) such that it"
    * root 1..1
    * root = "2.16.840.1.113883.10.20.1.58"
      * ^comment = "SHALL contain exactly one [1..1] @root=\"2.16.840.1.113883.10.20.1.58\" (CONF:1198-10486)."
    * extension 0..0
      * ^comment = "SHALL not contain [0..0] extension"
* participant[participant1] ^short = "The participant \"VRF\" represents the clinician(s) who verified the patient advance directive."
  * ^comment = "SHOULD contain zero or more [0..*] participant (CONF:1198-8662) such that it"
  * typeCode 1..1
  * typeCode = #VRF (exactly)
    * ^comment = "SHALL contain exactly one [1..1] @typeCode=\"VRF\" Verifier (CodeSystem: HL7ParticipationType urn:oid:2.16.840.1.113883.5.90 STATIC) (CONF:1198-8663)."
  * obeys should-time
  * time 0..1
    * ^comment = "SHOULD contain zero or one [0..1] time (CONF:1198-8665)." // auto-should
    * insert IntervalValueOnly
  * participantRole 1..1
    * ^comment = "SHALL contain exactly one [1..1] participantRole (CONF:1198-8825)."
    * code 0..1
    * code from $2.16.840.1.114222.4.11.1066 (preferred)
      * ^comment = "This participantRole SHOULD contain zero or one [0..1] code, which SHOULD be selected from ValueSet Healthcare Provider Taxonomy urn:oid:2.16.840.1.114222.4.11.1066 DYNAMIC (CONF:1198-28446)."
    * addr 0..*
    * addr only USRealmAddressADUSFIELDED
      * ^comment = "This participantRole MAY contain zero or more [0..*] US Realm Address (AD.US.FIELDED) (identifier: urn:oid:2.16.840.1.113883.10.20.22.5.2) (CONF:1198-28451)."
    * playingEntity 1..1
      * ^comment = "This participantRole SHALL contain exactly one [1..1] playingEntity (CONF:1198-28428)."
      * name 1..1
      * name only USRealmPersonNamePNUSFIELDED
        * ^comment = "The playingEntity SHALL contain exactly one [1..1] US Realm Person Name (PN.US.FIELDED) (identifier: urn:oid:2.16.840.1.113883.10.20.22.5.1.1) (CONF:1198-28454)."
* participant[participant2] ^short = "This custodian (CST) participant identifies a legal representative for healthcare decision-making. Examples of such  individuals are called health care agents, substitute decision makers and/or health care proxies.  Only record a healthcare agent who is acting in that capacitiy and participating in carae decision-making during the documented care encounter."
* participant[participant2] ^comment = "SHOULD contain zero or more [0..*] participant (CONF:1198-8667) such that it"
  * typeCode 1..1
  * typeCode = #CST (exactly)
    * ^comment = "SHALL contain exactly one [1..1] @typeCode=\"CST\" Custodian (CodeSystem: HL7ParticipationType urn:oid:2.16.840.1.113883.5.90 STATIC) (CONF:1198-8668)."
  * participantRole 1..1
    * ^comment = "SHALL contain exactly one [1..1] participantRole (CONF:1198-8669)."
    * classCode 1..1
    * classCode = #AGNT (exactly)
      * ^comment = "This participantRole SHALL contain exactly one [1..1] @classCode=\"AGNT\" Agent (CodeSystem: HL7RoleClass urn:oid:2.16.840.1.113883.5.110 STATIC) (CONF:1198-8670)."
    * code 0..1
    * code from $2.16.840.1.113762.1.4.1046.35 (preferred)
      * ^comment = "This participantRole SHOULD contain zero or one [0..1] code, which SHOULD be selected from ValueSet Healthcare Agent or Proxy Choices urn:oid:2.16.840.1.113762.1.4.1046.35 DYNAMIC (CONF:1198-28440)."
    * addr 0..1
    * addr only USRealmAddressADUSFIELDED
      * ^comment = "This participantRole SHOULD contain zero or one [0..1] US Realm Address (AD.US.FIELDED) (identifier: urn:oid:2.16.840.1.113883.10.20.22.5.2) (CONF:1198-8671)."
    * obeys should-telecom
    * telecom 0..*
      * ^comment = "This participantRole SHOULD contain zero or more [0..*] telecom (CONF:1198-8672)." // auto-should
    * playingEntity 1..1
      * ^comment = "This participantRole SHALL contain exactly one [1..1] playingEntity (CONF:1198-8824)."
      * code 0..1
      * code from $2.16.840.1.113883.11.20.9.51 (preferred)
        * ^comment = "This playingEntity SHOULD contain zero or one [0..1] code, which SHOULD be selected from ValueSet Healthcare Agent Qualifier urn:oid:2.16.840.1.113883.11.20.9.51 DYNAMIC (CONF:1198-28444)."
      * name 1..1
        * ^short = "The name of the healthcare agent."
        * ^comment = "This playingEntity SHALL contain exactly one [1..1] name (CONF:1198-8673)."
* reference ^slicing.discriminator[0].type = #value
  * ^slicing.discriminator[=].path = "externalDocument"
  * ^slicing.discriminator[+].type = #value
  * ^slicing.discriminator[=].path = "typeCode"
  * ^slicing.rules = #open
* reference contains reference1 1..*
* reference[reference1] ^comment = "SHOULD contain at least one [1..*] reference (CONF:1198-8692) such that it"
  * typeCode 1..1
  * typeCode = #REFR (exactly)
    * ^comment = "SHALL contain exactly one [1..1] @typeCode=\"REFR\" Refers to (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002 STATIC) (CONF:1198-8694)."
  * externalDocument 1..1
    * ^comment = "SHALL contain exactly one [1..1] externalDocument (CONF:1198-8693)."
    * id 1..*
      * ^comment = "This externalDocument SHALL contain at least one [1..*] id (CONF:1198-8695)."
    * text 0..1
      * ^comment = "This externalDocument MAY contain zero or one [0..1] text (CONF:1198-8696)."
      * reference 0..1
        * obeys 1198-8699
        * ^short = "The URL of a referenced advance directive document **MAY** be present, and **SHALL** be represented in Observation/reference/ExternalDocument/text/reference (CONF:1198-8698)."
        * ^comment = "The text, if present, MAY contain zero or one [0..1] reference (CONF:1198-8697)."

Invariant: 1198-32449
Description: "If the Advance Directive does not have a specified ending time, the <high> element **SHALL** have the nullFlavor attribute set to *NA* (CONF:1198-32449)."
Severity: #error
Expression: "value.exists() or nullFlavor = 'NA'"

Invariant: 1198-8699
Description: "If a URL is referenced, then it **SHOULD** have a corresponding linkHTML element in narrative block (CONF:1198-8699)."
Severity: #warning
// Not implementing right now