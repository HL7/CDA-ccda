Profile: DrugMonitoringAct
Parent: $Act
Id: DrugMonitoringAct
Title: "Drug Monitoring Act"
Description: """This template represents the act of monitoring the patient's medication and includes a participation to record the person responsible for monitoring the medication. The prescriber of the medication is not necessarily the same person or persons monitoring the drug. The effectiveTime indicates the time when the activity is intended to take place.

For example, a cardiologist may prescribe a patient Warfarin. The patient's primary care provider may monitor the patient's INR and adjust the dosing of the Warfarin based on these laboratory results. Here the person designated to monitor the drug is the primary care provider."""

* insert LogicalModelTemplateRootOnly(drug-monitoring-act, 2.16.840.1.113883.10.20.22.4.123)
* insert NarrativeLink

* classCode 1..1
* classCode = #ACT (exactly)
  * ^comment = "SHALL contain exactly one [1..1] @classCode=\"ACT\" act (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:1098-30823)."
* moodCode 1..1
* moodCode = #INT (exactly)
  * ^comment = "SHALL contain exactly one [1..1] @moodCode=\"INT\" (CONF:1098-28656)."
* id 1..*
  * ^comment = "SHALL contain at least one [1..*] id (CONF:1098-31920)."
* code 1..1
  * ^comment = "SHALL contain exactly one [1..1] code (CONF:1098-28660)."
  * code 1..1
  * code = #395170001
    * ^comment = "This code SHALL contain exactly one [1..1] @code=\"395170001\" medication monitoring (regime/therapy) (CONF:1098-30818)."
  * codeSystem 1..1
  * codeSystem = "2.16.840.1.113883.6.96"
    * ^comment = "This code SHALL contain exactly one [1..1] @codeSystem=\"2.16.840.1.113883.6.96\" (CodeSystem: SNOMED CT urn:oid:2.16.840.1.113883.6.96) (CONF:1098-30819)."
* statusCode 1..1
  * ^comment = "SHALL contain exactly one [1..1] statusCode (CONF:1098-31921)."
  * code 1..1
  * code from ActStatus (required)
    * ^comment = "This statusCode SHALL contain exactly one [1..1] @code, which SHALL be selected from ValueSet ActStatus urn:oid:2.16.840.1.113883.1.11.15933 DYNAMIC (CONF:1098-32358)."
* effectiveTime 1..1
  * ^comment = "SHALL contain exactly one [1..1] effectiveTime (CONF:1098-31922)."
* participant ^slicing.discriminator.type = #value
  * ^slicing.discriminator.path = "typeCode"
  * ^slicing.rules = #open
* participant contains participant1 1..*
* participant[participant1] ^comment = "SHALL contain at least one [1..*] participant (CONF:1098-28661) such that it"
  * typeCode 1..1
  * typeCode = #RESP (exactly)
    * ^comment = "SHALL contain exactly one [1..1] @typeCode=\"RESP\" (CONF:1098-28663)."
  * participantRole 1..1
    * ^comment = "SHALL contain exactly one [1..1] participantRole (CONF:1098-28662)."
    * classCode 1..1
    * classCode = #ASSIGNED (exactly)
      * ^comment = "This participantRole SHALL contain exactly one [1..1] @classCode=\"ASSIGNED\" (CONF:1098-28664)."
    * id 1..*
      * ^comment = "This participantRole SHALL contain at least one [1..*] id (CONF:1098-28665)."
    * playingEntity 1..1
      * ^comment = "This participantRole SHALL contain exactly one [1..1] playingEntity (CONF:1098-28667)."
      * classCode 1..1
      * classCode = #PSN (exactly)
        * ^comment = "This playingEntity SHALL contain exactly one [1..1] @classCode=\"PSN\" (CONF:1098-28668)."
      * name 1..1
      * name only USRealmPersonNamePNUSFIELDED
        * ^comment = "This playingEntity SHALL contain exactly one [1..1] US Realm Person Name (PN.US.FIELDED) (identifier: urn:oid:2.16.840.1.113883.10.20.22.5.1.1) (CONF:1098-28669)."