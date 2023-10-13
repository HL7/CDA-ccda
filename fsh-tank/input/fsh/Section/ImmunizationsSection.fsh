Profile: ImmunizationsSection
Parent: $Section
Id: ImmunizationsSection
Title: "Immunizations Section"
Description: "The Immunizations Section defines a patient's current immunization status and pertinent immunization history. The primary use case for the Immunization Section is to enable communication of a patient's immunization status. The section should include current immunization status, and may contain the entire immunization history that is relevant to the period of time being summarized."
* nullFlavor ^short = "If a required section contains no information, the @nullFlavor MAY be set to NI"

* insert Section(#11369-6, Immunizations, 2.16.840.1.113883.10.20.22.2.2.1, 2015-08-01)
* entry ^slicing.discriminator[0].type = #profile
  * ^slicing.discriminator[=].path = "substanceAdministration"
  * ^slicing.rules = #open
  * ^short = "If section/@nullFlavor is not present..."
* entry contains activity 1..*
* entry[activity] ^comment = "SHALL contain at least one [1..*] entry (CONF:1198-9019) such that it"
  * substanceAdministration 1..1
  * substanceAdministration only ImmunizationActivity
    * ^comment = "SHALL contain exactly one [1..1] Immunization Activity (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.4.52:2015-08-01) (CONF:1198-15494)."