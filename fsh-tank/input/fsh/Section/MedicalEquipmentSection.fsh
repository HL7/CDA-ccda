Profile: MedicalEquipmentSection
Parent: $Section
Id: MedicalEquipmentSection
Title: "Medical Equipment Section"
Description: """This section defines a patient's implanted and external health and medical devices and equipment. This section lists any pertinent durable medical equipment (DME) used to help maintain the patient's health status. All equipment relevant to the diagnosis, care, or treatment of a patient should be included. 

Devices applied to, or placed in, the patient are represented with the Procedure Activity Procedure template. Equipment supplied to the patient (e.g., pumps, inhalers, wheelchairs) is represented by the Non-Medicinal Supply Activity template. 

These devices may be grouped together within a Medical Equipment Organizer. The organizer would probably not be used with devices applied in or on the patient but rather to organize a group of medical supplies the patient has been supplied with."""

* insert Section(#46264-8, History of medical device use, 2.16.840.1.113883.10.20.22.2.23, 2014-06-09)
* entry ..*
  * ^slicing.discriminator[0].type = #profile
  * ^slicing.discriminator[=].path = "organizer"
  * ^slicing.discriminator[+].type = #profile
  * ^slicing.discriminator[=].path = "procedure"
  * ^slicing.discriminator[+].type = #profile
  * ^slicing.discriminator[=].path = "supply"
  * ^slicing.rules = #open
* entry contains
    medicalEquip 0..* and
    nonMedSupply 0..* and
    procedure 0..*
* entry[medicalEquip] ^comment = "MAY contain zero or more [0..*] entry (CONF:1098-7948) such that it"
  * organizer 1..1
  * organizer only MedicalEquipmentOrganizer
    * ^comment = "SHALL contain exactly one [1..1] Medical Equipment Organizer (identifier: urn:oid:2.16.840.1.113883.10.20.22.4.135) (CONF:1098-30351)."
* entry[nonMedSupply] ^comment = "SHOULD contain zero or more [0..*] entry (CONF:1098-31125) such that it"
  * supply 1..1
  * supply only NonMedicinalSupplyActivity
    * ^comment = "SHALL contain exactly one [1..1] Non-Medicinal Supply Activity (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.4.50:2014-06-09) (CONF:1098-31861)."
* entry[procedure] ^comment = "SHOULD contain zero or more [0..*] entry (CONF:1098-31885) such that it"
  * procedure 1..1
  * procedure only ProcedureActivityProcedure
    * ^comment = "SHALL contain exactly one [1..1] Procedure Activity Procedure (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.4.14:2014-06-09) (CONF:1098-31886)."
* obeys should-non-med-supply and should-procedure-act-procedure