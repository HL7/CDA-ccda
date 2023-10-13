Profile: PlannedCoverage
Parent: $Act
Id: PlannedCoverage
Title: "Planned Coverage"
Description: "This template represents the insurance coverage intended to cover an act or procedure."

* insert LogicalModelTemplateRootOnly(planned-coverage, 2.16.840.1.113883.10.20.22.4.129)

* classCode 1..1
* classCode = #ACT (exactly)
  * ^comment = "SHALL contain exactly one [1..1] @classCode=\"ACT\" act (CodeSystem: HL7ActCode urn:oid:2.16.840.1.113883.5.4) (CONF:1098-31945)."
* moodCode 1..1
* moodCode = #INT (exactly)
  * ^comment = "SHALL contain exactly one [1..1] @moodCode=\"INT\" Intent (CodeSystem: HL7ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:1098-31946)."
* id 1..*
  * ^comment = "SHALL contain at least one [1..*] id (CONF:1098-31950)."
* code 1..1
  * ^comment = "SHALL contain exactly one [1..1] code (CONF:1098-31951)."
  * code 1..1
  * code = #48768-6
    * ^comment = "This code SHALL contain exactly one [1..1] @code=\"48768-6\" Payment Sources (CONF:1098-31952)."
  * codeSystem 1..1
  * codeSystem = "2.16.840.1.113883.6.1"
    * ^comment = "This code SHALL contain exactly one [1..1] @codeSystem=\"2.16.840.1.113883.6.1\" (CodeSystem: LOINC urn:oid:2.16.840.1.113883.6.1) (CONF:1098-31953)."
* statusCode 1..1
  * ^comment = "SHALL contain exactly one [1..1] statusCode (CONF:1098-31954)."
  * code 1..1
  * code = #active (exactly)
    * ^comment = "This statusCode SHALL contain exactly one [1..1] @code=\"active\" Active (CodeSystem: HL7ActCode urn:oid:2.16.840.1.113883.5.4) (CONF:1098-31955)."
* author 0..*
* author only AuthorParticipation
  * ^comment = "MAY contain zero or more [0..*] Author Participation (identifier: urn:oid:2.16.840.1.113883.10.20.22.4.119) (CONF:1098-32178)."
* entryRelationship ^slicing.discriminator.type = #profile
  * ^slicing.discriminator.path = "act"
  * ^slicing.rules = #open
* entryRelationship contains entryRelationship1 1..1
* entryRelationship[entryRelationship1] ^comment = "SHALL contain exactly one [1..1] entryRelationship (CONF:1098-31967) such that it"
  * typeCode 1..1
  * typeCode = #COMP (exactly)
    * ^comment = "SHALL contain exactly one [1..1] @typeCode=\"COMP\" has component (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:1098-31968)."
  * act 1..1
    * ^comment = "SHALL contain exactly one [1..1] act (CONF:1098-31969)."
    * classCode 1..1
    * classCode = #ACT (exactly)
      * ^comment = "This act SHALL contain exactly one [1..1] @classCode=\"ACT\" ACT (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:1098-31970)."
    * moodCode 1..1
    * moodCode = #INT (exactly)
      * ^comment = "This act SHALL contain exactly one [1..1] @moodCode=\"INT\" intent (CodeSystem: HL7ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:1098-31971)."
    * id 1..*
      * ^short = "These act/identifiers are unique identifiers for the policy or program providing the coverage."
      * ^comment = "This act SHALL contain at least one [1..*] id (CONF:1098-31972)."
    * code 1..1
    * code from $Payer (required)
      * ^comment = "This act SHALL contain exactly one [1..1] code, which SHALL be selected from ValueSet Payer urn:oid:2.16.840.1.114222.4.11.3591 DYNAMIC (CONF:1098-31973)."
    * statusCode 1..1
      * ^comment = "This act SHALL contain exactly one [1..1] statusCode (CONF:1098-31974)."
      * code 1..1
      * code = #active (exactly)
        * ^comment = "This statusCode SHALL contain exactly one [1..1] @code=\"active\" Active (CodeSystem: HL7ActStatus urn:oid:2.16.840.1.113883.5.14) (CONF:1098-31975)."