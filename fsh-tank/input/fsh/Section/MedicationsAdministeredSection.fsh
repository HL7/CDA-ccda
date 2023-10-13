Profile: MedicationsAdministeredSection
Parent: $Section
Id: MedicationsAdministeredSection
Title: "Medications Administered Section"
Description: """The Medications Administered Section usually resides inside a Procedure Note describing a procedure. This section defines medications and fluids administered during the procedure, its related encounter, or other procedure related activity excluding anesthetic medications. Anesthesia medications should be documented as described in the Anesthesia Section
templateId 2.16.840.1.113883.10.20.22.2.25."""

* insert Section(#29549-3, Medications Administered, 2.16.840.1.113883.10.20.22.2.38, 2014-06-09)
* entry 0..*
  * ^comment = "MAY contain zero or more [0..*] entry (CONF:1098-8156)."
  * substanceAdministration 1..1
  * substanceAdministration only MedicationActivity
    * ^comment = "The entry, if present, SHALL contain exactly one [1..1] Medication Activity (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.4.16:2014-06-09) (CONF:1098-15499)."