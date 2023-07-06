The United States Core Data for Interoperability (USCDI)^138 is a standardized set of health data classes and
constituent data elements for nationwide, interoperable health information exchange.
To support implementers in meeting this data policy, the HL7 community recommends following guidance in this
section.

### General USCDI Guidance

This section contains high level guidance that applies across USCDI Data Classes and Data Elements.

#### Best Practices for Implementing Templates revised to support USCDI v2 and v3

See Section 4.1.5 Declaring Section Template Conformance which includes a subsection on best practices for
including templateIds when using new or revised templates supporting USCDI v2 and v3.

#### Social Determinant of Health Vocabulary Design Notes

The [ONC US Core Data for Interoperability (USCDI) v2](https://www.healthit.gov/isa/united-states-core-data-interoperability-uscdi#uscdi-v2) update in July 2021 included several social determinants of
health concepts, including problems, goals, procedures, and service requests. The [HL7 Accelerator Gravity Project](https://www.hl7.org/gravity/)
launched in 20 20 to improve how we use and share information on social determinants of health and built an
SDOH clinical care implementation guide.

For the SDOH Clinical Care HL7 Implementation Guide, the Gravity project has defined the following value sets
across specific social risk factor domains for problems/health concerns, goals, procedures, and service requests:

- [Social Determinants of Health Conditions Value Set](https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1196.788/expansion)
- [Social Determinants of Health Procedures Value Set](https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1196.789/expansion)
- [Social Determinants of Health Goals Value Set](https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.71/expansion)
- [Social Determinants of Health Service Requests Value Set](https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1196.790/expansion) (Used in the Planned Procedure Template)

^138 https://www.healthit.gov/isa/sites/isa/files/2022-10/USCDI-Version-3-October-2022-Errata-Final.pdf

The Figure below illustrates how the Gravity value sets are grouped for use in the C- CDA Problem Observation
template.

**Figure 8: Example of SDOH Grouping Value set in VSAC (Conditions)**
<table><tr><td><img src="Figure 8 Example of SDOH Grouping Value set in VSAC (Conditions).png" /></td></tr></table>


As Gravity did not focus upon detailed work information, such concepts are not included in this value set. For
communicating detailed observations related to an individual’s work information, implementers can consider
utilizing the templates in the C-CDA 2.1 Supplemental Templates for Occupational Data for Health implementation
guide.

### USCDI Data Class and Data Element Guidance

In the sections below, specific guidance is included related to each of the USCDI v2 and V3 Data Classes and Data
Elements.

#### Assessment and Plan of Treatment

Represents a health professional’s conclusions and working assumptions that will guide treatment of the
patient.

| **USCDI v2 DATA ELEMENT**   | **USCDI Vocabulary Requirement**    | Template    | XPath    |
| ---- | ------ | ------ | ------ |
| [SDOH Assessment](https://www.healthit.gov/isa/taxonomy/term/1801/uscdi-v2)<br />Structured evaluation of risk (e.g., PRAPARE, Hunger Vital Sign, AHC-HRSN screening tool) for any Social Determinants of Health domain such as food, housing, or transportation security. SDOH data relate to conditions in which people live, learn, work, and play and their effects on health risks and outcomes. | - Logical Observation Identifiers Names and Codes (LOINC®) version 2.70<br/> - SNOMED International, Systematized Nomenclature of Medicine Clinical Terms (SNOMED CT®) U.S. Edition, March 2021 Release | Assessment<br />Scale<br />Observation  | The whole template and contained supporting observation  |
{:.grid}
## Table 68: USCDI v2 Data Elements - Assessment and Plan of Treatment

##### SDOH Assessment

Assessment Screenings can represent a structured evaluation of risk (e.g., PRAPARE, Hunger Vital Sign, AHC-HRSN
screening tool) for any Social Determinants of Health domain such as food, housing, or transportation security. The
assessment scale responses are represented in C-CDA with the Assessment Scale Observation (V2)
2.16.840.1.113883.10.20.22.4.69:2022- 06 -01 and its contained Assessment Scale Supporting Observation
2.16.840.1.113883.10.20.22.4.86. The Social History Observation (V4) 2.16.840.1.113883.10.20.22.4.38:2022-06-
01 is for simple observations made by an individual about a patient's social history status during the course of care.
Both can contribute to the identification of SDOH Problems (Conditions) or Observations or can be the reason for
Service Requests (Planned Procedures) or Procedures.

Assessment Scale Observation (V2) 2.16.840.1.113883.10.20.22.4.69:2022- 06 -01 and its contained Assessment
Scale Supporting Observation 2.16.840.1.113883.10.20.22.4.86 are designed to represent [LOINC Panels](https://loinc.org/panels/) that are
collections of LOINC terms that represent specific sets of information, intended for forms or assessments related
to health that are completed by patients and/or providers.

When an Assessment Scale Observation is contained in a Problem Observation, a Social History Observation, a
Procedure, or a Planned Procedure instance that is Social Determinant of Health focused, that Assessment scale
may contain assessment scale observations that represent question and answer pairs from SDOH screening
instruments.

For communicating detailed observations related to an individual’s work information, implementers can consider
utilizing the templates in the [C- CDA 2.1 Supplemental Templates for Occupational Data for Health](https://www.hl7.org/implement/standards/product_brief.cfm?product_id=522) implementation
guide.

SDOH Observations and Survey Screenings and the resultant plans and interventions are foundational towards
improving a person's overall health and wellness when confronted with health problems.


**Figure 9: SDOH Assessment and Planning Process**
<table><tr><td><img src="Figure 9 SDOH Assessment and Planning Process.png" /></td></tr></table>

#### Care Team Member(s)

Represents information about a person who participates or is expected to participate in the care of a patient.

| **USCDI v2 DATA ELEMENT**   | **USCDI Vocabulary Requirement**    | Template    | XPath    |
| ---- | ------ | ------ | ------ |
| [Care Team Member Name](https://www.healthit.gov/isa/taxonomy/term/1286/uscdi-v2)||CareTeam Member Act|performer/assignedEntity/assignedPerson|
| [Care Team Member Identifier](https://www.healthit.gov/isa/taxonomy/term/1291/uscdi-v2)||CareTeam Member Act|performer/assignedEntity/id|
| [Care Team Member Role](https://www.healthit.gov/isa/taxonomy/term/1301/uscdi-v2) (Function or functions that a person may perform while participating in the care for a patient)||CareTeam Member Act|performer/sdtc:functionCode<br />Additional roles: participant/sdtc:functionCode|
| [Care Team Member Location](https://www.healthit.gov/isa/taxonomy/term/1296/uscdi-v2) (Physical location of provider or other care team member)||CareTeam Member Act|performer/assignedEntity/addr<br />performer/assignedEntity/<br />representedOrganization/addr<br />- When a provider is working on behalf of an organization an addr & telecom SHALL be present in representedOrganization (CONF:4515-184).|
| [Care Team Member Telecom](https://www.healthit.gov/isa/taxonomy/term/1316/uscdi-v2) (Electronic contact information of a provider or other care team member)|ITU-T E.123, Series E: Overall Network Operation, Telephone Service, Service Operation and Human Factors, International Operation - General provisions concerning users: Notation for national and international telephone numbers, email addresses and web addresses (incorporated by reference in § 170.299); and<br />ITU-T E.164, Series E: Overall Network Operation, Telephone Service, Service Operation and Human Factors, International operation - Numbering plan of the international telephone service: The international public telecommunication numbering plan as adopted at 45 CFR 170.207(q)(1)|CareTeam Member Act|performer/assignedEntity/telecom<br />performer/assignedEntity/<br />representedOrganization/telecom<br />- When a provider is working on behalf of an organization an addr & telecom **SHALL** be present in representedOrganization (CONF:4515-184).|
{:.grid}
**Table 69: USCDI V2 Data Elements - Care Team Member(s)**

##### Care Team Member Name

No additional guidance

##### Care Team Member Identifier

No additional guidance

##### Care Team Member Role

No additional guidance

##### Care Team Member Location

No additional guidance

##### Care Team Member Telecom

No additional guidance

#### Clinical Tests

Includes non-imaging and non-laboratory/pathology tests performed on a patient that results in structured or
unstructured (narrative) findings specific to the patient, such as electrocardiogram (ECG), visual acuity exam,
macular exam, or graded exercise testing (GXT), to facilitate the diagnosis and management of conditions.

Please see 5.2.11.1 _Pathology and Laboratory Result Domain_ for examples of types of imaging and
laboratory/pathology tests to clarify what is not a clinical test.

Appendix B in U.S. Core Data for Interoperability (USCDI) Task Force 2021 [HITAC Phase 3 Recommendations Report
Letter](https://www.healthit.gov/sites/default/files/page/2021-10/2021-09-09_USCDI_TF_2021_HITAC_Phase%203_%20Recommendations%20Report_Signed_508.pdf) identifies a starter set of example LOINC codes for “clinical tests''.

| **USCDI v2 DATA ELEMENT**   | **USCDI Vocabulary Requirement**    | Template    | XPath    |
| ---- | ------ | ------ | ------ |
|[Clinical Test](https://www.healthit.gov/isa/taxonomy/term/2456/uscdi-v2)<br />The name of the non-imaging or non-laboratory test performed on a patient.|- Logical Observation Identifiers Names and Codes (LOINC®) version 2.70|Result Organizer<br /><u>Or</u><br /><u>Result Observation</u>|organizer/code<br />Or<br />observation/code|
|[Clinical Test Result/Report](https://www.healthit.gov/isa/taxonomy/term/3166/uscdi-v2)<br />Interpreted results of clinical tests that may include study performed, reason performed, findings, and impressions. Includes both structured and unstructured (narrative) components||Result Observation|observation/value|
{:.grid}
**Table 70: USCDI v2 Data Elements - Clinical Tests**

##### Clinical Test

The organizer/code in the Result Organizer Template (2.16.840.1.113883.10.20.22.4.1) or the Observation/code in
the Result Observation template (2.16.840.1.113883.10.20.22.4.2) records a test that has been performed. To
align with common implementer practice with C- CDA Lab Result Observations, each Clinical Test Result
Observation Template instance should be wrapped in a Result organizer, and the Result/Organizer/code should
equal the Result Observation/code, except when the Clinical Test performed has Test Results that are logically
resulted together. In this case the result observations should not each be wrapped in its own result organizer but
should be resulted together as a bundled result inside the Clinical Test represented by the Organizer/code as
described in the next paragraph.

The Result Organizer Template is designed to be used to wrap Result (test) Observations that are components of
the same test. For example, a visual acuity study (28631-0) Visual acuity study (LOINC) code could be the test
identified at the Result Organizer/code, and the Organizer then contains two Result Observations stating the visual
acuity of each eye (79882-7 LOINC code for _Visual acuity uncorrected Right eye by Snellen eye chart_ and 79883- 5
LOINC code for _Visual acuity uncorrected Left eye by Snellen eye chart_ )
If a system needs to record a planned test, the Planned Procedure template in the Plan of Treatment section is
used

##### Clinical Test Result/Report

The Result Organizer Template (2.16.840.1.113883.10.20.22.4.1) or the Result Observation template
(2.16.840.1.113883.10.20.22.4.2) fulfills the need of the clinical test performed with the Result observation/value
containing the Clinical Test Result/Report.
Observation/Value in the Result Observation Template (2.16.840.1.113883.10.20.22.4.2) contains the result
(fi nding) of the test. Observation/value may be an encoded value, physical quantity or text.

- Text (ST dataType)

```
<observation classCode="OBS" moodCode="EVN">
    <observation classCode="OBS" moodCode="EVN">
        <templateId root="2.16.840.1.113883.10.20.22.4.2"/>
        <templateId root="2.16.840.1.113883.10.20.22.4.2" extension="2023-05-01"/>
        <id root="f1aa44dd-6f39-4f5c-b267-897c3824b563"/>
        <code code="8601-7" displayName="EKG Impression"
            codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
        <statusCode code="completed"/>
        <effectiveTime value="20231023090823-0500"/>
        <!-- Representing a result returned as unstructured string-->
        <value xsi:type="ST">Irregular sinus arrhythmia with both sinus tachycardia
            sinus bradycardia (tachy-brady syndrome).</value>
        <interpretationCode code="A" codeSystem="2.16.840.1.113883.5.83"
            displayName="Abormal" />
    </observation>
```

- Encoded (datatype CD):

```
<observation classCode="OBS" moodCode="EVN">
    <observation classCode="OBS" moodCode="EVN">
        <templateId root="2.16.840.1.113883.10.20.22.4.2"/>
        <templateId root="2.16.840.1.113883.10.20.22.4.2" extension="2023-05-01"/>
        <id root="f1aa44dd-6f39-4f5c-b267-897c3824b563"/>
        <code code="69428-1" displayName="Jugular vein distension"
            codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
        <statusCode code="completed"/>
        <effectiveTime value="20231023090823-0500"/>
        <value xsi:type="CD" code="52101004" displayName="Present"
            codeSystem="2.16.840.1.113883.6.96" codeSystemName="SNOMED CT"/>
        <interpretationCode code="A" codeSystem="2.16.840.1.113883.5.83"
            displayName="Abormal" />
    </observation>
```

- Physical Quantity (dataType PQ)

```
<observation classCode="OBS" moodCode="EVN">
    <observation classCode="OBS" moodCode="EVN">
        <templateId root="2.16.840.1.113883.10.20.22.4.2"/>
        <templateId root="2.16.840.1.113883.10.20.22.4.2" extension="2023-05-01"/>
        <id root="f1aa44dd-6f39-4f5c-b267-897c3824b563"/>
        <code code="41355-9" displayName="Elbow - right Flexion Active Range of Motion
            Quantitative"
            codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
        <statusCode code="completed"/>
        <effectiveTime value="20231023090823-0500"/>
        <value xsi:type="PQ" value="110" unit="deg"/>
        <interpretationCode code="A" codeSystem="2.16.840.1.113883.5.83"
            displayName="Abormal" />
    </observation>
```

#### Diagnostic Imaging

Tests that result in visual images requiring interpretation by a credentialed professional.

| **USCDI v2 DATA ELEMENT**   | **USCDI Vocabulary Requirement**    | Template    | XPath    |
| ---- | ------ | ------ | ------ |
|[Diagnostic Imaging Test](https://www.healthit.gov/isa/taxonomy/term/2466/uscdi-v2)<br />The name of the test performed which generates visual images (radiographic, photographic, video, etc.) of anatomic structures; and requires interpretation by qualified professionals.|- Logical Observation Identifiers Names and Codes (LOINC®) version 2.70|Result Organizer|organizer/code<br />Or<br />observation/code|
|[Diagnostic Imaging Report](https://www.healthit.gov/isa/taxonomy/term/2471/uscdi-v2)<br />Interpreted results of imaging test that includes the study performed, reason, findings, and impressions. Includes both structured and unstructured (narrative) components.||Result Observation|observation/value|
{:.grid}
**Table 71: USCDI v2 Data Elements - Diagnostic Imaging**

##### Diagnostic Imaging Test

Diagnostic Imaging Tests can have several statuses as they move through different systems. Common statuses are
'ordered', 'performed', and 'resulted'. The companion guide recommends the use of Result Organizer and the
statuses of 'active' (ordered /performed), and 'completed' (resulted). The statuses of Cancelled and Aborted may
also be allowed.

##### Diagnostic Imaging Report

When the report is narrative, an entry reference from the observation to the narrative is preferred. See [example.](https://cdasearch.hl7.org/examples/view/Results/Results%20Radiology%20with%20Image%20Narrative)

#### Encounter Information

Information related to interactions between healthcare providers and the subject of care in which healthcare-
related activities take place.

| **USCDI v2 DATA ELEMENT**   | **USCDI Vocabulary Requirement**    | Template    | XPath    |
| ---- | ------ | ------ | ------ |
|[Encounter Diagnosis](https://www.healthit.gov/isa/taxonomy/term/1201/uscdi-v2)|- SNOMED International, Systematized Nomenclature of Medicine Clinical Terms (SNOMED CT®) U.S. Edition, March 2021 Release<br />- International Classification of Diseases ICD10-CM 2021|Encounter Diagnosis -> Problem Observation <br />Hospital Discharge Diagnosis> Problem Observation|observation/value|
|[Encounter Disposition](https://www.healthit.gov/isa/taxonomy/term/1196/uscdi-v2)<br />Identifies the location or type of facility to where the patient left **(WENT)** following a hospital or encounter episode.|None (follow C-CDA)|Encounter Activity|encounter/sdtc:dischargeDispositionCode|
|[Encounter Location](https://www.healthit.gov/isa/taxonomy/term/1336/uscdi-v2)<br />Physical location of facility which delivered a person’s health care or related services.|None (follow C-CDA)|Encounter Activity|encounter/participant/@typeCode="LOC"|
|[Encounter Time](https://www.healthit.gov/isa/taxonomy/term/1191/uscdi-v2)<br />Represents a date/time related to an encounter<br />(e.g., scheduled appointment time, check in time,<br />start and stop times).|None (follow C-CDA)|Encounter Activity|encounter/effectiveTime|
|[Encounter Type](https://www.healthit.gov/isa/taxonomy/term/1186/uscdi-v2)|None (follow C-CDA)|Encounter Activity|encounter/code|
{:.grid}
**Table 72: USCDI v2 Data Elements - Encounter Information**

##### Encounter Diagnosis

A Hospital Discharge Diagnosis [Hospital Discharge Diagnosis (V3) [act, 2.16.840.1.113883.10.20.22.4.33] “counts”
as an Encounter Diagnosis where the encounter is a hospital stay or the last day of a hospital stay. If there are
other (ambulatory, for example) encounters included in the document, those other encounters would need to
have a separate instance of a diagnosis for Encounter Diagnosis (using Encounter Diagnosis [act,
2.16.840.1.113883.10.20.22.4.80], even if it’s the same diagnosis.

##### Encounter Disposition

Implementers should note that a Discharge Disposition is not appropriate for all document types

- Hospital Discharge Summary documents SHOULD have a discharge disposition
- Progress Notes, or H&P, typically won't have a discharge disposition.

In Encounter Summaries the Encounter Disposition will also be present in the document header at
componentOf/encompassingEncounter/dischargeDispositionCode, but in Patient Summaries,
componentOf/encompassingEncounter SHALL NOT be present.
While an Encounter Summary provides a snapshot of the patient’s condition at the time of the encounter as
authored by the clinician, a Patient summary provides the most current information available from the sending
system [across multiple encounters^139](https://carequality.org/wp-content/uploads/2022/03/Improve-C-CDA-Joint-Content-WG-v2.0-FINAL-COPY-20220316.pdf).

^139 https://carequality.org/wp-content/uploads/2022/03/Improve-C-CDA-Joint-Content-WG-v2.0-FINAL-COPY-20220316.pdf

##### Encounter Location

In Encounter Summaries the Encounter Location will also be present in the document header at
componentOf/encompassingEncounter/location, but in Patient Summaries,
componentOf/encompassingEncounter SHALL NOT be present.

##### Encounter Time

In Encounter Summaries the Encounter Time will also be present in the document header at
componentOf/encompassingEncounter/effectiveTime, but for Patient Summaries,
componentOf/encompassingEncounter SHALL NOT be present.

##### Encounter Type

In Encounter Summaries the Encounter Type will also be present in the document header at
componentOf/encompassingEncounter/code, but for Patient Summaries,
componentOf/encompassingEncounter SHALL NOT be present.

Implementers should note that only conveying Encounter Type in the document header at
componentOf/encompassingEncounter/code is insufficient.

#### Goals

An expressed desired health state to be achieved by a subject of care (or family/group).

| **USCDI v2 DATA ELEMENT**   | **USCDI Vocabulary Requirement**    | Template    | XPath    |
| ---- | ------ | ------ | ------ |
|[SDOH Goals](https://www.healthit.gov/isa/taxonomy/term/1836/uscdi-v2)<br />Identifies a future desired condition or change in condition related to an SDOH risk in any domain and is established by the patient or provider. (e.g., Has adequate quality meals and snacks, Transportation security-able to access health and social needs). SDOH data relate to conditions in which people live, learn, work, and play and their effects|- SNOMED International, Systematized Nomenclature of Medicine Clinical Terms (SNOMED CT®) U.S. Edition, March 2021 Release<br />- Logical Observation Identifiers Names and Codes (LOINC®) version 2.70|Goal Observation|observation/code<br />and/or<br />observation/value|
{:.grid}
**Table 73: USCDI v2 Data Elements - Goals**

##### SDOH Goals

The updated Goals Observation template includes a value set for conveying SDOH goals.

For SDOH value sets, see Section 6.1.2 [Social Determinant of Health Vocabulary Design Notes](uscdi_guidance.html#social-determinant-of-health -vocabulary-design-notes)

#### Health Insurance Information

Identifiers are integral components of health insurance information and processing. The table below includes key
common identifiers and where they are located within C-CDA health insurance related templates. Typically,
organizations own Object Identifiers (OIDs) that are used to computably identify the organization. These are held
in the roots of IDs in CDA documents. Occasionally, an organization may not have an OID identifier. While it is
recommended that organizations obtain OIDs, if the organization has no identifying root, the root may be omitted,
the null flavor attribute set to "UNK", and the ID still sent in the extension attribute.

- Example for an organization without an OID: <id nullFlavor="UNK" extension="1234S6789"/>
- Example for an organization with an OID (Medicare): <id root="2.16.840.1.113883.4.927"
    extension="1EG4-TE5-MK73"/>


| **USCDI v2 DATA ELEMENT**   | **USCDI Vocabulary Requirement**    | Template    | XPath    |
| ---- | ------ | ------ | ------ |
|[Coverage Status](https://www.healthit.gov/isa/taxonomy/term/3601/uscdi-v3)<br />Presence or absence of health care insurance.|None (follow C-CDA)|Coverage Activity|act/effectiveTime/@value|
|[Coverage Type](https://www.healthit.gov/isa/taxonomy/term/2351/uscdi-v3)<br />Category of health care payers. (e.g., Medicare, TRICARE, Commercial Managed Care - PPO)|None (follow C-CDA)|Policy Activity|act/code|
|[Relationship to Subscriber](https://www.healthit.gov/isa/taxonomy/term/3581/uscdi-v3)<br />Relationship of a patient to the primary insured person.|None (follow C-CDA)|Policy Activity<br />participant/@typeCode="COV" Coverage target<br />("2.16.840.1.113883.10.20.22.4.89" Covered Party Participant)|participant/@typeCode="COV"/participantRole/code/@code|
|[Member Identifier](https://www.healthit.gov/isa/taxonomy/term/2751/uscdi-v3)<br />Sequence of characters used to uniquely refer to an individual with respect to their insurance.|None (follow C-CDA)|Policy Activity<br />participant/@typeCode="COV" Coverage target<br />("2.16.840.1.113883.10.20.22.4.89" Covered Party Participant)|act/participant/templateId/@root="2.16.840.1.113883.10.20.22.4.89"/participantRole/id|
|[Subscriber Identifier](https://www.healthit.gov/isa/taxonomy/term/2341/uscdi-v3)<br />Sequence of characters used to uniquely refer to the individual that selects insurance benefits.|None (follow C-CDA)|Policy Activity|act/participant/@typeCode="HLD"/templateId/@root="2.16.840.1.113883.10.20.22.4.90"/participantRole/id<br />OR if SELF<br />@typeCode="COV"/templateId/@root="2.16.840.1.113883.10.20.22.4.89"/participantRole/id|
|[Group Identifier](https://www.healthit.gov/isa/taxonomy/term/2361/uscdi-v3)<br />Sequence of characters used to uniquely refer to a specific health insurance plan.|None (follow C-CDA)|Policy Activity|act/templateId/@root="2.16.840.1.113883.10.20.22.4.61"/id|
|[Payer Identifier](https://www.healthit.gov/isa/taxonomy/term/2346/uscdi-v3)<br />Sequence of characters used to uniquely refer to an insurance payer.|None (follow C-CDA)|j Activity|act/performer[@typeCode="PRF" AND code/@code="PAYER"]/templateId/@root="2.16.840.1.113883.10.20.22.4.87"/assignedEntity/id|
{:.grid}

##### Coverage Status

The C-CDA model records the coverage status for a patient using the coverage activity effectiveTime.

The act/effectiveTime@value records the date when you checked the coverage for a patient, and applies for all
policies within the coverage activity. If systems choose to include a time they may need multiple Coverage Activity
Acts to represent the moment of the eligibility check. Details on a specific Policy coverage period, or self-pay
period, systems can record an additional effectiveTime inside the Policy Activity. Systems may prioritize Coverages
using the sequenceNumber.

##### Coverage Type

No additional guidance

##### Relationship to Subscriber

See the latest guidance added to Policy Activity V4 which includes a new value set.

##### Member Identifier

No additional guidance

##### Subscriber Identifier

No additional guidance

##### Group Identifier

No additional guidance

##### Payer Identifier

See the latest guidance added to Policy Activity V4.

#### Health Status/Assessments

An expressed desired health state to be achieved by a subject of care (or family/group).
Proposed Text: Assessments represent health-related matters of interest, importance, or worry to a patient,
patient's family, or patient's healthcare provider that could identify a need, problem, or condition.

| **USCDI v2 DATA ELEMENT**   | **USCDI Vocabulary Requirement**    | Template    | XPath    |
| ---- | ------ | ------ | ------ |
|[Functional Status](https://www.healthit.gov/isa/taxonomy/term/3241/uscdi-v3)<br />Assessment of a patient’s capabilities, or their risks of development or worsening of a condition or problem. (e.g., fall risk, pressure ulcer risk, alcohol use)|- Logical Observation Identifiers Names and Codes (LOINC®) version 2.72|Functional Status Section<br />**Full Assessment**<br />Assessment Scale Observation + Assessment Scale Supporting Observation <br />**Clinical Judgement** Functional Status Observation|**Full Assessment**<br />Assessment Scale Observation<br />observation/code<br />observation/effectiveTime<br />observation/value<br />Assessment Scale Supporting Observationobservation/code<br />observation/value<br />**Clinical Judgement**<br />Functional Status Observation<br />observation/code<br />observation/effectiveTime<br />observation/value|
|[Disability Status](https://www.healthit.gov/isa/taxonomy/term/3276/uscdi-v3)<br />Assessments of a patient’s physical, cognitive, intellectual, or psychiatric disabilities. (e.g., vision, hearing, memory, activities of daily living)|- Logical Observation Identifiers Names and Codes (LOINC®) version 2.72|Disability Status Observation|observation/code<br />observation/effectiveTime<br />observation/value|
|[Mental/Cognitivie Status](https://www.healthit.gov/isa/taxonomy/term/1616/uscdi-v3)<br />Assessment of a patient's level of cognitive functioning. (e.g., alertness, orientation, comprehension, concentration, and immediate memory for simple commands)|- Logical Observation Identifiers Names and Codes (LOINC®) version 2.72|Mental Status Section<br />**Full Assessment**<br />Assessment Scale Observation + Assessment Scale Supporting Observation <br />**Clinical Judgement** Mental Status Observation||**Full Assessment**<br />Assessment Scale Observation<br />observation/code<br />observation/effectiveTime<br />observation/value<br />Assessment Scale Supporting Observation<br />observation/code<br />observation/value<br />**Clinical Judgement**<br />Mental Status Observation<br />observation/effectiveTime<br />observation/value|
|[Pregnancy Status](https://www.healthit.gov/isa/taxonomy/term/1651/uscdi-v3)<br />State or condition of being pregnant or intent to become pregnant. (e.g., pregnant, not pregnant, intent to become pregnant, unknown)|None (follow C-CDA)|Pregnancy Observation|observation/value|
{:.grid}

##### Functional Status

A clinician, or caregiver, may record the functional status of a patient (e.g., mobility status, activities of daily living, self-care status) using a formal assessment tool, or a simple assertion. When a clinician uses a formal instrument, such as the Glasgow Coma scale, systems are encouraged to use the Assessment Scale Observation to group a series of Assessment Scale Supporting Observations. See the approved [Functional Assessment - Glasgow Coma](http://cdasearch.hl7.org/examples/view/Functional%20Status/Functional%20Assessment%20-%20Glasgow%20Coma) example. Note, the best practice is to include the final 'score' in both the Assessment Scale Observation/value in addition to an individual Assessment Scale Supporting Observation. Use of the prior

Functional Status Organizer and Functional Status Observation is discouraged since the it promotes inconsistent generation of an Organizer/Observation when a generic Assessment Scale Observation/Assessment Scale Supporting Observation is sufficient. In a future release of C-CDA, Structured Documents will deprecate these legacy templates.

In certain situations a clinician may make a judgement about a patient's physical function. The Functional Status Observation is the appropriate place to record this judgement. See approved [Functional Impairment](http://cdasearch.hl7.org/examples/view/Functional%20Status/Functional%20Impairment) example.

##### Disability Status

A clinician can use the new Disability Status Observation to assert a specific concern about a patient. A prior HL7
standard, the electronic initial case report (eICR), created a Disability Status Observation template constrained to 8
concepts (see VSAC (log-in required): [Disability Status](https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1099.49/expansion)). The eICR project is restricted to report "minimum
necessary” data needed for public health case reporting. The new Disability Status Observation is not limited to
these 8 concepts, and adds the ability to include an Assessment Scale Observation/Assessment Scale Supporting
Observation.

##### Mental/Cognitive Status

A clinician, or caregiver, may record the Mental/Cognitive Status of a patient's psychological and mental
competency using a formal assessment tool, or a simple assertion. When a clinician uses a formal instrument, such
as the [Patient Health Questionnaire-9 (PHQ-9)](https://cdasearch.hl7.org/examples/view/Mental%20Status/Patient%20Health%20Questionnaire%20PHQ-9), systems are encouraged to use the Assessment Scale Observation
to group a series of Assessment Scale Supporting Observations. See the approved Patient Health Questionnaire
PHQ- 9 example. Note, the best practice is to include the final 'score' in both the Assessment Scale
Observation/value in addition to an individual Assessment Scale Supporting Observation. Use of the prior Mental
Status Organizer and Mental Status Observation is discouraged since the it promotes inconsistent generation of an
Organizer/Observation when a generic Assessment Scale Observation/Assessment Scale Supporting Observation is
sufficient. In a future release of C-CDA, Structured Documents will deprecate these legacy templates.

In certain situations a clinician may make a judgement about a patient's Mental/Cognitive Status function. The
Mental Status Observation is the appropriate place to record this judgement. See approved [Memory
Impairment](https://cdasearch.hl7.org/examples/view/Mental%20Status/Memory%20Impairment) example.

##### Pregnancy Status

The existing C-CDA Pregnancy Observation represents current and/or prior pregnancy dates. Systems wishing to
capture the intent to become pregnant can include the [Pregnancy Intention in Next Year](https://trifolia.auth0.com/u/login?state=hKFo2SAyRDZhSzdXVFloM0UtSGhDbzc4d2pkUzhDQ0dEd2ZTS6Fur3VuaXZlcnNhbC1sb2dpbqN0aWTZIG1Nem90cGJLVWJseEhQai0tNVlhMjlsZEhXYkpqS2RHo2NpZNkgbXBYV3dwQU9CVHQ1YVVNMVNFMnE1S3VVdHI0WXZVRTk) in the Social History
Section.

#### Laboratory

Analysis of clinical specimens to obtain information about the health of a patient.

| **USCDI v2 DATA ELEMENT**   | **USCDI Vocabulary Requirement**    | Template    | XPath    |
| ---- | ------ | ------ | ------ |
|[Specimen Type](https://www.healthit.gov/isa/taxonomy/term/2491/uscdi-v3)<br />Substance being sampled or tested. (e.g., nasopharyngeal swab, whole blood, serum, urine, wound swab).|SNOMED International, Systematized Nomenclature of Medicine Clinical Terms (SNOMED CT) U.S. Edition, March 2022 Release|Result Organizer<br />Result Observation|organizer/specimen/specimenRole/specimenPlayingEntity/code organizer/observation/specimen/specimenRole/specimenPlayingEnt|
|[Result Status](https://www.healthit.gov/isa/taxonomy/term/2441/uscdi-v3)<br />State or condition of a laboratory test.|None (follow C-CDA)|Result Observation|observation/statusCode|
{:.grid}


#### Specimen Type

The Result Organizer/specimen is used when all Result Observations are from the same specimen. If any of the
Result Observations use a different specimen they must be recorded individually at
the Organizer/observation/specimen.

#### Result Status

The observation/statusCode uses the Result Status value set (2.16.840.1.113883.11.20.9.39) to allow systems to
record result status, such as 'in process' (active) or 'final' (completed).

#### Medication

| **USCDI v2 DATA ELEMENT**   | **USCDI Vocabulary Requirement**    | Template    | XPath    |
| ---- | ------ | ------ | ------ |
|[Dose](https://www.healthit.gov/isa/taxonomy/term/1236/uscdi-v3)
Amount of a medication for each administration.|None (follow C-CDA)|Medication Information|substanceAdministration/doseQuantity/@value|
|[Dose Unit of Measure](https://www.healthit.gov/isa/taxonomy/term/1516/uscdi-v3)
Units of measure of a medication. (e.g., milligrams, milliliters)|The Unified Code for Units of Measure, Revision 2.1|Medication Information|substanceAdministration/doseQuantity/@value and @unit|
|[Indication](https://www.healthit.gov/isa/taxonomy/term/1546/uscdi-v3)
Sign, symptom, or medical condition that leads to the recommendation of a treatment, test, or procedure.|None (follow C-CDA)|Medication Activity - >Indication|observation/value|
|[Fill Status](https://www.healthit.gov/isa/taxonomy/term/1586/uscdi-v3)
State of a medication with regards to dispensing or other activity. (e.g., dispensed, partially dispensed, not dispensed)|None (follow C-CDA)|Medication Dispense|supply/code|
{:.grid}

#### Dose

Dose (doseQuantity) represents how many of the consumables (a medication code that is precoordinated with the
dose) are to be administered at each administration event. As a result, the dose is always relative to the
consumable. Dose (doseQuantity) will often be unitless number that indicates the number of products given per
administration (e.g., "2", meaning 2 x "metoprolol 25mg tablet" per administration).

`<doseQuantity value="2"/>`

`<doseQuantity value="2" unit="{tablet}" />`

When a unit is omitted, or text is included in curly braces ({}), the unit is equivalent to '1'.

It is not recommended to communicate the consumable as "metoprolol" and include a doseQuantity of "50 mg":

`<doseQuantity value="50" unit="mg" />`

##### Dose Unit of Measure

Dose Unit of Measure should only be leveraged when the dose unit of measure value is not precoordinated in the
medication code.

Example: 
```<doseQuantity value="5" unit="mg/kg" />```

##### Indication

An Indication Template (2.16.840.1.113883.10.20.22.4.19) that is contained in a Medication Activity Template is
used to represent the sign, symptom, or medical condition that led to the ordering or administration of the
medication.

The Indication template belongs as an entryRelationship under the medication activity with typeCode=SUBJ and
inversionInd=true.

##### Fill Status

C- CDA doesn't include a field to explicitly share number of Refill remaining on a prescription. The Fill Status can be
obtain by combing the Medication Supply (Prescription Order), and the Medication Dispense (Pharmacist
provision).

In the Medication Supply ("INT" intent mood), the repeatNumber defines the number of allowed dispenses. For
example, a repeatNumber of "3" means that the substance can be dispensed up to 3 times. This is <u>not</u> equivalent
to refills.

In the Medication Dispense ("EVN" event mood), the repeatNumber is the number of dispenses. For example, a
repeatNumber of "3" indicates the third dispense. This is <u>not</u> equivalent to refills.

Use Case: A patient has 6 fills allowed

Event Mood:

They have filled 4 times

- Dispense #1 - quantity - 75; repeatNumber = 1 This is the first time the medication is dispensed. Repeat
Number 1 is the first instance and not a refill. 5 refills remain.
- Dispense #2 - quantity - 75; repeatNumber = 2 Repeat number 2 is second fill, but the the first refill. 4 refills
remain.
- Dispense #3 - quantity - 75; repeatNumber = 3
- Dispense #4 - quantity - 75; repeatNumber = 4

Intent Mood:

2 remaining refills:

In Intent mood a Supply is the order/information sent to the pharmacy and is not updated at each dispense

- Supply - quantity - 75; repeatNumber = 6 (how many overall allowed!)

#### Patient Demographics

| **USCDI v2 DATA ELEMENT**   | **USCDI Vocabulary Requirement**    | Template    | XPath    |
| ---- | ------ | ---- | ------ |
| [Sexual Orientation](https://www.healthit.gov/isa/taxonomy/term/2741/uscdi-v2)<br />A person’s identification of their emotional, romantic, sexual, or affectional attraction to another person.  | - Sexual orientation must be coded in accordance with SNOMED CT® and HL7 Version 3 Standard, Value Sets for AdministrativeGender and NullFlavor, attributed as follows:<br />- Lesbian, gay or homosexual. 38628009<br />- Straight or heterosexual. 20430005<br />- Bisexual. 42035005<br />- Something else, please describe. nullFlavor OTH<br />- Don't know. nullFlavor UNK<br />- Choose not to disclose. nullFlavor ASKU Adopted at 45 CFR 170.207(o)(1) | Sexual Orientation Observation  | observation/value  |
| [Gender Identity](https://www.healthit.gov/isa/taxonomy/term/2736/uscdi-v2)<br />A person’s internal sense of being a man, woman, both, or neither.  | Gender Identify must be coded in accordance with SNOMED CT® and HL7 Version 3 Standard, Value Sets for AdministrativeGender and NullFlavor, attributed as follows:<br />- Male. 446151000124109<br />- Female. 446141000124107<br />- Female-to-Male (FTM)/Transgender Male/Trans Man. 407377005 <br />- Male-to-Female (MTF)/Transgender Female/Trans Woman. 407376001<br />- Genderqueer, neither exclusively male nor female. 446131000124102<br />- Additional gender category or other, please specify. nullFlavor OTH<br />- Choose not to disclose. nullFlavor ASKU Adopted at 45 CFR 170.207(o)(2)| Gender Identity Observation  |  observation/value |
| **USCDI v3 DATA ELEMENT**  | **USCDI Vocabulary Requirement**  | **Template**  | **XPath**  |
| [Date of Death](https://www.healthit.gov/isa/taxonomy/term/2726/uscdi-v3)<br />Known or estimated year, month, and day of the patient's death.  | None (follow C-CDA)  | US Realm Header  | sdtc:deceasedInd sdtc:deceasedTime see: CDA Extensions recordTarget/patientRole/patient  |
| [Tribal Affiliation](https://www.healthit.gov/isa/taxonomy/term/3691/uscdi-v3)<br />Tribe or band with which an individual associates.  | None (follow C-CDA)  | Tribal Affiliation Observation  | observation[code/@code="95370-3"]/value  |
| [Related Person's Name](https://www.healthit.gov/isa/taxonomy/term/2696/uscdi-v3)<br />Name of a person with a legal or familial relationship to a patient.  | None (follow C-CDA)  | Related Person Relationship and Name Participant  | /ClinicalDocument/participant/associatedEntity/associatedPerson/name  |
| [Related Person's Relationship](https://www.healthit.gov/isa/taxonomy/term/2671/uscdi-v3)<br />Relationship of a person to a patient. (e.g., parent, next-of-kin, guardian, custodian)  | None (follow C-CDA)  | Related Person Relationship and Name Participant  | /ClinicalDocument/participant/associatedEntity/code (Personal And Legal Relationship Role Type Value Set)  |
| [Occupation](https://www.healthit.gov/isa/taxonomy/term/3381/uscdi-v3)<br />Type of work of a person. (e.g., infantry, business analyst, social worker)  | - Occupational Data for Health, version 20201030  | Basic Occupation Observation  | observation[code/@code="11341-5"]/value  |
| [Occupation Industry](https://www.healthit.gov/isa/taxonomy/term/3376/uscdi-v3)<br />Type of business that compensates for work or assigns work to an unpaid worker or volunteer. (e.g., U.S. Army, cement manufacturing, children and youth services)  | - Occupational Data for Health, version 20201030  | Basic Industry Observation  | observation[code/@code="86188-0"]/value  |
| [Sex](https://www.healthit.gov/isa/taxonomy/term/731/uscdi-v3)<br />Documentation of a specific instance of sex and/or gender information.  | - SNOMED International, Systematized Nomenclature of Medicine Clinical Terms (SNOMED CT®) U.S. Edition, March 2022 Release  | Birth Sex Observation (V2)  | observation[code/@code="76689-9"]/value  |
{:.grid}
**Table 74: USCDI Data Elements - Patient Demographics**

##### Sexual Orientation

No additional guidance

##### Gender Identity

The [Gender Harmony project](https://confluence.hl7.org/display/VOC/The+Gender+Harmony+Project), does not recommend the use of the terms and codes _Male-to-female transsexual
(407376001)or Female-to-male transsexual (407377005)._ However, they are in the bound [Gender Identity](https://confluence.hl7.org/display/VOC/The+Gender+Harmony+Project) value
set and are permitted to be used.

##### Date of Death

CDA has the sdtc:deceasedInd and sdtc:deceasedTime extensions that represents that a patient is deceased,
sdtc:deceasedInd = "true" and sdtc:deceasedTime, to indicate the time of death. Note that these extensions may
also be associated with other subject/persons present in the document.

##### Tribal Affiliation

The tribal affiliation template represents a tribe or band with which an individual associates. It does not reflect
official tribal enrollment.

##### Related Person's Name

Persons associated with the patient identified in the RecordTarget are represented using various participation
relationships. To represent a generic related person's relationship to the patient and that person's name, a new
template has been created (Related Person Relationship and Name - Participant Participation) that may be used in
the header or in entries.

##### Related Person's Relationship

Persons associated with the patient identified in the RecordTarget are represented using various participation
relationships. To represent a generic related person's relationship to the patient and that person's name, a new
template has been created (Related Person Relationship and Name - Participant Participation) that may be used
in the header or in entries.

##### Occupation

The Basic Occupation template is a simple observation template that is similar to the Past or Present Occupation
Observation template found in [HL7 CDA® R2 Implementation Guide: C-CDA R2.1 Supplemental Templates for
Occupational Data for Health Release 1, STU Release 1.1 - US Realm](https://www.hl7.org/implement/standards/product_brief.cfm?product_id=522) but is simplified or use in the general clinical
context and binds to the most recent ODH value set from Occupational Data for Health, version 20201030 code
system.

##### Occupation Industry

The Basic Industry template is a simple observation template that is similar to the Past or Present Industry
Observation template found in [HL7 CDA® R2 Implementation Guide: C-CDA R2.1 Supplemental Templates for
Occupational Data for Health Release 1, STU Release 1.1 - US Realm](https://www.hl7.org/implement/standards/product_brief.cfm?product_id=522) but is simplified for use in the general clinical
context and binds to the most recent ODH value set from Occupational Data for Health, version 20201030 code
system.

##### Sex

The Birth Sex Observation template reflects the Sex assigned at birth concept present in USCDI v1 and v2 and the
Sex concept in USCDI V3

#### Problems

Information about a condition, diagnosis, or other event, situation, issue, or clinical concept that is documented.

<table
                                    style="border-collapse:collapse;margin-left:18.61pt"
                                    cellspacing="0">
                                    <tr style="height:37pt">
                                        <td
                                            style="width:91pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"
                                            ><p class="s17"
                                                style="padding-left: 5pt;text-indent: 0pt;text-align: left;"
                                                ><b>USCDI v2 DATA ELEMENT</b></p></td>
                                        <td
                                            style="width:79pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"
                                            ><p class="s17"
                                                style="padding-left: 5pt;text-indent: 0pt;line-height: 12pt;text-align: left;"
                                                ><b>USCDI Vocabulary Requirement</b></p></td>
                                        <td
                                            style="width:99pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"
                                            ><p class="s17"
                                                style="padding-left: 5pt;text-indent: 0pt;text-align: left;"
                                                ><b>Template</b></p></td>
                                        <td
                                            style="width:227pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"
                                            ><p class="s17"
                                                style="padding-left: 5pt;text-indent: 0pt;text-align: left;"
                                                ><b>XPath</b></p></td>
                                    </tr>
                                    <tr style="height:48pt">
                                        <td
                                            style="width:91pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"
                                            rowspan="3"><p
                                                style="padding-left: 5pt;text-indent: 0pt;line-height: 12pt;text-align: left;"
                                                  ><a
                                                  href="https://www.healthit.gov/isa/taxonomy/term/1806/uscdi-v2"
                                                  class="s82">SDOH Problems/Health Concerns</a></p><p
                                                class="s128"
                                                style="padding-left: 5pt;padding-right: 5pt;text-indent: 0pt;text-align: left;"
                                                >An identified Social Determinants of Health-related
                                                condition (e.g., Homelessness (finding), Lack of
                                                adequate food Z59.41, Transport too expensive
                                                (finding)). SDOH data relate to conditions in which
                                                people live, learn, work, and play and their effects
                                                on health risks and outcomes.</p></td>
                                        <td
                                            style="width:79pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"
                                            rowspan="3"><p class="s128"
                                                style="padding-left: 5pt;padding-right: 4pt;text-indent: 0pt;text-align: left;"
                                                >- SNOMED International, Systematized Nomenclature of
                                                Medicine Clinical Terms (SNOMED CT®) U.S. Edition, March 2021 Release</p>
                                                <p class="s128"
                                                style="padding-left: 5pt;padding-right: 4pt;text-indent: 0pt;text-align: left;"
                                                >- International Classification of Diseases ICD-10- CM 2021</p></td>
                                        <td
                                            style="width:99pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"
                                                ><p class="s128"
                                                style="padding-left: 5pt;text-indent: 0pt;line-height: 12pt;text-align: left;"
                                                >For SDOH Problems<span style=" color: #000;"
                                                  >:</span></p><p
                                                style="text-indent: 0pt;text-align: left;"
                                                ><br /></p><p class="s19"
                                                style="padding-left: 5pt;text-indent: 0pt;text-align: left;"
                                                >Problem Observation</p></td>
                                        <td
                                            style="width:227pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"
                                                ><p class="s130"
                                                style="padding-left: 5pt;text-indent: 0pt;text-align: left;"
                                                >/observation/value/@code</p></td>
                                    </tr>
                                    <tr style="height:65pt">
                                        <td
                                            style="width:99pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"
                                                ><p class="s128"
                                                style="padding-left: 5pt;padding-right: 7pt;text-indent: 0pt;text-align: left;"
                                                >For SDOH Problems in Social History:</p><p
                                                style="text-indent: 0pt;text-align: left;"
                                                ><br /></p><p class="s19"
                                                style="padding-left: 5pt;padding-right: 37pt;text-indent: 0pt;text-align: left;"
                                                >Social History Observation</p></td>
                                        <td
                                            style="width:227pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"
                                                ><p class="s130"
                                                style="padding-left: 5pt;text-indent: 0pt;text-align: left;"
                                                >/observation/value/@code</p></td>
                                    </tr>
                                    <tr style="height:132pt">
                                        <td
                                            style="width:99pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"
                                                ><p class="s128"
                                                style="padding-left: 5pt;text-indent: 0pt;text-align: left;"
                                                >For SDOH Problems that are Health Concerns:</p><p
                                                style="text-indent: 0pt;text-align: left;"
                                                ><br /></p><p class="s19"
                                                style="padding-left: 5pt;text-indent: 0pt;text-align: left;"
                                                >Health Concern Act</p></td>
                                        <td
                                            style="width:227pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"
                                                ><p class="s130"
                                                style="padding-left: 5pt;text-indent: 0pt;text-align: left;"
                                                >/entry/act/entryRelationship</p><p class="s128"
                                                style="padding-top: 7pt;padding-left: 5pt;text-indent: 0pt;text-align: left;"
                                                >Primitive conformance statement above first
                                                entryRelationship or after last (see H&amp;P
                                                Document)</p><p class="s130"
                                                style="padding-left: 5pt;text-indent: 0pt;text-align: left;"
                                                >/entry/act/entryRelationship/observation</p></td>
                                    </tr>
                                    <tr style="height:62pt">
                                        <td
                                            style="width:91pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"
                                                ><p class="s153"
                                                style="padding-left: 5pt;text-indent: 0pt;text-align: left;"
                                                ><a href="https://www.healthit.gov/isa/taxonomy/term/1241/uscdi-v2">Date of Diagnosis</a><span class="s127"> </span><span
                                                  class="s128">Date of first determination by a
                                                  qualified professional of the presence of a problem or condition affecting a patient. </p></td>
                                        <td
                                            style="width:79pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"
                                                ><p style="text-indent: 0pt;text-align: left;"
                                                ><br /></p></td>
                                        <td
                                            style="width:99pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"
                                                ><p class="s19"
                                                style="padding-left: 5pt;text-indent: 0pt;line-height: 12pt;text-align: left;"
                                                >Problem Observation</p><p class="s128"
                                                style="padding-left: 5pt;text-indent: 2pt;text-align: left;"
                                                >-&gt; Date of Diagnosis Act</p></td>
                                        <td
                                            style="width:227pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"
                                                ><p class="s130"
                                                style="padding-left: 5pt;text-indent: 0pt;text-align: left;"
                                                >/act/effectiveTime/@value</p></td>
                                    </tr>
                                     <tr style="height:74pt">
                                        <td
                                            style="width:91pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"
                                                ><p class="s153"
                                                style="padding-left: 5pt;padding-right: 6pt;text-indent: 0pt;text-align: left;"
                                                  ><a
                                                  href="https://www.healthit.gov/isa/taxonomy/term/1251/uscdi-v2"
                                                  class="s82" target="_blank">Date of Resolution</a><span class="s127"> </span><span
                                                  class="s128">Date of subsiding or termination of a
                                                  symptom, problem, or condition.</p></td>
                                        <td
                                            style="width:79pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"
                                                ><p style="text-indent: 0pt;text-align: left;"
                                                ><br /></p></td>
                                        <td
                                            style="width:99pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"
                                                ><p class="s19"
                                                style="padding-left: 5pt;text-indent: 0pt;line-height: 12pt;text-align: left;"
                                                >Problem Observation</p></td>
                                        <td
                                            style="width:227pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"
                                                ><p class="s130"
                                                style="padding-left: 5pt;text-indent: 0pt;text-align: left;"
                                                >/observation/effectiveTime/high</p></td>
                                    </tr>
                                </table><p style="text-indent: 0pt;text-align: left;">
                                
**Table 75: USCDI v2 Data Elements - Problems**

##### SDOH Problems/Health Concerns

The updated Problem Observation, and Health Concern Act templates include a value set for conveying SDOH
problems and health concerns.

For SDOH value sets, see 6.1.2 [Social Determinant of Health Vocabulary Design Notes](uscdi_guidance.html#social-determinant-of-health-vocabulary-design-notes).

##### Date of Diagnosis

No additional guidance

##### Date of Resolution

No additional guidance

#### Procedures

<table
                                    style="border-collapse:collapse;margin-left:18.61pt"
                                    cellspacing="0">
                                    <tr style="height:25pt">
                                        <td
                                            style="width:103pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"
                                            ><p class="s17"
                                                style="padding-left: 5pt;text-indent: 0pt;line-height: 12pt;text-align: left;"
                                                ><b>USCDI v2 DATA ELEMENT</b></p></td>
                                        <td
                                            style="width:100pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"
                                            ><p class="s17"
                                                style="padding-left: 5pt;text-indent: 0pt;line-height: 12pt;text-align: left;"
                                                ><b>USCDI Vocabulary Requirement</b></p></td>
                                        <td
                                            style="width:67pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"
                                           ><p class="s17"
                                                style="padding-left: 5pt;text-indent: 0pt;text-align: left;"
                                                ><b>Template</b></p></td>
                                        <td
                                            style="width:219pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"
                                            ><p class="s17"
                                                style="padding-left: 5pt;text-indent: 0pt;text-align: left;"
                                                ><b>XPath</b></p></td>
                                    </tr>
                                    <tr style="height:109pt">
                                        <td
                                            style="width:103pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"
                                            rowspan="2"><p
                                                style="padding-left: 5pt;text-indent: 0pt;line-height: 12pt;text-align: left;"
                                                  ><a
                                                  href="https://www.healthit.gov/isa/taxonomy/term/1841/uscdi-v2"
                                                  class="s82">SDOH Interventions</a></p><p
                                                class="s128"
                                                style="padding-top: 7pt;padding-left: 5pt;padding-right: 6pt;text-indent: 0pt;text-align: left;"
                                                >A service offered to a patient to address
                                                identified Social Determinants of Health concerns,
                                                problems, or diagnoses (e.g.,</p><p class="s128"
                                                style="padding-top: 7pt;padding-left: 5pt;padding-right: 6pt;text-indent: 0pt;text-align: left;"
                                                >Education about Meals on Wheels Program, Referral
                                                to transportation support programs). SDOH data
                                                relate to conditions in which people live, learn,
                                                work, and play and their effects on health risks and
                                                outcomes.</p></td>
                                        <td
                                            style="width:100pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"
                                            rowspan="2"><p class="s128"
                                                style="padding-left: 5pt;padding-right: 1pt;text-indent: 0pt;text-align: left;"
                                                >- SNOMED International, Systematized Nomenclature of
                                                Medicine Clinical Terms (SNOMED CT®)</p><p
                                                class="s128"
                                                style="padding-left: 5pt;text-indent: 0pt;text-align: left;"
                                                >U.S. Edition, March 2021 Release</p><p class="s128"
                                                style="padding-left: 5pt;text-indent: 0pt;line-height: 11pt;text-align: left;"
                                                >- Current Procedural Terminology (CPT®) 2021, as maintained and distributed by the American Medical Association, for physician services and other health care services.</p>
                                                <p class="s128"
                                                style="padding-left: 5pt;text-indent: 0pt;line-height: 11pt;text-align: left;"
                                                >- Healthcare Common Procedure Coding System (HCPCS) Level II, as maintained and distributed by HHS.</p></td>
                                        <td
                                            style="width:67pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"
                                                ><p class="s128"
                                                style="padding-left: 5pt;text-indent: 0pt;text-align: left;"
                                                >For interventions that have occurred:</p><p
                                                style="text-indent: 0pt;text-align: left;"
                                                ><br /></p><p class="s19"
                                                style="padding-left: 5pt;text-indent: 0pt;text-align: left;"
                                                >Procedure Activity Procedure</p></td>
                                        <td
                                            style="width:219pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"
                                                ><p class="s130"
                                                style="padding-left: 5pt;text-indent: 0pt;text-align: left;"
                                                >/entry/procedure/code/@code</p></td>
                                    </tr>
                                    <tr style="height:168pt">
                                        <td
                                            style="width:67pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"
                                                ><p class="s128"
                                                style="padding-left: 5pt;text-indent: 0pt;text-align: left;"
                                                >For interventions that are planned:</p><p
                                                style="text-indent: 0pt;text-align: left;"
                                                ><br /></p><p class="s19"
                                                style="padding-left: 5pt;text-indent: 0pt;text-align: left;"
                                                >Planned Procedure</p></td>
                                        <td
                                            style="width:219pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"
                                                ><p class="s130"
                                                style="padding-left: 5pt;text-indent: 0pt;text-align: left;"
                                                >/entry/procedure/code/@code</p></td>
                                    </tr>
                                    <tr style="height:25pt">
                                        <td
                                            style="width:103pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"
                                            bgcolor="#33AF1D"><p class="s17"
                                                style="padding-left: 5pt;text-indent: 0pt;line-height: 12pt;text-align: left;"
                                                ><b>USCDI v3 DATA ELEMENT</b></p></td>
                                        <td
                                            style="width:100pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"
                                             bgcolor="#33AF1D"><p class="s17"
                                                style="padding-left: 5pt;text-indent: 0pt;line-height: 12pt;text-align: left;"
                                                ><b>USCDI Vocabulary Requirement</b></p></td>
                                        <td
                                            style="width:67pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"
                                            bgcolor="#33AF1D"><p class="s17"
                                                style="padding-left: 5pt;text-indent: 0pt;text-align: left;"
                                                ><b>Template</b></p></td>
                                        <td
                                            style="width:219pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"
                                             bgcolor="#33AF1D"><p class="s17"
                                                style="padding-left: 5pt;text-indent: 0pt;text-align: left;"
                                                ><b>XPath</b></p></td>
                                    </tr>
                                    <tr style="height:109pt">
                                        <td
                                            style="width:103pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"
                                            rowspan="2"><p
                                                style="padding-left: 5pt;text-indent: 0pt;line-height: 12pt;text-align: left;"
                                                  ><a
                                                  href="https://www.healthit.gov/isa/taxonomy/term/2631/uscdi-v3"
                                                  class="s82">Reason for Referral</a></p><p
                                                class="s128"
                                                style="padding-top: 7pt;padding-left: 5pt;padding-right: 6pt;text-indent: 0pt;text-align: left;"
                                                >Explanation or justification for a referral or consultation</p></td>
                                        <td
                                            style="width:100pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"
                                            rowspan="2"><p class="s128"
                                                style="padding-left: 5pt;padding-right: 1pt;text-indent: 0pt;text-align: left;"
                                                >None (follow C-CDA)</p></td>
                                        <td
                                            style="width:67pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"
                                                ><p class="s128"
                                                style="padding-left: 5pt;text-indent: 0pt;text-align: left;"
                                                >Reason for Referral Section</p></td>
                                        <td
                                            style="width:219pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"
                                                ><p class="s130"
                                                style="padding-left: 5pt;text-indent: 0pt;text-align: left;"
                                                >Patient Referral Act (act 2.16.840.1.113883.10.20.22.4.140)</p><br/>
                                                <p>+ <br/> Indication (V2) <br/> (observation, (observation, 2.16.840.1.113883.10.20.22.4.19, release 2014-06-09)</p>
                                                </td>
                                    </tr>
                                </table>
                                
**Table 76: USCDI Data Elements - Procedures**

##### SDOH Interventions

The updated Procedure Activity Procedure, and Planned Procedure templates include a value set for conveying
SDOH interventions.

For SDOH value sets, see 6.1.2 [Social Determinant of Health Vocabulary Design Notes](uscdi_guidance.html#social-determinant-of-health-vocabulary-design-notes).

##### Reason for Referral

A reason for referral is represented with the [Patient Referral Act](http://www.hl7.org/ccdasearch/templates/2.16.840.1.113883.10.20.22.4.140.html) template, which contains the [Indication
Observation](http://www.hl7.org/ccdasearch/templates/2.16.840.1.113883.10.20.22.4.19.html) template with an ActRelationship typeCode of "RSON" (Reason). Please also see [Referral Request and
Close Referral with a Note](https://cdasearch.hl7.org/examples/view/Referrals%20-%20Planned%20and%20Completed/Referral%20Request%20and%20Close%20Referral%20with%20a%20Note) example for "closing the loop".