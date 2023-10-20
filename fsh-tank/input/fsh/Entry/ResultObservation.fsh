Profile: ResultObservation
Parent: $Observation
Id: ResultObservation
Title: "Result Observation"
Description: """This template represents the results of a laboratory, radiology, or other study performed on a patient.

The result observation includes a statusCode to allow recording the status of an observation. Pending results (e.g., a test has been run but results have not been reported yet) should be represented as active ActStatus.

If code contains a valid non-null LOINC then the xsi:type value SHOULD match the LOINC Scale Part based on the table below:

| LOINC Scale Part     | Value xsi:type |
| -------- | ------- |
| Qn - Quantitative | INT, IVL_INT, MO, IVL_MO, REAL, IVL_REAL, PQ, IVL_PQ, RTO, TS, IVL_TS |
| Ord - Ordinal | CD |
| Nom - Nominal | CD |
| Nar - Narrative | ED, ST |
| OrdQn - Quantitative or Ordinal | CD, INT, IVL_INT, MO, IVL_MO, REAL, IVL_REAL, PQ, IVL_PQ, RTO, TS, IVL_TS |
| Multi - Multi | ED |
| Doc - Document | ED |

"""

* insert LogicalModelTemplate(result-obs, 2.16.840.1.113883.10.20.22.4.2, 2023-05-01)

* ^status = #draft
* classCode 1..1
* classCode = #OBS (exactly)
  * ^comment = "SHALL contain exactly one [1..1] @classCode=\"OBS\" Observation (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:4537-7130)."
* moodCode 1..1
* moodCode = #EVN (exactly)
  * ^comment = "SHALL contain exactly one [1..1] @moodCode=\"EVN\" Event (CodeSystem: HL7ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:4537-7131)."
* id 1..*
  * ^comment = "SHALL contain at least one [1..*] id (CONF:4537-7137)."
* code 1..1
  * insert ShallCodeOrNullFlavor
  * obeys 4537-19212
  * ^comment = "SHALL contain exactly one [1..1] code, which SHOULD be selected from CodeSystem LOINC (urn:oid:2.16.840.1.113883.6.1) (CONF:4537-7133)."
* statusCode 1..1
  * ^comment = "SHALL contain exactly one [1..1] statusCode (CONF:4537-7134)."
  * code 1..1
  * code from $2.16.840.1.113883.11.20.9.39 (required)
    * ^comment = "This statusCode SHALL contain exactly one [1..1] @code, which SHALL be selected from ValueSet Result Status urn:oid:2.16.840.1.113883.11.20.9.39 STATIC (CONF:4537-14849)."
* effectiveTime 1..1
  * ^short = "Represents the clinically relevant time of the measurement (e.g., the time a blood pressure reading is obtained, the time the blood sample was obtained for a chemistry test)."
  * ^comment = "SHALL contain exactly one [1..1] effectiveTime (CONF:4537-7140)."
* value 1..1
  * ^slicing.discriminator[0].type = #type
  * ^slicing.discriminator[=].path = "$this"
  * ^slicing.rules = #open
  * ^short = "Value can be any type, but certain types have additional rules listed below."
* value contains physical-quantity 0..1 and coded 0..1
* value[physical-quantity] only $PQ
  * unit 1..1
    * insert USCDI(Result Units)
  * translation 0..1
    * ^short = "Can be used to represent the original results as output by the lab"
* value[coded] only $CD
  * obeys 4537-32610
  * translation 0..1
    * ^short = "Can be used to represent the original results as output by the lab"
  // * obeys 4537-31484 and 4537-32610
  // * insert USCDI([[@unit if xsi:type=PQ is USCDI Result Units.  NOTE for PQ values: The base CDA R2.0 standard requires @unit to be drawn from UCUM, and best practice is to use case sensitive UCUM units]])
  // * ^comment = "A coded or physical quantity value **MAY** contain zero or more [0..&ast;] translations, which can be used to represent the original results as output by the lab (CONF:4537-31866). / SHALL contain exactly one [1..1] value (CONF:4537-7143)."
* interpretationCode from http://terminology.hl7.org/ValueSet/v3-ObservationInterpretation
  * insert USCDI([[Result Interpretation]])
  * ^comment = "SHOULD contain zero or more [0..*] interpretationCode, which SHALL be selected from ValueSet Observation Interpretation (HL7) urn:oid:2.16.840.1.113883.1.11.78 DYNAMIC (CONF:4537-7147)."
* methodCode 0..1
  * ^comment = "MAY contain zero or one [0..1] methodCode (CONF:4537-7148)."
* targetSiteCode 0..1
  * ^comment = "MAY contain zero or one [0..1] targetSiteCode (CONF:4537-7153)."
* specimen 0..*
  * ^short = "Laboratory observations are expected to include the specimen participant. The specimen included at specimenPlayingEntity/code must be consistent with the observation/code."
  * ^comment = "MAY contain zero or more [0..*] specimen (CONF:4537-32611)."
  * specimenRole 1..1
    * ^comment = "The specimen, if present, SHALL contain exactly one [1..1] specimenRole (CONF:4537-32612)."
    * specimenPlayingEntity 1..1
      * ^comment = "This specimenRole SHALL contain exactly one [1..1] specimenPlayingEntity (CONF:4537-32613)."
      * code 1..1
      * code from $2.16.840.1.113762.1.4.1099.54 (preferred)
        * ^comment = "This specimenPlayingEntity SHALL contain exactly one [1..1] code, which SHOULD be selected from ValueSet Specimen type urn:oid:2.16.840.1.113762.1.4.1099.54 DYNAMIC (CONF:4537-32614)."
* author 0..*
* author only AuthorParticipation
  * ^comment = "SHOULD contain zero or more [0..*] Author Participation (identifier: urn:oid:2.16.840.1.113883.10.20.22.4.119) (CONF:4537-7149)."
* obeys should-referenceRange
* referenceRange 0..*
  * insert USCDI([[Result Reference Range]])
  * ^comment = "SHOULD contain zero or more [0..*] referenceRange (CONF:4537-7150)." // auto-should
  * observationRange 1..1
    * ^comment = "The referenceRange, if present, SHALL contain exactly one [1..1] observationRange (CONF:4537-7151)."
    * code 0..0
      * ^comment = "This observationRange SHALL NOT contain [0..0] code (CONF:4537-7152)."
    * value 1..1
      * ^comment = "This observationRange SHALL contain exactly one [1..1] value (CONF:4537-32175)."

Invariant: 4537-19212
Description: "This code **SHOULD** be a code from the LOINC that identifies the result observation. If an appropriate LOINC code does not exist, then the local code for this result **SHALL** be sent (CONF:4537-19212)."
Severity: #warning
Expression: "codeSystem = '2.16.840.1.113883.6.1'"

Invariant: 4537-31484
Description: "If Observation/value is a physical quantity (xsi:type=\"PQ\"): This value SHALL contain exactly one [1..1] @unit, which SHOULD be selected from ValueSet UnitsOfMeasureCaseSensitive urn:oid:2.16.840.1.113883.1.11.12839 DYNAMIC. Note: Base CDA requires that all @unit values SHALL be drawn from UCUM."
Severity: #warning

Invariant: 4537-32610
Description: "If Observation/value is a CD (**xsi:type=\"CD\"**) the value **SHOULD** be SNOMED-CT or LOINC (CONF:4537-32610)."
Severity: #warning
Expression: "codeSystem = '2.16.840.1.113883.6.96' or codeSystem = '2.16.840.1.113883.6.1'"
