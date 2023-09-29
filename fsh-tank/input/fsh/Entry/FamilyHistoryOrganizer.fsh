Profile: FamilyHistoryOrganizer
Parent: $Organizer
Id: FamilyHistoryOrganizer
Title: "Family History Organizer"
Description: "The Family History Organizer associates a set of observations with a family member. For example, the Family History Organizer can group a set of observations about the patient's father."
* insert LogicalModelNA
* ^identifier.value = "urn:hl7ii:2.16.840.1.113883.10.20.22.4.45:2015-08-01"
* ^version = "2015-08-01"
* classCode 1..1
* classCode = #CLUSTER (exactly)
  * ^comment = "SHALL contain exactly one [1..1] @classCode=\"CLUSTER\" Cluster (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:1198-8600)."
* moodCode 1..1
* moodCode = #EVN (exactly)
  * ^comment = "SHALL contain exactly one [1..1] @moodCode=\"EVN\" Event (CodeSystem: HL7ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:1198-8601)."
* templateId ^slicing.discriminator[0].type = #value
  * ^slicing.discriminator[=].path = "root"
  * ^slicing.discriminator[+].type = #value
  * ^slicing.discriminator[=].path = "extension"
  * ^slicing.rules = #open
* templateId contains primary 1..1
* templateId[primary] ^comment = "SHALL contain exactly one [1..1] templateId (CONF:1198-8604) such that it"
  * root 1..1
  * root = "2.16.840.1.113883.10.20.22.4.45"
    * ^comment = "SHALL contain exactly one [1..1] @root=\"2.16.840.1.113883.10.20.22.4.45\" (CONF:1198-10497)."
  * extension 1..1
  * extension = "2015-08-01"
    * ^comment = "SHALL contain exactly one [1..1] @extension=\"2015-08-01\" (CONF:1198-32606)."
* id 1..*
  * ^comment = "SHALL contain at least one [1..*] id (CONF:1198-32485)."
* statusCode 1..1
  * ^comment = "SHALL contain exactly one [1..1] statusCode (CONF:1198-8602)."
  * code 1..1
  * code = #completed (exactly)
    * ^comment = "This statusCode SHALL contain exactly one [1..1] @code=\"completed\" Completed (CodeSystem: HL7ActStatus urn:oid:2.16.840.1.113883.5.14 STATIC) (CONF:1198-19099)."
* subject 1..1
  * ^comment = "SHALL contain exactly one [1..1] subject (CONF:1198-8609)."
  * relatedSubject 1..1
    * ^comment = "This subject SHALL contain exactly one [1..1] relatedSubject (CONF:1198-15244)."
    * classCode 1..1
    * classCode = #PRS (exactly)
      * ^comment = "This relatedSubject SHALL contain exactly one [1..1] @classCode=\"PRS\" Person (CodeSystem: HL7EntityClass urn:oid:2.16.840.1.113883.5.41 STATIC) (CONF:1198-15245)."
    * code 1..1
    * code from $2.16.840.1.113883.1.11.19579 (preferred)
      * ^comment = "This relatedSubject SHALL contain exactly one [1..1] code, which SHOULD be selected from ValueSet Family Member Value urn:oid:2.16.840.1.113883.1.11.19579 DYNAMIC (CONF:1198-15246)."
    * subject 0..1
      * obeys 1198-15249 and 1198-15981 and 1198-15982 and 1198-15983
      * ^comment = "This relatedSubject SHOULD contain zero or one [0..1] subject (CONF:1198-15248)."
      * administrativeGenderCode 1..1
      * administrativeGenderCode from $2.16.840.1.113883.1.11.1 (required)
        * ^comment = "The subject, if present, SHALL contain exactly one [1..1] administrativeGenderCode, which SHALL be selected from ValueSet Administrative Gender (HL7 V3) urn:oid:2.16.840.1.113883.1.11.1 DYNAMIC (CONF:1198-15974)."
      * birthTime 0..1
        * ^comment = "The subject, if present, SHOULD contain zero or one [0..1] birthTime (CONF:1198-15976)."
* component 1..*
  * ^comment = "SHALL contain at least one [1..*] component (CONF:1198-32428)."
  * observation 1..1
  * observation only FamilyHistoryObservation
    * ^comment = "Such components SHALL contain exactly one [1..1] Family History Observation (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.4.46:2015-08-01) (CONF:1198-32429)."

Invariant: 1198-15249
Description: "The subject **SHOULD** contain zero or more [0..*] sdtc:id. The prefix sdtc: **SHALL** be bound to the namespace “urn:hl7-org:sdtc”. The use of the namespace provides a necessary extension to CDA R2 for the use of the id element (CONF:1198-15249)."
Severity: #warning

Invariant: 1198-15981
Description: "The subject **MAY** contain zero or one [0..1] *sdtc:deceasedInd*. The prefix sdtc: **SHALL** be bound to the namespace “urn:hl7-org:sdtc”. The use of the namespace provides a necessary extension to CDA R2 for the use of the deceasedInd element (CONF:1198-15981)."
Severity: #warning

Invariant: 1198-15982
Description: "The subject **MAY** contain zero or one [0..1] *sdtc:deceasedTime*. The prefix sdtc: **SHALL** be bound to the namespace “urn:hl7-org:sdtc”. The use of the namespace provides a necessary extension to CDA R2 for the use of the deceasedTime element (CONF:1198-15982)."
Severity: #warning

Invariant: 1198-15983
Description: "The age of a relative at the time of a family history observation **SHOULD** be inferred by comparing RelatedSubject/subject/birthTime with Observation/effectiveTime (CONF:1198-15983)."
Severity: #warning