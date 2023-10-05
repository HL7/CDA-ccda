Profile: DeceasedObservation
Parent: $Observation
Id: DeceasedObservation
Title: "Deceased Observation"
Description: "This template represents the observation that a patient has died. It also represents the cause of death, indicated by an entryRelationship type of CAUS. This template allows for more specific representation of data than is available with the use of dischargeDispositionCode."

* insert LogicalModelTemplate(deceasedObservation, 2.16.840.1.113883.10.20.22.4.79, 2015-08-01)

* classCode 1..1
* classCode = #OBS (exactly)
  * ^comment = "SHALL contain exactly one [1..1] @classCode=\"OBS\" Observation (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:1198-14851)."
* moodCode 1..1
* moodCode = #EVN (exactly)
  * ^comment = "SHALL contain exactly one [1..1] @moodCode=\"EVN\" Event (CodeSystem: HL7ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:1198-14852)."
* id 1..*
  * ^comment = "SHALL contain at least one [1..*] id (CONF:1198-14873)."
* code 1..1
  * ^comment = "SHALL contain exactly one [1..1] code (CONF:1198-14853)."
  * code 1..1
  * code = #ASSERTION
    * ^comment = "This code SHALL contain exactly one [1..1] @code=\"ASSERTION\" Assertion (CONF:1198-19135)."
  * codeSystem 1..1
  * codeSystem = "2.16.840.1.113883.5.4"
    * ^comment = "This code SHALL contain exactly one [1..1] @codeSystem=\"2.16.840.1.113883.5.4\" (CodeSystem: HL7ActCode urn:oid:2.16.840.1.113883.5.4) (CONF:1198-32158)."
* statusCode 1..1
  * ^comment = "SHALL contain exactly one [1..1] statusCode (CONF:1198-14854)."
  * code 1..1
  * code = #completed (exactly)
    * ^comment = "This statusCode SHALL contain exactly one [1..1] @code=\"completed\" Completed (CodeSystem: HL7ActStatus urn:oid:2.16.840.1.113883.5.14 STATIC) (CONF:1198-19095)."
* effectiveTime 1..1
  * ^comment = "SHALL contain exactly one [1..1] effectiveTime (CONF:1198-14855)."
  * low 1..1
    * ^comment = "This effectiveTime SHALL contain exactly one [1..1] low (CONF:1198-14874)."
* value 1..1
* value only $CD
  * ^comment = "SHALL contain exactly one [1..1] value with @xsi:type=\"CD\" (CONF:1198-14857)."
  * code 1..1
    * ^comment = "This value SHALL contain exactly one [1..1] @code=\"419099009\" Dead (CodeSystem: SNOMED CT urn:oid:2.16.840.1.113883.6.96 STATIC) (CONF:1198-15142)."
* entryRelationship ^slicing.discriminator[0].type = #profile
  * ^slicing.discriminator[=].path = "observation"
  * ^slicing.rules = #open
* entryRelationship contains problemObservation 0..1
* entryRelationship[problemObservation] ^comment = "SHOULD contain zero or one [0..1] entryRelationship (CONF:1198-14868) such that it"
  * typeCode 1..1
  * typeCode = #CAUS (exactly)
    * ^comment = "SHALL contain exactly one [1..1] @typeCode=\"CAUS\" Is etiology for (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002 STATIC) (CONF:1198-14875)."
  * inversionInd 1..1
  * inversionInd = true (exactly)
    * ^comment = "SHALL contain exactly one [1..1] @inversionInd=\"true\" True (CONF:1198-32900)."
  * observation 1..1
  * observation only ProblemObservation
    * ^comment = "SHALL contain exactly one [1..1] Problem Observation (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.4.4:2015-08-01) (CONF:1198-14870)."