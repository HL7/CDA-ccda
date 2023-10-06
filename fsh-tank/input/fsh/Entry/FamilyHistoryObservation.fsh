Profile: FamilyHistoryObservation
Parent: $Observation
Id: FamilyHistoryObservation
Title: "Family History Observation"
Description: "Family History Observations related to a particular family member are contained within a Family History Organizer. The effectiveTime in the Family History Observation is the biologically or clinically relevant time of the observation. The biologically or clinically relevant time is the time at which the observation holds (is effective) for the family member (the subject of the observation)."

* insert LogicalModelTemplate(family-history-obs, 2.16.840.1.113883.10.20.22.4.46, 2015-08-01)

* classCode 1..1
* classCode = #OBS (exactly)
  * ^comment = "SHALL contain exactly one [1..1] @classCode=\"OBS\" Observation (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:1198-8586)."
* moodCode 1..1
* moodCode = #EVN (exactly)
  * ^comment = "SHALL contain exactly one [1..1] @moodCode=\"EVN\" Event (CodeSystem: HL7ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:1198-8587)."
* id 1..*
  * ^comment = "SHALL contain at least one [1..*] id (CONF:1198-8592)."
* code 1..1
* code from $2.16.840.1.113883.3.88.12.3221.7.2 (preferred)
  * ^comment = "SHALL contain exactly one [1..1] code, which SHOULD be selected from ValueSet Problem Type (SNOMEDCT) urn:oid:2.16.840.1.113883.3.88.12.3221.7.2 DYNAMIC (CONF:1198-32427)."
  * translation 1..*
  * translation from $2.16.840.1.113762.1.4.1099.28 (preferred)
    * ^comment = "This code SHALL contain at least one [1..*] translation, which SHOULD be selected from ValueSet Problem Type (LOINC) urn:oid:2.16.840.1.113762.1.4.1099.28 DYNAMIC (CONF:1198-32847)."
* statusCode 1..1
  * ^comment = "SHALL contain exactly one [1..1] statusCode (CONF:1198-8590)."
  * code 1..1
  * code = #completed (exactly)
    * ^comment = "This statusCode SHALL contain exactly one [1..1] @code=\"completed\" Completed (CodeSystem: HL7ActStatus urn:oid:2.16.840.1.113883.5.14 STATIC) (CONF:1198-19098)."
* effectiveTime 0..1
  * ^comment = "SHOULD contain zero or one [0..1] effectiveTime (CONF:1198-8593)."
* value 1..1
* value only $CD
* value from Problem (required)
  * ^comment = "SHALL contain exactly one [1..1] value with @xsi:type=\"CD\", where the code SHALL be selected from ValueSet Problem urn:oid:2.16.840.1.113883.3.88.12.3221.7.4 DYNAMIC (CONF:1198-8591)."
* entryRelationship ^slicing.discriminator[0].type = #profile
  * ^slicing.discriminator[=].path = "observation"
  * ^slicing.rules = #open
* entryRelationship contains
    ageObservation 0..1 and
    deathObservation 0..1
* entryRelationship[ageObservation] ^comment = "MAY contain zero or one [0..1] entryRelationship (CONF:1198-8675) such that it"
  * typeCode 1..1
  * typeCode = #SUBJ (exactly)
    * ^comment = "SHALL contain exactly one [1..1] @typeCode=\"SUBJ\" Subject (CodeSystem: HL7ParticipationType urn:oid:2.16.840.1.113883.5.90 STATIC) (CONF:1198-8676)."
  * inversionInd 1..1
  * inversionInd = true (exactly)
    * ^comment = "SHALL contain exactly one [1..1] @inversionInd=\"true\" True (CONF:1198-8677)."
  * observation 1..1
  * observation only AgeObservation
    * ^comment = "SHALL contain exactly one [1..1] Age Observation (identifier: urn:oid:2.16.840.1.113883.10.20.22.4.31) (CONF:1198-15526)."
* entryRelationship[deathObservation] ^comment = "MAY contain zero or one [0..1] entryRelationship (CONF:1198-8678) such that it"
  * typeCode 1..1
  * typeCode = #CAUS (exactly)
    * ^comment = "SHALL contain exactly one [1..1] @typeCode=\"CAUS\" Causal or Contributory (CodeSystem: HL7ParticipationType urn:oid:2.16.840.1.113883.5.90 STATIC) (CONF:1198-8679)."
  * observation 1..1
  * observation only FamilyHistoryDeathObservation
    * ^comment = "SHALL contain exactly one [1..1] Family History Death Observation (identifier: urn:oid:2.16.840.1.113883.10.20.22.4.47) (CONF:1198-15527)."