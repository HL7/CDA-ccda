Profile: ProcedureDescriptionSection
Parent: $Section
Id: ProcedureDescriptionSection
Title: "Procedure Description Section"
Description: "The Procedure Description section records the particulars of the procedure and may include procedure site preparation, surgical site preparation, pertinent details related to sedation/anesthesia, pertinent details related to measurements and markings, procedure times, medications administered, estimated blood loss, specimens removed, implants, instrumentation, sponge counts, tissue manipulation, wound closure, sutures used, vital signs and other monitoring data. Local practice often identifies the level and type of detail required based on the procedure or specialty."
* insert LogicalModelNA
* ^identifier.value = "urn:oid:2.16.840.1.113883.10.20.22.2.27"
* templateId ^slicing.discriminator.type = #value
  * ^slicing.discriminator.path = "root"
  * ^slicing.rules = #open
* templateId contains primary 1..1
* templateId[primary] ^comment = "SHALL contain exactly one [1..1] templateId (CONF:81-8062) such that it, SHALL not contain [0..0] extension."
  * root 1..1
  * root = "2.16.840.1.113883.10.20.22.2.27"
    * ^comment = "SHALL contain exactly one [1..1] @root=\"2.16.840.1.113883.10.20.22.2.27\" (CONF:81-10442)."
  * extension 0..0
* code 1..1
  * ^comment = "SHALL contain exactly one [1..1] code (CONF:81-15411)."
  * code 1..1
  * code = #29554-3
    * ^comment = "This code SHALL contain exactly one [1..1] @code=\"29554-3\" Procedure Description (CONF:81-15412)."
  * codeSystem 1..1
  * codeSystem = "2.16.840.1.113883.6.1"
    * ^comment = "This code SHALL contain exactly one [1..1] @codeSystem=\"2.16.840.1.113883.6.1\" (CodeSystem: LOINC urn:oid:2.16.840.1.113883.6.1) (CONF:81-26489)."
* title 1..1
  * ^comment = "SHALL contain exactly one [1..1] title (CONF:81-8064)."
* text 1..1
  * ^comment = "SHALL contain exactly one [1..1] text (CONF:81-8065)."