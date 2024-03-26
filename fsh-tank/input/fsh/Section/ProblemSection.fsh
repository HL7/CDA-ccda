Profile: ProblemSection
Parent: $Section
Id: ProblemSection
Title: "Problem Section"
Description: "This section lists and describes all relevant clinical problems at the time the document is generated. At a minimum, all pertinent current and historical problems should be listed. Overall health status may be represented in this section."
* nullFlavor ^short = "If a required section contains no information, the @nullFlavor MAY be set to NI"

* insert Section(#11450-4, [[Problem list - Reported]], 2.16.840.1.113883.10.20.22.2.5.1, 2015-08-01)
* entry 0..*
  * ^slicing.discriminator[0].type = #profile
  * ^slicing.discriminator[=].path = "act"
  * ^slicing.discriminator[+].type = #profile
  * ^slicing.discriminator[=].path = "observation"
  * ^slicing.rules = #open
  * ^short = "If section/@nullFlavor is not present:"
  * ^comment = "SHALL contain at least one [1..*] entry (CONF:1198-9183)"
* entry contains
    act 0..* and
    observation 0..1
* entry[act] ^comment = "SHALL contain exactly one [1..1] Problem Concern Act (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.4.3:2015-08-01) (CONF:1198-15506)"
  * act 1..1
  * act only ProblemConcernAct
    * ^comment = "SHALL contain exactly one [1..1] Problem Concern Act (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.4.3:2015-08-01) (CONF:1198-15505)"
* entry[observation].observation 1..1
* entry[observation].observation only HealthStatusObservation
  * ^comment = "SHALL contain exactly one [1..1] Health Status Observation (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.4.5:2014-06-09) (CONF:1198-30482)."
* obeys shall-problem-concern-act