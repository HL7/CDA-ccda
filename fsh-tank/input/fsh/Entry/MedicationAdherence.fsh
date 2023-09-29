Profile: MedicationAdherence
Parent: $Observation
Id: MedicationAdherence
Title: "Medication Adherence"
Description: "This profile represents whether a medication has been consumed according to instructions."
* insert LogicalModelNA
* ^identifier.value = "urn:hl7ii:2.16.840.1.113883.10.20.22.4.508"
* classCode 1..1
* moodCode 1..1
* moodCode = #EVN (exactly)
* templateId ^slicing.discriminator[0].type = #value
  * ^slicing.discriminator[=].path = "root"
  * ^slicing.discriminator[+].type = #value
  * ^slicing.discriminator[=].path = "extension"
  * ^slicing.rules = #open
* templateId contains primary 1..1
* templateId[primary].root 1..1
* templateId[primary].root = "2.16.840.1.113883.10.20.22.4.508"
* id 1..*
* code 1..1
  * code 1..1
  * code = #71799-1
    * ^label = "Adherence to prescribed medication instructions [Reported]"
  * codeSystem 1..1
  * codeSystem = "2.16.840.1.113883.6.1"
* statusCode 1..1
* effectiveTime 1..1
* value 1..1
* value only $CD
  * code 1..1
  * code from $2.16.840.1.113762.1.4.1099.59 (extensible)