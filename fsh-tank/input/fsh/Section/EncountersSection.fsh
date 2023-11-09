Profile: EncountersSection
Parent: $Section
Id: EncountersSection
Title: "Encounters Section"
Description: "This section lists and describes any healthcare encounters pertinent to the patient's current health status or historical health history. An encounter is an interaction, regardless of the setting, between a patient and a practitioner who is vested with primary responsibility for diagnosing, evaluating, or treating the patient's condition. It may include visits, appointments, as well as non-face-to-face interactions. It is also a contact between a patient and a practitioner who has primary responsibility (exercising independent judgment) for assessing and treating the patient at a given contact. This section may contain all encounters for the time period being summarized, but should include notable encounters.  NOTE: Since the EncounterActivity entry template has a moodCode of EVN, it is not possible to use it for planned encounters.  The PlannedEncounter entry template should be used if future encounters are being included in this section."
* nullFlavor ^short = "If a required section contains no information, the @nullFlavor MAY be set to NI"

* insert Section(#46240-8, Encounters, 2.16.840.1.113883.10.20.22.2.22.1, 2015-08-01)
* entry ^slicing.discriminator[0].type = #value
  * ^slicing.discriminator[=].path = "encounter"
  * ^slicing.rules = #open
  * ^short = "If section/@nullFlavor is not present:"
* entry contains encounter 0..*
* entry[encounter] ^comment = "SHALL contain at least one [1..*] entry (CONF:1198-8709) such that it"
  * encounter 1..1
  * encounter only EncounterActivity
    * ^comment = "SHALL contain exactly one [1..1] Encounter Activity (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.4.49:2015-08-01) (CONF:1198-15468)."
* obeys shall-encounter-activity