Profile: PayersSection
Parent: $Section
Id: PayersSection
Title: "Payers Section"
Description: """The Payers Section contains data on the patient's payers, whether "third party" insurance, self-pay, other payer or guarantor, or some combination of payers, and is used to define which entity is the responsible fiduciary for the financial aspects of a patient's care..

Each unique instance of a payer and all the pertinent data needed to contact, bill to, and collect from that payer should be included. Authorization information that can be used to define pertinent referral, authorization tracking number, procedure, therapy, intervention, device, or similar authorizations for the patient or provider, or both should be included. At a minimum, the patient's pertinent current payment sources should be listed..

The sources of payment are represented as a Coverage Activity, which identifies all of the insurance policies or government or other programs that cover some or all of the patient's healthcare expenses. The policies or programs are sequenced by preference. The Coverage Activity has a sequence number that represents the preference order. Each policy or program identifies the covered party with respect to the payer, so that the identifiers can be recorded."""
* insert LogicalModelNA
* ^identifier.value = "urn:hl7ii:2.16.840.1.113883.10.20.22.2.18:2015-08-01"
* ^version = "2015-08-01"
* templateId ^slicing.discriminator[0].type = #value
  * ^slicing.discriminator[=].path = "root"
  * ^slicing.discriminator[+].type = #value
  * ^slicing.discriminator[=].path = "extension"
  * ^slicing.rules = #open
* templateId contains primary 1..1
* templateId[primary] ^comment = "SHALL contain exactly one [1..1] templateId (CONF:1198-7924) such that it"
  * root 1..1
  * root = "2.16.840.1.113883.10.20.22.2.18"
    * ^comment = "SHALL contain exactly one [1..1] @root=\"2.16.840.1.113883.10.20.22.2.18\" (CONF:1198-10434)."
  * extension 1..1
  * extension = "2015-08-01"
    * ^comment = "SHALL contain exactly one [1..1] @extension=\"2015-08-01\" (CONF:1198-32597)."
* code 1..1
  * ^comment = "SHALL contain exactly one [1..1] code (CONF:1198-15395)."
  * code 1..1
  * code = #48768-6
    * ^comment = "This code SHALL contain exactly one [1..1] @code=\"48768-6\" Payers (CONF:1198-15396)."
  * codeSystem 1..1
  * codeSystem = "2.16.840.1.113883.6.1"
    * ^comment = "This code SHALL contain exactly one [1..1] @codeSystem=\"2.16.840.1.113883.6.1\" (CodeSystem: LOINC urn:oid:2.16.840.1.113883.6.1) (CONF:1198-32149)."
* title 1..1
  * ^comment = "SHALL contain exactly one [1..1] title (CONF:1198-7926)."
* text 1..1
  * ^comment = "SHALL contain exactly one [1..1] text (CONF:1198-7927)."
* entry ^slicing.discriminator[0].type = #value
  * ^slicing.discriminator[=].path = "act"
  * ^slicing.rules = #open
* entry contains coverage 0..*
* entry[coverage] ^comment = "SHOULD contain zero or more [0..*] entry (CONF:1198-7959) such that it"
  * act 1..1
  * act only CoverageActivity
    * ^comment = "SHALL contain exactly one [1..1] Coverage Activity (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.4.60:2015-08-01) (CONF:1198-15501)."