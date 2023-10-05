Profile: InstructionsSection
Parent: $Section
Id: InstructionsSection
Title: "Instructions Section"
Description: "The Instructions Section records instructions given to a patient. List patient decision aids here."
* insert LogicalModelNA
* ^identifier.value = "urn:hl7ii:2.16.840.1.113883.10.20.22.2.45:2014-06-09"
* ^version = "2014-06-09"
* nullFlavor ^short = "If a required section contains no information, the @nullFlavor MAY be set to NI"
* templateId ^slicing.discriminator[0].type = #value
  * ^slicing.discriminator[=].path = "root"
  * ^slicing.discriminator[+].type = #value
  * ^slicing.discriminator[=].path = "extension"
  * ^slicing.rules = #open
* templateId contains primary 1..1
* templateId[primary] ^comment = "SHALL contain exactly one [1..1] templateId (CONF:1098-10112) such that it"
  * root 1..1
  * root = "2.16.840.1.113883.10.20.22.2.45"
    * ^comment = "SHALL contain exactly one [1..1] @root=\"2.16.840.1.113883.10.20.22.2.45\" (CONF:1098-31384)."
  * extension 1..1
  * extension = "2014-06-09"
    * ^comment = "SHALL contain exactly one [1..1] @extension=\"2014-06-09\" (CONF:1098-32599)."
* code 1..1
  * ^comment = "SHALL contain exactly one [1..1] code (CONF:1098-15375)."
  * code 1..1
  * code = #69730-0
    * ^comment = "This code SHALL contain exactly one [1..1] @code=\"69730-0\" Instructions (CONF:1098-15376)."
  * codeSystem 1..1
  * codeSystem = "2.16.840.1.113883.6.1"
    * ^comment = "This code SHALL contain exactly one [1..1] @codeSystem=\"2.16.840.1.113883.6.1\" (CodeSystem: LOINC urn:oid:2.16.840.1.113883.6.1) (CONF:1098-32148)."
* title 1..1
  * ^comment = "SHALL contain exactly one [1..1] title (CONF:1098-10114)."
* text 1..1
  * ^comment = "SHALL contain exactly one [1..1] text (CONF:1098-10115)."
* entry ^slicing.discriminator[0].type = #value
  * ^slicing.discriminator[=].path = "act"
  * ^slicing.rules = #open
  * ^short = "If section/@nullFlavor is not present:"
* entry contains instruction 1..*
* entry[instruction] ^comment = "SHALL contain at least one [1..*] entry (CONF:1098-10116) such that it"
  * act 1..1
  * act only Instruction
    * ^comment = "SHALL contain exactly one [1..1] Instruction (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.4.20:2014-06-09) (CONF:1098-31398)."