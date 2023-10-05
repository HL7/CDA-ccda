Profile: Instruction
Parent: $Act
Id: Instruction
Title: "Instruction"
Description: "The Instruction template can be used in several ways, such as to record patient instructions within a Medication Activity or to record fill instructions within a supply order. The template's moodCode can only be INT. If an instruction was already given, the Procedure Activity Procedure template (instead of this template) should be used to represent the already occurred instruction. The act/code defines the type of instruction. Though not defined in this template, a Vaccine Information Statement (VIS) document could be referenced through act/reference/externalDocument, and patient awareness of the instructions can be represented with the generic participant and the participant/awarenessCode."

* insert LogicalModelTemplate(instruction, 2.16.840.1.113883.10.20.22.4.20, 2014-06-09)

* classCode 1..1
* classCode = #ACT (exactly)
  * ^comment = "SHALL contain exactly one [1..1] @classCode=\"ACT\" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:1098-7391)."
* moodCode 1..1
* moodCode = #INT (exactly)
  * ^comment = "SHALL contain exactly one [1..1] @moodCode=\"INT\" (CodeSystem: HL7ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:1098-7392)."
* code 1..1
* code from $2.16.840.1.113883.11.20.9.34 (preferred)
  * ^comment = "SHALL contain exactly one [1..1] code, which SHOULD be selected from ValueSet Patient Education urn:oid:2.16.840.1.113883.11.20.9.34 DYNAMIC (CONF:1098-16884)."
* statusCode 1..1
  * ^comment = "SHALL contain exactly one [1..1] statusCode (CONF:1098-7396)."
  * code 1..1
  * code = #completed (exactly)
    * ^comment = "This statusCode SHALL contain exactly one [1..1] @code=\"completed\" Completed (CodeSystem: HL7ActStatus urn:oid:2.16.840.1.113883.5.14 STATIC) (CONF:1098-19106)."