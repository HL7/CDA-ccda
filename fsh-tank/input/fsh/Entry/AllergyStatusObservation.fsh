Profile: AllergyStatusObservation
Parent: $Observation
Id: AllergyStatusObservation
Title: "Allergy Status Observation"
Description: """This template represents the clinical status attributed to the allergy or intolerance. There can be only one allergy status observation per allergy - intolerance observation.
"""

* insert LogicalModelTemplate(allergyStatusObservation, 2.16.840.1.113883.10.20.22.4.28, 2019-06-20)

* classCode 1..1
* classCode = #OBS (exactly)
  * ^comment = "SHALL contain exactly one [1..1] @classCode=\"OBS\" Observation (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:1198-7318)."
* moodCode 1..1
* moodCode = #EVN (exactly)
  * ^comment = "SHALL contain exactly one [1..1] @moodCode=\"EVN\" Event (CodeSystem: HL7ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:1198-7319)."
* code 1..1
  * ^comment = "SHALL contain exactly one [1..1] code (CONF:1198-7320)."
  * code 1..1
  * code = #33999-4
    * ^comment = "This code SHALL contain exactly one [1..1] @code=\"33999-4\" Status (CONF:1198-19131)."
  * codeSystem 1..1
  * codeSystem = "2.16.840.1.113883.6.1"
    * ^comment = "This code SHALL contain exactly one [1..1] @codeSystem=\"2.16.840.1.113883.6.1\" (CodeSystem: LOINC urn:oid:2.16.840.1.113883.6.1) (CONF:1198-32155)."
* statusCode 1..1
  * ^comment = "SHALL contain exactly one [1..1] statusCode (CONF:1198-7321)."
  * code 1..1
  * code = #completed (exactly)
    * ^comment = "This statusCode SHALL contain exactly one [1..1] @code=\"completed\" Completed (CodeSystem: HL7ActStatus urn:oid:2.16.840.1.113883.5.14 STATIC) (CONF:1198-19087)."
* value 1..1
* value only $CE
* value from $2.16.840.1.113762.1.4.1099.29 (required)
  * ^comment = "SHALL contain exactly one [1..1] value with @xsi:type=\"CE\", where the code SHALL be selected from ValueSet Allergy Clinical Status urn:oid:2.16.840.1.113762.1.4.1099.29 DYNAMIC (CONF:1198-7322)."