Profile: Reason
Parent: $Observation
Id: Reason
Title: "Reason"
Description: """This template describes the thought process or justification for an action or for not performing an action. Examples include patient, system, or non-problem/diagnosis medical-related reasons for declining to perform specific actions, or any reason for performing an action. Note that the parent template that calls this template can be asserted to have occurred or to not have occurred. Therefore, this template simply adds a reason to some other (possibly negated) act. As such, there is nothing in this template that says whether the parent act did or did not occur. It is expected that the primary use of this template within C-CDA is to provide the rationale for why something was not done. If this template is called by a template that is not negated, the Reason template should contain something other than a problem or a diagnosis, such as a patient preference.
The	Indication observation: 2.16.840.1.113883.10.20.22.4.19 should be used to represent a diagnosis or problem to indicate the diagnosis or problem is the rationale for an action.
Immunization Refusal Reason: 2.16.840.1.113883.10.20.22.4.53 should be used to represent the rationale for the patient declining an immunization as the value set is crafted for the immunization use case.

"""
* ^meta.versionId = "4"
* ^meta.lastUpdated = "2023-07-11T23:42:06.692Z"

* insert LogicalModelTemplate(reason, 2.16.840.1.113883.10.20.24.3.88, 2023-05-01)

* ^status = #draft
* classCode 1..1
* classCode = #OBS (exactly)
  * ^comment = "SHALL contain exactly one [1..1] @classCode=\"OBS\" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:4537-11357)."
* moodCode 1..1
* moodCode = #EVN (exactly)
  * ^comment = "SHALL contain exactly one [1..1] @moodCode=\"EVN\" (CodeSystem: HL7ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:4537-11358)."
* id 1..*
  * ^comment = "SHALL contain at least one [1..*] id (CONF:4537-26998)."
* code 1..1
  * ^comment = "SHALL contain exactly one [1..1] code (CONF:4537-11361)."
  * code 1..1
  * code = #77301-0
    * ^comment = "This code SHALL contain exactly one [1..1] @code=\"77301-0\" Reason care action performed or not (CONF:4537-11362)."
  * codeSystem 1..1
  * codeSystem = "2.16.840.1.113883.6.1"
    * ^comment = "This code SHALL contain exactly one [1..1] @codeSystem=\"2.16.840.1.113883.6.1\" (CodeSystem: LOINC urn:oid:2.16.840.1.113883.6.1) (CONF:4537-27028)."
* statusCode 1..1
  * ^comment = "SHALL contain exactly one [1..1] statusCode (CONF:4537-11364)."
  * code 1..1
  * code = #completed (exactly)
    * ^comment = "This statusCode SHALL contain exactly one [1..1] @code=\"completed\" (CodeSystem: HL7ActStatus urn:oid:2.16.840.1.113883.5.14) (CONF:4537-11365)."
* effectiveTime 1..1
  * ^comment = "SHALL contain exactly one [1..1] effectiveTime (CONF:4537-11366)."
  * low 1..1
    * ^comment = "This effectiveTime SHALL contain exactly one [1..1] low (CONF:4537-27551)."
  * high 0..1
    * ^comment = "This effectiveTime MAY contain zero or one [0..1] high (CONF:4537-27552)."
* value 1..1
* value only $CD
  * ^comment = "SHALL contain exactly one [1..1] value with @xsi:type=\"CD\" (CONF:4537-11367)."