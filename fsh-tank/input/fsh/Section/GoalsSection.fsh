Profile: GoalsSection
Parent: $Section
Id: GoalsSection
Title: "Goals Section"
Description: "This template represents patient Goals. A goal is a defined outcome or condition to be achieved in the process of patient care. Goals include patient-defined over-arching goals (e.g., alleviation of health concerns, desired/intended positive outcomes from interventions, longevity, function, symptom management, comfort) and health concern-specific or intervention-specific goals to achieve desired outcomes."
* insert LogicalModelNA
* ^identifier.value = "urn:oid:2.16.840.1.113883.10.20.22.2.60"
* nullFlavor 0..1
* nullFlavor = #NI (exactly)
  * ^comment = "MAY contain zero or one [0..1] @nullFlavor=\"NI\" No information (CodeSystem: HL7NullFlavor urn:oid:2.16.840.1.113883.5.1008) (CONF:1098-32819)."
* templateId ^slicing.discriminator.type = #value
  * ^slicing.discriminator.path = "root"
  * ^slicing.rules = #open
* templateId contains primary 1..1
* templateId[primary] ^comment = "SHALL contain exactly one [1..1] templateId (CONF:1098-29584) such that it, SHALL not contain [0..0] extension."
  * root 1..1
  * root = "2.16.840.1.113883.10.20.22.2.60"
    * ^comment = "SHALL contain exactly one [1..1] @root=\"2.16.840.1.113883.10.20.22.2.60\" (CONF:1098-29585)."
  * extension 0..0
* code 1..1
  * ^comment = "SHALL contain exactly one [1..1] code (CONF:1098-29586)."
  * code 1..1
  * code = #61146-7
    * ^comment = "This code SHALL contain exactly one [1..1] @code=\"61146-7\" Goals (CONF:1098-29587)."
  * codeSystem 1..1
  * codeSystem = "2.16.840.1.113883.6.1"
    * ^comment = "This code SHALL contain exactly one [1..1] @codeSystem=\"2.16.840.1.113883.6.1\" (CodeSystem: LOINC urn:oid:2.16.840.1.113883.6.1) (CONF:1098-29588)."
* title 1..1
  * ^comment = "SHALL contain exactly one [1..1] title (CONF:1098-30721)."
* text 1..1
  * ^comment = "SHALL contain exactly one [1..1] text (CONF:1098-30722)."
* entry ^slicing.discriminator.type = #value
  * ^slicing.discriminator.path = "observation"
  * ^slicing.rules = #open
  * ^short = "If section/@nullFlavor is not present:"
* entry contains goal 1..*
* entry[goal] ^comment = "SHALL contain at least one [1..*] entry (CONF:1098-30719) such that it"
  * observation 1..1
  * observation only GoalObservation
    * ^comment = "SHALL contain exactly one [1..1] Goal Observation (identifier: urn:oid:2.16.840.1.113883.10.20.22.4.121) (CONF:1098-30720)."