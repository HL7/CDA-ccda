Profile: CriticalityObservation
Parent: $Observation
Id: CriticalityObservation
Title: "Criticality Observation"
Description: "This observation represents the gravity of the potential risk for future life-threatening adverse reactions when exposed to a substance known to cause an adverse reaction in that individual. When the worst case result is assessed to have a life-threatening or organ system threatening potential, it is considered to be of high criticality."

* insert LogicalModelTemplateRootOnly(criticality-obs, 2.16.840.1.113883.10.20.22.4.145)
* insert NarrativeLink

* classCode 1..1
* classCode = #OBS (exactly)
  * ^comment = "SHALL contain exactly one [1..1] @classCode=\"OBS\" Observation (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:81-32921)."
* moodCode 1..1
* moodCode = #EVN (exactly)
  * ^comment = "SHALL contain exactly one [1..1] @moodCode=\"EVN\" Event (CodeSystem: HL7ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:81-32922)."
* code 1..1
  * ^comment = "SHALL contain exactly one [1..1] code (CONF:81-32919)."
  * code 1..1
  * code = #82606-5
    * ^comment = "This code SHALL contain exactly one [1..1] @code=\"82606-5\" Criticality (CONF:81-32925)."
  * codeSystem 1..1
  * codeSystem = "2.16.840.1.113883.6.1"
    * ^comment = "This code SHALL contain exactly one [1..1] @codeSystem=\"2.16.840.1.113883.6.1\" (CodeSystem: LOINC urn:oid:2.16.840.1.113883.6.1) (CONF:81-32926)."
* statusCode 1..1
  * ^comment = "SHALL contain exactly one [1..1] statusCode (CONF:81-32920)."
  * code 1..1
  * code from $2.16.840.1.113762.1.4.1240.6 (required)
  * ^comment = "This statusCode SHALL contain exactly one [1..1] @code, which SHALL be selected from ValueSet Completed or Nullified Act Status urn:oid:2.16.840.1.113762.1.4.1240.6."
* value 1..1
* value only $CD
* value from $2.16.840.1.113883.1.11.20549 (required)
  * ^comment = "SHALL contain exactly one [1..1] value with @xsi:type=\"CD\", where the code SHALL be selected from ValueSet Criticality Observation urn:oid:2.16.840.1.113883.1.11.20549 DYNAMIC (CONF:81-32928)."