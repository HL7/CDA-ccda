Profile: EncounterDiagnosis
Parent: $Act
Id: EncounterDiagnosis
Title: "Encounter Diagnosis"
Description: "This template wraps relevant problems or diagnoses at the close of a visit or that need to be followed after the visit. If the encounter is associated with a Hospital Discharge, the Hospital Discharge Diagnosis must be used. This entry requires at least one Problem Observation entry.  The Problem Status template in the Problem Observation entry indicates the status of the diagnosis."

* insert LogicalModelTemplate(encounter-dx, 2.16.840.1.113883.10.20.22.4.80, 2015-08-01)

* classCode 1..1
* classCode = #ACT (exactly)
  * ^comment = "SHALL contain exactly one [1..1] @classCode=\"ACT\" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:1198-14889)."
* moodCode 1..1
* moodCode = #EVN (exactly)
  * ^comment = "SHALL contain exactly one [1..1] @moodCode=\"EVN\" (CodeSystem: HL7ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:1198-14890)."
* code 1..1
  * ^comment = "SHALL contain exactly one [1..1] code (CONF:1198-19182)."
  * code 1..1
  * code = #29308-4
    * ^comment = "This code SHALL contain exactly one [1..1] @code=\"29308-4\" Diagnosis (CONF:1198-19183)."
  * codeSystem 1..1
  * codeSystem = "2.16.840.1.113883.6.1"
    * ^comment = "This code SHALL contain exactly one [1..1] @codeSystem=\"2.16.840.1.113883.6.1\" (CodeSystem: LOINC urn:oid:2.16.840.1.113883.6.1) (CONF:1198-32160)."
* entryRelationship ^slicing.discriminator[0].type = #profile
  * ^slicing.discriminator[=].path = "observation"
  * ^slicing.rules = #open
* statusCode 1..1
  * code 1..1
  * code = #completed (exactly)
    * ^comment = "This statusCode SHALL contain exactly one [1..1] @code=\"completed\" Completed (CodeSystem: HL7ActStatus urn:oid:2.16.840.1.113883.5.14 STATIC)."
* entryRelationship contains problemObservation 1..*
* entryRelationship[problemObservation] ^comment = "SHALL contain at least one [1..*] entryRelationship (CONF:1198-14892) such that it"
  * typeCode 1..1
  * typeCode = #SUBJ (exactly)
    * ^comment = "SHALL contain exactly one [1..1] @typeCode=\"SUBJ\" (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002 STATIC) (CONF:1198-14893)."
  * observation 1..1
  * observation only ProblemObservation
    * ^comment = "SHALL contain exactly one [1..1] Problem Observation (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.4.4:2015-08-01) (CONF:1198-14898)."