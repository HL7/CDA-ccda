Profile: TobaccoUse
Parent: $Observation
Id: TobaccoUse
Title: "Tobacco Use"
Description: """This template represents a patient's tobacco use. 

All the types of tobacco use are represented using the codes from the tobacco use and exposure-finding hierarchy in SNOMED CT, including codes required for recording smoking status in Meaningful Use Stage 2. 

The effectiveTime element is used to describe dates associated with the patient's tobacco use. Whereas the Smoking Status - Meaningful Use template (2.16.840.1.113883.10.20.22.4.78:2014-06-09) represents a "snapshot in time" observation, simply reflecting what the patient's current smoking status is at the time of the observation, this Tobacco Use template uses effectiveTime to represent the biologically relevant time of the observation. Thus, to record a former smoker, an observation of "cigarette smoker" will have an effectiveTime/low defining the time the patient started to smoke cigarettes and an effectiveTime/high defining the time the patient ceased to smoke cigarettes. To record a current smoker, the effectiveTime/low will define the time the patient started smoking and will have no effectiveTime/high to indicated that the patient is still smoking."""

* insert LogicalModelTemplate(tobacco-use, 2.16.840.1.113883.10.20.22.4.85, 2014-06-09)
* insert NarrativeLink

* classCode 1..1
* classCode = #OBS (exactly)
  * ^comment = "SHALL contain exactly one [1..1] @classCode=\"OBS\" Observation (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:1098-16558)."
* moodCode 1..1
* moodCode = #EVN (exactly)
  * ^comment = "SHALL contain exactly one [1..1] @moodCode=\"EVN\" Event (CodeSystem: HL7ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:1098-16559)."
* id 1..*
  * ^comment = "SHALL contain at least one [1..*] id (CONF:1098-32400)."
* code 1..1
  * ^comment = "SHALL contain exactly one [1..1] code (CONF:1098-19174)."
  * code 1..1
  * code = #11367-0
    * ^comment = "This code SHALL contain exactly one [1..1] @code=\"11367-0\" History of tobacco use (CONF:1098-19175)."
  * codeSystem 1..1
  * codeSystem = "2.16.840.1.113883.6.1"
    * ^comment = "This code SHALL contain exactly one [1..1] @codeSystem=\"2.16.840.1.113883.6.1\" (CodeSystem: LOINC urn:oid:2.16.840.1.113883.6.1) (CONF:1098-32172)."
* statusCode 1..1
  * ^comment = "SHALL contain exactly one [1..1] statusCode (CONF:1098-16561)."
  * code 1..1
  * code from $2.16.840.1.113762.1.4.1240.6 (required)
  * ^comment = "This statusCode SHALL contain exactly one [1..1] @code, which SHALL be selected from ValueSet Completed or Nullified Act Status urn:oid:2.16.840.1.113762.1.4.1240.6."
* effectiveTime 1..1
  * ^short = "The effectiveTime represents the biologically relevant time of the observation. A \"former smoker\" is recorded with the proper code \"current smoker\" with an effectiveTime/low and effectiveTime/high  defining the time during which the patient was a smoker."
  * ^comment = "SHALL contain exactly one [1..1] effectiveTime (CONF:1098-16564)."
  * low 1..1
    * ^comment = "This effectiveTime SHALL contain exactly one [1..1] low (CONF:1098-16565)."
  * high 0..1
    * ^comment = "This effectiveTime MAY contain zero or one [0..1] high (CONF:1098-31431)."
* value 1..1
* value only $CD
  * ^comment = "SHALL contain exactly one [1..1] value with @xsi:type=\"CD\" (CONF-1098-16562)."
  * code 1..1
  * code from $2.16.840.1.113883.11.20.9.41 (required)
    * ^comment = "This value SHALL contain exactly one [1..1] @code,  which SHALL be selected from ValueSet Tobacco Use urn:oid:2.16.840.1.113883.11.20.9.41 DYNAMIC (CONF:1098-16563)."
* author 0..*
* author only AuthorParticipation
  * ^comment = "SHOULD contain zero or more [0..*] Author Participation (identifier: urn:oid:2.16.840.1.113883.10.20.22.4.119) (CONF:1098-31152)."