Profile: AnesthesiaSection
Parent: $Section
Id: AnesthesiaSection
Title: "Anesthesia Section"
Description: "The Anesthesia Section records the type of anesthesia (e.g., general or local) and may state the actual agent used. This may be a subsection of the Procedure Description Section. The full details of anesthesia are usually found in a separate Anesthesia Note."
* insert LogicalModelNA
* ^identifier.value = "urn:hl7ii:2.16.840.1.113883.10.20.22.2.25:2014-06-09"
* ^version = "2014-06-09"
* templateId ^slicing.discriminator[0].type = #value
  * ^slicing.discriminator[=].path = "root"
  * ^slicing.discriminator[+].type = #value
  * ^slicing.discriminator[=].path = "extension"
  * ^slicing.rules = #open
* templateId contains primary 1..1
* templateId[primary] ^comment = "SHALL contain exactly one [1..1] templateId (CONF:1098-8066) such that it"
  * root 1..1
  * root = "2.16.840.1.113883.10.20.22.2.25"
    * ^comment = "SHALL contain exactly one [1..1] @root=\"2.16.840.1.113883.10.20.22.2.25\" (CONF:1098-10380)."
  * extension 1..1
  * extension = "2014-06-09"
    * ^comment = "SHALL contain exactly one [1..1] @extension=\"2014-06-09\" (CONF:1098-32531)."
* code 1..1
  * ^comment = "SHALL contain exactly one [1..1] code (CONF:1098-15351)."
  * code 1..1
  * code = #59774-0
    * ^comment = "This code SHALL contain exactly one [1..1] @code=\"59774-0\" Anesthesia (CONF:1098-15352)."
  * codeSystem 1..1
  * codeSystem = "2.16.840.1.113883.6.1"
    * ^comment = "This code SHALL contain exactly one [1..1] @codeSystem=\"2.16.840.1.113883.6.1\" (CodeSystem: LOINC urn:oid:2.16.840.1.113883.6.1) (CONF:1098-30830)."
* title 1..1
  * ^comment = "SHALL contain exactly one [1..1] title (CONF:1098-8068)."
* text 1..1
  * ^comment = "SHALL contain exactly one [1..1] text (CONF:1098-8069)."
* entry ..*
  * ^slicing.discriminator[0].type = #profile
  * ^slicing.discriminator[=].path = "procedure"
  * ^slicing.discriminator[+].type = #profile
  * ^slicing.discriminator[=].path = "substanceAdministration"
  * ^slicing.rules = #open
* entry contains
    procedure 0..* and
    medication 0..*
* entry[procedure] ^comment = "MAY contain zero or more [0..*] entry (CONF:1098-8092) such that it"
  * procedure 1..1
  * procedure only ProcedureActivityProcedure
    * ^comment = "SHALL contain exactly one [1..1] Procedure Activity Procedure (identifier: urn:hl7\n                ii:2.16.840.1.113883.10.20.22.4.14:2014-06-09) (CONF:1098-15447)."
* entry[medication] ^comment = "MAY contain zero or more [0..*] entry (CONF:1098-8094) such that it"
  * substanceAdministration 1..1
  * substanceAdministration only MedicationActivity
    * ^comment = "SHALL contain exactly one [1..1] Medication Activity (identifier: urn:hl7ii:2.16.8\n                40.1.113883.10.20.22.4.16:2014-06-09) (CONF:1098-31127)."