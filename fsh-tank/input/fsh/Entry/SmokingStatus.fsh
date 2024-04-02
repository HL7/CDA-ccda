Profile: SmokingStatus
Parent: $Observation
Id: SmokingStatus
Title: "Smoking Status"
Description: """This template represents a patient's smoking status. It is a combination and replacement of the two previous templates Smoking Status - Meaningful Use and Tobacco Use, and it aligns with the US Core Smoking Status profile.

When the code represents a quantifiable observation (such as 8664-5 - Cigarettes smoked total (pack per year)), the value may be a Physical Quantity. When the code is Smoking Status (72166-2) or Tobacco Use (11367-0), the value **SHALL** be coded.

Regarding effectiveTime: some values in the Tobacco Use value set represent temporal meanings (e.g. 266919005 - Never smoked tobacco) and should correspond to a single timestamp representing when the observation was true. Other codes, such as 59978006 - Cigar smoker, may be represented with a single timestamp or a time range indicating when the patient began smoking and when they stopped."""

* insert LogicalModelTemplate(tobacco-use, 2.16.840.1.113883.10.20.22.4.511, 2024-05-01)
* insert NarrativeLink

* classCode 1..1
* classCode = #OBS (exactly)
* moodCode 1..1
* moodCode = #EVN (exactly)
* id 1..*
* code 1..1
* code from $SmokingStatusType
  * code 1..1
* statusCode 1..1
  * code 1..1
  * code = #completed (exactly)
* effectiveTime 1..1
  * value 0..1
    * ^short = "Represents a timestamp indicating a \"point in time\" when the observation was true"
  * low 0..1
    * ^short = "Represents the earliest time the observation was true. Should not be used for temporal codes (e.g. 266919005 - Never smoked tobacco)"
  * high 0..1
    * ^short = "Represents the last known time the observation was true. If the observation is still true, set `@nullFlavor` to `UNK`."
* value only $CD or $REAL
* value 1..1
  * ^slicing.discriminator[0].type = #type
  * ^slicing.discriminator[=].path = "$this"
  * ^slicing.rules = #closed
  * ^short = "REAL shall only be used for Smoking Status where code = 8663-7 or 8664-5"
* value contains count 0..1 and coded 0..1
* value[count] only $REAL
  * ^short = "Only used for Smoking Status where code = 8663-7 or 8664-5"
* value[coded] only $CD
  * code 1..1
  * code from $SmokingStatusComprehensive (required)
* obeys numeric-status

Invariant: numeric-status
Description: "When code is Smoking Status (72166-2) or Tobacco Use (11367-0), the value SHALL be coded"
Severity: #error
// Expression: "(code.code = '72166-2' or code.code = '11367-0') implies value.code.exists()"