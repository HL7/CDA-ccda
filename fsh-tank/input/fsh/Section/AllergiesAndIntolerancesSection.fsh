Profile: AllergiesAndIntolerancesSection
Parent: $Section
Id: AllergiesAndIntolerancesSection
Title: "Allergies and Intolerances Section"
Description: "This section lists and describes any medication allergies, adverse reactions, idiosyncratic reactions, anaphylaxis/anaphylactoid reactions to food items, and metabolic variations or adverse reactions/allergies to other substances (such as latex, iodine, tape adhesives). At a minimum, it should list currently active and any relevant historical allergies and adverse reactions."
* nullFlavor ^short = "If a required section contains no information, the @nullFlavor MAY be set to NI"

* insert Section(#48765-2, [[Allergies and adverse reactions Document]], 2.16.840.1.113883.10.20.22.2.6.1, 2015-08-01)
* entry ^slicing.discriminator[0].type = #profile
  * ^slicing.discriminator[=].path = "act"
  * ^slicing.rules = #open
  * ^short = "If section/@nullFlavor is not present:"
* entry contains allergyConcern 0..*
* entry[allergyConcern] ^comment = "SHALL contain at least one [1..*] entry (CONF:1198-7531) such that it"
  * act 1..1
  * act only AllergyConcernAct
    * ^comment = "SHALL contain exactly one [1..1] Allergy Concern Act (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.4.30:2015-08-01) (CONF:1198-15446)."
* obeys shall-allergy-concern