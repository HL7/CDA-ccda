Profile: SpecimenCollectionProcedure
Parent: $Procedure
Id: SpecimenCollectionProcedure
Title: "Specimen Collection Procedure"
Description: """This template represents clinical information about the specimen including when it was collected, the type and source of specimen, as well as related observations regarding the specimen."""

* insert LogicalModelTemplate(specimen-collection-proc, 2.16.840.1.113883.10.20.22.4.415, 2018-09-01)

* classCode 1..1
* classCode = #PROC (exactly)
* moodCode 1..1
* moodCode = #EVN (exactly)
* code 1..1
  * insert CodedSnomed(17636008, [[Specimen collection (procedure)]])
* obeys should-effectiveTime
* effectiveTime 0..1
* obeys should-targetSiteCode
* targetSiteCode from $2.16.840.1.113883.3.88.12.3221.8.9 (required)
  * insert USCDI([[Specimen Source Site]])
* entryRelationship ^slicing.discriminator[0].type = #profile
  * ^slicing.discriminator[=].path = "act"
  * ^slicing.discriminator[+].type = #profile
  * ^slicing.discriminator[=].path = "observation"
  * ^slicing.rules = #open
* entryRelationship contains specimenRef 1..1 and rejectReason 0..*
* entryRelationship[specimenRef] ^comment = "SHALL contain exactly one [1..1] entryRelationship such that it"
  * typeCode 1..1
  * typeCode = #SUBJ (exactly)
    * ^comment = "SHALL contain exactly one [1..1] @typeCode=\"SUBJ\" Has Subject (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002 STATIC)."
  * act 1..1
  * act only EntryReference
    * ^comment = "SHALL contain exactly one [1..1] Entry Reference (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.4.122)."
  * ^short = "References the specimen that is the subject of this procedure"
* entryRelationship[rejectReason] ^comment = "SHOULD contain at least one [0..*] entryRelationship such that it"
  * typeCode 1..1
  * typeCode = #COMP (exactly)
    * ^comment = "SHALL contain exactly one [1..1] @typeCode=\"COMP\" Component (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002 STATIC)."
  * observation 1..1
  * observation only SpecimenRejectReasonObservation
    * ^comment = "SHALL contain exactly one [1..1] Specimen Reject Reason Observation (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.4.420:2018-09-01)."
    * insert USCDI([[Specimen Condition Acceptability]])
