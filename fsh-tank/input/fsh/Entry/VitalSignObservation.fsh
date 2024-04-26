Profile: VitalSignObservation
Parent: $Observation
Id: VitalSignObservation
Title: "Vital Sign Observation"
Description: """This template represents measurement of common vital signs. Vital signs are represented with additional vocabulary constraints for type of vital sign and unit of measure.

The following is a list of recommended units for common types of vital sign measurements:

| Name | Unit |
| -------- | ------- |
| PulseOx | % |
| Height/Head Circumf | cm |
| Weight | kg |
| Temp | Cel |
| BP | mm[Hg] |
| Pulse/Resp Rate | /min |
| BMI | kg/m2 |
| BSA | m2 |
| inhaled oxygen concentration | % |
| Average Blood Pressure (Systolic and Diastolic) | mm[Hg] |
| Occipital Front Head Circumference Percentile (Birth -36 months) | % |

"""

* insert LogicalModelTemplate(vital-sign-obs, 2.16.840.1.113883.10.20.22.4.27, 2014-06-09)
* insert NarrativeLink

* classCode 1..1
* classCode = #OBS (exactly)
  * ^comment = "SHALL contain exactly one [1..1] @classCode=\"OBS\" Observation (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:1098-7297)."
* moodCode 1..1
* moodCode = #EVN (exactly)
  * ^comment = "SHALL contain exactly one [1..1] @moodCode=\"EVN\" Event (CodeSystem: HL7ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:1098-7298)."
* id 1..*
  * ^comment = "SHALL contain at least one [1..*] id (CONF:1098-7300)."
* obeys should-code
* code 1..1
  * ^comment = "SHALL contain exactly one [1..1] code (CONF:1098-7301)."
  * code 0..1
  * code from $2.16.840.1.113883.3.88.12.80.62 (preferred)
    * ^comment = "This code SHOULD contain zero or one [0..1] @code, which SHOULD be selected from ValueSet Vital Sign Result Type urn:oid:2.16.840.1.113883.3.88.12.80.62 DYNAMIC (CONF:1098-32934)." // man-should
* statusCode 1..1
  * ^comment = "SHALL contain exactly one [1..1] statusCode (CONF:1098-7303)."
  * code 1..1
  * code = #completed (exactly)
    * ^comment = "This statusCode SHALL contain exactly one [1..1] @code=\"completed\" Completed (CodeSystem: HL7ActStatus urn:oid:2.16.840.1.113883.5.14 STATIC) (CONF:1098-19119)."
* effectiveTime 1..1
  * ^comment = "SHALL contain exactly one [1..1] effectiveTime (CONF:1098-7304)."
* value 1..1
* value only $PQ
  * ^comment = "SHALL contain exactly one [1..1] value with @xsi:type=\"PQ\" (CONF:1098-7305)."
  * unit 1..1
  * unit from UnitsOfMeasureCaseSensitive (required)
    * ^short = "NOTE: The base CDA R2.0 standard requires @unit to be drawn from UCUM, and best practice is to use case sensitive UCUM units"
    * ^comment = "This value SHALL contain exactly one [1..1] @unit, which SHALL be selected from ValueSet UnitsOfMeasureCaseSensitive urn:oid:2.16.840.1.113883.1.11.12839 DYNAMIC (CONF:1098-31579).  Use a default of 1 for @unit when @nullFlavor is present."
* interpretationCode 0..1
  * ^comment = "MAY contain zero or one [0..1] interpretationCode (CONF:1098-7307)."
  * insert BindAtCode($2.16.840.1.113883.1.11.78, required)
* methodCode 0..1
  * ^comment = "MAY contain zero or one [0..1] methodCode (CONF:1098-7308)."
* targetSiteCode 0..1
  * ^comment = "MAY contain zero or one [0..1] targetSiteCode (CONF:1098-7309)."
* obeys should-author
* author 0..*
* author only AuthorParticipation
  * ^comment = "SHOULD contain zero or more [0..*] Author Participation (identifier: urn:oid:2.16.840.1.113883.10.20.22.4.119) (CONF:1098-7310)." // man-should

* obeys should-percent and should-cm and should-kg and should-cel and should-bp and should-rates and should-bmi and should-bsa

Invariant: should-percent
Description: "Percentage codes (PulseOx, O2 Concentration, Percentiles) should be represented with %"
Severity: #warning
Expression: "(code.code in ('2708-6' | '3150-0' | '59408-5' | '8289-1' | '59575-1' | '59576-9')) implies value.unit = '%'"

Invariant: should-cm
Description: "Height & Head Circumference should be represented in cm"
Severity: #warning
Expression: "(code.code in ('8287-5' | '8302-2' | '8306-3' | '9843-4')) implies value.unit = 'cm'"

Invariant: should-kg
Description: "Weight should be represented in kg"
Severity: #warning
Expression: "(code.code = '29463-7') implies value.unit = 'kg'"

Invariant: should-cel
Description: "Temperature should be represented in Celcius (Cel)"
Severity: #warning
Expression: "(code.code = '8310-5') implies value.unit = 'Cel'"

Invariant: should-bp
Description: "Blood pressure should be represented in mm[Hg]"
Severity: #warning
Expression: "(code.code in ('8480-6' | '8462-4' | '8478-0' | '96608-5' | '96609-3')) implies value.unit = 'mm[Hg]'"

Invariant: should-rates
Description: "Rates should be represented in /min"
Severity: #warning
Expression: "(code.code in ('8867-4' | '9279-1')) implies value.unit = '/min'"

Invariant: should-bmi
Description: "BMI should be represented in kg/m2"
Severity: #warning
Expression: "(code.code = '39156-5') implies value.unit = 'kg/m2'"

Invariant: should-bsa
Description: "BSA should be represented in m2"
Severity: #warning
Expression: "(code.code = '3140-1') implies value.unit = 'm2'"
