Profile: FamilyHistoryDeathObservation
Parent: $Observation
Id: FamilyHistoryDeathObservation
Title: "Family History Death Observation"
Description: "This clinical statement records whether the family member is deceased."

* insert LogicalModelTemplateRootOnly(family-history-death-obs, 2.16.840.1.113883.10.20.22.4.47)

* classCode 1..1
* classCode = #OBS (exactly)
  * ^comment = "SHALL contain exactly one [1..1] @classCode=\"OBS\" Observation (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:81-8621)."
* moodCode 1..1
* moodCode = #EVN (exactly)
  * ^comment = "SHALL contain exactly one [1..1] @moodCode=\"EVN\" Event (CodeSystem: HL7ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:81-8622)."
* code 1..1
  * ^comment = "SHALL contain exactly one [1..1] code (CONF:81-19141)."
  * code 1..1
  * code = #ASSERTION
    * ^comment = "This code SHALL contain exactly one [1..1] @code=\"ASSERTION\" Assertion (CONF:81-19142)."
  * codeSystem 1..1
  * codeSystem = "2.16.840.1.113883.5.4"
    * ^comment = "This code SHALL contain exactly one [1..1] @codeSystem=\"2.16.840.1.113883.5.4\" (CodeSystem: HL7ActCode urn:oid:2.16.840.1.113883.5.4) (CONF:81-26504)."
* statusCode 1..1
  * ^comment = "SHALL contain exactly one [1..1] statusCode (CONF:81-8625)."
  * code 1..1
  * code = #completed (exactly)
    * ^comment = "This statusCode SHALL contain exactly one [1..1] @code=\"completed\" Completed (CodeSystem: HL7ActStatus urn:oid:2.16.840.1.113883.5.14 STATIC) (CONF:81-19097)."
* value 1..1
* value only $CD
  * ^comment = "SHALL contain exactly one [1..1] value with @xsi:type=\"CD\" (CONF:81-8626)."
  * code 1..1
  * code = #419099009
    * ^comment = "This value SHALL contain exactly one [1..1] @code=\"419099009\" Dead (CodeSystem: SNOMED CT urn:oid:2.16.840.1.113883.6.96 STATIC) (CONF:81-26470)."
  * codeSystem 1..1
  * codeSystem = "2.16.840.1.113883.6.96"