Profile: InstructionObservation
Parent: $Observation
Id: InstructionObservation
Title: "Instruction Observation"
Description: "The Instruction observation template can be used in several ways, such as to record patient instructions within a Medication Activity or to record fill instructions within a supply order. Though not defined in this template, a Vaccine Information Statement (VIS) document could be referenced through observation/reference/externalDocument, and patient awareness of the instructions can be represented with the generic participant and the participant/awarenessCode.

The value element represents the actual instructions given to the patient. Typically recorded as a string or a narrative reference, the value may also be coded, though this template enforces no limits on the set of codes that can be used."

* insert LogicalModelTemplate(instruction, 2.16.840.1.113883.10.20.22.4.515, 2025-05-01)
* insert NarrativeLink

* classCode 1..1
* classCode = #OBS (exactly)
* moodCode 1..1
* moodCode = #EVN (exactly)
* code 1..1
  * insert CodedLoinc(89187-7, Instructions Provided)
  * translation 0..*
  * translation from $2.16.840.1.113883.11.20.9.34 (preferred)
    * ^short = "Can further classify the type of instructions provided"
* statusCode 1..1
  * code 1..1
  * code = #completed (exactly)
* effectiveTime 0..1
  * insert IntervalValueOnly
* value 1..1
* value only $CD or $ST or $ED
  * ^short = "The actual instructions provided"