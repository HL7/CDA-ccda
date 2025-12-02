Profile: UDIOrganizer
Parent: $Organizer
Id: UDIOrganizer
Title: "UDI Organizer"
Description: """This template is nested within an entryRelationship of either a [Procedure Activity Procedure](StructureDefinition-ProcedureActivityProcedure.html) or a [Non-Medicinal Supply Activity](StructureDefinition-NonMedicinalSupplyActivity.html).
It is used to record all UDI-related templates needed to exchange parsed UDI data elements and their associated information.
The Device Identifier template **SHALL** be included.  The Lot or Batch Number, Serial Number, Manufacturing Date, Expiration Date, and Distinct Identification Code templates **SHOULD** be included if present in the UDI.  Implantable Device Status (urn:hl7ii:2.16.840.1.113883.10.20.22.4.305, 2019-06-21, NCIt: C160939) **MAY** be included in the UDI Organizer if the device is implantable and the information is available. The other listed templates **MAY** be included if available."""
* ^meta.versionId = "5"
* ^meta.lastUpdated = "2023-07-11T23:41:40.695Z"

* insert LogicalModelTemplate(UDI-org, 2.16.840.1.113883.10.20.22.4.311, 2019-06-21)
* insert NarrativeLinkOrganizer

* classCode 1..1
* classCode = #CLUSTER (exactly)
  * ^comment = "SHALL contain exactly one [1..1] @classCode=\"CLUSTER\" (CONF:4437-3482)."
* moodCode 1..1
* moodCode = #EVN (exactly)
  * ^comment = "SHALL contain exactly one [1..1] @moodCode=\"EVN\" (CONF:4437-3483)."
* id 1..1
  * ^comment = "SHALL contain exactly one [1..1] id (CONF:4437-3541)."
  * root 1..1
    * ^comment = "This id SHALL contain exactly one [1..1] @root (CONF:4437-3542)."
* code 0..1
  * ^comment = "MAY contain zero or one [0..1] code (CONF:4437-3481)."
  * code 0..1
  * code = #74711-3
    * ^comment = "The code, if present, MAY contain zero or one [0..1] @code=\"74711-3\" Unique Device Identifier (CodeSystem: LOINC urn:oid:2.16.840.1.113883.6.1) (CONF:4437-3486)."
  * codeSystem 1..1
  * codeSystem = "2.16.840.1.113883.6.1"
    * ^comment = "The code, if present, SHALL contain exactly one [1..1] @codeSystem=\"2.16.840.1.113883.6.1\" (CONF:4437-3487)."
* statusCode 1..1
  * ^comment = "SHALL contain exactly one [1..1] statusCode (CONF:4437-3490)."
  * code 1..1
  * code = #completed (exactly)
    * ^comment = "This statusCode SHALL contain exactly one [1..1] @code=\"completed\" Completed (CodeSystem: HL7ActStatus urn:oid:2.16.840.1.113883.5.14) (CONF:4437-3543)."

* component ^slicing.discriminator[0].type = #profile
  * ^slicing.discriminator[=].path = "observation"
  * ^slicing.rules = #open
* component contains deviceIdentifierObservation 1..1 and
    lotOrBatchNumberObservation 0..1 and 
    serialNumberObservation 0..1 and 
    manufacturingDateObservation 0..1 and 
    expirationDateObservation 0..1 and 
    distinctIdentificationCodeObservation 0..1 and 
    brandNameObservation 0..1 and 
    modelNumberObservation 0..1 and 
    companyNameObservation 0..1 and 
    catalogNumberObservation 0..1 and 
    latexSafetyObservation 0..1 and 
    mRISafetyObservation 0..1 and 
    implantableDeviceStatusObservation 0..1
* component[deviceIdentifierObservation] ^short = "Device Identifier observation component"
  * observation 1..1
  * observation only DeviceIdentifierObservation
* component[lotOrBatchNumberObservation] ^short = "Lot Or Batch Number observation component"
  * ^condition = "should-lot-or-batch-number-observation"
  * observation 1..1
  * observation only LotOrBatchNumberObservation
* obeys should-lot-or-batch-number-observation
* component[serialNumberObservation] ^short = "Serial Number observation component"
  * ^condition = "should-serial-number-observation"
  * observation 1..1
  * observation only SerialNumberObservation
* obeys should-serial-number-observation
* component[manufacturingDateObservation] ^short = "Manufacturing Date observation component"
  * ^condition = "should-manufacturing-date-observation"
  * observation 1..1
  * observation only ManufacturingDateObservation
* obeys should-manufacturing-date-observation
* component[expirationDateObservation] ^short = "Expiration Date observation component"
  * ^condition = "should-expiration-date-observation"
  * observation 1..1
  * observation only ExpirationDateObservation
* obeys should-expiration-date-observation
* component[distinctIdentificationCodeObservation] ^short = "Distinct Identification Code observation component"
  * ^condition = "should-distinct-identification-code-observation"
  * observation 1..1
  * observation only DistinctIdentificationCodeObservation
* obeys should-distinct-identification-code-observation
* component[brandNameObservation] ^short = "Brand Name observation component"
  * observation 1..1
  * observation only BrandNameObservation
* component[modelNumberObservation] ^short = "Model Number observation component"
  * observation 1..1
  * observation only ModelNumberObservation
* component[companyNameObservation] ^short = "Company Name observation component"
  * observation 1..1
  * observation only CompanyNameObservation
* component[catalogNumberObservation] ^short = "Catalog Number observation component"
  * observation 1..1
  * observation only CatalogNumberObservation
* component[latexSafetyObservation] ^short = "Latex Safety observation component"
  * observation 1..1
  * observation only LatexSafetyObservation
* component[mRISafetyObservation] ^short = "MRI Safety observation component"
  * observation 1..1
  * observation only MRISafetyObservation
* component[implantableDeviceStatusObservation] ^short = "Implantable Device Status observation component"
  * observation 1..1
  * observation only ImplantableDeviceStatusObservation
