Profile: MedicationInformation
Parent: $ManufacturedProduct
Id: MedicationInformation
Title: "Medication Information"
Description: """A medication should be recorded as a pre-coordinated ingredient + strength + dose form (e.g., "metoprolol 25mg tablet", "amoxicillin 400mg/5mL suspension") where possible. This includes RxNorm codes whose Term Type is SCD (semantic clinical drug), SBD (semantic brand drug), GPCK (generic pack), BPCK (brand pack).

The dose (doseQuantity) represents how many of the consumables are to be administered at each administration event. As a result, the dose is always relative to the consumable and the interval of administration. Thus, a patient consuming a single "metoprolol 25mg tablet" per administration will have a doseQuantity of "1", whereas a patient consuming "metoprolol Oral Product" (RxCUI 1163523) will have a dose of "25 mg"."""

* insert LogicalModelTemplate(med-information, 2.16.840.1.113883.10.20.22.4.23, 2014-06-09)

* classCode 1..1
  * ^comment = "SHALL contain exactly one [1..1] @classCode=\"MANU\" (CodeSystem: HL7RoleClass urn:oid:2.16.840.1.113883.5.110 STATIC) (CONF:1098-7408)."
* id 0..*
  * ^comment = "MAY contain zero or more [0..*] id (CONF:1098-7410)."
* manufacturedMaterial 1..1
  * ^short = "A medication should be recorded as a pre-coordinated ingredient + strength + dose form (e.g., “metoprolol 25mg tablet”, “amoxicillin 400mg/5mL suspension”) where possible. This includes RxNorm codes whose Term Type is SCD (semantic clinical drug), SBD (semantic brand drug), GPCK (generic pack), BPCK (brand pack)."
  * ^comment = "SHALL contain exactly one [1..1] manufacturedMaterial (CONF:1098-7411)."
  * code 1..1
  * code from $2.16.840.1.113762.1.4.1010.4 (required)
    * ^comment = "This manufacturedMaterial SHALL contain exactly one [1..1] code, which SHALL be selected from ValueSet Medication Clinical Drug urn:oid:2.16.840.1.113762.1.4.1010.4 DYNAMIC (CONF:1098-7412)."
    * translation from $2.16.840.1.113762.1.4.1010.2 (preferred)
      * ^short = "Translations may also be sent with NDC codes (Codesystem urn:oid:2.16.840.1.113883.6.69)."
      * ^comment = "This code MAY contain zero or more [0..*] translation, which SHALL be selected from ValueSet Clinical Substance urn:oid:2.16.840.1.113762.1.4.1010.2 DYNAMIC (CONF:1098-31884).  This code MAY contain zero or more [0..*] translation, which SHALL be selected from CodeSystem NDC urn:oid:2.16.840.1.113883.6.69."
* manufacturerOrganization 0..1
  * ^comment = "MAY contain zero or one [0..1] manufacturerOrganization (CONF:1098-7416)."