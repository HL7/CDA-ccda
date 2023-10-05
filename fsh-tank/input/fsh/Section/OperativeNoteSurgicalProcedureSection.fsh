Profile: OperativeNoteSurgicalProcedureSection
Parent: $Section
Id: OperativeNoteSurgicalProcedureSection
Title: "Operative Note Surgical Procedure Section"
Description: "The Operative Note Surgical Procedure Section can be used to restate the procedures performed if appropriate for an enterprise workflow. The procedure(s) performed associated with the Operative Note are formally modeled in the header using serviceEvent."
* obeys 81-8054
* insert OldSection(#10223-6, Operative Note Surgical Procedure, 2.16.840.1.113883.10.20.7.14)


Invariant: 81-8054
Description: "If the surgical procedure section is present there SHALL be text indicating the procedure performed (CONF:81-8054)."
Severity: #warning