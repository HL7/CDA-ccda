Profile: InstructionsSection
Parent: $Section
Id: InstructionsSection
Title: "Instructions Section"
Description: "The Instructions Section records instructions given to a patient. List patient decision aids here."
* nullFlavor ^short = "If a required section contains no information, the @nullFlavor MAY be set to NI"

* insert Section(#69730-0, Instructions, 2.16.840.1.113883.10.20.22.2.45, 2014-06-09)
* entry ^slicing.discriminator[0].type = #value
  * ^slicing.discriminator[=].path = "act"
  * ^slicing.rules = #open
  * ^short = "If section/@nullFlavor is not present:"
* entry contains instruction 0..*
* entry[instruction] ^comment = "SHALL contain at least one [1..*] entry (CONF:1098-10116) such that it"
  * act 1..1
  * act only Instruction
    * ^comment = "SHALL contain exactly one [1..1] Instruction (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.4.20:2014-06-09) (CONF:1098-31398)."
* obeys shall-instruction