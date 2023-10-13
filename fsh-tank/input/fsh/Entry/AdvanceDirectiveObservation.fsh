Profile: AdvanceDirectiveObservation
Parent: $Observation
Id: AdvanceDirectiveObservation
Title: "Advance Directive Observation"
Description: """This clinical statement represents Advance Directive Observation findings (e.g., "resuscitation status is Full Code") rather than orders. It should not be considered a legal document or a substitute for the actual Advance Directive document. The related legal documents are referenced using the reference/externalReference element.

The Advance Directive Observation describes the patient's directives, including but not limited to:
*  Medications
*  Transfer of Care to Hospital
*  Treatment
*  Procedures
*  Intubation and Ventilation
*  Diagnostic Tests
*  Tests

The observation/value element contains the detailed patient directive which may be coded or text. For example, a category directive may be antibiotics, and the details would be intravenous antibiotics only.
"""

* insert LogicalModelTemplate(advance-directive-obs, 2.16.840.1.113883.10.20.22.4.48, 2015-08-01)

* classCode 1..1
* classCode = #OBS (exactly)
  * ^comment = "SHALL contain exactly one [1..1] @classCode=\"OBS\" Observation (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:1198-8648)."
* moodCode 1..1
* moodCode = #EVN (exactly)
  * ^comment = "SHALL contain exactly one [1..1] @moodCode=\"EVN\" Event (CodeSystem: HL7ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:1198-8649)."
* id 1..*
  * ^comment = "SHALL contain at least one [1..*] id (CONF:1198-8654)."
* code 1..1
* code from $2.16.840.1.113883.1.11.20.2 (preferred)
  * ^comment = "SHALL contain exactly one [1..1] code, which SHOULD be selected from ValueSet Advance Directive Type Code urn:oid:2.16.840.1.113883.1.11.20.2 DYNAMIC (CONF:1198-8651)."
  * translation ^slicing.discriminator[0].type = #value
    * ^slicing.discriminator[=].path = "code"
    * ^slicing.discriminator[+].type = #value
    * ^slicing.discriminator[=].path = "codeSystem"
    * ^slicing.rules = #open
  * translation contains advanceDirective 1..1
  * translation[advanceDirective] ^comment = "This code SHALL contain exactly one [1..1] translation (CONF:1198-32842) such that it"
    * code 1..1
    * code = #75320-2
      * ^comment = "SHALL contain exactly one [1..1] @code=\"75320-2\" Advance directive (CONF:1198-32843)."
    * codeSystem 1..1
    * codeSystem = "2.16.840.1.113883.6.1"
      * ^comment = "SHALL contain exactly one [1..1] @codeSystem=\"2.16.840.1.113883.6.1\" (CodeSystem: LOINC urn:oid:2.16.840.1.113883.6.1) (CONF:1198-32844)."
* statusCode 1..1
  * ^short = "SG 20230706: constraint not entered 'properly' deleted fixedCode='Completed here - it's already in the next element and shoudln't be here - entered weird/wrong in TWB"
  * ^comment = "SHALL contain exactly one [1..1] statusCode (CONF:1198-8652)."
  * code 1..1
  * code = #completed (exactly)
    * ^comment = "This statusCode SHALL contain exactly one [1..1] @code=\"completed\" Completed (CodeSystem: HL7ActStatus urn:oid:2.16.840.1.113883.5.14 STATIC) (CONF:1198-19082)."
* effectiveTime 1..1
  * ^comment = "SHALL contain exactly one [1..1] effectiveTime (CONF:1198-8656)."
  * low 1..1
    * ^comment = "This effectiveTime SHALL contain exactly one [1..1] low (CONF:1198-28719)."
  * high 1..1
    * obeys 1198-32449
    * ^comment = "This effectiveTime SHALL contain exactly one [1..1] high (CONF:1198-15521)."
* value 1..1
  * obeys 1198-32493
  * ^comment = "SHALL contain exactly one [1..1] value (CONF:1198-30804)."
  //"<sliceName value=\"value1\"/>"
* author 0..*
* author only AuthorParticipation
  * ^comment = "SHOULD contain zero or more [0..*] Author Participation (identifier: urn:oid:2.16.840.1.113883.10.20.22.4.119) (CONF:1198-32406)."
* participant ^slicing.discriminator[0].type = #value
  * ^slicing.discriminator[=].path = "participantRole"
  * ^slicing.discriminator[+].type = #value
  * ^slicing.discriminator[=].path = "typeCode"
  * ^slicing.rules = #open
  * ^short = "This custodian (CST) participant identifies a legal representative for the patient's advance directive. Examples of such  individuals are called health care agents, substitute decision makers and/or health care proxies.  If there is more than one  legal representative, a qualifier may be used to designate the  legal representative as primary or secondary."
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
* participant[participant1] ^short = "The participant \"VRF\" represents the clinician(s) who verified the patient advance directive observation."
  * ^comment = "SHOULD contain zero or more [0..*] participant (CONF:1198-8662) such that it"
  * typeCode 1..1
  * typeCode = #VRF (exactly)
    * ^comment = "SHALL contain exactly one [1..1] @typeCode=\"VRF\" Verifier (CodeSystem: HL7ParticipationType urn:oid:2.16.840.1.113883.5.90 STATIC) (CONF:1198-8663)."
  * obeys should-time
  * time 0..1
    * obeys 1198-8666
    * ^comment = "SHOULD contain zero or one [0..1] time (CONF:1198-8665)." // auto-should
  * participantRole 1..1
    * ^comment = "SHALL contain exactly one [1..1] participantRole (CONF:1198-8825)."
    * code 0..1
    * code from $2.16.840.1.114222.4.11.1066 (preferred)
      * ^comment = "This participantRole SHOULD contain zero or one [0..1] code, which SHOULD be selected from ValueSet Healthcare Provider Taxonomy urn:oid:2.16.840.1.114222.4.11.1066 DYNAMIC (CONF:1198-28446)."
    * addr 0..*
    * addr only USRealmAddressADUSFIELDED
      * ^comment = "This participantRole MAY contain zero or more [0..*] US Realm Address (AD.US.FIELDED) (identifier: urn:oid:2.16.840.1.113883.10.20.22.5.2) (CONF:1198-28451)."
    * playingEntity 0..1
      * ^comment = "This participantRole MAY contain zero or one [0..1] playingEntity (CONF:1198-28428)."
      * name 0..*
      * name only USRealmPersonNamePNUSFIELDED
        * ^comment = "The playingEntity, if present, MAY contain zero or more [0..*] US Realm Person Name (PN.US.FIELDED) (identifier: urn:oid:2.16.840.1.113883.10.20.22.5.1.1) (CONF:1198-28454)."
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
    * code from $2.16.840.1.113883.11.20.12.1 (preferred)
      * ^comment = "This participantRole SHOULD contain zero or one [0..1] code, which SHOULD be selected from ValueSet Personal And Legal Relationship Role Type urn:oid:2.16.840.1.113883.11.20.12.1 DYNAMIC (CONF:1198-28440)."
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
        * ^short = "Record the name of the agent who can provide a copy of the Advance Directive in the name element."
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
        * obeys 1198-8698 and 1198-8699
        * ^comment = "The text, if present, MAY contain zero or one [0..1] reference (CONF:1198-8697)."

Invariant: 1198-32449
Description: "If the Advance Directive does not have a specified ending time, the <high> element **SHALL** have the nullFlavor attribute set to *NA* (CONF:1198-32449)."
Severity: #error

Invariant: 1198-32493
Description: "If type CD, then value will be SNOMED-CT 2.16.840.1.113883.6.96 (CONF:1198-32493)."
Severity: #error

Invariant: 1198-8666
Description: "The data type of Observation/participant/time in a verification **SHALL** be *TS* (time stamp) (CONF:1198-8666)."
Severity: #warning

Invariant: 1198-8698
Description: "The URL of a referenced advance directive document **MAY** be present, and **SHALL** be represented in Observation/reference/ExternalDocument/text/reference (CONF:1198-8698)."
Severity: #warning

Invariant: 1198-8699
Description: "If a URL is referenced, then it **SHOULD** have a corresponding linkHTML element in narrative block (CONF:1198-8699)."
Severity: #warning