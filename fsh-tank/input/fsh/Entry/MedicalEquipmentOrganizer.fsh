Profile: MedicalEquipmentOrganizer
Parent: $Organizer
Id: MedicalEquipmentOrganizer
Title: "Medical Equipment Organizer"
Description: """This template represents a set of current or historical medical devices, supplies, aids and equipment used by the patient. Examples are hearing aids, orthotic devices, ostomy supplies, visual aids, diabetic supplies such as syringes and pumps, and wheelchairs. 

Devices that are applied during a procedure (e.g., cardiac pacemaker, gastrosomy tube, port catheter), whether permanent or temporary, are represented within the Procedure Activity Procedure template (templateId: 2.16.840.1.113883.10.20.22.4.14.2)."""

* insert LogicalModelTemplateRootOnly(medical-equipment-org, 2.16.840.1.113883.10.20.22.4.135)
* insert NarrativeLinkOrganizer

* obeys 1098-32380
* classCode 1..1
* classCode = #CLUSTER (exactly)
  * ^comment = "SHALL contain exactly one [1..1] @classCode=\"CLUSTER\" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:1098-31020)."
* moodCode 1..1
  * ^comment = "SHALL contain exactly one [1..1] @moodCode=\"EVN\" Event (CodeSystem: HL7ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:1098-31021)."
* id 1..*
  * ^comment = "SHALL contain at least one [1..*] id (CONF:1098-31024)."
* code 0..1
  * ^short = "This code can represent a category of devices. The code is strictly optional, and is not currently limited to any value set or code system. Implementers may use it if they wish to provide optional coded information about this grouping of medical equipment."
  * ^comment = "MAY contain zero or one [0..1] code (CONF:1098-31025)."
* statusCode 1..1
  * ^short = "The organizer is a collection of statuses for contained entries. The organizer remains active until all contained entries are done."
  * ^comment = "SHALL contain exactly one [1..1] statusCode (CONF:1098-31026)."
  * code 1..1
  * code from $2.16.840.1.113883.11.20.9.39 (required)
    * ^comment = "This statusCode SHALL contain exactly one [1..1] @code, which SHALL be selected from ValueSet Result Status urn:oid:2.16.840.1.113883.11.20.9.39 STATIC 2014-09-01 (CONF:1098-31029)."
* effectiveTime 1..1
  * ^short = "The effectiveTime can be used to show the time period over which the patient will be using the set of equipment. The organizer would probably not be used with devices applied in or on the patient."
  * ^comment = "SHALL contain exactly one [1..1] effectiveTime (CONF:1098-32136)."
  * low 1..1
    * ^comment = "This effectiveTime SHALL contain exactly one [1..1] low (CONF:1098-32378)."
  * high 1..1
    * ^comment = "This effectiveTime SHALL contain exactly one [1..1] high (CONF:1098-32379)."
* component ^slicing.discriminator[0].type = #profile
  * ^slicing.discriminator[=].path = "supply"
  * ^slicing.discriminator[+].type = #profile
  * ^slicing.discriminator[=].path = "procedure"
  * ^slicing.rules = #open
* component contains
    nonMedicalSupply 0..* and
    procedureActivity 0..*
* component[nonMedicalSupply] ^comment = "MAY contain zero or more [0..*] component (CONF:1098-31027) such that it"
  * supply 1..1
  * supply only NonMedicinalSupplyActivity
    * ^comment = "SHALL contain exactly one [1..1] Non-Medicinal Supply Activity (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.4.50:2014-06-09) (CONF:1098-31862)."
* component[procedureActivity] ^comment = "MAY contain zero or more [0..*] component (CONF:1098-31887) such that it"
  * procedure 1..1
  * procedure only ProcedureActivityProcedure
    * ^comment = "SHALL contain exactly one [1..1] Procedure Activity Procedure (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.4.14:2014-06-09) (CONF:1098-31888)."

Invariant: 1098-32380
Description: "Either Non-Medicinal Supply Activity (templateId:2.16.840.1.113883.10.20.22.4.50:2014-06-09) **OR** Procedure Activity Procedure (templateId:2.16.840.1.113883.10.20.22.4.14:2014-06-09) **SHALL** be present (CONF:1098-32380)."
Severity: #error
Expression: "component.where(supply.withTemplateIdOf(NonMedicinalSupplyActivity)).exists() or component.where(procedure.withTemplateIdOf(ProcedureActivityProcedure)).exists()"