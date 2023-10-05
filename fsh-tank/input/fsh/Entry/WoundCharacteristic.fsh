Profile: WoundCharacteristic
Parent: $Observation
Id: WoundCharacteristic
Title: "Wound Characteristic"
Description: "This template represents characteristics of a wound (e.g., integrity of suture line, odor, erythema)."

* insert LogicalModelTemplateRootOnly(woundCharacteristic, 2.16.840.1.113883.10.20.22.4.134)

* classCode 1..1
* classCode = #OBS (exactly)
  * ^comment = "SHALL contain exactly one [1..1] @classCode=\"OBS\" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:1098-29938)."
* moodCode 1..1
* moodCode = #EVN (exactly)
  * ^comment = "SHALL contain exactly one [1..1] @moodCode=\"EVN\" (CodeSystem: HL7ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:1098-29939)."
* id 1..*
  * ^comment = "SHALL contain at least one [1..*] id (CONF:1098-29942)."
* code 1..1
  * ^comment = "SHALL contain exactly one [1..1] code (CONF:1098-29943)."
  * code 1..1
  * code = #ASSERTION
    * ^comment = "This code SHALL contain exactly one [1..1] @code=\"ASSERTION\" assertion (CONF:1098-31540)."
  * codeSystem 1..1
  * codeSystem = "2.16.840.1.113883.5.4"
    * ^comment = "This code SHALL contain exactly one [1..1] @codeSystem=\"2.16.840.1.113883.5.4\" (CodeSystem: HL7ActCode urn:oid:2.16.840.1.113883.5.4) (CONF:1098-31541)."
* statusCode 1..1
  * code 1..1
  * code = #completed (exactly)
    * ^comment = "SHALL contain exactly one [1..1] statusCode=\"completed\" (CodeSystem: HL7ActStatus urn:oid:2.16.840.1.113883.5.14 STATIC) (CONF:1098-29944)."
* effectiveTime 1..1
  * ^comment = "SHALL contain exactly one [1..1] effectiveTime (CONF:1098-29946)."
* value 1..1
* value only $CD
* value from $2.16.840.1.113883.11.20.9.58 (required)
  * ^comment = "SHALL contain exactly one [1..1] value with @xsi:type=\"CD\", where the code SHALL be selected from ValueSet Wound Characteristic urn:oid:2.16.840.1.113883.11.20.9.58 DYNAMIC (CONF:1098-29947)."
  //"<sliceName value=\"woundCharacteristic\"/>"