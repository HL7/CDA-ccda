Profile: HistoryofPresentIllnessSection
Parent: $Section
Id: HistoryofPresentIllnessSection
Title: "History of Present Illness Section"
Description: "The History of Present Illness section describes the history related to the reason for the encounter. It contains the historical details leading up to and pertaining to the patient's current complaint or reason for seeking medical care."
* insert LogicalModelNA
* ^identifier.value = "urn:oid:1.3.6.1.4.1.19376.1.5.3.1.3.4"
* templateId ^slicing.discriminator.type = #value
  * ^slicing.discriminator.path = "root"
  * ^slicing.rules = #open
* templateId contains primary 1..1
* templateId[primary] ^comment = "SHALL contain exactly one [1..1] templateId (CONF:81-7848) such that it, SHALL not contain [0..0] extension."
  * root 1..1
  * root = "1.3.6.1.4.1.19376.1.5.3.1.3.4"
    * ^comment = "SHALL contain exactly one [1..1] @root=\"1.3.6.1.4.1.19376.1.5.3.1.3.4\" (CONF:81-10458)."
  * extension 0..0
* code 1..1
  * ^comment = "SHALL contain exactly one [1..1] code (CONF:81-15477)."
  * code 1..1
  * code = #10164-2
    * ^comment = "This code SHALL contain exactly one [1..1] @code=\"10164-2\" (CONF:81-15478)."
  * codeSystem 1..1
  * codeSystem = "2.16.840.1.113883.6.1"
    * ^comment = "This code SHALL contain exactly one [1..1] @codeSystem=\"2.16.840.1.113883.6.1\" (CodeSystem: LOINC urn:oid:2.16.840.1.113883.6.1) (CONF:81-26478)."
* title 1..1
  * ^comment = "SHALL contain exactly one [1..1] title (CONF:81-7850)."
* text 1..1
  * ^comment = "SHALL contain exactly one [1..1] text (CONF:81-7851)."