Profile: AdvanceDirectiveObservation
Parent: $Observation
Id: AdvanceDirectiveObservation
Title: "Advance Directive Observation"
Description: """Advance Directive Observations may include a variety of information called different “content types”. The set of Advance Directive Observations within an Advance Directive Organizer provides a summarization of relevant information available in an external Advance Healthcare Directive document or gathered as a result of a conversation with the patient or their healthcare agent (Advance Directive document or Portable Medical Order document).


The types of content in an advance directive could include, but are not limited to:
* Healthcare agent consent
* Resuscitation procedure preference
* Intubation and Ventilation procedure preference
* Antibiotics or other medication administration preference
* Artificial nutrition or hydration administration preference
* Diagnostic Testing procedure preference
* Preferences relating to palliative care
* Preferences relating to hospice care 
* Organ donation preference
* Autopsy procedure preference
* Burial or funeral preference
* Care preference that is general in nature which the patient wants care providers to take into consideration, such as likes or dislikes related to the experience of receiving care
* Information about a personal goal, such as seeing a grandchild born, attending a child’s wedding, finding care for a beloved pet, or dying in a certain place.

Preferences can be for or against certain procedures and are typically conditional based upon a certain health scenario taking place.

The type of content in a portable medical order could include but are not limited to procedures that can be ordered such as cardiopulmonary resuscitation, hospital transfer, full/selected/comfort care, antibiotics administration, artificial nutrition and hydration administration, dialysis, intubation, ventilation, and more.

Advance directives are effective when the individual is unable to communicate with their medical team themselves, due to a health crisis or emergency, and persist from execution until such time as the condition of the individual renders them appropriate for use. The effectiveTime/low tells when they went into effect (or will go into effect) and the high tells when they ceased or will cease to be in effect. If the starting effective time is not known, effectiveTime/low is UNK, but this would still be considered “Active”. At a minimum the starting effective time is the date signed. If effectiveTime/high contains a value of “NA” or it is not valued, the advance directive remains active until some action is taken to make it inactive, such as updating the document contents or revocation of the document itself. (Explicit use of nullFlavor=”NA” is the preferred approach for indicating an Advance Directive that is not time bounded.) That action may update the existing information with an effectiveTime/high or it may replace the open-ended entry with a new entry that includes the effectiveTime/high information. An advance directive is active so long as the effectiveTime/high has not been passed.

The author of the Advance Directive Observation is the person documenting that the directives were reviewed and verified to be accurate for provision of treatment and care. The verifier is the person who read the document and verified the advance directive information. The role of verifier and the role of author need not be fulfilled by the same person, so each role is documented separately. However, the author and the verifier often will be the same person in advance healthcare directive documents that are NOT portable medical orders. This template supports Context Conduction. The author of the organizer can be assumed to be the author of the Advance Directive Observations within the organizer unless explicitly overridden within the contained observation. When author identity confidence is high, implementers should explicitly assert conformance to the Provenance Author Participation template.

Advance Directive Observations that would appear in the context of an Advance Directive Organizer:

| Information Content Type (as evidenced in an external document, or provided verbally during a patient encounter and not contained in an external document) | How the Observation is used to represent this information for exchange |
| --- | --- |
| Existing advance healthcare directive document | Observation.code = 75320 <br/> Observation.code.translation = 92183-3 (Form type) <br/> Observation.value = a code from Advance Healthcare Directive Categories <br/> Optional: entryRelationship to reference the external source document by identifier |
| Appointment of healthcare agents  that are consented to by the patient.| Observation.code = 75320 <br/> Observation.code.translation = 81335-2 <br/> Observation.value = a code from Healthcare Agent or Proxy Choices  <br/> If no healthcare agents are appointed, Observation.value/@nullflavor = a code from No Healthcare Agent Included Reason <br/>  Observation.participant is used to record an appointed healthcare agent. Each Advance Directive Observation of this type holds only one Healthcare Agent, necessitating that if a primary healthcare agent and a backup healthcare agent are designed two Advance Directive Observation entries are required. |
| Patient’s Treatment Intervention Preferences (also supports preconditional health scenarios), Care Experience Preferences, and Upon Death Preferences. | When documenting that a patient has documented or expressed Treatment Intervention Preferences, Care Experience Preferences, or Upon Death Preferences, the person verifying the content in the referenced document is the performer of the observation and the observation.value tells what type of content was verified or discussed.<br/>  The documented preference is included as a reference to the Treatment Intervention Preference, Care Experience Preference or Upon Death Preference identified in the source document.<br/>The verified current preference can be included as entryRelationships to a Treatment Intervention Preference or Care Experience Preference where the performer is the person verifying the information with the patient or the healthcare agent, the informant is the patient or healthcare agent, and the author is the person recording this documentation in the EHR. <br/> Observation.code = 75320 <br/> Observation.code.translation = 95541-9 Care Experience Preference <br/> 81378-2 Personal Intervention Preference <br/> 81337-8 Upon Death Preferences <br/> Observation.value = code from Advance Directive Content Type |
| Personal healthcare goals (also supports preconditional health scenarios) | Observation.code = 75320 <br/> Observation.code.translation = 87528-6  Personal Health Goal <br/> Observation.value = a code from Health Goals at End of Life Grouping |
| Practitioner Orders that are in place in a Portable Medical Order document. | Observation.code = 75320 <br/> Observation.code.translation = Code should come from CPT or SNOMED CT codes. <br/> Observation.value will be from a specialized value set including coded values appropriate for the specific order. Or if coded concepts are not available, Observation.value will be a Boolean where T = perform and F=do-not-perform |
{:.grid}

Advance Directive Observation that would not be contained in the context of an Advance Directive Organizer:

| Information Content Type (as evidenced in an external document, or provided verbally during a patient encounter and not contained in an external document) | How the Observation is used to represent this information for exchange |
| --- | --- |
| Advance Directive Observation authored by the organization creating the C-CDA document to show the Patient’s DNR Status. | Observation.code = 75320 <br/> Observation.code.translation = 100822-6 Cardiopulmonary resuscitation orders <br/> Observation.value will be  LA33470-8 (Yes CPR) or LA33471-6 (No CPR) |
{:.grid}
"""

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
  * ^comment = "SHALL contain exactly one [1..1] code (CONF:3250-16895)."
  * code 1..1
  * code = #75320-2
    * ^comment = "This code SHALL contain exactly one [1..1] @code=\"75320-2\" Advance directive (CodeSystem: LOINC urn:oid:2.16.840.1.113883.6.1) (CONF:3250-16940)."
  * obeys should-translation
  * translation 0..*
  * translation from $2.16.840.1.113883.11.20.9.69.4 (preferred)   
    * ^comment = "This code SHOULD contain zero or more [0..*] translation, which SHOULD be selected from ValueSet Advance Directives Categories urn:oid:2.16.840.1.113883.11.20.9.69.4." // man-should
* text 1..1
* statusCode 1..1
  * ^comment = "SHALL contain exactly one [1..1] statusCode (CONF:1198-8652)."
  * code 1..1
  * code = #completed (exactly)
    * ^comment = "This statusCode SHALL contain exactly one [1..1] @code=\"completed\" Completed (CodeSystem: HL7ActStatus urn:oid:2.16.840.1.113883.5.14 STATIC) (CONF:1198-19082)."
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
* value from $2.16.840.1.113762.1.4.1099.57
  * ^binding.description = "Advance Directive Content Type"
* obeys should-author
* author 0..*
* author only AuthorParticipation
  * ^comment = "SHOULD contain zero or more [0..*] Author Participation (identifier: urn:oid:2.16.840.1.113883.10.20.22.4.119)." // man-should
* participant ^slicing.discriminator[0].type = #value
  * ^slicing.discriminator[=].path = "typeCode"
  * ^slicing.rules = #open
* participant contains
    verifier 0..* and
    custodian 0..*
* participant[verifier] ^short = "The participant \"VRF\" represents the clinician(s) who verified the patient advance directive."
  * ^comment = "SHOULD contain zero or more [0..*] participant (CONF:1198-8662) such that it"
  * typeCode 1..1
  * typeCode = #VRF (exactly)
    * ^comment = "SHALL contain exactly one [1..1] @typeCode=\"VRF\" Verifier (CodeSystem: HL7ParticipationType urn:oid:2.16.840.1.113883.5.90 STATIC) (CONF:1198-8663)."
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
  * obeys should-time
  * time 0..1
    * ^comment = "SHOULD contain zero or one [0..1] time (CONF:1198-8665)." // auto-should
    * insert IntervalValueOnly
  * participantRole 1..1
    * ^comment = "SHALL contain exactly one [1..1] participantRole (CONF:1198-8825)."
    * obeys should-code
    * code 0..1
    * code from $2.16.840.1.114222.4.11.1066 (preferred)
      * ^comment = "This participantRole SHOULD contain zero or one [0..1] code, which SHOULD be selected from ValueSet Healthcare Provider Taxonomy urn:oid:2.16.840.1.114222.4.11.1066 DYNAMIC (CONF:1198-28446)." // man-should
    * addr 0..*
    * addr only USRealmAddress
      * ^comment = "This participantRole MAY contain zero or more [0..*] US Realm Address (AD.US.FIELDED) (identifier: urn:oid:2.16.840.1.113883.10.20.22.5.2) (CONF:1198-28451)."
    * playingEntity 1..1
      * ^comment = "This participantRole SHALL contain exactly one [1..1] playingEntity (CONF:1198-28428)."
      * name 1..1
      * name only USRealmPersonNamePNUSFIELDED
        * ^comment = "The playingEntity SHALL contain exactly one [1..1] US Realm Person Name (PN.US.FIELDED) (identifier: urn:oid:2.16.840.1.113883.10.20.22.5.1.1) (CONF:1198-28454)."
* obeys should-informant
* informant ^short = "SHOULD contain informant" // man-should
* participant[custodian] ^short = "This custodian (CST) participant identifies a legal representative for healthcare decision-making. Examples of such  individuals are called health care agents, substitute decision makers and/or health care proxies.  Only record a healthcare agent who is acting in that capacitiy and participating in carae decision-making during the documented care encounter."
* participant[custodian] ^comment = "SHOULD contain zero or more [0..*] participant (CONF:1198-8667) such that it"
  * typeCode 1..1
  * typeCode = #CST (exactly)
    * ^comment = "SHALL contain exactly one [1..1] @typeCode=\"CST\" Custodian (CodeSystem: HL7ParticipationType urn:oid:2.16.840.1.113883.5.90 STATIC) (CONF:1198-8668)."
  * participantRole 1..1
    * ^comment = "SHALL contain exactly one [1..1] participantRole (CONF:1198-8669)."
    * classCode 1..1
    * classCode = #AGNT (exactly)
      * ^comment = "This participantRole SHALL contain exactly one [1..1] @classCode=\"AGNT\" Agent (CodeSystem: HL7RoleClass urn:oid:2.16.840.1.113883.5.110 STATIC) (CONF:1198-8670)."
    * obeys should-code
    * code 0..1
    * code from $2.16.840.1.113762.1.4.1046.35 (preferred)
      * ^comment = "This participantRole SHOULD contain zero or one [0..1] code, which SHOULD be selected from ValueSet Healthcare Agent or Proxy Choices urn:oid:2.16.840.1.113762.1.4.1046.35 DYNAMIC (CONF:1198-28440)." // man-should
    * obeys should-addr
    * addr 0..1
    * addr only USRealmAddress
      * ^comment = "This participantRole SHOULD contain zero or one [0..1] US Realm Address (AD.US.FIELDED) (identifier: urn:oid:2.16.840.1.113883.10.20.22.5.2) (CONF:1198-8671)."  // man-should
    * obeys should-telecom
    * telecom 0..*
      * ^comment = "This participantRole SHOULD contain zero or more [0..*] telecom (CONF:1198-8672)." // auto-should
    * playingEntity 1..1
      * ^comment = "This participantRole SHALL contain exactly one [1..1] playingEntity (CONF:1198-8824)."
      * obeys should-code
      * code 0..1
      * code from $2.16.840.1.113883.11.20.12.1 (preferred)
        * ^comment = "This playingEntity SHOULD contain zero or one [0..1] code, which SHOULD be selected from ValueSet Personal and Legal Relationship RoleType urn:oid:2.16.840.1.113883.11.20.12.1 DYNAMIC." // man-should
      * name 1..1
        * ^short = "The name of the healthcare agent."
        * ^comment = "This playingEntity SHALL contain exactly one [1..1] name (CONF:1198-8673)."
* reference ^slicing.discriminator[0].type = #value
  * ^slicing.discriminator[=].path = "typeCode"
  * ^slicing.rules = #open
* reference contains reference1 1..*
* reference[reference1] ^comment = "SHOULD contain at least one [1..*] reference (CONF:1198-8692) such that it"
  * typeCode 1..1
  * typeCode = #REFR (exactly)
    * ^comment = "SHALL contain exactly one [1..1] @typeCode=\"REFR\" Refers to (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002 STATIC) (CONF:1198-8694)."
  * externalDocument 1..1
    * ^comment = "SHALL contain exactly one [1..1] externalDocument (CONF:1198-8693)."
    * insert USCDI([[Author]])
    * id 1..*
      * ^comment = "This externalDocument SHALL contain at least one [1..*] id (CONF:1198-8695)."
    * text 0..1
      * ^comment = "This externalDocument MAY contain zero or one [0..1] text (CONF:1198-8696)."
      * reference 0..1
        * obeys 1198-8699
        * ^short = "The URL of a referenced advance directive document **MAY** be present, and **SHALL** be represented in Observation/reference/ExternalDocument/text/reference (CONF:1198-8698)."
        * ^comment = "The text, if present, MAY contain zero or one [0..1] reference (CONF:1198-8697)."
    * code 1..1
    * code from $2.16.840.1.113883.11.20.9.69.4 (preferred)    

Invariant: 1198-32449
Description: "If the Advance Directive does not have a specified ending time, the <high> element **SHALL** have the nullFlavor attribute set to *NA* (CONF:1198-32449)."
Severity: #error
Expression: "value.exists() or nullFlavor = 'NA'"

Invariant: 1198-8699
Description: "If a URL is referenced, then it **SHOULD** have a corresponding linkHTML element in narrative block (CONF:1198-8699)."
Severity: #warning
// Not implementing right now