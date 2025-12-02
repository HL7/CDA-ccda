Profile: MedicationAdherence
Parent: $Observation
Id: MedicationAdherence
Title: "Medication Adherence"
Description: "This profile represents whether a medication has been consumed according to instructions."

* insert LogicalModelTemplate(med-adherence, 2.16.840.1.113883.10.20.22.4.508, 2023-05-01)
* insert NarrativeLink
* classCode 1..1
* moodCode 1..1
* moodCode = #EVN (exactly)
* id 1..*
* code 1..1
  * insert CodedLoinc(71799-1, Adherence to prescribed medication instructions [Reported])
* statusCode 1..1
* effectiveTime 1..1
* value 1..1
* value only $CD
  * insert BindAtCode($2.16.840.1.113762.1.4.1240.8, preferred)
* insert ShouldElement(informant)
* informant
  * insert USCDI([[The person or organization that provided the information about the medication adherence.]])
  * assignedEntity 1..1
  * assignedEntity.code from $2.16.840.1.113762.1.4.1267.11 (preferred)