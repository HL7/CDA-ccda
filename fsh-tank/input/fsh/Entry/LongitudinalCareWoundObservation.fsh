Profile: LongitudinalCareWoundObservation
Parent: ProblemObservation
Id: LongitudinalCareWoundObservation
Title: "Longitudinal Care Wound Observation"
Description: "This template represents acquired or surgical wounds and is not intended to encompass all wound types. The template applies to wounds such as pressure ulcers, surgical incisions, and deep tissue injury wounds. Information in this template may include information about the wound measurements characteristics."

* insert LogicalModelTemplate(Longitudinal-care-wound-obs, 2.16.840.1.113883.10.20.22.4.114, 2015-08-01)

* classCode 1..1
* classCode = #OBS (exactly)
  * ^comment = "SHALL contain exactly one [1..1] @classCode=\"OBS\" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:1198-31012)."
* moodCode 1..1
* moodCode = #EVN (exactly)
  * ^comment = "SHALL contain exactly one [1..1] @moodCode=\"EVN\" (CodeSystem: HL7ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:1198-31013)."
* code 1..1
  * ^comment = "SHALL contain exactly one [1..1] code (CONF:1198-29476)."
  * code 1..1
  * code = #ASSERTION
    * ^comment = "This code SHALL contain exactly one [1..1] @code=\"ASSERTION\" assertion (CONF:1198-29477)."
  * codeSystem 1..1
  * codeSystem = "2.16.840.1.113883.5.4"
    * ^comment = "This code SHALL contain exactly one [1..1] @codeSystem=\"2.16.840.1.113883.5.4\" (CodeSystem: HL7ActCode urn:oid:2.16.840.1.113883.5.4) (CONF:1198-31010)."
* value 1..1
* value only $CD
* value from $2.16.840.1.113883.1.11.20.2.6 (preferred)
  * ^comment = "SHALL contain exactly one [1..1] value with @xsi:type=\"CD\", where the code SHOULD be selected from ValueSet Wound Type urn:oid:2.16.840.1.113883.1.11.20.2.6 DYNAMIC (CONF:1198-29485)."
* targetSiteCode 0..1
* targetSiteCode from $2.16.840.1.113883.3.88.12.3221.8.9 (preferred)
  * ^comment = "SHOULD contain zero or one [0..1] targetSiteCode, which SHOULD be selected from ValueSet Body Site Value Set urn:oid:2.16.840.1.113883.3.88.12.3221.8.9 DYNAMIC (CONF:1198-29488) such that it"
  //"<sliceName value=\"targetSiteCode1\"/>"
  * qualifier 0..*
    * ^short = "If targetSite/qualifierCode name/value pairs are used, care must be taken to avoid conflict with the SNOMED-CT body structure code used in observation/value.  SNOMED-CT body structure codes are often pre-coordinated with laterality."
    * ^comment = "MAY contain zero or more [0..*] qualifier (CONF:1198-29490)."
    * name 1..1
      * ^comment = "The qualifier, if present, SHALL contain exactly one [1..1] name (CONF:1198-29491)."
      * code 1..1
      * code = #272741003
        * ^comment = "This name SHALL contain exactly one [1..1] @code=\"272741003\" laterality (CONF:1198-29492)."
      * codeSystem 1..1
      * codeSystem = "2.16.840.1.113883.6.96"
        * ^comment = "This name SHALL contain exactly one [1..1] @codeSystem=\"2.16.840.1.113883.6.96\" (CodeSystem: SNOMED CT urn:oid:2.16.840.1.113883.6.96) (CONF:1198-31524)."
    * value 1..1
      * ^comment = "The qualifier, if present, SHALL contain exactly one [1..1] value (CONF:1198-29493)."
      * code 1..1
      * code from $2.16.840.1.113883.11.20.9.37 (preferred)
        * ^comment = "This value SHALL contain exactly one [1..1] @code, which SHOULD be selected from ValueSet TargetSite Qualifiers urn:oid:2.16.840.1.113883.11.20.9.37 DYNAMIC (CONF:1198-29494)."
* author 0..*
* author only AuthorParticipation
  * ^comment = "SHOULD contain zero or more [0..*] Author Participation (identifier: urn:oid:2.16.840.1.113883.10.20.22.4.119) (CONF:1198-31542)."
* entryRelationship ^slicing.discriminator[0].type = #profile
  * ^slicing.discriminator[=].path = "observation"
  * ^slicing.rules = #open
  * ^short = "When the wound observed is a type of pressure ulcer, then this template SHOULD contain an entry for the Highest Pressure Ulcer Stage."
* entryRelationship contains
    woundMeasurementObservation 0..* and
    woundCharacteristic 0..* and
    numberofPressureUlcersObservation 0..* and
    highestPressureUlcerStage 0..1
* entryRelationship[woundMeasurementObservation] ^comment = "SHOULD contain zero or more [0..*] entryRelationship (CONF:1198-29495) such that it"
  * typeCode 1..1
  * typeCode = #COMP (exactly)
    * ^comment = "SHALL contain exactly one [1..1] @typeCode=\"COMP\" (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002 STATIC) (CONF:1198-29496)."
  * observation 1..1
  * observation only WoundMeasurementObservation
    * ^comment = "SHALL contain exactly one [1..1] Wound Measurement Observation (identifier: urn:oid:2.16.840.1.113883.10.20.22.4.133) (CONF:1198-29497)."
* entryRelationship[woundCharacteristic] ^comment = "SHOULD contain zero or more [0..*] entryRelationship (CONF:1198-29503) such that it"
  * typeCode 1..1
  * typeCode = #COMP (exactly)
    * ^comment = "SHALL contain exactly one [1..1] @typeCode=\"COMP\" (CONF:1198-29504)."
  * observation 1..1
  * observation only WoundCharacteristic
    * ^comment = "SHALL contain exactly one [1..1] Wound Characteristic (identifier: urn:oid:2.16.840.1.113883.10.20.22.4.134) (CONF:1198-29505)."
* entryRelationship[numberofPressureUlcersObservation] ^short = "When the wound observed is a type of pressure ulcer, then this template SHOULD contain an entry for the Number of Pressure Ulcers."
  * ^comment = "MAY contain zero or more [0..*] entryRelationship (CONF:1198-31890) such that it"
  * typeCode 1..1
  * typeCode = #COMP (exactly)
    * ^comment = "SHALL contain exactly one [1..1] @typeCode=\"COMP\" Has component (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:1198-31891)."
  * observation 1..1
  * observation only NumberofPressureUlcersObservation
    * ^comment = "SHALL contain exactly one [1..1] Number of Pressure Ulcers Observation (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.4.76:2015-08-01) (CONF:1198-31892)."
* entryRelationship[highestPressureUlcerStage] ^comment = "MAY contain zero or one [0..1] entryRelationship (CONF:1198-31893) such that it"
  * typeCode 1..1
  * typeCode = #COMP (exactly)
    * ^comment = "SHALL contain exactly one [1..1] @typeCode=\"COMP\" Has component (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:1198-31894)."
  * observation 1..1
  * observation only HighestPressureUlcerStage
    * ^comment = "SHALL contain exactly one [1..1] Highest Pressure Ulcer Stage (identifier: urn:oid:2.16.840.1.113883.10.20.22.4.77) (CONF:1198-31919)."