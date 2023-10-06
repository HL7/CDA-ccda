Profile: ProvenanceAssemblerParticipation
Parent: $Participant1
Id: ProvenanceAssemblerParticipation
Title: "Provenance - Assembler Participation"
Description: """This template represents the organization that supported generation of a CDA document. The Assembler Organization may be different than the Author Organization, and may be different from the Organization that developed the software used to generate the document. 

This Participation is only for use in the CDA Header because it applies to the entire content in the document.

This template is consistent with the prior Assembler Document Participant  (2.16.840.1.113883.3.5019.1.1) in the 2016 HL7 Data Provenance guide, however, makes no claim about representing the software organization. All constraints for conformance are defined in this template.

Note: The CDA Participant does not support a software device or the organization that created the software. The Assembler role can only be expressed at the level of organization. This is a known issue with the current CDA R2 model.
Note: The Provenance template title includes a version 2 to support moving from the 'Basic Provenance' guide to the this Companion Guide, so the templateId has not changed."""
* ^meta.versionId = "4"
* ^meta.lastUpdated = "2023-07-11T23:42:05.979Z"

* insert LogicalModelTemplate(provenance-assembler, 2.16.840.1.113883.10.20.22.5.7, 2020-05-19)

* ^status = #draft
* typeCode 1..1
* typeCode = #DEV (exactly)
  * ^comment = "SHALL contain exactly one [1..1] @typeCode=\"DEV\" Device (CONF:4537-55)."
* functionCode 1..1
  * ^comment = "SHALL contain exactly one [1..1] functionCode (CONF:4537-38)."
  * code 1..1
  * code = #assembler
    * ^comment = "This functionCode SHALL contain exactly one [1..1] @code=\"assembler\" Assembler (CONF:4537-32972)."
  * codeSystem 1..1
    * ^comment = "This functionCode SHALL contain exactly one [1..1] @codeSystem (CodeSystem: ProvenanceParticipantType urn:oid:2.16.840.1.113883.4.642.4.1131) (CONF:4537-41)."
* time 1..1
  * ^comment = "SHALL contain exactly one [1..1] time (CONF:4537-42)."
* associatedEntity 1..1
  * ^short = "The template does not require any elements from the associatedEntity since the information is recorded in the scopingOrganization."
  * ^comment = "SHALL contain exactly one [1..1] associatedEntity (CONF:4537-39)."
  * classCode 1..1
  * classCode = #OWN (exactly)
    * ^comment = "This associatedEntity SHALL contain exactly one [1..1] @classCode=\"OWN\" Owned Entity (CONF:4537-32973)."
  * scopingOrganization 1..1
    * ^comment = "This associatedEntity SHALL contain exactly one [1..1] scopingOrganization (CONF:4537-43)."
    * id 1..*
      * ^comment = "This scopingOrganization SHALL contain at least one [1..*] id (CONF:4537-50)."
    * name 1..*
      * ^comment = "This scopingOrganization SHALL contain at least one [1..*] name (CONF:4537-51)."
    * telecom 0..*
      * ^comment = "This scopingOrganization SHOULD contain zero or more [0..*] telecom (CONF:4537-52)."
    * addr 0..*
    * addr only USRealmAddressADUSFIELDED
      * ^comment = "This scopingOrganization SHOULD contain zero or more [0..*] US Realm Address (AD.US.FIELDED) (identifier: urn:oid:2.16.840.1.113883.10.20.22.5.2) (CONF:4537-47)."