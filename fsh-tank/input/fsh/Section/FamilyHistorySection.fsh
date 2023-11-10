Profile: FamilyHistorySection
Parent: $Section
Id: FamilyHistorySection
Title: "Family History Section"
Description: "This section contains data defining the patient's genetic relatives in terms of possible or relevant health risk factors that have a potential impact on the patient's healthcare risk profile."

* insert Section(#10157-6, Family History, 2.16.840.1.113883.10.20.22.2.15, 2015-08-01)
* entry ^slicing.discriminator[0].type = #profile
  * ^slicing.discriminator[=].path = "organizer"
  * ^slicing.rules = #open
* entry contains organizer 0..*
* entry[organizer] ^comment = "MAY contain zero or more [0..*] entry (CONF:1198-32430) such that it"
  * organizer 1..1
  * organizer only FamilyHistoryOrganizer
    * ^comment = "SHALL contain exactly one [1..1] Family History Organizer (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.4.45:2015-08-01) (CONF:1198-32431)."