Profile: SurgicalDrainsSection
Parent: $Section
Id: SurgicalDrainsSection
Title: "Surgical Drains Section"
Description: "The Surgical Drains Section may be used to record drains placed during the surgical procedure. Optionally, surgical drain placement may be represented with a text element in the Procedure Description Section."
* obeys 81-8056
* insert OldSection(#11537-8, Surgical Drains, 2.16.840.1.113883.10.20.7.13)


Invariant: 81-8056
Description: "If the Surgical Drains section is present, there SHALL be a statement providing details of the drains placed or SHALL explicitly state there were no drains placed (CONF:81-8056)."
Severity: #warning