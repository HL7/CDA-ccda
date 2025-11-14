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

The Result Observation template is a versatile template designed to represent any type of finding resulting from various types of tests. Value set bindings for Observation.code have been created to support implementers, covering three categories: 1) Common Laboratory Tests, 2) Radiology Tests, and 3) Clinical Tests. If a suitable code is not available within these value sets, first use another LOINC code. If no LOINC code is appropriate, a local code may be used.
"""

* insert LogicalModelTemplate(result-obs, 2.16.840.1.113883.10.20.22.4.2, 2023-05-01)
* insert NarrativeLink

* ^status = #draft
* classCode 1..1
* classCode = #OBS (exactly)
  * ^comment = "SHALL contain exactly one [1..1] @classCode=\"OBS\" Observation (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:4537-7130)."
* moodCode 1..1
* moodCode = #EVN (exactly)
  * ^comment = "SHALL contain exactly one [1..1] @moodCode=\"EVN\" Event (CodeSystem: HL7ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:4537-7131)."
* id 1..*
  * ^comment = "SHALL contain at least one [1..*] id (CONF:4537-7137)."
* sdtcCategory 0..*
* sdtcCategory from http://hl7.org/fhir/us/core/ValueSet/us-core-clinical-result-observation-category (preferred)
* code 1..1
  * insert ShallCodeOrNullFlavor
  * insert USCDI([[Tests]])
  * obeys 4537-19212
  * ^comment = "SHALL contain exactly one [1..1] code, which SHOULD be selected from CodeSystem LOINC (urn:oid:2.16.840.1.113883.6.1) (CONF:4537-7133)."
  * insert AdditionalBinding(preferred, $CommonLabTests, Common Lab Tests, [[IFor common lab tests.]])
  * insert AdditionalBinding(preferred, $Radiology, Radiology, [[For radiology.]])
  * insert AdditionalBinding(preferred, $ClinicalTest, Clinical Test, [[For clinical tests.]])  
* statusCode 1..1
  * insert USCDI([[Result Status]])
  * ^comment = "SHALL contain exactly one [1..1] statusCode (CONF:4537-7134)."
  * insert BindAtCode($2.16.840.1.113883.11.20.9.39, required)
* effectiveTime 1..1
  * ^short = "Represents the clinically relevant time of the measurement (e.g., the time a blood pressure reading is obtained, the time the blood sample was obtained for a chemistry test)."
  * ^comment = "SHALL contain exactly one [1..1] effectiveTime (CONF:4537-7140)."
* value 1..1
  * ^slicing.discriminator[0].type = #type
  * ^slicing.discriminator[=].path = "$this"
  * ^slicing.rules = #open
  * insert USCDI([[Values/Results - Value can be any type, but certain types have additional rules.]])
* value contains physical-quantity 0..1 and coded 0..1
* value[physical-quantity] only $PQ
  * unit 1..1
  * unit from http://terminology.hl7.org/ValueSet/v3-UnitsOfMeasureCaseSensitive (preferred)
    * insert USCDI([[Result Unit of Measure - if null flavor is sent, the unit SHALL be set to '1']])
  * translation 0..1
    * ^short = "Can be used to represent the original results as output by the lab"
* value[coded] only $CD
  * obeys 4537-32610
  * translation 0..1
    * ^short = "Can be used to represent the original results as output by the lab"
* obeys should-interpretationCode
* interpretationCode
  * insert USCDI([[Result Interpretation]])
  * ^comment = "SHOULD contain zero or more [0..*] interpretationCode, which SHALL be selected from ValueSet Observation Interpretation (HL7) urn:oid:2.16.840.1.113883.1.11.78 DYNAMIC (CONF:4537-7147)." // man-should
* methodCode 0..1
  * ^comment = "MAY contain zero or one [0..1] methodCode (CONF:4537-7148)."
* targetSiteCode 0..1
  * ^comment = "MAY contain zero or one [0..1] targetSiteCode (CONF:4537-7153)."
* obeys should-author
* author 0..*
* author only AuthorParticipation
  * ^comment = "SHOULD contain zero or more [0..*] Author Participation (identifier: urn:oid:2.16.840.1.113883.10.20.22.4.119) (CONF:4537-7149)." // man-should
* obeys should-referenceRange
* referenceRange 0..*
  * insert USCDI([[Result Reference Range]])
  * ^comment = "SHOULD contain zero or more [0..*] referenceRange (CONF:4537-7150)." // auto-should
  * observationRange 1..1
    * ^comment = "The referenceRange, if present, SHALL contain exactly one [1..1] observationRange (CONF:4537-7151)."
    * value 1..1
      * ^short = "When the value is a quantity, then the unit SHOULD be selected from ValueSet UnitsOfMeasureCaseSensitive."
      * ^comment = "This observationRange SHALL contain exactly one [1..1] value (CONF:4537-32175)."

Invariant: 4537-19212
Description: "This code **SHOULD** be a code from the LOINC that identifies the result observation. If an appropriate LOINC code does not exist, then the local code for this result **SHALL** be sent (CONF:4537-19212)."
Severity: #warning
Expression: "codeSystem = '2.16.840.1.113883.6.1'"

Invariant: 4537-32610
Description: "If Observation/value is a CD (**xsi:type=\"CD\"**) the value **SHOULD** be SNOMED-CT or LOINC (CONF:4537-32610)."
Severity: #warning
Expression: "codeSystem = '2.16.840.1.113883.6.96' or codeSystem = '2.16.840.1.113883.6.1'"
