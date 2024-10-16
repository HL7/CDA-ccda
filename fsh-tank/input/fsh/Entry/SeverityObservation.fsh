Profile: SeverityObservation
Parent: $Observation
Id: SeverityObservation
Title: "Severity Observation"
Description: "This clinical statement represents the gravity of the problem, such as allergy or reaction, in terms of its actual or potential impact on the patient. The Severity Observation can be associated with an Allergy - Intolerance Observation, Substance or Device Allergy - Intolerance Observation, Reaction Observation or other reaction. When the Severity Observation is associated directly with an allergy it characterizes the allergy. When the Severity Observation is associated with a Reaction Observation it characterizes a reaction. A person may manifest many symptoms in a reaction to a single substance, and each reaction to the substance can be represented. However, each reaction observation can have only one severity observation associated with it. For example, someone may have a rash reaction observation as well as an itching reaction observation, but each can have only one level of severity. The severity of problems may be precoordinated within the coding used to describe the problem."

* insert LogicalModelTemplate(severity-obs, 2.16.840.1.113883.10.20.22.4.8, 2014-06-09)
* insert NarrativeLink

* classCode 1..1
* classCode = #OBS (exactly)
  * ^comment = "SHALL contain exactly one [1..1] @classCode=\"OBS\" Observation (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:1098-7345)."
* moodCode 1..1
* moodCode = #EVN (exactly)
  * ^comment = "SHALL contain exactly one [1..1] @moodCode=\"EVN\" Event (CodeSystem: HL7ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:1098-7346)."
* code 1..1
  * ^comment = "SHALL contain exactly one [1..1] code (CONF:1098-19168)."
  * code 1..1
  * code = #SEV
    * ^comment = "This code SHALL contain exactly one [1..1] @code=\"SEV\" Severity (CONF:1098-19169)."
  * codeSystem 1..1
  * codeSystem = "2.16.840.1.113883.5.4"
    * ^comment = "This code SHALL contain exactly one [1..1] @codeSystem=\"2.16.840.1.113883.5.4\" (CodeSystem: HL7ActCode urn:oid:2.16.840.1.113883.5.4) (CONF:1098-32170)."
* statusCode 1..1
  * ^comment = "SHALL contain exactly one [1..1] statusCode (CONF:1098-7352)."
  * code 1..1
  * code = #completed (exactly)
    * ^comment = "This statusCode SHALL contain exactly one [1..1] @code=\"completed\" Completed (CodeSystem: HL7ActStatus urn:oid:2.16.840.1.113883.5.14 STATIC) (CONF:1098-19115)."
* value 1..1
* value only $CD
* value from Severity (preferred)
  * ^comment = "SHALL contain exactly one [1..1] value with @xsi:type=\"CD\", where the code SHOULD be selected from ValueSet Reaction Severity urn:oid:2.16.840.1.113883.3.88.12.3221.6.8 DYNAMIC (CONF:1098-7356)."