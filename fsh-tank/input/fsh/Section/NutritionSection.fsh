Profile: NutritionSection
Parent: $Section
Id: NutritionSection
Title: "Nutrition Section"
Description: "The Nutrition Section represents diet and nutrition information including special diet requirements and restrictions (e.g., texture modified diet, liquids only, enteral feeding). It also represents the overall nutritional status of the patient and nutrition assessment findings."
* insert OldSection(#61144-2,  Diet and nutrition , 2.16.840.1.113883.10.20.22.2.57)

* entry ^slicing.discriminator.type = #value
  * ^slicing.discriminator.path = "observation"
  * ^slicing.rules = #open
* entry contains nutritionalStatus 0..*
* entry[nutritionalStatus] ^comment = "SHOULD contain zero or more [0..*] entry (CONF:1098-30321) such that it"
  * observation 1..1
  * observation only NutritionalStatusObservation
    * ^comment = "SHALL contain exactly one [1..1] Nutritional Status Observation (identifier: urn:oid:2.16.840.1.113883.10.20.22.4.124) (CONF:1098-30322)."