Profile: ActivitiesSection
Parent: $Section
Id: ActivitiesSection
Title: "Activities Section"
Description: """This template represents Activities. Activities are actions taken to maximize the prospects of the goals of care for the patient, including the removal of barriers to success. Activities can be planned, ordered, historical, etc.

Activities include actions that may be ongoing (e.g., maintenance medications that the patient is taking, or monitoring the patient's health status or the status of an intervention). 

Instructions are nested within interventions and may include self-care instructions. Instructions are information or directions to the patient and other providers including how to care for the individual's condition, what to do at home, when to call for help, any additional appointments, testing, and changes to the medication list or medication instructions, clinical guidelines and a summary of best practice.

Instructions are information or directions to the patient. Use the Instructions Section when instructions are included as part of a document that is not a Care Plan. Use the Activities Section, containing the Intervention Act containing the Instruction entry, when instructions are part of a structured care plan."""
* insert LogicalModelNA
* ^identifier.value = "urn:hl7ii:2.16.840.1.113883.10.20.21.2.3:2015-08-01"
* ^version = "2015-08-01"
* templateId ^slicing.discriminator[0].type = #value
  * ^slicing.discriminator[=].path = "root"
  * ^slicing.discriminator[+].type = #value
  * ^slicing.discriminator[=].path = "extension"
  * ^slicing.rules = #open
* templateId contains primary 1..1
* templateId[primary] ^comment = "SHALL contain exactly one [1..1] templateId (CONF:1198-8680) such that it"
  * root 1..1
  * root = "2.16.840.1.113883.10.20.21.2.3"
    * ^comment = "SHALL contain exactly one [1..1] @root=\"2.16.840.1.113883.10.20.21.2.3\" (CONF:1198-10461)."
  * extension 1..1
  * extension = "2015-08-01"
    * ^comment = "SHALL contain exactly one [1..1] @extension=\"2015-08-01\" (CONF:1198-32559)."
* code 1..1
  * ^comment = "SHALL contain exactly one [1..1] code (CONF:1198-15377)."
  * code 1..1
  * code = #62387-6
    * ^comment = "This code SHALL contain exactly one [1..1] @code=\"62387-6\" Interventions Provided (CONF:1198-15378)."
  * codeSystem 1..1
  * codeSystem = "2.16.840.1.113883.6.1"
    * ^comment = "This code SHALL contain exactly one [1..1] @codeSystem=\"2.16.840.1.113883.6.1\" (CodeSystem: LOINC urn:oid:2.16.840.1.113883.6.1) (CONF:1198-30864)."
* title 1..1
  * ^comment = "SHALL contain exactly one [1..1] title (CONF:1198-8682)."
* text 1..1
  * ^comment = "SHALL contain exactly one [1..1] text (CONF:1198-8683)."
* entry ..*
  * ^slicing.discriminator[0].type = #profile
  * ^slicing.discriminator[=].path = "act"
  * ^slicing.rules = #open
* entry contains
    intervention 0..* and
    plannedIntervention 0..* and
    handoffCommParticipants 0..*
* entry[intervention] ^comment = "SHOULD contain zero or more [0..*] entry (CONF:1198-30996) such that it"
  * act only InterventionAct
    * ^comment = "The entry, if present, SHALL contain exactly one [1..1] Intervention Act (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.4.131:2015-08-01) (CONF:1198-30997)."
* entry[plannedIntervention] ^comment = "SHOULD contain zero or more [0..*] entry (CONF:1198-32730) such that it"
  * act 1..1
  * act only PlannedInterventionAct
    * ^comment = "The entry, if present, SHALL contain exactly one [1..1] Planned Intervention Act (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.4.146:2015-08-01) (CONF:1198-32731)."
* entry[handoffCommParticipants] ^comment = "MAY contain zero or more [0..*] entry (CONF:1198-32402) such that it"
  * act 1..1
  * act only HandoffCommunicationParticipants
    * ^comment = "The entry, if present, SHALL contain exactly one [1..1] Intervention Act (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.4.141) (CONF:1198-32403)."