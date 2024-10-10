Profile: ImmunizationMedicationInformation
Parent: $ManufacturedProduct
Id: ImmunizationMedicationInformation
Title: "Immunization Medication Information"
Description: "The Immunization Medication Information represents product information about the immunization substance. The vaccine manufacturer and vaccine lot number are typically recorded in the medical record and should be included if known."

* insert LogicalModelTemplate(immunization-med-info, 2.16.840.1.113883.10.20.22.4.54, 2014-06-09)

* classCode 1..1
  * ^comment = "SHALL contain exactly one [1..1] @classCode=\"MANU\" (CodeSystem: HL7RoleClass urn:oid:2.16.840.1.113883.5.110 STATIC) (CONF:1098-9002)."
* id 0..*
  * ^comment = "MAY contain zero or more [0..*] id (CONF:1098-9005)."
* manufacturedMaterial 1..1
  * ^comment = "SHALL contain exactly one [1..1] manufacturedMaterial (CONF:1098-9006)."
  * code 1..1
  * code from $2.16.840.1.113762.1.4.1010.6 (required)
    * ^comment = "This manufacturedMaterial SHALL contain exactly one [1..1] code, which SHALL be selected from ValueSet CVX Vaccines Administered Vaccine Set urn:oid:2.16.840.1.113762.1.4.1010.6 DYNAMIC (CONF:1098-9007)."
  * obeys should-lotNumberText
  * lotNumberText 0..1
    * insert USCDI([[Lot Number Text - lotNumberText should be included if known. It may not be known for historical immunizations, planned immunizations, or refused/deferred immunizations.]])
    * ^comment = "This manufacturedMaterial SHOULD contain zero or one [0..1] lotNumberText (CONF:1098-9014)." // auto-should
* obeys should-manufacturerOrganization
* manufacturerOrganization 0..1
  * ^comment = "SHOULD contain zero or one [0..1] manufacturerOrganization (CONF:1098-9012)." // auto-should