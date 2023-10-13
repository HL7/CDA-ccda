Profile: ReasonforReferralSection
Parent: $Section
Id: ReasonforReferralSection
Title: "Reason for Referral Section"
Description: "This section describes the clinical reason why a provider is sending a patient to another provider for care. The reason for referral may become the reason for visit documented by the receiving provider."

* insert Section(#42349-1, Reason for Referral, 1.3.6.1.4.1.19376.1.5.3.1.3.1, 2014-06-09)
* entry ^slicing.discriminator[0].type = #value
  * ^slicing.discriminator[=].path = "act"
  * ^slicing.rules = #open
* entry contains patientReferral 0..*
* entry[patientReferral] ^comment = "MAY contain zero or more [0..*] entry (CONF:1098-30808) such that it"
  * act 1..1
  * act only PatientReferralAct
    * ^comment = "SHALL contain exactly one [1..1] Patient Referral Act (identifier: urn:oid:2.16.840.1.113883.10.20.22.4.140) (CONF:1098-30897)."