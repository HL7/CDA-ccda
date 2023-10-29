Profile: CoverageActivity
Parent: $Act
Id: CoverageActivity
Title: "Coverage Activity"
Description: """A Coverage Activity groups the policy and authorization acts within a Payers Section to order the payment sources. A Coverage Activity contains one or more Policy Activities, each of which contains zero or more Authorization Activities. 
The sequenceNumber/@value shows the policy order of preference. 
The Member Identifier is described in the contained Policy Activity Template 2.16.840.1.113883.10.20.22.4.61."""

* insert LogicalModelTemplate(coverage-activity, 2.16.840.1.113883.10.20.22.4.60, 2023-05-01)
* insert NarrativeLink

* ^status = #draft
* classCode 1..1
* classCode = #ACT (exactly)
  * ^comment = "SHALL contain exactly one [1..1] @classCode=\"ACT\" Act (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:4537-8872)."
* moodCode 1..1
* moodCode = #EVN (exactly)
  * ^comment = "SHALL contain exactly one [1..1] @moodCode=\"EVN\" Event (CodeSystem: HL7ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:4537-8873)."
* id 1..*
  * ^comment = "SHALL contain at least one [1..*] id (CONF:4537-8874)."
* code 1..1
  * ^comment = "SHALL contain exactly one [1..1] code (CONF:4537-8876)."
  * code 1..1
  * code = #48768-6
    * ^comment = "This code SHALL contain exactly one [1..1] @code=\"48768-6\" Payment sources (CONF:4537-19160)."
  * codeSystem 1..1
  * codeSystem = "2.16.840.1.113883.6.1"
    * ^comment = "This code SHALL contain exactly one [1..1] @codeSystem=\"2.16.840.1.113883.6.1\" (CodeSystem: LOINC urn:oid:2.16.840.1.113883.6.1) (CONF:4537-32156)."
* statusCode 1..1
  * ^comment = "SHALL contain exactly one [1..1] statusCode (CONF:4537-8875)."
  * code 1..1
  * code from $2.16.840.1.113762.1.4.1240.6 (required)
  * ^comment = "This statusCode SHALL contain exactly one [1..1] @code, which SHALL be selected from ValueSet Completed or Nullified Act Status urn:oid:2.16.840.1.113762.1.4.1240.6."
* obeys should-effectiveTime
* effectiveTime 0..1
  * ^comment = "SHOULD contain zero or one [0..1] effectiveTime (CONF:4537-33064)." // auto-should
  * ^short = "Records the date and time when you checked and possibly updated the coverage for a patient, and applies for all policies within the coverage activity. Multiple Coverage Activity Acts would be needed to convey different times when coverage was checked and possibly updated. Details on a specific Policy coverage period, or self-pay period, systems can record an additional effectiveTime inside the Policy Activity. Systems may prioritize Coverages using the sequenceNumber."
  * value 1..1
    * ^comment = "The effectiveTime, if present, SHALL contain exactly one [1..1] @value (CONF:4537-33065)."
* entryRelationship ^slicing.discriminator[0].type = #profile
  * ^slicing.discriminator[=].path = "act"
  * ^slicing.discriminator[+].type = #value
  * ^slicing.discriminator[=].path = "typeCode"
  * ^slicing.rules = #open
* entryRelationship contains entryRelationship1 1..*
* entryRelationship[entryRelationship1] ^short = "entryRelationship"
  * ^comment = "SHALL contain at least one [1..*] entryRelationship (CONF:4537-8878) such that it"
  * typeCode 1..1
  * typeCode = #COMP (exactly)
    * ^comment = "SHALL contain exactly one [1..1] @typeCode=\"COMP\" has component (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002 STATIC) (CONF:4537-8879)."
  * sequenceNumber 0..1
    * ^comment = "MAY contain zero or one [0..1] sequenceNumber (CONF:4537-17174)."
    * value 1..1
      * ^comment = "The sequenceNumber, if present, SHALL contain exactly one [1..1] @value (CONF:4537-17175)."
  * act 1..1
  * act only PolicyActivity
    * ^comment = "SHALL contain exactly one [1..1] Policy Activity (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.4.61:2015-08-01) (CONF:4537-15528)."