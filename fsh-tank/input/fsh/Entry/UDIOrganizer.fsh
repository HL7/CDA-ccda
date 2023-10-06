Profile: UDIOrganizer
Parent: $Organizer
Id: UDIOrganizer
Title: "UDI Organizer"
Description: """This template is nested in an entryRelationship/Procedure Activity Procedure to record all the UDI-related templates to exchange the parsed UDI data elements and associated data.

* **Device Identifier**
      urn:hl7ii:2.16.840.1.113883.10.20.22.4.304: 2019-06-21 NCIt: C101722 SHALL be included in UDI Organizer 
* **Lot or Batch Number**
 urn:hl7ii:2.16.840.1.113883.10.20.22.4.315: 2019-06-21 NCIt:C101672 SHOULD be included in UDI Organizer if present in UDI
* **Serial Number** 
urn:hl7ii:2.16.840.1.113883.10.20.22.4.319: 2019-06-21 NCIt: C101671 SHOULD be included in UDI Organizer if present in UDI 
* **Manufacturing Date**  
urn:hl7ii:2.16.840.1.113883.10.20.22.4.316: 2019-06-21  NCIt:C101669 SHOULD be included in UDI Organizer if present in UDI  
*  **Expiration Date**
      urn:hl7ii:2.16.840.1.113883.10.20.22.4.309: 2019-06-21 NCIt: C101670 SHOULD be included in UDI Organizer if present in UDI 
* **Distinct Identification Code** 
urn:hl7ii:2.16.840.1.113883.10.20.22.4.308: 2019-06-21 NCIt: C113843 SHOULD be included in UDI Organizer if present in UDI
* **Brand Name**
      urn:hl7ii:2.16.840.1.113883.10.20.22.4.301: 2019-06-21 NCIt: C71898 MAY be included in the UDI Organizer if available
* **Model Number** 
urn:hl7ii:2.16.840.1.113883.10.20.22.4.317: 2019-06-21 NCIt: C99285 MAY be included in the UDI Organizer if available
* **Catalog Number**
      urn:hl7ii:2.16.840.1.113883.10.20.22.4.302: 2019-06-21 NCIt: C99286 MAY be included in the UDI Organizer if available
* **Company Name** 
urn:hl7ii:2.16.840.1.113883.10.20.22.4.303: 2019-06-21   NCIt: C54131 MAY be included in the UDI Organizer if available
* **MRI Safety**
urn:hl7ii:2.16.840.1.113883.10.20.22.4.318: 2019-06-21 NCIt: C106044 MAY be included in the UDI Organizer if available
* **Latex Safety**
urn:hl7ii:2.16.840.1.113883.10.20.22.4.314: 2019-06-21 NCIt: C160938 MAY be included in the UDI Organizer if available
* **Implantable Device Status**
urn:hl7ii:2.16.840.1.113883.10.20.22.4.305 2019-06-21 NCIt: C160939 MAY be included in the UDI Organizer if available"""
* ^meta.versionId = "5"
* ^meta.lastUpdated = "2023-07-11T23:41:40.695Z"

* insert LogicalModelTemplate(UDI-org, 2.16.840.1.113883.10.20.22.4.311, 2019-06-21)

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
* component 1..1
  * ^comment = "SHALL contain exactly one [1..1] component (CONF:4437-3488)."
  * observation 1..1
  * observation only DeviceIdentifierObservation
    * ^comment = "This component SHALL contain exactly one [1..1] Device Identifier Observation (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.4.304:2019-06-21) (CONF:4437-3489)."