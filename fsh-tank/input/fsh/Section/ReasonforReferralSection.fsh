Profile: ReasonforReferralSection
Parent: $Section
Id: ReasonforReferralSection
Title: "Reason for Referral Section"
Description: "This section describes the clinical reason why a provider is sending a patient to another provider for care. The reason for referral may become the reason for visit documented by the receiving provider."
* insert LogicalModelNA
* ^identifier.value = "urn:hl7ii:1.3.6.1.4.1.19376.1.5.3.1.3.1:2014-06-09"
* ^version = "2014-06-09"
* templateId ^slicing.discriminator[0].type = #value
  * ^slicing.discriminator[=].path = "root"
  * ^slicing.discriminator[+].type = #value
  * ^slicing.discriminator[=].path = "extension"
  * ^slicing.rules = #open
* templateId contains primary 1..1
* templateId[primary] ^comment = "SHALL contain exactly one [1..1] templateId (CONF:1098-7844) such that it"
  * root 1..1
  * root = "1.3.6.1.4.1.19376.1.5.3.1.3.1"
    * ^comment = "SHALL contain exactly one [1..1] @root=\"1.3.6.1.4.1.19376.1.5.3.1.3.1\" (CONF:1098-10468)."
  * extension 1..1
  * extension = "2014-06-09"
    * ^comment = "SHALL contain exactly one [1..1] @extension=\"2014-06-09\" (CONF:1098-32571)."
* code 1..1
  * ^comment = "SHALL contain exactly one [1..1] code (CONF:1098-15427)."
  * code 1..1
  * code = #42349-1
    * ^comment = "This code SHALL contain exactly one [1..1] @code=\"42349-1\" Reason for Referral (CONF:1098-15428)."
  * codeSystem 1..1
  * codeSystem = "2.16.840.1.113883.6.1"
    * ^comment = "This code SHALL contain exactly one [1..1] @codeSystem=\"2.16.840.1.113883.6.1\" (CodeSystem: LOINC urn:oid:2.16.840.1.113883.6.1) (CONF:1098-30867)."
* title 1..1
  * ^comment = "SHALL contain exactly one [1..1] title (CONF:1098-7846)."
* text 1..1
  * ^comment = "SHALL contain exactly one [1..1] text (CONF:1098-7847)."
* entry ^slicing.discriminator[0].type = #value
  * ^slicing.discriminator[=].path = "act"
  * ^slicing.rules = #open
* entry contains patientReferral 0..*
* entry[patientReferral] ^comment = "MAY contain zero or more [0..*] entry (CONF:1098-30808) such that it"
  * act 1..1
  * act only PatientReferralAct
    * ^comment = "SHALL contain exactly one [1..1] Patient Referral Act (identifier: urn:oid:2.16.840.1.113883.10.20.22.4.140) (CONF:1098-30897)."