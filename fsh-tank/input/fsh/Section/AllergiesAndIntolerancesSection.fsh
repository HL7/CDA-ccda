Profile: AllergiesAndIntolerancesSection
Parent: $Section
Id: AllergiesAndIntolerancesSection
Title: "Allergies and Intolerances Section"
Description: "This section lists and describes any medication allergies, adverse reactions, idiosyncratic reactions, anaphylaxis/anaphylactoid reactions to food items, and metabolic variations or adverse reactions/allergies to other substances (such as latex, iodine, tape adhesives). At a minimum, it should list currently active and any relevant historical allergies and adverse reactions."
* insert LogicalModelNA
* ^identifier.value = "urn:hl7ii:2.16.840.1.113883.10.20.22.2.6.1:2015-08-01"
* ^version = "2015-08-01"
* nullFlavor ^short = "If a required section contains no information, the @nullFlavor MAY be set to NI"
* templateId 2..
  * ^slicing.discriminator[0].type = #value
  * ^slicing.discriminator[=].path = "extension"
  * ^slicing.discriminator[+].type = #value
  * ^slicing.discriminator[=].path = "root"
  * ^slicing.rules = #open
* templateId contains secondary 1..1
* templateId[secondary] ^comment = "SHALL contain exactly one [1..1] templateId (CONF:1198-7527) such that it"
  * root 1..1
  * root = "2.16.840.1.113883.10.20.22.2.6.1"
    * ^comment = "SHALL contain exactly one [1..1] @root=\"2.16.840.1.113883.10.20.22.2.6.1\" (CONF:1198-10379)."
  * extension 1..1
  * extension = "2015-08-01"
    * ^comment = "SHALL contain exactly one [1..1] @extension=\"2015-08-01\" (CONF:1198-32545)."
* code 1..1
  * ^comment = "SHALL contain exactly one [1..1] code (CONF:1198-15349)."
  * code 1..1
  * code = #48765-2
    * ^comment = "This code SHALL contain exactly one [1..1] @code=\"48765-2\" Allergies, adverse reactions, alerts (CONF:1198-15350)."
  * codeSystem 1..1
  * codeSystem = "2.16.840.1.113883.6.1"
    * ^comment = "This code SHALL contain exactly one [1..1] @codeSystem=\"2.16.840.1.113883.6.1\" (CodeSystem: LOINC urn:oid:2.16.840.1.113883.6.1) (CONF:1198-32140)."
* title 1..1
  * ^comment = "SHALL contain exactly one [1..1] title (CONF:1198-7534)."
* text 1..1
  * ^comment = "SHALL contain exactly one [1..1] text (CONF:1198-7530)."
* entry ^slicing.discriminator[0].type = #profile
  * ^slicing.discriminator[=].path = "act"
  * ^slicing.rules = #open
  * ^short = "If section/@nullFlavor is not present:"
* entry contains allergyConcern 1..*
* entry[allergyConcern] ^comment = "SHALL contain at least one [1..*] entry (CONF:1198-7531) such that it"
  * act 1..1
  * act only AllergyConcernAct
    * ^comment = "SHALL contain exactly one [1..1] Allergy Concern Act (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.4.30:2015-08-01) (CONF:1198-15446)."