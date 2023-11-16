Profile: DateOfDiagnosisAct
Parent: $Act
Id: DateOfDiagnosisAct
Title: "Date of Diagnosis Act"
Description: """This template represents the earliest date of diagnosis, which is the date of first determination by a qualified professional of the presence of a problem or condition affecting a patient. An encounter diagnosis date may be different than this Date of Diagnosis.

The date of diagnosis is usually not the same date as the date of condition onset. A patient may have a condition for some time before it is formally diagnosed."""
* ^meta.versionId = "4"
* ^meta.lastUpdated = "2023-07-11T23:41:51.895Z"

* insert LogicalModelTemplate(date-of-diagnosis-act, 2.16.840.1.113883.10.20.22.4.502, 2022-06-01)
* insert NarrativeLink

* classCode 1..1
* classCode = #ACT (exactly)
  * ^comment = "SHALL contain exactly one [1..1] @classCode=\"ACT\" Act (CodeSystem: HL7ActCode urn:oid:2.16.840.1.113883.5.4) (CONF:4515-33010)."
* moodCode 1..1
* moodCode = #EVN (exactly)
  * ^comment = "SHALL contain exactly one [1..1] @moodCode=\"EVN\" Event (CodeSystem: HL7ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:4515-33011)."
* code 1..1
  * ^comment = "SHALL contain exactly one [1..1] code (CONF:4515-33001)."
  * code 0..1
  * code = #77975-1
    * ^comment = "This code SHALL contain zero or one [0..1] @code=\"77975-1\" Earliest date of diagnosis (CONF:4515-33004)."
  * codeSystem 1..1
  * codeSystem = "2.16.840.1.113883.6.1"
    * ^comment = "This code SHALL contain exactly one [1..1] @codeSystem=\"2.16.840.1.113883.6.1\" LOINC (CONF:4515-33005)."
* statusCode 1..1
  * code 1..1
  * code = #completed (exactly)
    * ^comment = "SHALL contain exactly one [1..1] statusCode=\"completed\" Completed (CodeSystem: HL7ActStatus urn:oid:2.16.840.1.113883.5.14) (CONF:4515-33006)."
* effectiveTime 1..1
  * ^comment = "SHALL contain exactly one [1..1] effectiveTime (CONF:4515-33007)."
  * obeys ts-shall-year
  * value 1..1
    * ^comment = "This effectiveTime SHALL contain exactly one [1..1] @value (CONF:4515-33008)."
  * low 0..0
    * ^comment = "This effectiveTime SHALL NOT contain [0..0] low (CONF:4515-33016)."
  * high 0..0
    * ^comment = "This effectiveTime SHALL NOT contain [0..0] high (CONF:4515-33017)."
