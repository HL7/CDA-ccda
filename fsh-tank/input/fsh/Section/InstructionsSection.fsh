Profile: InstructionsSection
Parent: $Section
Id: InstructionsSection
Title: "Instructions Section"
Description: "The Instructions Section records instructions given to a patient. List patient decision aids here."
* nullFlavor ^short = "If a required section contains no information, the @nullFlavor MAY be set to NI"

* insert Section(#69730-0, Instructions, 2.16.840.1.113883.10.20.22.2.45, 2014-06-09)
* entry ^slicing.discriminator[0].type = #profile
  * ^slicing.discriminator[=].path = "act"
  * ^slicing.discriminator[+].type = #profile
  * ^slicing.discriminator[=].path = "observation"
  * ^slicing.rules = #open
  * ^short = "If section/@nullFlavor is not present:"
* entry contains instructionAct 0..* and instructionObservation 0..*
* entry[instructionAct]
  * ^condition = "shall-instruction"
  * act 1..1
  * act only InstructionActivity
* entry[instructionObservation]
  * observation 1..1
  * observation only InstructionObservation
* obeys shall-instruction