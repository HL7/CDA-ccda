Profile: DrugVehicle
Parent: $ParticipantRole
Id: DrugVehicle
Title: "Drug Vehicle"
Description: "This template represents the vehicle (e.g., saline, dextrose) for administering a medication."

* insert LogicalModelTemplateRootOnly(drugVehicle, 2.16.840.1.113883.10.20.22.4.24)

* classCode 1..1
* classCode = #MANU (exactly)
  * ^comment = "SHALL contain exactly one [1..1] @classCode=\"MANU\" (CodeSystem: HL7RoleClass urn:oid:2.16.840.1.113883.5.110 STATIC) (CONF:81-7490)."
* code 1..1
  * ^comment = "SHALL contain exactly one [1..1] code (CONF:81-19137)."
  * code 1..1
  * code = #412307009
    * ^comment = "This code SHALL contain exactly one [1..1] @code=\"412307009\" Drug Vehicle (CONF:81-19138)."
  * codeSystem 1..1
  * codeSystem = "2.16.840.1.113883.6.96"
    * ^comment = "This code SHALL contain exactly one [1..1] @codeSystem=\"2.16.840.1.113883.6.96\" (CodeSystem: SNOMED CT urn:oid:2.16.840.1.113883.6.96) (CONF:81-26502)."
* playingEntity 1..1
  * ^comment = "SHALL contain exactly one [1..1] playingEntity (CONF:81-7492)."
  * code 1..1
    * ^short = "This playingEntity/code is used to supply a coded term for the drug vehicle."
    * ^comment = "This playingEntity SHALL contain exactly one [1..1] code (CONF:81-7493)."
  * name 0..1
    * obeys 81-10087
    * ^comment = "This playingEntity MAY contain zero or one [0..1] name (CONF:81-7494)."

Invariant: 81-10087
Description: "This playingEntity/name MAY be used for the vehicle name in text, such as Normal Saline (CONF:81-10087)."
Severity: #warning