Profile: ChiefComplaintandReasonforVisitSection
Parent: $Section
Id: ChiefComplaintandReasonforVisitSection
Title: "Chief Complaint and Reason for Visit Section"
Description: "This section records the patient's chief complaint (the patient's own description) and/or the reason for the patient's visit (the provider's description of the reason for visit). Local policy determines whether the information is divided into two sections or recorded in one section serving both purposes."
* insert OldSection(#46239-0, Chief Complaint and Reason for Visit, 2.16.840.1.113883.10.20.22.2.13)
* obeys no-cc-rfv

Invariant: no-cc-rfv
Description: "When using this section, the Chief Complaint Section and the Reason for Visit Section SHALL NOT be used."
Severity: #error
Expression: "%resource.component.structuredBody.component.where(section.hasTemplateIdOf(ChiefComplaintSection) or section.hasTemplateIdOf(ReasonforVisitSection)).empty()"
