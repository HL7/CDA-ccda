Profile: FamilyHistorySection
Parent: $Section
Id: FamilyHistorySection
Title: "Family History Section"
Description: "This section contains data defining the patient's genetic relatives in terms of possible or relevant health risk factors that have a potential impact on the patient's healthcare risk profile."
* insert LogicalModelNA
* ^identifier.value = "urn:hl7ii:2.16.840.1.113883.10.20.22.2.15:2015-08-01"
* ^version = "2015-08-01"
* templateId ^slicing.discriminator[0].type = #value
  * ^slicing.discriminator[=].path = "root"
  * ^slicing.discriminator[+].type = #value
  * ^slicing.discriminator[=].path = "extension"
  * ^slicing.rules = #open
* templateId contains primary 1..1
* templateId[primary] ^comment = "SHALL contain exactly one [1..1] templateId (CONF:1198-7932) such that it"
  * root 1..1
  * root = "2.16.840.1.113883.10.20.22.2.15"
    * ^comment = "SHALL contain exactly one [1..1] @root=\"2.16.840.1.113883.10.20.22.2.15\" (CONF:1198-10388)."
  * extension 1..1
  * extension = "2015-08-01"
    * ^comment = "SHALL contain exactly one [1..1] @extension=\"2015-08-01\" (CONF:1198-32607)."
* code 1..1
  * ^comment = "SHALL contain exactly one [1..1] code (CONF:1198-15469)."
  * code 1..1
  * code = #10157-6
    * ^comment = "This code SHALL contain exactly one [1..1] @code=\"10157-6\" Family History (CONF:1198-15470)."
  * codeSystem 1..1
  * codeSystem = "2.16.840.1.113883.6.1"
    * ^comment = "This code SHALL contain exactly one [1..1] @codeSystem=\"2.16.840.1.113883.6.1\" (CodeSystem: LOINC urn:oid:2.16.840.1.113883.6.1) (CONF:1198-32481)."
* title 1..1
  * ^comment = "SHALL contain exactly one [1..1] title (CONF:1198-7934)."
* text 1..1
  * ^comment = "SHALL contain exactly one [1..1] text (CONF:1198-7935)."
* entry ^slicing.discriminator[0].type = #value
  * ^slicing.discriminator[=].path = "organizer"
  * ^slicing.rules = #open
* entry contains organizer 0..*
* entry[organizer] ^comment = "MAY contain zero or more [0..*] entry (CONF:1198-32430) such that it"
  * organizer 1..1
  * organizer only FamilyHistoryOrganizer
    * ^comment = "SHALL contain exactly one [1..1] Family History Organizer (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.4.45:2015-08-01) (CONF:1198-32431)."