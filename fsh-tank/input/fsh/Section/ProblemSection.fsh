Profile: ProblemSection
Parent: $Section
Id: ProblemSection
Title: "Problem Section"
Description: "This section lists and describes all relevant clinical problems at the time the document is generated. At a minimum, all pertinent current and historical problems should be listed. Overall health status may be represented in this section."
* insert LogicalModelNA
* ^identifier.value = "urn:hl7ii:2.16.840.1.113883.10.20.22.2.5.1:2015-08-01"
* ^version = "2015-08-01"
* nullFlavor 0..1
* nullFlavor = #NI (exactly)
  * ^comment = "MAY contain zero or one [0..1] @nullFlavor=\"NI\" No information (CodeSystem: HL7NullFlavor urn:oid:2.16.840.1.113883.5.1008) (CONF:1198-32864)."
* templateId ^slicing.discriminator[0].type = #value
  * ^slicing.discriminator[=].path = "extension"
  * ^slicing.discriminator[+].type = #value
  * ^slicing.discriminator[=].path = "root"
  * ^slicing.rules = #open
* templateId contains primary 1..1
* templateId[primary] ^comment = "SHALL contain exactly one [1..1] templateId (CONF:1198-9179) such that it"
  * root 1..1
  * root = "2.16.840.1.113883.10.20.22.2.5.1"
    * ^comment = "SHALL contain exactly one [1..1] @root=\"2.16.840.1.113883.10.20.22.2.5.1\" (CONF:1198-10441)."
  * extension 1..1
  * extension = "2015-08-01"
    * ^comment = "SHALL contain exactly one [1..1] @extension=\"2015-08-01\" (CONF:1198-32510)."
* code 1..1
  * ^comment = "SHALL contain exactly one [1..1] code (CONF:1198-15409)."
  * code 1..1
  * code = #11450-4
    * ^comment = "This code SHALL contain exactly one [1..1] @code=\"11450-4\" Problem List (CONF:1198-15410)."
  * codeSystem 1..1
  * codeSystem = "2.16.840.1.113883.6.1"
    * ^comment = "This code SHALL contain exactly one [1..1] @codeSystem=\"2.16.840.1.113883.6.1\" (CodeSystem: LOINC urn:oid:2.16.840.1.113883.6.1) (CONF:1198-31142)."
* title 1..1
  * ^comment = "SHALL contain exactly one [1..1] title (CONF:1198-9181)."
* text 1..1
  * ^comment = "SHALL contain exactly one [1..1] text (CONF:1198-9182)."
* entry 1..*
  * ^slicing.discriminator[0].type = #exists
  * ^slicing.discriminator[=].path = "*"
  * ^slicing.rules = #open
  * ^short = "If section/@nullFlavor is not present:"
  * ^comment = "SHALL contain at least one [1..*] entry (CONF:1198-9183)"
* entry contains
    act 0..* and
    observation 0..1
* entry[act] ^comment = "SHALL contain exactly one [1..1] Problem Concern Act (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.4.3:2015-08-01) (CONF:1198-15506)"
  * ^min = 0
  * act 1..1
  * act only ProblemConcernAct
    * ^comment = "SHALL contain exactly one [1..1] Problem Concern Act (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.4.3:2015-08-01) (CONF:1198-15505)"
* entry[observation].observation 1..1
* entry[observation].observation only HealthStatusObservation
  * ^comment = "SHALL contain exactly one [1..1] Health Status Observation (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.4.5:2014-06-09) (CONF:1198-30482)."