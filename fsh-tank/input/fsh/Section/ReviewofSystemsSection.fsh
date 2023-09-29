Profile: ReviewofSystemsSection
Parent: $Section
Id: ReviewofSystemsSection
Title: "Review of Systems Section"
Description: "The Review of Systems Section contains a relevant collection of symptoms and functions systematically gathered by a clinician. It includes symptoms the patient is currently experiencing, some of which were not elicited during the history of present illness, as well as a potentially large number of pertinent negatives, for example, symptoms that the patient denied experiencing."
* insert LogicalModelNA
* ^identifier.value = "urn:oid:1.3.6.1.4.1.19376.1.5.3.1.3.18"
* templateId ^slicing.discriminator.type = #value
  * ^slicing.discriminator.path = "root"
  * ^slicing.rules = #open
* templateId contains primary 1..1
* templateId[primary] ^comment = "SHALL contain exactly one [1..1] templateId (CONF:81-7812) such that it, SHALL not contain [0..0] extension."
  * root 1..1
  * root = "1.3.6.1.4.1.19376.1.5.3.1.3.18"
    * ^comment = "SHALL contain exactly one [1..1] @root=\"1.3.6.1.4.1.19376.1.5.3.1.3.18\" (CONF:81-10469)."
  * extension 0..0
* code 1..1
  * ^comment = "SHALL contain exactly one [1..1] code (CONF:81-15435)."
  * code 1..1
  * code = #10187-3
    * ^comment = "This code SHALL contain exactly one [1..1] @code=\"10187-3\" Review of Systems (CONF:81-15436)."
  * codeSystem 1..1
  * codeSystem = "2.16.840.1.113883.6.1"
    * ^comment = "This code SHALL contain exactly one [1..1] @codeSystem=\"2.16.840.1.113883.6.1\" (CodeSystem: LOINC urn:oid:2.16.840.1.113883.6.1) (CONF:81-26495)."
* title 1..1
  * ^comment = "SHALL contain exactly one [1..1] title (CONF:81-7814)."
* text 1..1
  * ^comment = "SHALL contain exactly one [1..1] text (CONF:81-7815)."