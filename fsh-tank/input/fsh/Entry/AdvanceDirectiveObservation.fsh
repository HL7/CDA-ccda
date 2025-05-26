Profile: AdvanceDirectiveObservation
Parent: $Observation
Id: AdvanceDirectiveObservation
Title: "Advance Directive Observation"
Description: """The Advance Directive Observation template is nested within the Advance Directive Existence Observation, which indicates whether the individual has any advance directive documents. Each Advance Directive Observation template provides details about one type of advance directive document and may also include information about the document’s author, as well as any individuals who discussed and verified its contents with the patient or their designated healthcare agent.
 
The Advance Directive Observation template also can be nested within an Intervention Act to serve as documentation explaining why an intervention was planned/performed or not.
"""

* insert LogicalModelTemplate(advance-directive-obs, 2.16.840.1.113883.10.20.22.4.48, 2025-05-01)
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
  * insert CodedLoinc(75320-2, [[Advance Directive]])
  * obeys should-translation
  * translation 0..*
  * translation from $2.16.840.1.113883.11.20.9.69.4 (preferred)   
    * insert USCDI([[Advance Directive Type]])
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
* value 0..1
* value only $CD
* value from $AdvanceDirectiveDocumentTypes (preferred)
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
* participant[verifier]
  * insert USCDI([[Verifier - The participant \"VRF\" represents the clinician(s) who verified the patient advance directive.]])
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
    * insert USCDI([[External Document]])
    * id 1..*
      * ^comment = "This externalDocument SHALL contain at least one [1..*] id (CONF:1198-8695)."
    * text 0..1
      * ^comment = "This externalDocument MAY contain zero or one [0..1] text (CONF:1198-8696)."
      * reference 0..1
        * obeys 1198-8699
        * ^short = "The URL of a referenced advance directive document **MAY** be present, and **SHALL** be represented in Observation/reference/ExternalDocument/text/reference (CONF:1198-8698)."
        * ^comment = "The text, if present, MAY contain zero or one [0..1] reference (CONF:1198-8697)."
    * code 1..1
    * code from $AdvanceDirectiveDocumentTypes (preferred)
    * sdtcAuthor
      * insert USCDI([[Author]])

Invariant: 1198-32449
Description: "If the Advance Directive does not have a specified ending time, the <high> element **SHALL** have the nullFlavor attribute set to *NA* (CONF:1198-32449)."
Severity: #error
Expression: "value.exists() or nullFlavor = 'NA'"

Invariant: 1198-8699
Description: "If a URL is referenced, then it **SHOULD** have a corresponding linkHTML element in narrative block (CONF:1198-8699)."
Severity: #warning
// Not implementing right now