Profile: MedicationAdherence
Parent: $Observation
Id: MedicationAdherence
Title: "Medication Adherence"
Description: "This profile represents whether a medication has been consumed according to instructions."

* insert LogicalModelTemplate(med-adherence, 2.16.840.1.113883.10.20.22.4.508, 2023-05-01)
* classCode 1..1
* moodCode 1..1
* moodCode = #EVN (exactly)
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