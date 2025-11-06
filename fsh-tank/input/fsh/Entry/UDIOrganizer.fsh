Profile: UDIOrganizer
Parent: $Organizer
Id: UDIOrganizer
Title: "UDI Organizer"
Description: """This template is nested in an entryRelationship/Procedure Activity Procedure to record all the UDI-related templates to exchange the parsed UDI data elements and associated data.
The Device Identifier template SHALL be included.  The Lot or Batch Number, Serial Number, Manufacturing Date, Expiration Date, and Distinct Identification Code templates SHOULD be included if present in the UDI.  The Implantable Device Status template MAY be included if the device is implantable and the information is available.  The other listed templates MAY be included if available."""
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
* component contains deviceObs 1..1 and otherObs 0..*
* component[deviceObs] ^short = "component"
  * observation 1..1
  * observation only DeviceIdentifierObservation
* component[otherObs]
  * observation 1..1
  * observation only LotOrBatchNumberObservation or SerialNumberObservation or ManufacturingDateObservation or ExpirationDateObservation or DistinctIdentificationCodeObservation or BrandNameObservation or ModelNumberObservation or CompanyNameObservation or CatalogNumberObservation or LatexSafetyObservation or MRISafetyObservation or ImplantableDeviceStatusObservation
