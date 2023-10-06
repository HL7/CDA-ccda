Profile: SubstanceAdministeredAct
Parent: $Act
Id: SubstanceAdministeredAct
Title: "Substance Administered Act"
Description: "This template represents the administration course in a series. The entryRelationship/sequenceNumber in the containing template shows the order of this particular administration in that medication series."

* insert LogicalModelTemplateRootOnly(substance-administered-act, 2.16.840.1.113883.10.20.22.4.118)

* classCode 1..1
* classCode = #ACT (exactly)
  * ^comment = "SHALL contain exactly one [1..1] @classCode=\"ACT\" Act (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:1098-31500)."
* moodCode 1..1
* moodCode = #EVN (exactly)
  * ^comment = "SHALL contain exactly one [1..1] @moodCode=\"EVN\" Event (CodeSystem: HL7ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:1098-31501)."
* id 1..*
  * ^comment = "SHALL contain at least one [1..*] id (CONF:1098-31504)."
* code 1..1
  * ^comment = "SHALL contain exactly one [1..1] code (CONF:1098-31506)."
  * code 1..1
  * code = #416118004
    * ^comment = "This code SHALL contain exactly one [1..1] @code=\"416118004\" Administration (CONF:1098-31507)."
  * codeSystem 1..1
  * codeSystem = "2.16.840.1.113883.6.96"
    * ^comment = "This code SHALL contain exactly one [1..1] @codeSystem=\"2.16.840.1.113883.6.96\" (CodeSystem: SNOMED CT urn:oid:2.16.840.1.113883.6.96) (CONF:1098-31508)."
* statusCode 1..1
  * ^comment = "SHALL contain exactly one [1..1] statusCode=\"completed\" Completed (CodeSystem: HL7ActStatus urn:oid:2.16.840.1.113883.5.14) (CONF:1098-31505)."
  * code 1..1
  * code = #completed (exactly)
    * ^comment = "SHALL contain exactly one [1..1] statusCode=\"completed\" Completed (CodeSystem: HL7ActStatus urn:oid:2.16.840.1.113883.5.14) (CONF:1098-31505)."
* effectiveTime 0..1
  * ^comment = "MAY contain zero or one [0..1] effectiveTime (CONF:1098-31509)."