Profile: SocialHistoryObservation
Parent: $Observation
Id: SocialHistoryObservation
Title: "Social History Observation"
Description: """This template represents a patient's job (occupation and industry), lifestyle, and environmental health risk factors. Demographic data (e.g., marital status, race, ethnicity, religious affiliation) are captured in the header. Though tobacco use and exposure may be represented with a Social History Observation, it is recommended to use the Current Smoking Status template or the Tobacco Use template instead, to represent smoking or tobacco habits.
There are supplemental templates and guidance for observations of [Occupational Data for Health](https://www.hl7.org/implement/standards/product_brief.cfm?product_id=522), [nutrition](https://www.hl7.org/implement/standards/product_brief.cfm?product_id=478) and [pregnancy](https://www.hl7.org/implement/standards/product_brief.cfm?product_id=494) that could be captured in the Social History Observation, and implementers may want to consider using those more specific templates in the Social History section."""

* insert LogicalModelTemplate(social-history-obs, 2.16.840.1.113883.10.20.22.4.38, 2022-06-01)
* insert NarrativeLink

* classCode 1..1
* classCode = #OBS (exactly)
  * ^comment = "SHALL contain exactly one [1..1] @classCode=\"OBS\" Observation (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:4515-8548)."
* moodCode 1..1
* moodCode = #EVN (exactly)
  * ^comment = "SHALL contain exactly one [1..1] @moodCode=\"EVN\" Event (CodeSystem: HL7ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:4515-8549)."
* id 1..*
  * ^comment = "SHALL contain at least one [1..*] id (CONF:4515-8551)."
* insert FixedCategory(social-history, http://terminology.hl7.org/CodeSystem/observation-category, Social History, social-history)
* code 1..1
* code from $2.16.840.1.113762.1.4.1267.28 (preferred)
  * obeys 4515-32956
* statusCode 1..1
  * ^comment = "SHALL contain exactly one [1..1] statusCode (CONF:4515-8553)."
  * code 1..1
  * code = #completed (exactly)
    * ^comment = "This statusCode SHALL contain exactly one [1..1] @code=\"completed\" Completed (CodeSystem: HL7ActStatus urn:oid:2.16.840.1.113883.5.14 STATIC) (CONF:4515-19117)."
* effectiveTime 1..1
  * ^comment = "SHALL contain exactly one [1..1] effectiveTime (CONF:4515-31868)."
* obeys 4515-8555
* insert ShouldElement(value)
* value 0..1
  * insert USCDI([[Alcohol Use, Substance Use, SDOH Problems/Health Concerns]])
  * ^slicing.discriminator[0].type = #type
  * ^slicing.discriminator[=].path = "$this"
  * ^slicing.rules = #open
  * ^comment = "SHOULD contain zero or one [0..1] value (CONF:4515-8559)." // auto-should
* value contains physical-quantity 0..1 and coded 0..1
* value[physical-quantity] only $PQ
  * unit 1..1
  * unit from http://terminology.hl7.org/ValueSet/v3-UnitsOfMeasureCaseSensitive (preferred)
* value[coded] only $CD
  * ^binding.strength = #example
  * ^binding.description = "See additional binding"
  * insert AdditionalBinding(preferred, $SDoHConditions, Social Determinant of Health Observations, [[If the Social History Observation is a Social Determinant of Health Observation, the observation/value code **SHOULD** be selected from ValueSet [Social Determinant of Health Conditions 2.16.840.1.113762.1.4.1196.788](https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1196.788/expansion) **DYNAMIC** (CONF:4515-32957).]])
* obeys should-sh-author
* author 0..*
* author only AuthorParticipation
  * ^comment = "SHOULD contain zero or more [0..*] Author Participation (identifier: urn:oid:2.16.840.1.113883.10.20.22.4.119) (CONF:4515-31869)." // man-should
* entryRelationship 0..*
  * ^slicing.discriminator[0].type = #profile
  * ^slicing.discriminator[=].path = "act"
  * ^slicing.discriminator[+].type = #profile
  * ^slicing.discriminator[=].path = "observation"
  * ^slicing.rules = #open
  * ^comment = "MAY contain zero or more [0..*] entryRelationship (CONF:4515-32969) such that it"
* entryRelationship contains
    supportingObs 0..* and
    entryReference 0..*
* entryRelationship[supportingObs] ^short = "When an Assessment Scale Observation is contained in a Social History Observation instance that is a Social Determinant of Health Social History Observation, that Assessment Scale Observation MAY contain Assessment Scale Supporting Observations that contain LOINC question and answer pairs from SDOH screening instruments."
  * ^comment = "MAY contain zero or more [0..*] entryRelationship (CONF:4515-32958) such that it"
  * typeCode 1..1
  * typeCode = #SPRT (exactly)
    * ^comment = "SHALL contain exactly one [1..1] @typeCode=\"SPRT\" Has support (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:4515-32960)."
  * observation 1..1
  * observation only AssessmentScaleObservation
    * ^comment = "SHALL contain exactly one [1..1] Assessment Scale Observation (identifier: urn:oid:2.16.840.1.113883.10.20.22.4.69) (CONF:4515-32959)."
* entryRelationship[entryReference] ^short = "When an Entry Reference is contained in a Social History Template instance that is a Social Determinant of Health Social History, that Entry Reference **MAY** reference an Assessment Scale Observation elsewhere in the document that represent LOINC question and answer pairs from SDOH screening instruments."
  * ^comment = "MAY contain zero or more [0..*] entryRelationship (CONF:4515-32969) such that it"
  * typeCode 1..1
  * typeCode = #SPRT (exactly)
    * ^comment = "SHALL contain exactly one [1..1] @typeCode=\"SPRT\" Has support (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:4515-32971)."
  * act 1..1
  * act only EntryReference
    * ^comment = "SHALL contain exactly one [1..1] Entry Reference (identifier: urn:oid:2.16.840.1.113883.10.20.22.4.122) (CONF:4515-32970)."

Invariant: 4515-32956
Description: "If @codeSystem is not LOINC, then this code **SHALL** contain at least one [1..*] translation, which **SHOULD** be selected from CodeSystem LOINC (urn:oid:2.16.840.1.113883.6.1) (CONF:4515-32956)."
Severity: #warning
Expression: "codeSystem = '2.16.840.1.113883.6.1' or translation.where(codeSystem = '2.16.840.1.113883.6.1').exists()"

Invariant: 4515-8555
Description: "If Observation/value is a physical quantity (xsi:type=\"PQ\"): This value SHALL contain exactly one [1..1] @unit, which SHOULD be selected from ValueSet UnitsOfMeasureCaseSensitive urn:oid:2.16.840.1.113883.1.11.12839 DYNAMIC. Note: Base CDA requires that all @unit values SHALL be drawn from UCUM."
Severity: #error

//This breaks the IG Publisher Expression: "value is CDA.PQ implies value.unit.exists()"
