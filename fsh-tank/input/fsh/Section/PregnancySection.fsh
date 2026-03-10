Profile: PregnancySection
Parent: $Section
Id: PregnancySection
Title: "Pregnancy Section"
Description: "This section contains a patient's pregnancy information. It is consistent with the International Patient Summary specification. The previous definition of this section was located in the Supplemental Templates for Pregnancy Status. Both the section as defined in that guide and the IPS section include other entries that C-CDA does not explicitly call out."

* insert Section(#10162-6, [[History of pregnancies Narrative]], 2.16.840.1.113883.10.20.22.2.70, 2026-05-01)
* entry 0..*
  * ^slicing.discriminator[0].type = #profile
  * ^slicing.discriminator[=].path = "observation"
  * ^slicing.rules = #open
  * ^short = "If section/@nullFlavor is not present:"
  * ^comment = "SHALL contain at least one [1..*] entry (CONF:1198-9183)"
* entry contains
    pregnancyStatus 1..* and
    pregnancyIntention 0..*
* entry[pregnancyStatus] 
  * ^comment = "MAY contain one or more [0..*] entry (CONF:1098-14695) such that it"
  * observation 1..1
  * observation only PregnancyStatusObservation
* entry[pregnancyIntention] 
  * ^comment = "MAY contain zero or more [0..*] entry (CONF:1098-14695) such that it"
  * observation 1..1
  * observation only PregnancyIntentionInNextYear