Profile: ReactionObservation
Parent: $Observation
Id: ReactionObservation
Title: "Reaction Observation"
Description: "This clinical statement represents the response to an undesired symptom, finding, etc. due to administered or exposed substance. A reaction can be defined described with respect to its severity, and can have been treated by one or more interventions."

* insert LogicalModelTemplate(reaction-obs, 2.16.840.1.113883.10.20.22.4.9, 2014-06-09)
* insert NarrativeLink

* classCode 1..1
* classCode = #OBS (exactly)
  * ^comment = "SHALL contain exactly one [1..1] @classCode=\"OBS\" Observation (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:1098-7325)."
* moodCode 1..1
* moodCode = #EVN (exactly)
  * ^comment = "SHALL contain exactly one [1..1] @moodCode=\"EVN\" Event (CodeSystem: HL7ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:1098-7326)."
* id 1..*
  * ^comment = "SHALL contain at least one [1..*] id (CONF:1098-7329)."
* code 1..1
  * ^comment = "SHALL contain exactly one [1..1] code (CONF:1098-16851)."
  * code 1..1
  * code = #ASSERTION
    * ^comment = "This code SHALL contain exactly one [1..1] @code=\"ASSERTION\" (CONF:1098-31124)."
  * codeSystem 1..1
  * codeSystem = "2.16.840.1.113883.5.4"
    * ^comment = "This code SHALL contain exactly one [1..1] @codeSystem=\"2.16.840.1.113883.5.4\" (CodeSystem: HL7ActCode urn:oid:2.16.840.1.113883.5.4) (CONF:1098-32169)."
* statusCode 1..1
  * ^comment = "SHALL contain exactly one [1..1] statusCode (CONF:1098-7328)."
  * code 1..1
  * code from $2.16.840.1.113762.1.4.1240.6 (required)
  * ^comment = "This statusCode SHALL contain exactly one [1..1] @code, which SHALL be selected from ValueSet Completed or Nullified Act Status urn:oid:2.16.840.1.113762.1.4.1240.6."
* obeys should-effectiveTime
* effectiveTime 0..1
  * ^comment = "SHOULD contain zero or one [0..1] effectiveTime (CONF:1098-7332)." // auto-should
  * obeys should-low
  * low 0..1
    * ^comment = "The effectiveTime, if present, SHOULD contain zero or one [0..1] low (CONF:1098-7333)." // auto-should
  * obeys should-high
  * high 0..1
    * ^comment = "The effectiveTime, if present, SHOULD contain zero or one [0..1] high (CONF:1098-7334)." // auto-should
* value 1..1
* value only $CD
* value from Problem (required)
  * ^comment = "SHALL contain exactly one [1..1] value with @xsi:type=\"CD\", where the code SHALL be selected from ValueSet Problem urn:oid:2.16.840.1.113883.3.88.12.3221.7.4 DYNAMIC (CONF:1098-7335)."
* entryRelationship ^slicing.discriminator[0].type = #profile
  * ^slicing.discriminator[=].path = "procedure"
  * ^slicing.discriminator[+].type = #profile
  * ^slicing.discriminator[=].path = "substanceAdministration"
  * ^slicing.discriminator[+].type = #profile
  * ^slicing.discriminator[=].path = "observation"
  * ^slicing.rules = #open
* entryRelationship contains
    procedure 0..* and
    medication 0..* and
    severity 0..1
* entryRelationship[procedure] ^comment = "MAY contain zero or more [0..*] entryRelationship (CONF:1098-7337) such that it"
  * typeCode 1..1
  * typeCode = #RSON (exactly)
    * ^comment = "SHALL contain exactly one [1..1] @typeCode=\"RSON\" Has reason (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002 STATIC) (CONF:1098-7338)."
  * inversionInd 1..1
  * inversionInd = true (exactly)
    * ^comment = "SHALL contain exactly one [1..1] @inversionInd=\"true\" True (CONF:1098-7343)."
  * procedure 1..1
  * procedure only ProcedureActivityProcedure
    * ^short = "This procedure activity is intended to contain information about procedures that were performed in response to an allergy reaction."
    * ^comment = "SHALL contain exactly one [1..1] Procedure Activity Procedure (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.4.14:2014-06-09) (CONF:1098-15920)."
* entryRelationship[medication] ^comment = "MAY contain zero or more [0..*] entryRelationship (CONF:1098-7340) such that it"
  * typeCode 1..1
  * typeCode = #RSON (exactly)
    * ^comment = "SHALL contain exactly one [1..1] @typeCode=\"RSON\" Has reason (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002 STATIC) (CONF:1098-7341)."
  * inversionInd 1..1
  * inversionInd = true (exactly)
    * ^comment = "SHALL contain exactly one [1..1] @inversionInd=\"true\" True (CONF:1098-7344)."
  * substanceAdministration 1..1
  * substanceAdministration only MedicationActivity
    * ^short = "This medication activity is intended to contain information about medications that were administered in response to an allergy reaction."
    * ^comment = "SHALL contain exactly one [1..1] Medication Activity (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.4.16:2014-06-09) (CONF:1098-15921)."
* entryRelationship[severity] ^comment = "MAY contain zero or one [0..1] entryRelationship (CONF:1098-7580) such that it"
  * typeCode 1..1
  * typeCode = #SUBJ (exactly)
    * ^comment = "SHALL contain exactly one [1..1] @typeCode=\"SUBJ\" Has subject (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002 STATIC) (CONF:1098-7581)."
  * inversionInd 1..1
  * inversionInd = true (exactly)
    * ^comment = "SHALL contain exactly one [1..1] @inversionInd=\"true\" TRUE (CONF:1098-10375)."
  * observation 1..1
  * observation only SeverityObservation
    * ^comment = "SHALL contain exactly one [1..1] Severity Observation (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.4.8:2014-06-09) (CONF:1098-15922)."