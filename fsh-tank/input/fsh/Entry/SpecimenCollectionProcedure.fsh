Profile: SpecimenCollectionProcedure
Parent: $Procedure
Id: SpecimenCollectionProcedure
Title: "Specimen Collection Procedure"
Description: """This template represents clinical information about the specimen including when it was collected, the type and source of specimen, as well as related observations regarding the specimen."""

* insert LogicalModelTemplate(specimen-collection-proc, 2.16.840.1.113883.10.20.22.4.415, 2018-09-01)
* insert NarrativeLink

* classCode 1..1
* classCode = #PROC (exactly)
* moodCode 1..1
* moodCode = #EVN (exactly)
* code 1..1
  * insert CodedSnomed(17636008, [[Specimen collection (procedure)]])
* obeys should-effectiveTime
* effectiveTime 0..1
  * ^short = "SHOULD have effectiveTime"
* insert ShouldElement(targetSiteCode)
* targetSiteCode from $2.16.840.1.113883.3.88.12.3221.8.9 (required)
  * insert USCDI([[Specimen Source Site]])
* specimen 1..1
  * specimenRole 1..1
    * id 1..1
      * ^short = "This id is used to match the specimen listed in the containing Results Organizer."
* entryRelationship ^slicing.discriminator[0].type = #profile
  * ^slicing.discriminator[=].path = "observation"
  * ^slicing.rules = #open
* entryRelationship contains condition 0..*
* entryRelationship[condition] ^comment = "SHOULD contain at least one [0..*] entryRelationship such that it"
  * typeCode 1..1
  * typeCode = #COMP (exactly)
    * ^comment = "SHALL contain exactly one [1..1] @typeCode=\"COMP\" Component (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002 STATIC)."
  * observation 0..1
  * observation only SpecimenConditionObservation
    * ^comment = "SHOULD contain exactly one [0..1] Specimen Condition Observation (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.4.421:2018-09-01)."
    * insert USCDI([[Specimen Condition Acceptability]])
