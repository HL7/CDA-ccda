Profile: RelatedPersonRelationshipAndNameParticipant
Parent: $Participant1
Id: RelatedPersonRelationshipAndNameParticipant
Title: "Related Person Relationship and Name Participant"
Description: "This template represents a generic participant person that has a relationship to the patient. (e.g., parent, next-of-kin, neighbor). The related person's name is required and it is recommended that the person's contact information is present. The more specific CDA participant of Guardian (recordTarget/patientRole/patient/guardian) can be used to represent a legally responsible guardian of the patient within the header. This template may be used to represent a person with any relationship to the patient within the header, or at the entry level when pertinent to a particular clinical statement."
* ^meta.versionId = "4"
* ^meta.lastUpdated = "2023-07-11T23:42:06.321Z"

* insert LogicalModelTemplate(related-person, 2.16.840.1.113883.10.20.22.5.8, 2023-05-01)

* ^status = #draft
* typeCode 1..1
* typeCode = #IND (exactly)
  * ^comment = "SHALL contain exactly one [1..1] @typeCode=\"IND\" Indirect (CodeSystem: HL7ParticipationType urn:oid:2.16.840.1.113883.5.90) (CONF:4537-32982)."
* associatedEntity 1..1
  * ^comment = "SHALL contain exactly one [1..1] associatedEntity (CONF:4537-32978)."
  * classCode 1..1
  * classCode = #PRS (exactly)
    * ^comment = "This associatedEntity SHALL contain exactly one [1..1] code, which SHALL be selected from ValueSet Personal And Legal Relationship Role Type  2.16.840.1.113883.11.20.12.1 DYNAMIC (CONF:4537-32985)."
  * code 1..1
  * code from $2.16.840.1.113883.11.20.12.1 (required)
    * ^short = "This associatedEntity/code represents the person's relationship to the patient."
    * ^comment = "This associatedEntity SHALL contain exactly one [1..1] code, which SHALL be selected from ValueSet Personal And Legal Relationship Role Type urn:oid:2.16.840.1.113883.11.20.12.1 DYNAMIC (CONF:4537-32985)."
  * addr 0..*
  * addr only USRealmAddressADUSFIELDED
    * ^comment = "This associatedEntity SHOULD contain zero or more [0..*] US Realm Address (AD.US.FIELDED) (identifier: urn:oid:2.16.840.1.113883.10.20.22.5.2) (CONF:4537-32979)."
  * obeys should-telecom
  * telecom 0..*
    * ^comment = "This associatedEntity SHOULD contain zero or more [0..*] telecom (CONF:4537-32986)." // auto-should
  * associatedPerson 1..1
    * ^short = "The associatedPerson represents the name and contact information of the related person"
    * ^comment = "This associatedEntity SHALL contain exactly one [1..1] associatedPerson (CONF:4537-32980)."
    * name 1..*
    * name only USRealmPersonNamePNUSFIELDED
      * ^comment = "This associatedPerson SHALL contain at least one [1..*] US Realm Person Name (PN.US.FIELDED) (identifier: urn:oid:2.16.840.1.113883.10.20.22.5.1.1) (CONF:4537-32987)."