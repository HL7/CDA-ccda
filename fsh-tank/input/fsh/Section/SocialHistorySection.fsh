Profile: SocialHistorySection
Parent: $Section
Id: SocialHistorySection
Title: "Social History Section"
Description: "This section contains social history data that influence a patient's physical, psychological or emotional health (e.g., smoking status, pregnancy). Demographic data, such as marital status, race, ethnicity, and religious affiliation, is captured in the header. Mental/behavioral health assessments such as PHQ-9 (Patient Health Questionnaire-9) for depression screening are captured in the Mental Status section."

* insert Section(#29762-2, Social history Narrative, 2.16.840.1.113883.10.20.22.2.17, 2015-08-01)
* entry ..*
  * ^slicing.discriminator[0].type = #profile
  * ^slicing.discriminator[=].path = "observation"
  * ^slicing.rules = #open
* entry contains
    socialHistory 0..* and
    pregnancyPregnancy 0..* and
    smokingStatus 0..* and
    caregiver 0..* and
    culteralReligious 0..* and
    homeCharacteristics 0..*
* entry[socialHistory] ^comment = "MAY contain zero or more [0..*] entry (CONF:1198-7953) such that it"
  * observation 1..1
  * observation only SocialHistoryObservation
    * ^comment = "SHALL contain exactly one [1..1] Social History Observation (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.4.38:2015-08-01) (CONF:1198-14821)."
* entry[pregnancyPregnancy] ^comment = "MAY contain zero or more [0..*] entry (CONF:1198-9132) such that it"
  * observation 1..1
  * observation only PregnancyStatusObservation
    * ^comment = "SHALL contain exactly one [1..1] Pregnancy Status Observation (identifier: urn:oid:2.16.840.1.113883.10.20.15.3.8) (CONF:1198-14822)."
* entry[smokingStatus] ^comment = "SHOULD contain zero or more [0..*] entry (CONF:1198-14823) such that it"
  * observation 1..1
  * observation only SmokingStatus
    * ^comment = "SHALL contain exactly one [1..1] Smoking Status(identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.4.511:2024-05-01) (CONF:1198-14824)."
* entry[caregiver] ^comment = "MAY contain zero or more [0..*] entry (CONF:1198-28361) such that it"
  * observation 1..1
  * observation only CaregiverCharacteristics
    * ^comment = "SHALL contain exactly one [1..1] Caregiver Characteristics (identifier: urn:oid:2.16.840.1.113883.10.20.22.4.72) (CONF:1198-28362)."
* entry[culteralReligious] ^comment = "MAY contain zero or more [0..*] entry (CONF:1198-28366) such that it"
  * observation 1..1
  * observation only CulturalandReligiousObservation
    * ^comment = "SHALL contain exactly one [1..1] Cultural and Religious Observation (identifier: urn:oi\n                d:2.16.840.1.113883.10.20.22.4.111) (CONF:1198-28367)."
* entry[homeCharacteristics] ^comment = "MAY contain zero or more [0..*] entry (CONF:1198-28825) such that it"
  * observation 1..1
  * observation only CharacteristicsofHomeEnvironment
    * ^comment = "SHALL contain exactly one [1..1] Characteristics of Home Environment (identifier: urn:oid:2.16.840.1.113883.10.20.22.4.109) (CONF:1198-28826)."
* obeys should-smoking-status