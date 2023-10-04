Profile: EncountersSection
Parent: $Section
Id: EncountersSection
Title: "Encounters Section"
Description: "This section lists and describes any healthcare encounters pertinent to the patient's current health status or historical health history. An encounter is an interaction, regardless of the setting, between a patient and a practitioner who is vested with primary responsibility for diagnosing, evaluating, or treating the patient's condition. It may include visits, appointments, as well as non-face-to-face interactions. It is also a contact between a patient and a practitioner who has primary responsibility (exercising independent judgment) for assessing and treating the patient at a given contact. This section may contain all encounters for the time period being summarized, but should include notable encounters.  NOTE: Since the EncounterActivity entry template has a moodCode of EVN, it is not possible to use it for planned encounters.  The PlannedEncounter entry template should be used if future encounters are being included in this section."
* insert LogicalModelNA
* ^identifier.value = "urn:hl7ii:2.16.840.1.113883.10.20.22.2.22.1:2015-08-01"
* ^version = "2015-08-01"
* nullFlavor 0..1
* nullFlavor = #NI (exactly)
  * ^comment = "MAY contain zero or one [0..1] @nullFlavor=\"NI\" No information (CodeSystem: HL7NullFlavor urn:oid:2.16.840.1.113883.5.1008) (CONF:1198-32815)."
* templateId 2..
  * ^slicing.discriminator[0].type = #value
  * ^slicing.discriminator[=].path = "root"
  * ^slicing.discriminator[+].type = #value
  * ^slicing.discriminator[=].path = "extension"
  * ^slicing.rules = #open
* templateId contains secondary 1..1
* templateId[secondary] ^comment = "SHALL contain exactly one [1..1] templateId (CONF:1198-8705) such that it"
  * root 1..1
  * root = "2.16.840.1.113883.10.20.22.2.22.1"
    * ^comment = "SHALL contain exactly one [1..1] @root=\"2.16.840.1.113883.10.20.22.2.22.1\" (CONF:1198-10387)."
  * extension 1..1
  * extension = "2015-08-01"
    * ^comment = "SHALL contain exactly one [1..1] @extension=\"2015-08-01\" (CONF:1198-32548)."
* code 1..1
  * ^comment = "SHALL contain exactly one [1..1] code (CONF:1198-15466)."
  * code 1..1
  * code = #46240-8
    * ^comment = "This code SHALL contain exactly one [1..1] @code=\"46240-8\" Encounters (CONF:1198-15467)."
  * codeSystem 1..1
  * codeSystem = "2.16.840.1.113883.6.1"
    * ^comment = "This code SHALL contain exactly one [1..1] @codeSystem=\" 2.16.840.1.113883.6.1\" (CodeSystem: LOINC urn:oid:2.16.840.1.113883.6.1 STATIC) (CONF:1198-31137)."
* title 1..1
  * ^comment = "SHALL contain exactly one [1..1] title (CONF:1198-8707)."
* text 1..1
  * ^comment = "SHALL contain exactly one [1..1] text (CONF:1198-8708)."
* entry ^slicing.discriminator[0].type = #value
  * ^slicing.discriminator[=].path = "encounter"
  * ^slicing.rules = #open
  * ^short = "If section/@nullFlavor is not present:"
* entry contains encounter 1..*
* entry[encounter] ^comment = "SHALL contain at least one [1..*] entry (CONF:1198-8709) such that it"
  * encounter 1..1
  * encounter only EncounterActivity
    * ^comment = "SHALL contain exactly one [1..1] Encounter Activity (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.4.49:2015-08-01) (CONF:1198-15468)."