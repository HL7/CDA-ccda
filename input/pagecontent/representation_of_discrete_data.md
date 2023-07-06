The full potential of our Health IT infrastructure can only be realized when the health information being shared
includes the corresponding discrete data that makes modern computing opportunities possible. Computer aided
processing and analysis is only possible when the information in clinical notes conveyed by standardized structured
data documents also includes machine processable representation of the data. Discrete data drives data analytics
and data analytics holds the potential to revolutionize care delivery while accelerating the shift toward value-
based care and innovations that improve the healthcare experience.

### General Entry-Level Guidance

The guidance below pertains when document sections include machine processable discrete data to aid processing
of information contained in the section. The following general entry-level guidance is applicable to all C-CDA entry
templates.

#### Narrative Text Linking (Referencing)

Best practice for CDA creation is to represent all human readable text in the section, then reference the text from
the discrete entries that represent the human readable information as machine processable data. To include
narrative text linking, the text element of the primary (outer-most) act in an entry should point, by reference, to
the portion of the narrative text corresponding to the meaning of the entire clinical statement expressed in the
discrete entry.

**Example 21: Narrative Text with Links to Machine Processable Data**
```
<section>
    <templateId root="2.16.840.1.113883.10.20.22.2.7.1" extension="2014-06- 09"
        assigningAuthorityName="HL7 CCD" />
    <code code="47519-4" displayName="Procedures" codeSystem="2.16.840.1.113883.6.1"
        codeSystemName="LOINC" />
    <title>Procedures</title>
    <text>
        <table border="1" width="100%">
            <thead>
                <tr>
                    <th>Procedure Name</th>
                    <th>Code</th>
                    <th>CodeSystem</th>
                    <th>Target Site</th>
                    <th>Date of Procedure</th>
                </tr>
            </thead>
            <tbody>
                <tr id=PROCEDURESUMMARY_1>
                    <td id=PROCEDURE_1>Skin care: graft site</td>
                    <td >406177009</td>
                    <td >SNOMED CT</td>
                    <td >11207009 (Structure of right thigh)<thigh) </td>
                        <td >2015-06- 23</td>
                </tr>
            </tbody>
        </table>
    </text>
    <entry typeCode="DRIV">
        <procedure classCode="PROC" moodCode="EVN">
            <templateId root="2.16.840.1.113883.10.20.22.4.14" extension="2014-06- 09" />
            <id root="93ad269d-40a6-4d71-bcc6-6978598820d9" />
            <code code="406177009" displayName="Skin care: graft site"
                codeSystem="2.16.840.1.113883.6.96">
                <originalText>
                    <reference value="#PROCEDURE_1" />
                </originalText>
            </code>
            <text><reference value="#PROCEDURESUMMARY_1" /></text>
            <statusCode code="completed" />
            <effectiveTime value="20150623" />
            <methodCode nullFlavor="UNK" />
            <targetSiteCode code="11207009" displayName="Structure of right thigh"
                codeSystem="2.16.840.1.113883.6.96" codeSystemName="SNOMED CT" />
            <author>
                <templateId root="2.16.840.1.113883.10.20.22.4.119" />
                <time value="20150623" />
                <assignedAuthor>
                    <id extension="db659e09-b0b0-4e51-a6e9-7eb5abdae4e4" />
                    <code nullFlavor="UNK" />
                    <assignedPerson>
                        <name nullFlavor="NI" />
                    </assignedPerson>
                </assignedAuthor>
            </author>
        </procedure>
    </entry>
</section>
```

In accordance with general CDA principles for human readability, every CDA shall be viewable through the use of a
CDA stylesheet. Since many vendors and document sources wish to distinguish their expertise by using specific
stylesheets, it is important to test early and often to make sure that the text has not become overly complicated,
to the point where only the producing system can render the text with the specific stylesheet. Obviously,
document sources cannot test with all other CDA stylesheets, but it is recommended to regularly test using the HL7
[CDA stylesheet approved by SDWG and managed in the HL7 GitHub](https://hl7.org/permalink/?CDAStyleSheet).^105

#### OriginalText

When a CDA document section contains coded discrete entries (such as allergy, medication, problem, etc. to
support machine processing of the available human readable information), coded data within the discrete entry
MAY include an originalText element to link the coded information back to the original human readable
information represented by that code. The use of code/originalText/reference and value/originalText/reference
should be used where it is useful to point to the human readable information associated with more specific areas
within the narrative related to a specific coded element within a discrete entry.

Narrative text linking from the text element in the entry (for the entire discrete entry, meaning the entire machine
processable clinical statement) and from the originalText element (for a specific part of the clinical statement)
referencing from coded concepts in the entry can be used together to provide very tight correspondences between
human readable and machine processable information.

<table
                                    style="border-collapse:collapse;margin-left:24.01pt"
                                    cellspacing="0">
                                    <tr style="height:29pt">
                                        <td
                                            style="width:468pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"
                                                bgcolor="#C5D9F0"><p class="s19"
                                                style="padding-left: 41pt;padding-right: 8pt;text-indent: 0pt;text-align: left;"
                                                >Coded entries MAY include an originalText element
                                                to link the coded data back to the associated human
                                                readable information represented by that code.
                                                  <b>[CONF-061]</b></p></td>
                                    </tr>
                                </table>

It should be noted there is no requirement that CDA entries must reference into the CDA Narrative Block. The
referencing mechanism can be used where it is important to represent the original text component of a coded CDA
entry.^106

It should be noted that sometimes the original text will be repeated in the originalText element rather than
using a reference link into the narrative text. This is not incorrect and should not be flagged as an error. In
this case, the originalText element, allows the human readable information to include a quality check.

^105 https://hl7.org/permalink/?CDAStyleSheet
^106 HL7 CDA. Chapter 4.2.5.1 Content.


However, the HL7 CDA standard recommends use of narrative text linking to minimize mismatch errors
where the human readable narrative information is not identical to the original text.

**Example 22: originalText used to record the term actually selected from the EHR**
```
<code code="9999123"
    displayName="Obsessional thoughts of augmented reality video
    games" codeSystem="2.16.840.1.113883.6.96">
    <originalText><reference value="#Obsessive thoughts related to video
        games"/></originalText>
</code>
```

**Example 23: originalText linking the coded concept used in the machine entry to the narrative**
<br />
originalText linking the coded concept used in the machine entry to the narrative that was actually
stated by the clinician or what was actually in the EHR when this problem was entered by the clinician.
Narrative text linking is the preferred method of representation because it eliminates the possibility for
mismatch between the attested content in the section.text and what was actually seen or said by the
clinician.
```
<code code=" 9999123 "
    displayName="Obsessional thoughts of augmented reality video
    games" codeSystem="2.16.840.1.113883.6.96">
    <originalText><reference value="#Problem_1"/></originalText>
</code>
```

The originalText contains what the human stated or the terms selected from the EHR user interface.

NOTE: The C-CDA specification does not currently include an explicit coded indicator to define whether the
narrative text contains additional information beyond the coded data or not. Narrative text and user
selected terms may routinely have more robust content than the structured entries. The narrative text may
contain additional nuances and should never be ignored by receiving systems.

<table
                                    style="border-collapse:collapse;margin-left:24.01pt"
                                    cellspacing="0">
                                    <tr style="height:29pt">
                                        <td
                                            style="width:468pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"
                                                bgcolor="#C5D9F0"><p class="s19"
                                                style="padding-left: 41pt;padding-right: 8pt;text-indent: 0pt;text-align: left;"
                                                >The originalText attribute SHOULD reference text in
                                                the Narrative Block which mirrors what the clinician
                                                saw or selected in the user interface of the system
                                                that created the source data.
                                            <b>[BP-062]</b></p></td>
                                    </tr>
                                </table>

Consequently, it is also valuable to send the local code that represents the originalText as a translation,
along with one or more translations to publicly defined code systems. This practice is encouraged in FHIR
when using data elements of type [CodableConcept](https://www.hl7.org/fhir/datatypes.html#CodeableConcept). In CDA this can be accomplished through
translationCode.

The following best practices were agreed upon by HL7 SD Work Group and the HL7 Vocabulary Work Group
in [January of 2017](https://confluence.hl7.org/display/VOC/Vocabulary+WG+Policy+on+Use+of+translationCode+in+the+V3+%28and+CDA%29+D
atatypes) :

- The @code attribute for a data element of type Coded Data (CD) SHALL use a code from a
    nationally recognized code system as identified in the [ONC Interoperability Standards
    Advisory.]( https://www.healthit.gov/isa/)
- The originalText property MAY capture the text that the clinician captured or selected in the
    user interface of the system used in creating the data element instance
- A code that represents the meaning for the originalText drawn from custom interface
    terminologies or another (local) code system according to agreement of the trading partners MAY be populated in translation.Code
- When a code is populated in translation.Code, it SHALL be more specific than the best available
    standard code system code
- A code populated in translation.Code SHALL NOT be broader than the code populated in the
    Code property

**Example 24: TranslationCode, with originalText and local coded term**
```
<value xsi:type="CD" code="254838004" displayName="Carcinoma of Breast"
    codeSystem="2.16.840.1.113883.6.96" codeSystemName="SNOMED CT" >
    <originalText>
        <reference value="#problem1"></reference>Carcinoma of right breast, stage 2, estrogen
        receptor
        positive</originalText>
    <!-- User Selected Term Coding -->
    <translation code="40780512" displayName="Carcinoma of right breast, stage 2, estrogen
        receptor
        positive" codeSystem="2.16.840.1.113883.3.247.1.1"
        codeSystemName="EHRorInterfaceTerminologyCodeSystem"/>
    <!-- “Secondary" Codes -->
    <translation code="174.9" codeSystem="2.16.840.1.113883.6.103" codeSystemName="ICD-9CM"
        displayName="Malignant neoplasm of breast (female), unspecified site"/>
    <translation code="C50.911" codeSystem="2.16.840.1.113883.6.90" codeSystemName="ICD-10- CM"
        displayName="Malignant neoplasm of unspecified site of right female breast"/>
    <translation code="416053008" codeSystem="2.16.840.1.113883.6.96" codeSystemName="SNOMED CT"
        displayName="Estrogen receptor positive tumor"/>
</value>
```
#### DisplayName Representation

When sending coded information, the CD datatype (most commonly used in &lt;code&gt; and &lt;value&gt; elements) has a
‘displayName’ element. This element is intended to be a valid human readable representation of the concept
defined by the code system and associated with the ‘code’ element at the time of data entry. As an example, for
LOINC codes, the ‘displayName’ element should convey either the short name or long name in LOINC for the code
used in the associated code element.

<table
                                    style="border-collapse:collapse;margin-left:24.01pt"
                                    cellspacing="0">
                                    <tr style="height:29pt">
                                        <td
                                            style="width:468pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"
                                                bgcolor="#C5D9F0"><p class="s19"
                                                style="padding-left: 41pt;text-indent: 0pt;line-height: 12pt;text-align: left;"
                                                >The displayName attribute SHALL NOT modify the
                                                meaning of the code. <b>[BP-063]</b></p><p
                                                class="s19"
                                                style="padding-left: 41pt;text-indent: 0pt;line-height: 12pt;text-align: left;"
                                                >Note: Testability requires fuzzy match
                                                capabilities.</p></td>
                                    </tr>
                                </table>
                                
The guidance for the use of the ‘displayName’ element are:

- display name is included as a courtesy to an unaided human interpreter of a coded value.
- display name adds no semantic meaning to the coded information, and it SHALL never exist without an
associated code.
- display name may not be present if the code is an expression for which no display name has been
assigned or can be derived in the associated code system.
- display name element must accurately represent the concept associated with the @code attribute of
the associated code or value element.

<table
                                    style="border-collapse:collapse;margin-left:24.01pt"
                                    cellspacing="0">
                                    <tr style="height:29pt">
                                        <td
                                            style="width:468pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"
                                            bgcolor="#C5D9F0"><p class="s19"
                                                style="padding-left: 41pt;text-indent: 0pt;line-height: 12pt;text-align: left;"
                                                >The displayName attribute MAY be included where
                                                syntactically allowed. <b>[BP-064]</b></p></td>
                                    </tr>
                                    <tr style="height:29pt">
                                        <td
                                            style="width:468pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"
                                            bgcolor="#C5D9F0"><p class="s19"
                                                style="padding-left: 41pt;text-indent: 0pt;text-align: left;"
                                                >The displayName attribute SHALL never exist without
                                                an associated code. <b>[CONF-065]</b></p></td>
                                    </tr>
                                </table>

When a CDA document includes coded data in discrete entries (such as allergen, medication, problem, etc.) to
support machine processing, every discrete entry SHOULD include a text element that references the human
readable representation of the information discretely represented by a code.

For example, say a new version of SNOMED is released with a new problem code of 99999123 and a display name
of “Obsessional thoughts of augmented reality video games” and this code is used in a Problem Observation. If
neither originalText nor display were included in the xml entry, the human readable narrative for the entry could
only say, “Problem 99999123 began on July 6, 2016 as noted by Dr. Ishihara.” This would violate the core CDA
principal of human readability.

<table
                                    style="border-collapse:collapse;margin-left:24.01pt"
                                    cellspacing="0">
                                    <tr style="height:37pt">
                                        <td
                                            style="width:468pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"
                                            bgcolor="#C5D9F0"><p class="s19"
                                                style="padding-left: 41pt;padding-right: 8pt;text-indent: 0pt;text-align: left;"
                                                >C-CDA Content Creators SHOULD include a human
                                                readable representation of the concept associated
                                                with the code as defined by the code system in the
                                                @displayName attribute of a code element.
                                                  <b>[BP-066]</b></p></td>
                                    </tr>
                                    <tr style="height:37pt">
                                        <td
                                            style="width:468pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"
                                            bgcolor="#C5D9F0"><p class="s19"
                                                style="padding-left: 41pt;padding-right: 8pt;text-indent: 0pt;text-align: left;"
                                                >C-CDA Content Validators MAY require a fuzzy match
                                                between the @displayName attribute of a code element
                                                and the preferred concept description for the code
                                                as defined by the associated code system.</p><p
                                                class="s31"
                                                style="padding-left: 41pt;text-indent: 0pt;line-height: 11pt;text-align: left;"
                                                ><b>[CONF-067]</b></p></td>
                                    </tr>
                                </table>

**Example 25: Code Display Name Representation**
```
<code code=" 9999123 "
    displayName="Obsessional thoughts of augmented reality video
    games" codeSystem="2.16.840.1.113883.6.96">
    <originalText><reference value="#PROBLEM1"/></originalText>
</code>
```

#### Use of Consistent Identifiers

The id element represents a globally unique identifier for a collection of data, be it a document, section, entry, or
sub-entry (such as an author).

Within a document ids should be used consistently, for example, every instance of the same provider throughout a
document should have the same id.

Within different document instances generated by the same system, the identifiers would also be the same when
representing the same source information. If the information in the source system is not treated as “the same
information”, then a different identifier would be used. When to treat information as “the same” or “different” is a
system design issue and may vary from source system to source system under certain scenarios when the data is
changing. However, use of consistent ids is a best practice that should be expected when information has not
changed.

For example, if a CCD is created for a patient with an allergy to penicillin, the next time a C-CDA document is
generated by that same system for that same patient, the id associated with the penicillin allergy in the generated
document and the id associated with the penicillin allergy in the previously generated document should be the
same.

If the allergy has changed (such as adding a new comment or changing the severity of a reaction), but it is still
internally treated by the system as the same piece of data, it should keep the same identifier. However, if the entry
has changed and the source system represents the changed information as a new instance of data, then the
information should contain a new id. For example, if a patient’s prescription for medication X changes in such a
way that the source system considers this a new prescription, it will have a new id, even if the new prescription
may still be for medication X. The new id helps the recipient system differentiate the new prescription from the
previous prescription.

Using consistent identifiers helps with reconciliation of discrete data. If the penicillin allergy cited before was
received and incorporated into a recipient system, then use of a consistent id makes it easier for the previously
received information to be identified. If, however, a newly generated id is sent with each new document reporting
on this allergy, then the allergy information appears to the recipient system as a brand-new allergy each time.
More complex decision logic must be performed to identify a match to an existing allergy. Consistent ids can
increase the accuracy of this complex matching step. The use of consistent ids for a specific instance of a problem,
medication statement or allergy, etc., improves the possibility that a recipient system can identify and relate newly
received information to an instance of the data that may already be in the recipient system.

One approach for implementing consistent unique ids is to maintain multiple Globally Unique Identifiers (GUIDs)
for each object in the database. When a recipient system stores multiple GUIDs in its database, it can use its full
set of GUIDs to help match incoming information with information that has been received previously. Also, when
content is imported from another system and the identifiers are maintained, these identifiers can be used to
improve communication back to the other system. For example, if system A imports information from system B,
and then subsequently sends information back to system B, system A can include system B’s identifiers to help
system B identify information that has been updated by system A.

Another consideration is to use Object Identifiers (OIDs) to identify the assigning authority for each GUID. This
requires some management to make sure the OID is globally unique. A vendor or specific implementation of
software typically owns a unique OID that forms the root of all their ids. Unique branches can then be created for
each implementation, server, data type, and record.

CDA id elements contain two elemental parts: a root (which must be a GUID or an OID) and an optional extension
(which can be any string of characters). If the extension is present, the combination of root + extension must be
globally unique. This can allow a hybrid approach for either using GUIDs or OIDs. For example, a GUID or OID may
be created for a local instance of an entire allergy database and sent as the root, and then the local identifier (such
as a database row number, a filename, or any other string) of the allergy can be sent as the extension.

A vendor may use any approach for generating valid GUIDs.

<table
                                    style="border-collapse:collapse;margin-left:24.01pt"
                                    cellspacing="0">
                                    <tr style="height:29pt">
                                        <td
                                            style="width:468pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"
                                                 bgcolor="#C5D9F0"><p class="s19"
                                                style="padding-left: 41pt;padding-right: 8pt;text-indent: 0pt;text-align: left;"
                                                >Content Creators SHOULD include ids to identify
                                                pieces of information and use consistent ids for the
                                                same piece of information <b>[BP-068]</b></p></td>
                                    </tr>
                                </table>

#### Use of nullFlavor and Handling Missing Information

Chapter 3.6 of the C-CDA Implementation Guide details how to handle unavailable and unknown information. In
HL7 V3, unavailable, unknown or incomplete data are handled with ‘flavors of null’ representing coded values that
communicate the reason for missing information.

Asserting a value for missing data is necessary where entries are required to meet validation. In addition,
communicating reasons for missing data is important in other circumstances as good practice. Indicating null
flavors at the appropriate level of precision is encouraged to convey the reason that required or expected data is
missing. The null flavor vocabulary domain within the CDA R2 standard details the complete hierarchy of null flavor
values.

The @nullFlavor attribute conveys significant information, especially when used with intervals. For example, in a
Tobacco Use observation, where the effectiveTime represents the clinically relevant time a code applies, an
effectiveTime/high/@nullFlavor=”UNK” indicates that the patient no longer uses whatever tobacco product is
represented by value but that the exact time when the patient stopped using the product is unknown. If the
nullFlavor were NA (not applicable), then the end time is not applicable which means the patient is still a user
(however, since high effectiveTime is an optional field, the preferred way to communicate this is to omit the
element entirely). Most other nullFlavors in this example (NI – no information, NAV – not available, NASK – not asked) convey the uncertainty of whether the patient is still a user of the substance.

**Example 26: Tobacco Use – Current Smoker with an unknown stop date**
```
<observation classCode="OBS" moodCode="EVN">
    <templateId root="2.16.840.1.113883.10.20.22.4.78"/>
    <templateId root="2.16.840.1.113883.10.20.22.4.78" extension="2014-06- 09"/>
    <id extension="64020-Z9301" root="1.2.840.114350.1.13.6289.1.7.1.1040.1"/>
    <code code="72166-2" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"
        displayName="Tobacco smoking status"/>
    <statusCode code="completed"/>
    <effectiveTime>
        <low value="20100412"/>
        <high nullFlavor="UNK"/>
    </effectiveTime>
    <value code="77176002" codeSystem="2.16.840.1.113883.6.96" displayName="Smoker"
        xsi:type="CD" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"/>
</observation>
```

**Example 27: Tobacco Use – Smoker where cessation date was not asked**
```
<observation classCode="OBS" moodCode="EVN">
    <templateId root="2.16.840.1.113883.10.20.22.4.78"/>
    <templateId root="2.16.840.1.113883.10.20.22.4.78" extension="2014-06- 09"/>
    <id extension="64020-Z9301" root="1.2.840.114350.1.13.6289.1.7.1.1040.1"/>
    <code code="72166-2" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"
        displayName="Tobacco smoking status"/>
    <statusCode code="completed"/>
    <effectiveTime>
        <low value="20100412"/>
        <high nullFlavor="NASK"/>
    </effectiveTime>
    <value code="77176002" codeSystem="2.16.840.1.113883.6.96" displayName="Smoker"
        xsi:type="CD" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"/>
</observation>
```
This is also conveyed in Chapter 3.3 of volume one of C-CDA 2.1. If the resolution to a problem is not known, its
effectiveTime/high should contain a value or nullFlavor=UNK. If the nullFlavor=NA, then the problem is definitely
_not_ resolved. And if the nullFlavor is anything else, then it is unclear as to whether the problem is still active or if it
has been resolved.

The @nullFlavor attribute also conveys when information is unknown. However, a nullFlavor SHALL NOT be used
to bypass IG requirements for convenience ( _e.g._ you may send a nullFlavor=UNK for a patient’s birthTime when it
is not recorded in a chart, but you must not send it simply because it is too difficult to convert the method your
system uses to record birth dates to an HL7 timestamp). NullFlavor attributes need not be included for non-
required elements, such as religiousAffiliationCode. If an element is optional and unknown, it may simply be
omitted.

#### Unknown Data in Sections That Require Entries

The following guidelines clarify the use of the “No Information” nullflavor=”NI” pattern for a section with no
information:

<table
                                    style="border-collapse:collapse;margin-left:24.01pt"
                                    cellspacing="0">
                                    <tr style="height:101pt">
                                        <td
                                            style="width:468pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"
                                                bgcolor="#C5D9F0"><p class="s19"
                                                style="padding-left: 41pt;text-indent: 0pt;text-align: left;"
                                                >If a document template requires a section to be
                                                present and the source system contains no
                                                information to populate the section:</p><p
                                                style="text-indent: 0pt;text-align: left;"
                                                ><br />
                                                - The section SHALL be included in the xml and SHALL be declared as having no information. - If the source system contains no information to populate a section that is not required (with a SHALL conformance statement) in the document template:</p><br/>
                                                <p class="s19"
                                                style="padding-left: 41pt;text-indent: 0pt;text-align: left;"
                                                >The section MAY be omitted, or the section MAY be
                                                included and declared as having no
                                                information.</p><p class="s31"
                                                style="padding-left: 41pt;text-indent: 0pt;line-height: 11pt;text-align: left;"
                                                ><b>[BP-069]</b></p></td>
                                    </tr>
                                </table>

The machine-readable data required within these sections are specified for clinical best practice and should not be
completely omitted unless the entire section contains no information (section/@nullFlavor=NI). In these instances,
unknown information may be used on the specific act, such as a Procedure Activity. Additionally, text describing
the reason for the unknown information and a code indicating the nature of the unknown information are
encouraged.

The key is to describe any unknown information as explicitly as possible to ensure accurate communication.
Further guidance and examples are provided in Chapter 3.6 of the C-CDA Implementation Guide. The 2015 Edition
Certification Criteria also reinforce this concept:


|   In our proposed rule we went further and said that if the provider does not have the information available
|   to populate one or more of the fields listed, either because they can be excluded from recording such
|   information (for example, vital signs) or because there is no information to record (for example,
|   laboratory tests), the provider may leave the field(s) blank. The only exception to this is the problem list,
|   medication list, and medication allergy list.

In other words, problems, medications, and medication allergies cannot simply be “left blank.” The applicable
document must include the section and a null value. For these sections, the narrative text must explicitly indicate
that the information is unknown.

**Example 28: No Information Problems Section**
```
<!-- ************************* PROBLEM LIST ****************************** -->
<component>
    <!-- nullFlavor of NI indicates No Information.-->
    <section nullFlavor="NI">
        <!-- conforms to Problems section with entries optional -->
        <templateId root="2.16.840.1.113883.10.20.22.2.5" extension="2015-08- 01"/>
        <code code="11450-4" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"
            displayName="PROBLEM LIST"/>
        <title>PROBLEMS</title>
        <text>No Information</text>
    </section>
</component>
```

#### Representing “no known” Information Versus “no information”

There is a distinction to be made between representing “no information” and representing “no known
information.” In the case of “no known information,” the author is not explicitly asserting the presence or absence
of information for the data element. “No information” is an explicit assertion that there is no information for that
data element in the system.
It is the difference between these statements: “I don’t know if the patient has any allergies” (no information) and
“The patient states that he is not allergic to anything” (no known).

In cases where “no known” information is being asserted, negation indicators should be used. A negation indicator
(negationInd) is used to flag the act as described in the third example within Chapter 3.6 of the C-CDA
Implementation Guide. Explicit codes for no known information, such as "no known allergies" within an Allergy
Observation, are not recommended within Consolidated CDA. Rather, a negation indicator is to be used on the act
along with a text description along with a code indicating the data that has no value.

When representing the concept of “no known” information, ambiguity for the use of negationInd within the
observation acts resulting from limitations of the earlier RIM version used by CDA R2 is acknowledged. Specific
examples have been adopted for frequently needed negation semantics such as “no known problems” and “no
known allergies”. In the future observation templates need to expressly define if the default actionNegationInd
behavior is intended or if negationInd is intended to function as a valueNegationInd. This will need to be addressed
in a future version of C-CDA.

**Example 29: Allergy List**
```
<!-- ************************* ALLERGY LIST ****************************** -->
<component>
    <section>
        <!-- conforms to Allergies section with entries optional -->
        <templateId root="2.16.840.1.113883.10.20.22.2.6" extension="2015-08- 01"/>
        <templateId root="2.16.840.1.113883.10.20.22.2.6"/>
        <!-- Allergies section with entries required -->
        <templateId root="2.16.840.1.113883.10.20.22.2.6.1"/>
        <templateId root="2.16.840.1.113883.10.20.22.2.6.1" extension="2015-08- 01"/>
        <code code="48765-2" codeSystem="2.16.840.1.113883.6.1"/>
        <title>ALLERGIES, ADVERSE REACTIONS, ALERTS</title>
        <text>No Known Allergies</text>
        <entry typeCode="DRIV">
            <!-- Allergy Concern Act -->
            <act classCode="ACT" moodCode="EVN">
                <templateId root="2.16.840.1.113883.10.20.22.4.30" extension="2015-08- 01"/>
                <templateId root="2.16.840.1.113883.10.20.22.4.30"/>
                <id root="36e3e930-7b14-11db-9fe1-0800200c9a66"/>
                <!-- SDWG supports 48765-2 or CONC in the code element -->
                <code code="CONC" codeSystem="2.16.840.1.113883.5.6"/>
                <statusCode code="active"/> <!--currently tracked concerns are active concerns-->
                <effectiveTime>
                    <low value="20091201"/> <!--show time when the concern first began being tracked-->
                </effectiveTime>
                <entryRelationship typeCode="SUBJ">
                    <!-- No Known Allergies -->
                    <!-- The negationInd = true negates the observation/value -->
                    <!-- The use of negationInd corresponds with the newer Observation.valueNegationInd
-->
                    <observation classCode="OBS" moodCode="EVN" negationInd="true">
                        <!-- allergy - intolerance observation template -->
                        <templateId root="2.16.840.1.113883.10.20.22.4.7" extension="2014-06- 09"/>
                        <templateId root="2.16.840.1.113883.10.20.22.4.7"/>
                        <id root="4adc1020-7b14-11db-9fe1-0800200c9a66"/>
                        <code code="ASSERTION" codeSystem="2.16.840.1.113883.5.4"/>
                        <statusCode code="completed"/>
                        <!-- N/A - author/time records when this assertion was made -->
                        <effectiveTime>
                            <low nullFlavor= "NA" />
                        </effectiveTime>
                        <value xsi:type="CD" code="419199007"
                            displayName="Allergy to substance (disorder)"
                            codeSystem="2.16.840.1.113883.6.96"
                            codeSystemName="SNOMED CT"/>
                        <author>
                            <time value="20100103"/>
                            <assignedAuthor>
                                <id extension="99999999" root="2.16.840.1.113883.4.6"/>
                                <code code="200000000X" codeSystem="2.16.840.1.113883.6.101"
                                    displayName="Allopathic &amp; Osteopathic Physicians"/>
                                <telecom use="WP" value="tel:555-555-1002"/>
                                <assignedPerson>
                                    <name>
                                        <given>Henry</given>
                                        <family>Seven</family>
                                    </name>
                                </assignedPerson>
                            </assignedAuthor>
                        </author>
                        <!-- In C-CDA R2.1 the participant is required. -->
                        <participant typeCode="CSM">
                            <participantRole classCode="MANU">
                                <playingEntity classCode="MMAT">
                                    <code nullFlavor="NA"/>
                                </playingEntity>
                            </participantRole>
                        </participant>
                    </observation>
                </entryRelationship>
            </act>
        </entry>
```

To represent that a section has “no information”, the section should be included, and a null value of NI used to
convey that there is no information in the source system for this section. To represent that a section has
information in the source system, but it has been excluded from the exchange document, the section should be
included and a null value of MSK used to convey that the information in the source system for this section has not
been provided by the sender due to security, privacy, or other reasons. The exact wording to be included in the
narrative text for the notions of “no information” and “masked information” can be determined locally.

**Example 30: Allergies Section with No Information**
```
<!-- ************************* ALLERGY LIST ****************************** -->
<component>
    <!-- nullFlavor of NI indicates No Information.-->
    <section nullFlavor="NI">
        <!-- conforms to Allergies section with entries optional -->
        <templateId root="2.16.840.1.113883.10.20.22.2.6" extension="2015-08- 01"/>
        <templateId root="2.16.840.1.113883.10.20.22.2.6"/>
        <!-- Allergies section with entries required -->
        <templateId root="2.16.840.1.113883.10.20.22.2.6.1"/>
        <templateId root="2.16.840.1.113883.10.20.22.2.6.1" extension="2015-08- 01"/>
        <code code="48765-2" codeSystem="2.16.840.1.113883.6.1"/>
        <title>ALLERGIES, ADVERSE REACTIONS, ALERTS</title>
        <text>No Information</text>
    </section>
```

If an organization has business rules that support not providing information from the patient’s record due to
security, privacy, or other reasons, nullFlavor codes can be used to represent this information in a C-CDA
document. The nullFlavor code used to indicate that information is not present due to security, privacy or other
reason is MSK for “masked”. The nullFlavor code for “not applicable” is NA. When information is not present for
these reasons, the text in the section.text element explains why. The exact meaning of the nullFlavor code can be
used, or localized text that has the same semantic meaning can be used.

**Example 31: Excluding section due to business rules.**

Entire section excluded because business rules of the author determine the section of information is not present due to security, privacy, or other reasons
<br/>
```
<section nullFlavor="MSK">
    <templateId root="2.16.840.1.113883.10.20.22.2.7"/>
    <templateId root="2.16.840.1.113883.10.20.22.2.7" extension="2014-06- 09"/>
    <templateId root="2.16.840.1.113883.10.20.22.2.7.1"/>
    <templateId root="2.16.840.1.113883.10.20.22.2.7.1" extension="2014-06- 09"/>
    <id root="4536582C-018F-11E6-9EF4-0050568B1D1B"/>
    <code code="47519-4" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"
        displayName="History of procedures"/>
    <title>Procedures - from Last 3 Months</title>
    <text>
        Information has not been provided by the sender due to security, privacy, or other reasons.
        There may be an alternate mechanism for gaining access to this information.
    </text>
</section>
```

**Example 32: Procedures Section with Excluded Information, example of locally selected wording**
```
<section nullFlavor="MSK">
    <templateId root="2.16.840.1.113883.10.20.22.2.7"/>
    <templateId root="2.16.840.1.113883.10.20.22.2.7" extension="2014-06- 09"/>
    <templateId root="2.16.840.1.113883.10.20.22.2.7.1"/>
    <templateId root="2.16.840.1.113883.10.20.22.2.7.1" extension="2014-06- 09"/>
    <id root="4536582C-018F-11E6-9EF4-0050568B1D1B"/>
    <code code="47519-4" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"
        displayName="History of procedures"/>
    <title>Procedures - from Last 3 Months</title>
    <text>
        Information not provided due to security, privacy, or other reasons.
    </text>
</section>
```

#### Specifying Time Intervals for Sections with Limits on the Included Discrete Data

In order to communicate that business rules have been applied to constrain the amount of information
represented in the section of a document, a new template has been defined that allows C-CDA Content Creators to
explicitly clarify the time range of the included information. The Section Time Range Observation entry describes
the business rule used to limit the information contained in the section to a specific interval of time using a
machine-readable format that facilitates computer processing. It is an optional entry and may be used in any
section where the included information has been limited to prevent the section from becoming overwhelming or
irrelevant. This entry links to the human readable text asserted in the section narrative disclosing the business
rules applied to limit the included information.

The Section Time Range Observation template (urn:hl7ii:2.16.840.1.113883.10.20.22.4.201:2016-06-01) may be
useful when a query for a C-CDA document may request a large amount of data--potentially years—and the system
that creates the document supplied in a response, limits the data they return to a relevant range of time. This
template enables the system creating the document to assert the range of time constraining the data provided in a
section.

**Reference:** [Declaring Business Rules that Limit Section Content](section_level_guidance.html#declaring-business-rules-that-limit-section-content); [Essential Entry-Level Guidance](representation_of_discrete_data.html#essential-entry-level-guidance); Appendix A

#### Use of Open Templates for Entries

It is important to emphasize the reusability and flexibility of templates so that implementations support the ability
to customize CDA documents specific to the patient’s care, provider, or setting needs. Within C-CDA, nearly all
templates allow additional content and are described as _open_ templates.

While templates constrain the CDA schema for specific uses, additional content may augment each document as
needed for a particular circumstance. For example, if the Payer section needs to be shared in a Care Plan
Document, this section could be added because the Care Plan Document template is an open template. The
Estimated Date of Delivery and the Medication Free Text Sig entry-level templates are the only closed templates in
the C-CDA IG. Other HL7 CDA implementation guides make greater use of closed templates.

**Reference:** Chapter 4.2.7 of the C-CDA IG.

#### Detailed Date/Time Guidance

A recent study by members of the Association for Healthcare Documentation Integrity presented during the HIMSS
Health Story Project Roundtable on March 5, 2019 demonstrated how the consistent use of style in the healthcare
record promotes clear communication, contributes to patient safety, and improves information exchange,
integration, and aggregation. The presentation also provided insight into the importance of applying style
standards to human-readable text to reduce physician burden. Many of the examples of poor styles and confusing
or irrelevant information focused on representation of the temporal date/time information contained in the
narrative text. While temporal information is critical for making clinical sense of the information contained in a
patient’s record, too much date/time information can be overwhelming or misleading. The Roundtable
recommendations challenged C-CDA creators to do more to ensure date/time information presented in the
Narrative Block is relevant and pertinent and styled appropriately to reduce physician burden.^110

^110 HIMSS Health Story Project Roundtable. Style Standards to Improve Health IT Usability and Reduce Physician Burden. March 5, 2019. https://www.himss.org/sites/hde/files/HSP%20March%202019%20Roundtable%20Q%26A.pdf

<table
                                    style="border-collapse:collapse;margin-left:24.01pt"
                                    cellspacing="0">
                                    <tr style="height:29pt">
                                        <td
                                            style="width:468pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"
                                            bgcolor="#C5D9F0"><p class="s19"
                                                style="padding-left: 41pt;padding-right: 8pt;text-indent: 0pt;text-align: left;"
                                                >C-CDA Content Creators SHOULD apply a consistent
                                                style to date/time information reported in the
                                                Narrative Blocks <b>[BP-070]</b></p></td>
                                    </tr>
                                    <tr style="height:37pt">
                                        <td
                                            style="width:468pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"
                                            bgcolor="#C5D9F0"><p class="s19"
                                                style="padding-left: 41pt;padding-right: 6pt;text-indent: 0pt;text-align: left;"
                                                >C-CDA Content Creators SHOULD render date/time
                                                information using a level of precision that is
                                                relevant and pertinent to the intended purpose of
                                                the section within the context of the document<b>.
                                                  [BP-071</b></p></td>
                                    </tr>
                                </table>

##### Timestamp Data Representation

The value of a point in time is represented using the ISO 8601 compliant form traditionally in use with HL7. This is
the form that has no decorating dashes, colons and no "T" between the date and time. In short, the syntax is
"YYYYMMDDHHMMSS.UUUU[+|-ZZzz]" where digits can be omitted from the right side to express less precision^111.
Common forms are "YYYYMMDD" and "YYYYMMDDHHMM", but the ability to truncate on the right side is not
limited to these two variants. The “.UUUU” part of the expression supports up to tenths of a millisecond and is
used to represent time precision greater than 1 second. for example, “.001” represents a thousandth of a second.
This representation also allows for timezone information to be specified using offsets from UTC. As an example of
specifying time zone information, Eastern Standard Time (EST) is represented as -0500, while Eastern Daylight
Saving Time (EDT) is represented as -0400. UTC Time is represented as -0000.

If no time zone offset is provided, you can make no assumption about time, unless you have made a local exchange
agreement. When timezone is NULL (unknown), "local time" is assumed. However, "local time" is always local to
some place, and without knowledge of that place, the time zone is unknown. Hence, a local time cannot be
converted into UTC. timezone should be specified for all TS values in order to avoid a significant loss of precision
when TSs are compared.

In administrative data context, sometimes values do not carry a time zone. For a date of birth in administrative
data, for example, it would be incorrect to specify timezone, since this may effectively change the date of birth
when converted into other time zones. For such administrative data the time zone is NULL (not applicable.)^112

<table
                                            style="border-collapse:collapse;margin-left:24.01pt"
                                            cellspacing="0">
                                            <tr style="height:147pt">
                                                <td
                                                  style="width:468pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"
                                                  bgcolor="#C5D9F0"><p class="s19"
                                                  style="padding-left: 41pt;text-indent: 0pt;line-height: 12pt;text-align: left;"
                                                  >When populating any effectiveTime or time element
                                                  in a document, C-CDA Content Creators:</p><p class="s31"
                                                  style="padding-left: 51pt;text-indent: -9pt;text-align: left;"
                                                  >1. <b>SHOULD </b><span class="s19">be precise to the
                                                  day.</span></p><p class="s31"
                                                  style="padding-left: 51pt;text-indent: -9pt;line-height: 12pt;text-align: left;"
                                                  >2. <b>SHOULD </b> <span class="s19">be precise to the
                                                  minute.</span></p><p
                                                  style="text-indent: 0pt;text-align: left;"
                                                  ></p><p class="s31"
                                                  style="padding-left: 51pt;text-indent: -9pt;line-height: 12pt;text-align: left;"
                                                  >3. <b>MAY </b> <span class="s19">be precise to the
                                                  second.</span></p><p class="s19"
                                                  style="padding-left: 51pt;text-indent: -9pt;line-height: 12pt;text-align: left;"
                                                  >4. If more precise than day, <b>SHALL </b>include
                                                  time-zone offset.</p><p class="s31"
                                                  style="padding-left: 43pt;text-indent: 0pt;text-align: left;"
                                                  ><b>[CONF-072]</b></p><p
                                                  style="text-indent: 0pt;text-align: left;"
                                                  ><br /></p><p class="s19"
                                                  style="padding-left: 41pt;padding-right: 8pt;text-indent: 0pt;text-align: left;"
                                                  >Note: This conformance does not apply to the
                                                  birthTime element because use of a timezone offset
                                                  could have an unintended negative effect when
                                                  doing patient matching. It also does not apply to
                                                  the effectiveTime element of the Birth Sex
                                                  Observation
                                                  (2.16.840.1.113883.10.20.22.4.200:2016-06-01) template</p></td>
                                            </tr>
                                            </table>
<table
                                            style="border-collapse:collapse;margin-left:24.01pt"
                                            cellspacing="0">
                                            <tr style="height:87pt">
                                                <td
                                                  style="width:468pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"
                                                  bgcolor="#C5D9F0"><p class="s19"
                                                  style="padding-left: 41pt;padding-right: 8pt;text-indent: 0pt;text-align: left;"
                                                  >When populating a birthTime metadata element in
                                                  the header or section of a document, C-CDA Content
                                                  Creators:</p><p class="s31"
                                                  style="padding-left: 51pt;text-indent: -9pt;text-align: left;"
                                                  >1. <b>SHALL </b><span class="s19">be precise to the
                                                  day.</span></p><p class="s31"
                                                  style="padding-left: 51pt;text-indent: -9pt;line-height: 12pt;text-align: left;"
                                                  >2. <b>SHOULD </b> <span class="s19">be precise to the
                                                  minute.</span></p><p
                                                  style="text-indent: 0pt;text-align: left;"
                                                  ></p><p class="s31"
                                                  style="padding-left: 51pt;text-indent: -9pt;line-height: 12pt;text-align: left;"
                                                  >3. <b>MAY </b> <span class="s19">be precise to the
                                                  second.</span></p><p class="s19"
                                                  style="padding-left: 51pt;text-indent: -9pt;line-height: 12pt;text-align: left;"
                                                  >4. <b>SHALL NOT </b>include time or
                                                  time-zone offset.</p><p class="s31"
                                                  style="padding-left: 43pt;text-indent: 0pt;text-align: left;"
                                                  ><b>[CONF-073]</b></p></td>
                                            </tr>
                                        </table>

^111 CDA R2 Datatypes Abstract Specification.
^112 Ibid.


##### Date/Time Precision

When specifying dates and times, care should be taken to only capture data with as much precision as is known.
The timestamp format allows for partial dates and partial times to be specified.

<table
                                            style="border-collapse:collapse;margin-left:24.01pt"
                                            cellspacing="0">
                                            <tr style="height:29pt">
                                                <td
                                                  style="width:468pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"
                                                  bgcolor="#C5D9F0"><p class="s19"
                                                  style="padding-left: 41pt;padding-right: 8pt;text-indent: 0pt;text-align: left;"
                                                  >Dates and Times SHOULD NOT be padded with zeroes
                                                  as this implies a precision that is probably not
                                                  true. <b>[CONF-074]</b></p></td>
                                            </tr>
                                        </table>

A date/time of “20160101000000.0000” is explicitly representing the exact first tenth of a millisecond on January
1 st, 2016. Unless this is the exact tenth of a millisecond that is intended to be represented, this date/time should
be sent as “20160101” which is stating “sometime on January 1st, 2016.” Similarly, “2016010109” is stating
“sometime after 09:00am on January 1st, 2016, but before 10:00am.”

When documenting an interval of date/times, care must also be taken in the interpretation of the high point of the
interval. Chapter 3.8.2 of the HL7 Abstract Data Types Specification reads:


|   The precision of a stated interval boundary is irrelevant for the interval. One might wrongly assume that
|   the interval "[19870901;19870930]" stands for the entire month, from the 1st of September 1987 until
|   end of the day on September 30th. However, this is not so! The proper way to denote an entire calendar
|   cycle (e.g., hour, day, month, year, etc.) in the interval notation is to use an open high boundary. For
|   example, all of September 1987 is denoted as "[198709;198710[".^113

<table
                                            style="border-collapse:collapse;margin-left:24.01pt"
                                            cellspacing="0">
                                            <tr style="height:37pt">
                                                <td
                                                  style="width:468pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"
                                                  bgcolor="#C5D9F0"><p class="s19"
                                                  style="padding-left: 41pt;text-indent: 0pt;text-align: left;"
                                                  >For purposes of an interval, when a partial
                                                  date/time is encountered, it SHOULD be acted upon
                                                  as if the rest of the date/time was padded with
                                                  “01” for months or days, and “0s” for hours,
                                                  minutes, seconds,and fractions of a second.
                                                  <b>[BP-075]</b></p></td>
                                            </tr>
                                        </table>
                                        
Thus, the first interval above should be considered as [19870901000000.0000;19870930000000.0000], which then
shows that it stands for the interval from September 1st, 1987 until the first instant of September 30th. It thus
does not actually include the rest of the instants of September 30th. The second interval is considered as
[19870901000000.0000;19871001000000.0000[. It includes all of September 30th but does not include the first
instant of October 1st because the interval is marked open.

^113 Chapter 3.8.2 of the HL7 Abstract Data Types Specification

| **Date / Time Expression**   | **Representation**    |
| ---- | ------ |
| **November 27, 1970**   | <effectiveDate value=“19701127”/>  |
| **11:30:52.3333 on November 27, 1970 in EST**   | <effectiveDate value=“19701127113052.3333-0500”/>  |
| **The entire year of 1970**   | <effectiveDate> <low value=“1970”/> <high inclusive=“false” value=“1971”/> </effectiveDate>  |
| **The entire month of September 1987**   | <effectiveDate> <low value=“198709”/> <high inclusive=“false” value=“198710”/> </effectiveDate>  |
{:.grid}
**Table 35: Date/Time Examples**

#### Referencing Information Within a Document

The Entry Reference template represents the act of referencing another entry in the same CDA document instance.
Its purpose is to remove the need to repeat the complete XML representation of the referred entry when relating
one entry to another. This template can be used to reference many types of Act class derivations, such as 
encounters, observations, procedures etc., as it is often necessary when authoring CDA documents to repeatedly
reference other Acts of these types. For example, in a Care Plan it is necessary to repeatedly relate Health
Concerns, Goals, Interventions and Outcomes.

The ID is required and must be the same ID as the entry/id it is referencing. The ID cannot be a null value. Act/Code
is set to nullFlavor=“NP” (Not Present). This means the value is not present in the message (in act/Code).

The `<linkHtml>` tag, is a generic referencing mechanism that can be used to reference identifiers that are internal
to a document. Note that security considerations need to be given to support for linking mechanisms. Not all
stylesheets enable the linking features of the `<linkHtml>` tag to be operationalized.

**Reference** : [Tags for formatting Narrative Text](section_level_guidance.html#tags-for-formatting-narrative-text)

<table
                                    style="border-collapse:collapse;margin-left:24.01pt"
                                    cellspacing="0">
                                    <tr style="height:29pt">
                                        <td
                                            style="width:468pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"
                                            bgcolor="#C5D9F0"><p class="s19"
                                                style="padding-left: 41pt;text-indent: 0pt;line-height: 12pt;text-align: left;"
                                                >C-CDA Content Creators MAY use id-based linking
                                                mechanisms within a C-CDA document.
                                                <b>[BP-076]</b></p></td>
                                    </tr>
                                    <tr style="height:37pt">
                                        <td
                                            style="width:468pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"
                                            bgcolor="#C5D9F0"><p class="s19"
                                                style="padding-left: 41pt;padding-right: 8pt;text-indent: 0pt;text-align: left;"
                                                >C-CDA Consumer SHOULD support stylesheets that
                                                facilitate the use of internal linking mechanisms,
                                                because linking within a single file does not pose
                                                security risks, facilitates readability and.
                                                Improves user experience when viewing C-CDA documents.
                                                  <b>[BP-077]</b></p></td>
                                    </tr>
                                </table>

#### Referencing Information in an External Document

The base HL7 CDA standard supports four act classes that enable information in one document to reference
information in an external document, external procedure, external observation, or external act. To date the C-CDA
implementer community has not explored the use of these mechanisms. However, as progress evolves on the use
of unique IDs that persist and are used consistently and meaningfully across systems, exploration may expand in
this area.

<table
                                    style="border-collapse:collapse;margin-left:24.01pt"
                                    cellspacing="0">
                                    <tr style="height:37pt">
                                        <td
                                            style="width:468pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"
                                            bgcolor="#C5D9F0"><p class="s19"
                                                style="padding-left: 41pt;padding-right: 8pt;text-indent: 0pt;text-align: left;"
                                                >C-CDA Content Creators MAY explore the use of
                                                linking mechanisms to external C-CDA documents,
                                                observations, or acts, depending on business
                                                decisions and the assessment of risk associated with
                                                this functionality. <b>[BP-078]</b></p></td>
                                    </tr>
                                    <tr style="height:37pt">
                                        <td
                                            style="width:468pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"
                                            bgcolor="#C5D9F0"><p class="s19"
                                                style="padding-left: 41pt;padding-right: 8pt;text-indent: 0pt;text-align: left;"
                                                >C-CDA Content Consumers MAY support stylesheets
                                                that support or prohibit the use of external linking
                                                mechanisms, depending on business decisions and the
                                                assessment of risk associated with this functionality. 
                                                <b>[BP-079]</b></p></td>
                                    </tr>
                                </table>

#### Understanding the ActStatus Model in C-CDA

Volume 1 of the HL7 C-CDA R2.1 specification includes a detailed explanation of how to determine the status of
the clinical statement included in a C-CDA document when that clinical statement is expressed in a C-CDA entry
template.^114 The chapter explains how a C-CDA Content Creator can indicate and a C-CDA Content Consumer can
understand if clinical statement is active, completed, or in some other state. Most clinical statements designed for
C- CDA have a completed status, but a select few include a state model expressed using the Act.statusCode.
Examples include the Problem Concern Entry and the Medication Activity. Templates of this sort include a value
set binding on the Act.statusCode element where the value set includes concepts from the HL7ActStatus code
system. The HL7ActStatus code system includes a set of concepts defined in the RIM state model. The value set
used with the Act.statusCode vary depending on the needs of the particular clinical statement but are static for
each clinical statement pattern definition (i.e. each entry template definition).

^114 HL7 C-CDA R2.1. Chapter 3.3 Determining the Status of Clinical Statement.

Determination of the Act.statusCode depends on the interplay between an act’s various components including
effectiveTime and other clinical status observations that may be pertinent for determining the status of the act
within the available Act.statusCode state model.

The guidance in Chapter 3.3 of Volume 1 of the HL7 C-CDA R2.1 specification is thorough and helpful. However,
when an EMR system does not support state models that align with the clinical statement models defined in C-
CDA, this guidance to be challenging for implementers. For additional information about how to address
challenges associated with a C-CDA Act.statusCode state model, consult the ActStatus row of the guidance table
for each entry templates listed below.

#### How Negation Works in C-CDA Templates

C- CDA entry templates include a negationInd attribute on all Act classes (act, procedure, encounter,
substanceAdministration, supply, and observation). Act.negationInd, when set to “true”, is a positive assertion that
the Act as a whole is negated. Some properties such as Act.id, Act.moodCode, and the participations are not
affected. These properties always have the same meaning: i.e., the author remains the author of the negative Act.
An act statement with negationInd is still a statement about the specific fact described by the Act. For instance, a
negated “finding of wheezing on July 1” means that the author positively denies that there was wheezing on July 1,
and that he takes the same responsibility for such statement and the same requirement to have evidence for such
statement than if he had not used negation.^115

In the case of an observation, the entry template may provide additional guidance, or this Companion Guide may
provide additional guidance, to clarify if the observation.negationInd attribute applied to the act as a whole, or just
to the observation.value element. In later versions of the RIM, multiple more specific negationInd attributes were
implemented to communicate this design intention more clearly. In CDA, the template definitions or companion
guidance needs to describe the intention explicitly.

<table
                                    style="border-collapse:collapse;margin-left:24.01pt"
                                    cellspacing="0">
                                    <tr style="height:29pt">
                                        <td
                                            style="width:468pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"
                                            bgcolor="#C5D9F0"><p class="s19"
                                                style="padding-left: 41pt;padding-right: 8pt;text-indent: 0pt;text-align: left;"
                                                >C-CDA Content Creators SHALL follow template
                                                conformance and additional companion guidance
                                                regarding the use of negationInd when representing
                                                discrete data in C-CDA documents.
                                                <b>[BP-080]</b></p></td>
                                    </tr>
                                    <tr style="height:37pt">
                                        <td
                                            style="width:468pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"
                                            bgcolor="#C5D9F0"><p class="s19"
                                                style="padding-left: 41pt;text-indent: 0pt;text-align: left;"
                                                >C-CDA Content Consumers SHALL follow template
                                                conformance and additional companion guidance
                                                regarding the use of negationInd when processing
                                                discrete data represented in C-CDA documents.
                                                  <b>[BP-081]</b></p></td>
                                    </tr>
                                </table>
                                
**Reference** : [Representing “no known” Information Versus “no information”](representation_of_discrete_data.html#representing-no-known-information-versus-no-information)

### Essential Entry-Level Guidance

The following guidance is specific for individual entry templates. It has been gathered from C- CDA implementer
community through other published implementation guides, C-CDA Implementation-A-Thons that HL7 and ONC
jointly hold, HL7 cross-workgroup collaboration sessions to review C-CDA templates, insight from the SOA
workgroup working on mappings between C-CDA and FHIR, and work produced by the HL7 C-CDA Examples Task
Force.

Each entry template described below includes the description of the purpose for the template. It also includes
detailed information about any state model associated with the design, issues related to the representation of
negated information, and special considerations to note such as nuanced guidance that has emerged through
experience within the C-CDA implementer community.

The data classes listed below include guidance for relevant entry templates used to represent types of information
associated with that class of data.

^115 HL7 CDA. Chapter 4.3.6.1 Act


#### Provenance

As demand increases for higher quality, more trusted clinical data in C-CDA documents, new efforts have emerged
to clarify basic information requirements for representing data “provenance.” Provenance provides traceability of
information and supports clinical information reconciliation and incorporation.

| **Entry Template**   | **Provenance Author Participation<br />[author: identifier urn:oid:2.16.840.1.113883.10.20.22.5.6:2019-10-01 (open)]**    |
| ---- | ------ |
| **Reference Source**   | HL7 C-CDA R2.1 Companion Guide  |
| **Purpose**   | This template provides a mechanism to record basic Provenance in an Author Participation.  |
| **ActStatus**   | Not applicable  |
| **Negation**   | Not applicable  |
| **Other Considerations**   | This template constrains the CDA Author Participation and is appropriate at the Header, Section, or Entry level. The conformance criteria specializes the C-CDA Author Participation (2.16.840.1.113883.10.20.22.4.119) but does not require generators to include this additional templateId.  |
| **Reference**   | Appendix A. Provenance – Author Participation for the full definition of this new template.  |
| **Example**   | Example 33: Use of the Provenance Author Participation  |
{:.grid}
**Table 36: Provenance Author Participation Template**


**Example 33: Use of the Provenance Author Participation**

```
<section>
    <!-- *** Allergies and Intolerances Section (entries required) (V3) *** -->
<templateId root="2.16.840.1.113883.10.20.22.2.6.1"/>
<templateId root="2.16.840.1.113883.10.20.22.2.6.1" extension="2015-08- 01"/>
<code code="48765-2" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
<title>ALLERGIES AND ADVERSE REACTIONS</title>
<text ID="allergiesNoKnown">No Known Allergies</text>
<entry typeCode="DRIV">
<!-- Allergy Concern Act -->
    <act classCode="A CT" moodCode="E VN">
        <templateId root="2.16.840.1.113883.10.20.22.4.30"/>
        <templateId root="2.16.840.1.113883.10.20.22.4.30" extension="2015-08- 01"/>
        <id root="36e3e930-7b14-11db-9fe1-0800200c9a66"/>
        <!-- SDWG supports 48765-2 or CONC in the code element -->
        <code code="CONC" codeSystem="2.16.840.1.113883.5.6"/>
        <text>
            <reference value="#allergiesNoKnown"/>
        </text>
        <statusCode code="active"/>
        <!--currently tracked concerns are active concerns-->
        <effectiveTime>
            <low value="20100903"/>
            <!--show time when the concern first began being tracked-->
        </effectiveTime>
        <entryRelationship typeCode="SUBJ">
            <!-- No Known Allergies -->
            <!-- The negationInd = true negates the observation/value -->
            <!-- The use of negationInd corresponds with the newer
Observation.valueNegationInd -->
            <observation classCode="O BS" moodCode="E VN" negationInd="true">
                <!-- allergy - intolerance observation template -->
                <templateId root="2.16.840.1.113883.10.20.22.4.7"/>
                <templateId root="2.16.840.1.113883.10.20.22.4.7" extension="2014-06- 09"/>
                <id root="4adc1020-7b14-11db-9fe1-0800200c9a66"/>
                <code code="ASSERTION" codeSystem="2.16.840.1.113883.5.4"/>
                <text>
                    <reference value="#allergiesNoKnown"/>
                </text>
                <statusCode code="completed"/>
                <!-- N/A - author/time records when this assertion was made -->
                <effectiveTime>
                    <low nullFlavor="NA"/>
                </effectiveTime>
                <value xsi:type="CD" code="419199007"
                    displayName="Allergy to substance (disorder)"
                    codeSystem="2.16.840.1.113883.6.96" codeSystemName="SNOMED CT"/>
                <author>
                    <!-- Provenance - Author Participation -->
                    <templateId root="2.16.840.1.113883.10.20.22.5.6" extension="2019-10- 01" />
                    <time value="201308011235-0800"/>
                    <assignedAuthor>
                        <!-- NPI of Author (example) -->
                        <id root="2.16.840.1.113883.4.6" extension="1234567"/>
                        <assignedPerson>
                            <name>
                                <given>Nurse</given>
                                <family>Nightingale</family>
                                <suffix>RN</suffix>
                            </name>
                        </assignedPerson>
                        <representedOrganization>
                            <!-- Tax Identifier of Organization is Unknown -->
                            <id root="2.16.840.1.113883.5.1008" nullFlavor="U NK"/>
                            <!-- NPI of Organization -->
                            <id root="2.16.840.1.113883.4.6" extension="1104145838"/>
                            <name>Good Health Hospital</name>
                            <telecom value="tel:+1(555)867-5309"/>
                        </representedOrganization>
                    </assignedAuthor>
                </author>
                <!-- In C-CDA R2.1 the participant is required. -->
                <participant typeCode="C SM">
                    <participantRole classCode="MANU">
                        <playingEntity classCode="MMAT">
                            <code nullFlavor="NA"/>
                        </playingEntity>
                    </participantRole>
                </participant>
            </observation>
        </entryRelationship>
    </act>
    </entry>
</section>
```

##### Provenance mapping to FHIR

Systems can use the Provenance - Author template to explicitly identify the person, or system, that authored the
content. This participant is equivalent to a FHIR Provenance.agent.type="author" with an appropriate
Provenance.target referencing the target resource.

If a system transforms a CDA entry with a Provenance - Author template assertion, the information contained in
the Provenance - Author template should be included in the FHIR Provenance.agent, and may also populate an
appropriate Resource element.

A CDA entry without an explicit Provenance-Author template assertion may not contain enough role specificity to
populate a FHIR Provenance Resource with certainty.

Implementers will have to determine appropriate mappings given the specific circumstance.


#### Section Time Range

The Section Time Range Observation entry describes the business rule used to limit the information contained in
the section to a specific interval of time using a machine-readable format that facilitates computer processing of
the information. It is an optional entry and may be used in any section to prevent the amount of information
included in the section from becoming overwhelming or irrelevant. This entry references the human readable
information disclosing the applied business rules stated in the asserted in the narrative text of the section.

##### Section Time Range Observation

| **Entry Template**   | **Section Time Range Observation<br />[observation: identifier urn:hl7ii:2.16.840.1.113883.10.20.22.4.201:2016-06-01 (open)]**    |
| ---- | ------ |
| **Reference Source**   | HL7 C-CDA R2.1  |
| **Purpose**   | This observation describes a date/time range applied by the document creator to limit the range of information contained in a section.  |
| **ActStatus**   | This is a discrete observation that has been made in order for it to be documented. Therefore, it always has a statusCode of “completed”.<br />This template does not include an effectiveTime element. See other considerations below.  |
| **Negation**   | Not specified.  |
| **Other Considerations**   | Narrative text linking applies for this entry. The human readable information describing the date/time range used to limit the information SHOULD be reported in the Narrative Block and SHOULD NOT be implied by the section.title only.<br />The specified date/time range of the content limit is specified in the observation.value element.  |
| **Reference**   | Appendix A for template definition  |
| **Example**   | Example 34: Section Time Range Template Example  |
{:.grid}
**Table 37: Section Time Range Observation Template**

**Example 34: Section Time Range Template Example**
```
<section>
    ...
    <title>Procedures</title>
    <text>
        <content ID="Proc_STR">Procedures performed between 08/15/2012 and 08/15/2015.</content>
        ...
    </text>
    <entry>
        <observation classCode="O BS" moodCode="E VN">
            <templateId root="2.16.840.1.113883.10.20.22.4.201" extension="2016-06- 01"/>
            <code code=" 82607-3" codeSystem="2.16.840.1.113883.6.1"
                displayName="Section Date and Time Range"/>
            <text>
                <reference value="#Proc_STR"/>
            </text>
            <statusCode code="completed"/>
            <value xsi:type="IVL_TS">
                <low value="20120815"/>
                <high value="20150815"/>
            </value>
        </observation>
    </entry>
</section>
```

#### Care Team

The header of a C-CDA document includes roles which are populated by providers and individuals who have been
engaged in delivering clinical care or documenting care the patient has received. Their role on the patient’s care
team is implicit. The Care Teams Section and corresponding Care Team Organizer templates enable care team
information to be documented explicitly. These templates also support a wider range of expressiveness provide
background on the type of care team and include more details about the members of the team and the roles
played by each member.

##### Care Team Organizer

| **Entry Template**   | **Care Team Organizer<br />[organizer: identifier urn:hl7ii:2.16.840.1.113883.10.20.22.4.500:2019-07-01 (open)]**    |
| ---- | ------ |
| **Reference Source**   | HL7 C-CDA R2.1 Companion Guide  |
| **Purpose**   | This organizer template contains information about a single care team.<br /> The author of the organizer is the person who documented the care team information.<br /> The participants of the organizer are the care team lead(s) and the care team organization.<br /> The components of the organizer contain the following information:<br /> - The encounter that caused the care team to be formed<br /> - Narrative information about the care team<br /> - The care team members<br /> - Reasons for the care team<br /> - The care team type(s) - a care team can have multiple care team types  |
| **ActStatus**   | The actStatus of this entry is statically bound to ValueSet ActStatus urn:oid:2.16.840.1.113883.1.11.15933. Implementers need to be prepared to address the specified state model. Possible states include: active, completed, cancelled, held, suspended, new, normal, nullified, obsolete, and aborted.  |
| **Negation**   | Not explicitly specified.  |
| **Other Considerations**   | Implementers are encouraged to take guidance from the structure of this entry, even if only populating the Narrative Block of the Care Teams Section.<br />Implementers should note the functionCode element vocabulary binding extends the set of concepts for a Care Team member’s role on the Care Team. A new value set called “Care Team Member Function” is grouped with the original value set called “ParticipationFunction.” In cases where a concept overlaps between these two value sets, implementers should use the concept from the ParticipationFunction value set.  |
| **Reference**   | Appendix A for template definitions.  |
| **Example**   | Example 35: Care Teams Section with Care Team Member Organizer for discrete data representation.  |
{:.grid}
**Table 38: Care Team Organizer Template**

<table><tr><td><img src="Figure 7 Logical design for Care Team Organizer Template.png" /></td></tr></table>


##### Care Team Organizer Template Design

**Figure 7: Logical design for Care Team Organizer Template**

**Example 35: Care Teams Section with Care Team Member Organizer for discrete data representation.**
```
<section>
    <!-- Care Teams Section Template ID and extension-->
    <templateId root="2.16.840.1.113883.10.20.22.2.500" extension="2019-07- 01"/>
    <templateId root="2.16.840.1.113883.10.20.22.2.500" extension="2022-06- 01"/>
    <code code="85847-2" codeSystem="2.16.840.1.113883.6.1"/>
    <title>Care Teams</title>
    <text>
        <list>
            <item>
                <content ID= "CareTeamName1">Inpatient Diabetes Care Team</content>
                (<content>Active</content>)
                <table>
                    <thead>
                        <tr>
                            <th>Member</th>
                            <th>Role on Team</th>
                            <th>Status</th>
                            <th>Date</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>Dr. Henry Seven </td>
                            <td ID="CT1_M01">PCP</td>
                            <td>(Active)</td>
                            <td>10/18/2019</td>
                        </tr>
                    </tbody>
                </table>
            </item>
        </list>
    </text>
    <!--Care Team Organizer-->
    <entry>
        <organizer classCode="CLUSTER" moodCode="EVN">
            <templateId root="2.16.840.1.113883.10.20.22.4.500"
                extension="2019-07- 01"/>
            <templateId root="2.16.840.1.113883.10.20.22.4.500"
                extension="2022-06- 01"/>
            <!--NEW Care Team Organizer Entry Template ID and extension-->
            <id root="1.1.1.1.1.1"/>
            <code code="86744-0" codeSystem="2.16.840.1.113883.6.1"
                codeSystemName="LOINC" displayName="Care Team">
                <originalText>
                    <reference value="#CareTeamName1"/>
                </originalText>
            </code>
            <!--Care Team Status -
https://vsac.nlm.nih.gov/valueset/2.16.840.1.113883.1.11.15933/expansion-->
            <statusCode code="active"/>
            <effectiveTime>
                <low value="201810081426-0500"/>
            </effectiveTime>
            <!-- This participant is the Care Team Lead (1..1)-->
            <!-- Care Team Lead is one of the contained care team members in the list of care
team members-->
            <participant typeCode="PPRF">
                <participantRole>
                    <!--<This id matches at least one of the member's id in the Care Team
Member act template-->
                    <id root="1.5.5.5.5.5.5"/>
                </participantRole>
            </participant>
            <!-- #1 Care Team Member Act - This component is a care team member who is a
provider -->
            <component>
                <act classCode="PCPR" moodCode="EVN">
                    <templateId root="2.16.840.1.113883.10.20.22.4.500.1"
                        extension="2019-07- 01"/>
                    <templateId root="2.16.840.1.113883.10.20.22.4.500.1"
                        extension="2022-06- 01"/>
                    <id root="1.5.5.5.5.5.5"/>
                    <code code="85847-2" codeSystem="2.16.840.1.113883.6.1"
                        codeSystemName="LOINC" displayName="Care Team Information"/>
                    <!--Care Team Member Status -
https://vsac.nlm.nih.gov/valueset/2.16.840.1.113883.1.11.15933/expansion-->
                    <statusCode code="active"/>
                    <effectiveTime xsi:type="IVL_TS">
                        <low value="201810081426-0500"/>
                    </effectiveTime>
                    <!--Attributes about the provider member - name-->
                    <performer typeCode="PRF">
                        <functionCode 
                            xmlns="urn:hl7-org:sdtc" code="PCP"
                            displayName="primary care physician"
                            codeSystem="2.16.840.1.113883.5.88"
                            codeSystemName="ParticipationFunction">
                            <originalText
                                xmlns="urn:hl7-org:v3">
                                <reference value="#CT1_M01"/>
                            </originalText>
                        </functionCode>
                        <!-- A care team member role -->
                        <assignedEntity>
                            <id root="B00B14E8-CDE4-48EA-8A09-01BC4945122A"
                                extension="1"/>
                            <id root="1.5.5.5.5.5.5"/>
                            <assignedPerson>
                                <name>
                                    <given>John</given>
                                    <given>D</given>
                                    <family>Smith</family>,
                                    <suffix>MD</suffix>
                                </name>
                            </assignedPerson>
                        </assignedEntity>
                    </performer>
                </act>
            </component>
        </organizer>
    </entry>
</section>
```

#### Encounter

The Encounters Section includes relevant and pertinent encounters which have already occurred for the patient,
including the encounter that instigated creation of the document. Future appointments and requested encounters
should be communicated in the Plan of Treatment Section.

<table
                                    style="border-collapse:collapse;margin-left:24.01pt"
                                    cellspacing="0">
                                    <tr style="height:29pt">
                                        <td
                                            style="width:468pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"
                                                bgcolor="#C5D9F0"><p class="s19"
                                                style="padding-left: 41pt;padding-right: 8pt;text-indent: 0pt;text-align: left;"
                                                >When the document pertains to a single encounter,
                                                the Encounter section SHALL contain information
                                                about that encounter, but MAY also contain
                                                additional encounters. <b>[CONF-082]</b></p></td>
                                    </tr>
                                </table>
                                
The Encounter Activity entry with an ID matching the encompassingEncounter header element represents the
primary encounter being documented.

**Reference:** [Care Team Members](document_level_guidance.html#care-team-members)

The Encounter Diagnosis is always represented as an entryRelationship to an Encounter Activity, even when the
document is about a single encounter. Historical encounters would each be documented as an Encounter Activity
and information about that encounter would be recorded using an entryRelationship within that corresponding
Encounter Activity. Additional information, such as free-text notes may also be communicated using extra
entryRelationships within the associated Encounter Activity.

A new entry template has been defined for recording clinical notes. It is called the Note Activity entry. To provide
a note on the Encounter, the entryRelationship should link to this new Note Activity entry template.

**Reference:** 4.4 [New and Additional C-CDA Section Templates (Defined in this Companion Guide)](section_level_guidance.html#new-and-additional-c-cda-section-templates-defined-in-this-companion-guide), Appendix A.1.2

##### Encounter Activity

| **Entry Template**   | **Encounter Activity (V3)<br />[encounter: identifier urn:hl7ii:2.16.840.1.113883.10.20.22.4.49:2015-08-01 (open)]**    |
| ---- | ------ |
| **Reference Source**   | HL7 C-CDA R2.1  |
| **Purpose**   | This clinical statement describes an interaction between a patient and clinician. Interactions may include in-person encounters, telephone conversations, and email exchanges.  |
| **ActStatus**   | No constraint specified.  |
| **Negation**   | No constraint specified.  |
| **Other Considerations**   | This template the sdtc:dischargeDispositionCode extension which may be used to record information about the disposition of the patient at the time of discharge. It also may include information about the practitioners involved in performing services, the location or locations where the encounter took place, the reason(s) that were the indication for the encounter, and any number of encounter diagnoses.  |
| **Reference**   | Visit [HL7 CDA Example Search](http://hl7-c-cda-examples.herokuapp.com/sections/Problems)  |
| **Example**   | How to represent [Outpatient Encounter with Diagnoses](http://hl7-c-cda-examples.herokuapp.com/examples/view/Encounters/Outpatient%20Encounter%20with%20Diagnoses)  |
{:.grid}
**Table 39: Encounter Activity Template**


##### Encounter Diagnosis

| **Entry Template**   | **Encounter Diagnosis (V3)<br />[act: identifier urn:hl7ii:2.16.840.1.113883.10.20.22.4.80:2015-08-01 (open)]**    |
| ---- | ------ |
| **Reference Source**   | HL7 C-CDA R2.1  |
| **Purpose**   | This template wraps relevant problems or diagnoses at the close of a visit or that need to be followed after the visit.  |
| **ActStatus**   | No constraint specified.  |
| **Negation**   | No constraint specified.  |
| **Other Considerations**   | This template requires at least one contained Problem Observation template.  |
| **Reference**   | Visit [HL7 CDA Example Search](http://hl7-c-cda-examples.herokuapp.com/sections/Problems)  |
| **Example**   | How to represent [Outpatient Encounter with Diagnoses](http://hl7-c-cda-examples.herokuapp.com/examples/view/Encounters/Outpatient%20Encounter%20with%20Diagnoses)  |
{:.grid}
**Table 40: Encounter Diagnosis Template**


##### Hospital Admission Diagnosis

| **Entry Template**   | **Hospital Admission Diagnosis (V3)<br />[act: identifier urn:hl7ii:2.16.840.1.113883.10.20.22.4.34:2015-08-01 (open)]**    |
| ---- | ------ |
| **Reference Source**   | HL7 C-CDA R2.1  |
| **Purpose**   | This template represents problems or diagnoses identified by the clinician at the time of the patient’s admission.  |
| **ActStatus**   | No constraint specified.  |
| **Negation**   | Not explicitly specified.  |
| **Other Considerations**   | This Hospital Admission Diagnosis act may contain more than one Problem Observation to represent multiple diagnoses for a Hospital Admission. The only difference between a Hospital Admission Diagnosis and a Hospital Discharge Diagnosis is the LOINC code used in the Act.code element of the act wrapper. Hospital Admission Diagnosis uses LOINC code 46241-6<br />(Hospital admission diagnosis Narrative - Reported), while Hospital Discharge Diagnosis uses LOINC code 11535-2 (Hospital discharge Dx Narrative)  |
| **Example**   | Example 36: Hospital Admission Diagnosis  |
{:.grid}
**Table 41: Hospital Admission Diagnosis Template**

**Example 36: Hospital Admission Diagnosis**
```
<act classCode="ACT" moodCode="EVN">
    <templateId root="2.16.840.1.113883.10.20.22.4.34" extension="2015-08-01" />
    <id root="5a784260-6856-4f38-9638-80c751aff2fb" />
    <code code="46241-6" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"
        displayName="Hospital Admission Diagnosis" />
    <statusCode code="active" />
    <effectiveTime>
        <low value="20090303" />
    </effectiveTime>
    <entryRelationship typeCode="SUBJ" inversionInd="false">
        <observation classCode="OBS" moodCode="EVN">
```


##### Hospital Discharge Diagnosis

| **Entry Template**   | **Hospital Discharge Diagnosis (V3)<br />[act: identifier urn:hl7ii:2.16.840.1.113883.10.20.22.4.33:2015-08-01 (open)]**    |
| ---- | ------ |
| **Reference Source**   | HL7 C-CDA R2.1  |
| **Purpose**   | This template represents problems or diagnoses present at the time of discharge which occurred during the hospitalization or need to be monitored after hospitalization.  |
| **ActStatus**   | No constraint specified.  |
| **Negation**   | Not explicitly specified.  |
| **Other Considerations**   | This template requires at least one contained Problem Observation template. The primary difference between a Discharge Diagnosis and a Hospital Discharge Diagnosis is the LOINC code used in the Act.code element of the act wrapper. Encounter Diagnosis uses LOINC code 29308-4 (Diagnosis), while Hospital Discharge Diagnosis uses LOINC code 11535-2 (Hospital discharge Dx Narrative)  |
| **Reference**   | Visit [HL7 CDA Example Search](http://hl7-c-cda-examples.herokuapp.com/sections/Problems) |
| **Example**   | How to reference [Hospital Discharge Encounter with Billable Diagnoses](http://hl7-c-cda-examples.herokuapp.com/examples/view/Encounters/Hospital%20Discharge%20Encounter%20with%20Billable%20Diagnoses)  |
{:.grid}
**Table 42: Hospital Discharge Diagnosis Template**

#### Order

The inFulfillmentOf/order information in the document header represents documentation of orders that are
fulfilled (in whole or in part) in the context of the encompassing encounter or within the context of the provided
service event. For example, a provider orders an X-Ray. The X-Ray is performed. A radiologist reads the X-Ray and
generates a report. The X-Ray order identifier is transmitted in the inFulfillmentOf/order class, and the performed
X-Ray procedure is transmitted in the documentationOf/ServiceEvent. In the body of the document, the service
activities performed to fulfill the order are represented using templates designed to represent a performed test
(observation), procedure, substanceAdministration, supply, encounter or other type of act.

<table
                                    style="border-collapse:collapse;margin-left:24.01pt"
                                    cellspacing="0">
                                    <tr style="height:29pt">
                                        <td
                                            style="width:468pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"
                                            bgcolor="#C5D9F0"><p class="s19"
                                                style="padding-left: 41pt;padding-right: 9pt;text-indent: 0pt;text-align: left;"
                                                >C-CDA Content Creators SHALL represent completed
                                                orders in the inFulfillmentOf area of the header for
                                                orders completed in the context established for the
                                                document. <b>[BP-083]</b></p></td>
                                    </tr>
                                    <tr style="height:49pt">
                                        <td
                                            style="width:468pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"
                                            bgcolor="#C5D9F0"><p class="s19"
                                                style="padding-left: 41pt;padding-right: 8pt;text-indent: 0pt;text-align: left;"
                                                >C-CDA Content Consumers SHALL render information
                                                about completed orders documented in the
                                                inFulfillmentOf area of the header for orders
                                                completed in the context established for the
                                                document. For example, a consumer might opt to
                                                render any inFulfillmentOf/order/id elements
                                                where @displayable=&quot;true&quot;, the
                                                inFulfillmentOf/order/code/originalText or
                                                @displayName, or both. <b>[BP-084]</b></p></td>
                                    </tr>
                                </table>

The document header does not include structures for indexing orders that have been placed within the context of
the encounter or services delivered. The HL7 CDA Release 2 Implementation Guide: Additional CDA R2 Templates –
Clinical Documents for Payers – Set 1, Release 1 – US Realm implementation guide defines a section templates for
this purpose.

##### Fulfilled Order

See Chapter 5.2. 13 Medication and Chapter 5.2.15 Procedure of this document for more information about entry
templates defined to represent performed service acts such as Intervention Act (V2), Procedure Activity Procedure
(V3), Immunization Activity(V3), Encounter Activity (V3), Medication Activity (V2), Non-Medicinal Supply Activity
(V2), etc. Templates types are discussed in the context of the data class used to categorize the type of service act.

**Reference:** [Medication](representation_of_discrete_data.html#medication), [Procedure](representation_of_discrete_data.html#procedure)

##### Placed Order

See Chapter 5.2.17 for more information about entry templates defined to represent ordered service acts such as
Planned Encounter (V2), Planned Medication Activity (V2), Planned Observation (V2), Planned Procedure (V2),
Planned Supply (V2), Planned Act (V2), etc.

**Reference:** [Plan of Treatment](representation_of_discrete_data.html#plan-of-treatment)

Templates of these types are discussed in the context of the data class used to categorize the type of service
activity. The key distinction for representing a placed order is to utilize the moodCode attribute with a value of
RQO. RQO in comes from the HL7ActMood code system and conceptually means “requested”. It is used to
represent an ordered service activity.

The HL7 CDA® Release 2 Implementation Guide: Additional CDA R2 Templates – Clinical Documents for Payers –
Set 1, Release 1 – US Realm implementation guide also include a set of entry level templates designed to represent
order information for use within the Orders Placed Section (2.16.840.1.113883.10.20.35.2.3).^116 They include: Act
Order (CDP1), Encounter Order (CDP1), Immunization Activity Order (CDP1), Medication Activity Order (CDP1),
Observation Order (CDP1), Procedure Order (CDP1), and Supply Order (CDP1).

The two sets of templates are consistent with each other. The set defined by the Payer community are more
constrained about the expectations for the allowable Act.statusCode, and more specific about the guidance on
what to indicate in the Act.effectiveTime.

**Reference:** [Declaring Section Template Conformance](section_level_guidance.html#declaring-section-template-conformance)

#### Problem

Problem information includes health concerns, problem concerns and problem observations including statements
about no known allergies.

^116 HL7 CDA® Release 2 Implementation Guide: Additional CDA R2 Templates – Clinical Documents for Payers – Set 1, Release 1 – US Realm. Table 31, page 137.

A patient problem is represented using a combination of templates designed to represent health concerns. Health
concerns contain data describing an interest or worry about a health state or process that could possibly require
attention, intervention, or management. It is a health-related matter that is of interest, importance or worry to
someone, who may be the patient, patient's family or patient's health care provider. Health concerns are derived
from a variety of sources within an EHR (such as Problem List, Family History, Social History, Social Worker Note,
etc.). Health concerns can be medical, surgical, nursing, allied health or patient-reported concerns.

Problem Concerns are a subset of health concerns that have risen to the level of importance that they typically
would belong on a classic “Problem List”, such as “Diabetes Mellitus” or “Family History of Melanoma” or “Tobacco
abuse”. These are of broad interest to multiple members of the care team. Examples of other Health Concerns that
might not typically be considered a Problem Concern include “Transportation difficulties” for someone who
doesn't drive and has trouble getting to appointments, or “Under-insured” for someone who doesn't have
sufficient insurance to properly cover their medical needs such as medications. Another related clinical statement
involves identifying risks. An example of a risk concern is, “Risk of Hyperkalemia” for a patient taking an ACE-
inhibitor medication.

The design of these concern templates enables multiple observations or multiple concerns to be tracked together
as a single concern. They act as a “wrapper” for the underlying Problem Observations.

Currently the Problem Section uses the Problem Concern template to record concerns commonly identified as
being “on the patient’s problem list”. The Health Concerns section uses Health Concern and Risk Concern
templates to record broader concerns, concerns that are not typically recorded on the patient’s problem list, and
risks that have not risen to the level of being a health concern.

When the designed clinical statement patterns do not match with the source information to be exchanged, it
creates challenges for implementers. The concern pattern has been a challenge for implementers because many
EHR systems do not organize the source problem data within the patient’s medical record in this way.

##### Problem Concern

| **Entry Template**   | **Problem Concern Act (V3)<br />[act: identifier urn:hl7ii:2.16.840.1.113883.10.20.22.4.3:2015-08-01 (open)]**    |
| ---- | ------ |
| **Reference Source**   | HL7 C-CDA R2.1  |
| **Purpose**   | This template reflects an ongoing concern on behalf of the provider who is managing the patient’s condition.  |
| **ActStatus**   | So long as the underlying condition is of ongoing concern and interest to the provider, the statusCode of the concern is “active”, regardless if the condition is active or resolved. Only when the underlying condition is no longer of concern is the statusCode of the Problem Concern Act set to “completed”.<br />The effectiveTime reflects the time that the underlying condition was felt to be a concern; it may or may not correspond to the effectiveTime of the condition (e.g., even five years later, the clinician may remain concerned about a prior heart attack).<br />The statusCode of the Problem Concern Act is the status of the concern, whereas the effectiveTime of the nested Problem Observation tells when the problem was experienced by the patient. The effectiveTime/low of the Problem Concern Act asserts when the concern became active. The effectiveTime/high asserts when the concern was completed (e.g., when the clinician deemed there is no longer any need to track the underlying condition).  |
| **Negation**   | Not explicitly specified.  |
| **Other Considerations**   | A Problem Concern Act can contain one or more Problem Observations (templateId 2.16.840.1.113883.10.20.22.4.4). In practice, most EHRs do not support this template design. See best practice guidance below for implementers who do not support problem concern tracking at this time.<br />Visit [HL7 CDA Example Search](http://hl7-c-cda-examples.herokuapp.com/sections/Problems)^117 for representing the expression [“No Known Problems”](http://hl7-c-cda-examples.herokuapp.com/examples/view/Problems/No%20Known%20Problems)<br />**Reference**: 5.2.6.2 Problem Observation  |
| **Reference**   | Visit [HL7 CDA Example Search](http://hl7-c-cda-examples.herokuapp.com/sections/Problems) |
| **Example**   | Example 37: Problem Concern containing a Problem Observation  |
{:.grid}
**Table 43: Problem Concern Template**

The design and guidance regarding the Problem Concern Act and Problem Observation templates are undergoing a
cross-workgroup collaborative review with participation from the HL7 Structured Documents and Patient Care
workgroups. This analysis has resulted in recommendations for improved guidance to help implementers with
challenges previously encountered when using the Problem Concern Act and Problem Observation templates to
exchange information about a patient’s conditions.

Based on guidance resulting from the HL7 cross-workgroup collaborative review project where the HL7 Patient
Care and Structured Documents workgroups jointly assessed issues with the Problem Concern Act template, the following guidance was developed^118.

<table
                                            style="border-collapse:collapse;margin-left:24.01pt"
                                            cellspacing="0">
                                            <tr style="height:257pt">
                                                <td
                                                  style="width:468pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"
                                                  bgcolor="#C5D9F0"><p class="s19"
                                                  style="padding-left: 41pt;padding-right: 8pt;text-indent: 0pt;text-align: left;"
                                                  >C-CDA Content Creators who do not natively
                                                  support organizing a patient’s problem
                                                  observations into collections associated with a
                                                  tracked concern SHOULD use the following
                                                  guidance:</p>
                                                  <p class="s19" style="padding-left: 78pt;text-indent: 0pt;line-height: 11pt;text-align: left;">1. Populate the Act.statusCode of the Problem Concern Act to reflect the status of the clinical statement about the problem stored within the source system.</p>
                                                  <p class="s19" style="padding-left: 78pt;text-indent: 0pt;line-height: 11pt;text-align: left;">2. Use nullFlavor=”NI” for the effectiveTime of the outer concern act wrapper.</p>
                                                  <p class="s19" style="padding-left: 78pt;text-indent: 0pt;line-height: 11pt;text-align: left;">3. Do not populate the author participation template associated with the outer concern act wrapper.</p>
                                                  <p class="s19" style="padding-left: 78pt;text-indent: 0pt;line-height: 11pt;text-align: left;">4. Include a single Problem Observation within the act wrapper. A future release of C-CDA will only allow the following within the act wrapper: only 1 entryRelationship of type REFR or COMP (1..1 entryRelationship of @typeCode=REFR OR @typeCode=COMP), and any number of supporting entryRelationships (0..* entryRelationship of @typeCode=SPRT)</p>
                                                  <p class="s19" style="padding-left: 78pt;text-indent: 0pt;line-height: 11pt;text-align: left;">5. Populate the effectiveTime of the Problem Observation with the clinically relevant time period associated with problem.</p>
                                                  <p class="s19" style="padding-left: 78pt;text-indent: 0pt;line-height: 11pt;text-align: left;">6. Include the author participation template associated with the Problem Observation to record the person who documented the problem.</p>
                                                  <p class="s19" style="padding-left: 78pt;text-indent: 0pt;line-height: 11pt;text-align: left;">7. Use the performer associated with the Problem Observation to record the person who made the diagnosis or observed the problem if that person is not also the author.</p>
                                                  <p class="s19" style="padding-left: 78pt;text-indent: 0pt;line-height: 11pt;text-align: left;">8. Use the Problem Status Observation template to record the clinical status assigned to the problem. Note that clinical status is a judgement assigned by the performer of the observation.
                                                  <b>[BP-085]</b></p></td>
                                            </tr>
                                        </table>
^117 HL7 C-CDA Examples Search. Problems. No Known Problems. http://cdasearch.hl7.org/examples/view/7353a215efda8dfe3fbacb19abbb90756ce14bab
^118 HL7 Cross-Workgroup C-CDA Template Review Project.

**Example 37: Problem Concern containing a Problem Observation**
```
<section>
    <!-- PLEASE REFER TO THE EXAMPLE TASK FORCE <https://cdasearch.hl7.org/sections/Problems> PAGE
FOR EXAMPLES TO COMMON CHALLENGES WITH ENTRIES IN THIS SECTION -->
    <templateId root="2.16.840.1.113883.10.20.22.2.5"/>
    <templateId root="2.16.840.1.113883.10.20.22.2.5" extension="2015-08- 01"/>
    <templateId root="2.16.840.1.113883.10.20.22.2.5.1"/>
    <templateId root="2.16.840.1.113883.10.20.22.2.5.1" extension="2015-08- 01"/>
    <id root="093A5380-00CE-11E6-B4C5-0050568B000B"/>
    <code code="11450-4" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"
        displayName="PROBLEM LIST"/>
    <title>Problem List</title>
    <text>
        <table width="100%">
            <thead>
                <tr>
                    <th>Problem Concern Information | Tracked By</th>
                    <th>Condition(s)</th>
                </tr>
            </thead>
            <tbody>
                <tr styleCode="normRow">
                    <td ID="ProblemConcern_1"><content>Active Problem</content> | <content/></td>
                    <td>
                        <list>
                            <item>
                                <table>
                                    <thead>
                                        <tr>
                                            <th>Problem Type | Problem<br/></th>
                                            <th>Time Frame</th>
                                            <th>Clinical Status</th>
                                            <th>Documented By</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr ID="ProblemObs1">
                                            <td>
                                                <content ID="ProblemObs_1_PT1">Problem</content> | <content
                                                    styleCode="Bold" ID="ProblemObs_1_P1">Osteoarthritis</content>
                                            </td>
                                            <td><content>(09/09/2014 - )</content></td>
                                            <td><content ID="ProblemObs_1_PS1">Active</content></td>
                                            <td><content>W.Colon</content> <content>(06/18/2015)</content></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </item>
                        </list>
                    </td>
                </tr>
            </tbody>
        </table>
    </text>
    <entry>
        <act classCode="ACT" moodCode="EVN">
            <!-- Problem Concern -->
            <templateId root="2.16.840.1.113883.10.20.22.4.3"/>
            <templateId root="2.16.840.1.113883.10.20.22.4.3" extension="2015-08- 01"/>
            <id extension="68993" root="1.2.840.114350.1.13.6289.1.7.2.768076"/>
            <id root="093A5380-00CE-11E6-B4C5-0050568B000B" extension="1"/>
            <code code="CONC" codeSystem="2.16.840.1.113883.5.6"
                codeSystemName="HL7ActClass" displayName="Concern"></code>
            <!-- This shows what to do when the source system does not track problem concerns. -->
            <text>
                <reference value="#ProblemConcern_1"></reference>
            </text>
            <statusCode code="active"/>
            <effectiveTime nullFlavor="NI"/>
            <!-- A System that supports Concern tracking MAY include the author(s) of the Concern
in addition to
author(s) for the contained Problem Observation(s). -->
            <entryRelationship inversionInd="false" typeCode="SUBJ">
                <!-- Problem Observation -->
                <observation classCode="OBS" moodCode="EVN">
                    <templateId root="2.16.840.1.113883.10.20.22.4.4"/>
                    <templateId root="2.16.840.1.113883.10.20.22.4.4" extension="2015-08- 01"/>
                    <templateId root="2.16.840.1.113883.10.20.22.4.4" extension="2022-06-01"/>
                    <id extension="68993" root="1.2.840.114350.1.13.6289.1.7.2.768076"/>
                    <id root="093A5380-00CE-11E6-B4C5-0050568B000B" extension="1.1"/>
                    <code code="55607006" codeSystem="2.16.840.1.113883.6.96" codeSystemName="SNOMED CT"
                        displayName="Problem">
                        <originalText>
                            <reference value="#ProblemObs_1_PT1"/>
                        </originalText>
                        <translation code="75326-9" codeSystem="2.16.840.1.113883.6.1"
                            codeSystemName="LOINC" displayName="Problem"/>
                    </code>
                    <text>
                        <reference value="#ProblemObs1"/>
                    </text>
                    <statusCode code="completed"/>
                    <effectiveTime>
                        <low value="20140909"/>
                    </effectiveTime>
                    <value code="396275006" codeSystem="2.16.840.1.113883.6.96" codeSystemName="SNOMED CT"
                        displayName="Osteoarthritis"
                        xsi:type="CD" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
                        <originalText>
                            <reference value="#ProblemObs_1_P1"/>
                        </originalText>
                        <translation code="715.90" codeSystem="2.16.840.1.113883.6.103" codeSystemName="ICD-
                            9CM" displayName="Osteoarthritis"/>
                        <translation code="M19.90" codeSystem="2.16.840.1.113883.6.90" codeSystemName="ICD-10-
                            CM" displayName="Osteoarthritis"/>
                    </value>
                    <author>
                        <time value="20150618"/>
                        <assignedAuthor>
                            <id nullFlavor="UNK"/>
                            <addr>
                                <streetAddressLine>8333 Clairemont Mesa Blvd.</streetAddressLine>
                                <city>Bel Air</city>
                                <state>MD</state>
                                <postalCode>21014</postalCode>
                            </addr>
                            <telecom use="WP" value="tel:+1-410-555-5544"/>
                            <assignedPerson>
                                <name>
                                    <given>Wilma</given>
                                    <family>Colon</family>
                                </name>
                            </assignedPerson>
                            <representedOrganization>
                                <name>Good Health Hospital</name>
                                <telecom use="WP" value="tel:+1-410-555-5544"/>
                                <addr>
                                    <streetAddressLine>8333 Clairemont Mesa Blvd.</streetAddressLine>
                                    <city>Bel Air</city>
                                    <state>MD</state>
                                    <postalCode>21014</postalCode>
                                </addr>
                            </representedOrganization>
                        </assignedAuthor>
                    </author>
                    <entryRelationship typeCode="REFR">
                        <observation classCode="OBS" moodCode="EVN">
                            <templateId root="2.16.840.1.113883.10.20.22.4.6"/>
                            <code code="33999-4" codeSystem="2.16.840.1.113883.6.1" displayName="Status"/>
                            <text>
                                <reference value="#ProblemObs_1_PS1"></reference>
                            </text>
                            <statusCode code="completed"/>
                            <effectiveTime>
                                <low value="20140909"/>
                            </effectiveTime>
                            <value code="55561003" codeSystem="2.16.840.1.113883.6.96" displayName="Active"
                                xsi:type="CD"
                                xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"/>
                        </observation>
                    </entryRelationship>
                </observation>
            </entryRelationship>
        </act>
    </entry>
</section>
```


##### Problem Observation

| **Entry Template**   | **Problem Observation (V4)<br />[observation: identifier urn:hl7ii:2.16.840.1.113883.10.20.22.4.4:2022-06-01 (open)]**    |
| ---- | ------ |
| **Reference Source**   | HL7 C-CDA R2.1  |
| **Purpose**   | This template reflects a discrete observation about a patient's problem.  |
| **ActStatus**   | This is a discrete observation that has been made in order for it to be documented. Therefore, it always has a statusCode of “completed”.<br />The effectiveTime, also referred to as the “clinically relevant time” is the time at which the observation holds true for the patient. For a provider seeing a patient in the clinic today, observing a history of heart attack that occurred five years ago, the effectiveTime is five years ago. The effectiveTime of the Problem Observation is the definitive indication of when the problem occurred. If the problem is known to be resolved, then an effectiveTime/high would be present. If the date of resolution is not known, then effectiveTime/high will be present with a nullFlavor of "UNK".^119  |
| **Negation**   | In this template, the negationInd attribute is used to indicate the absence of the condition in observation/value (Observation.ValueNegationInd).  |
| **Other Considerations**   | The optional Problem Status Observation template (identifier: urn:oid:2.16.840.1.113883.10.20.22.4.6) represents a clinical judgement of the status of the problem.<br /> negationInd of "true" coupled with an observation/value of SNOMED code 55607006 "Problem" indicates that the patient has [no known conditions](http://hl7-c-cda-examples.herokuapp.com/examples/view/Problems/No%20Known%20Problems).  |
| **Example**   | Example 37: Problem Concern containing a Problem Observation^120 |
| **Example**   | Example 38: No Known Problems  |
{:.grid}
**Table 44: Problem Observation Template**

^119 HL7 C-CDA R2.1 2018Dec with errata. Problem Observation (V3). Page 21.
^120 HL7 C-CDA Examples Search. Problems. No Known Problems. http://cdasearch.hl7.org/examples/view/7353a215efda8dfe3fbacb19abbb90756ce14bab

**Example 38: No Known Problems**
```
<section>
    <templateId root="2.16.840.1.113883.10.20.22.2.5.1"/>
    <!-- Problem Section with Coded Entries Required -->
    <templateId root="2.16.840.1.113883.10.20.22.2.5.1" extension="2015-08- 01"/>
    <!-- Problem Section with Coded Entries Required -->
    <code code="11450-4" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"
        displayName="Problem List"/>
    <title>PROBLEMS</title>
    <text ID="Concern_1"> Problem Concern:<br/> Concern Tracker Start Date: 06/07/2013
        16:05:06<br/>
        Concern Tracker End Date: <br/> Concern Status: Active<br/>
        <content ID="problems1">No known <content ID="problemType1">problems.</content></content>
    </text>
    <entry typeCode="DRIV">
        <!-- Problem Concern Act -->
        <act classCode="ACT" moodCode="EVN">
            <templateId root="2.16.840.1.113883.10.20.22.4.3"/>
            <templateId root="2.16.840.1.113883.10.20.22.4.3" extension="2015-08- 01"/>
            <id root="36e3e930-7b14-11db-9fe1-0800200c9a66"/>
            <!-- SDWG supports 48765-2 or CONC in the code element -->
            <code code="CONC" codeSystem="2.16.840.1.113883.5.6"/>
            <text>
                <reference value="#Concern_1"/>
            </text>
            <statusCode code="active"/>
            <!-- So long as the underlying condition is of concern to the provider (i.e., as long
as the condition,
whether active or resolved, is of ongoing concern and interest to the
provider), the statusCode is “active”.
Only when the underlying condition is no longer of concern is the statusCode
set to “completed”. -->
            <effectiveTime>
                <low value="20130607160506"/>
                <!-- The effectiveTime reflects the time that the underlying condition was felt
to be a concern;
it may or may not correspond to the effectiveTime of the condition (e.g.,
even five years later, the clinician may remain concerned about a prior heart attack).-->
            </effectiveTime>
            <!-- status is active so high is not applicable. If high is present it should have
nullFlavor of NA-->
            <author>
                <templateId root="2.16.840.1.113883.10.20.22.4.119"/>
                <time value="20130607160506"/>
                <assignedAuthor>
                    <id extension="66666" root="2.16.840.1.113883.4.6"/>
                    <code code="207RC0000X" codeSystem="2.16.840.1.113883.6.101"
                        codeSystemName="NUCC" displayName="Cardiovascular Disease"/>
                    <addr>
                        <streetAddressLine>6666 StreetName St.</streetAddressLine>
                        <city>Silver Spring</city>
                        <state>MD</state>
                        <postalCode>20901</postalCode>
                        <country>US</country>
                    </addr>
                    <telecom value="tel:+1(301)666-6666" use="WP"/>
                    <assignedPerson>
                        <name>
                            <given>Heartly</given>
                            <family>Sixer</family>
                            <suffix>MD</suffix>
                        </name>
                    </assignedPerson>
                </assignedAuthor>
            </author>
            <entryRelationship typeCode="SUBJ">
                <observation classCode="OBS" moodCode="EVN" negationInd="true">
                    <!-- The negationInd is used to indicate the absence of the condition in
observation/value (Observation.ValueNegationInd).
A negationInd of "true" coupled with an observation/value of SNOMED
code 55607006 "Problem"
indicates that the patient has no known conditions. -->
                    <!-- problem observation template -->
                    <templateId root="2.16.840.1.113883.10.20.22.4.4"/>
                    <templateId root="2.16.840.1.113883.10.20.22.4.4" extension="2015-08- 01"/>
                    <templateId root="2.16.840.1.113883.10.20.22.4.4" extension="2022-06- 01"/>
                    <id root="4adc1021-7b14-11db-9fe1-0800200c9a67"/>
                    <code code="64572001" displayName="Disease"
                        codeSystem="2.16.840.1.113883.6.96"
                        codeSystemName="SNOMED CT">
                        <translation code="75323-6" codeSystem="2.16.840.1.113883.6.1"
                            codeSystemName="LOINC" displayName="Condition"/>
                    </code>
                    <text>
                        <reference value="#problems1"/>
                    </text>
                    <statusCode code="completed"/>
                    <effectiveTime>
                        <low value="20130607160506"/>
                    </effectiveTime>
                    <!-- The time when this was clinically relevant ie True for the patient. -->
                    <!-- As a minimum time interval over which this is true, populate the
effectiveTime/low with the current time. -->
                    <!-- It would be equally valid to have a longer range of time over which this
statement was represented as being true. -->
                    <!-- As a maximum, you would never indicate an effectiveTime/high that was
greater than the current point in time. -->
                    <!-- This idea assumes that the value element could come from the Problem
value set, or-->
                    <!-- when negationInd was true, is could also come from the ProblemType value
set (and code would be ASSERTION). -->
                    <value xsi:type="CD" code="55607006" displayName="Problem"
                        codeSystem="2.16.840.1.113883.6.96" codeSystemName="SNOMED CT">
                        <originalText>
                            <reference value="#problemType1"/>
                        </originalText>
                    </value>
                </observation>
            </entryRelationship>
        </act>
    </entry>
</section>
```

##### Health Concern, Risk Concern

A health concern describes an interest or worry about a health state or process that could possibly require
attention, intervention, or management. A Health Concern is a health-related matter that is of interest,
importance or worry to someone, who may be the patient, patient's family or patient's health care provider. It is a
wrapper for a single health concern which may be derived from a variety of sources within an EHR (such as
Problem List, Family History, Social History, Social Worker Note, etc.). Problem Concerns are a subset of the set of
Health Concerns. Problem Concerns are more specifically the set of concerns a care provider has indicated as
being on the patient’s “Problem List”.

A Health Concern Act is used to track non-optimal physical or psychological situations drawing the patient to the
healthcare system. These may be from the perspective of the care team or from the perspective of the patient.
When the underlying condition is of concern (i.e., as long as the condition, whether active or resolved, is of
ongoing concern and interest), the statusCode is “active”. Only when the underlying condition is no longer of
concern is the statusCode set to “completed”. The effectiveTime reflects the time that the underlying condition
was felt to be a concern; it may or may not correspond to the effectiveTime of the condition (e.g., even five years
later, a prior heart attack may remain a concern). Health concerns require intervention(s) to increase the likelihood
of achieving the goals of care for the patient and they specify the condition-oriented reasons for creating the plan.

A Risk Concern Act represents a health concern that is at risk of occurring but has not yet manifested for the
patient. A risk is a clinical or socioeconomic condition that the patient does not currently have, but the probability
of developing that condition rises to the level of concern such that an intervention and/or monitoring is needed. It
is a wrapper for a single concern which may be derived from a variety of sources within an EHR (such as Problem
List, Family History, Social History, Social Worker Note, etc.). The design of this template is identical to the design
of a Health Concern template. The only difference is the semantics associated with the Act.code element. The
Act.code of a Risk Concern template carries the SNOMED CT concept 281694009 (Finding of at risk (finding))
whereas the Act.code of a Health Concern template carries the LOINC concept 75310 -3 (Health Concerns Document). 
The two templates are otherwise identical. Implementer best practice guidelines for the Health
Concern template should be applied to the Risk Concern template as well.

| **Entry Template**   | **Health Concern (V3)<br />[act: identifier urn:hl7ii:2.16.840.1.113883.10.20.22.4.132:2022-06-01 (open)]**    |
| ---- | ------ |
| **Reference Source**   | HL7 C-CDA R2.1  |
| **Purpose**   | This template represents a single health concern which may be derived from a variety of sources within an EHR (such as Problem List, Family History, Social History, Social Worker Note, etc.). A Health Concern is used to track non-optimal physical or psychological situations drawing the patient to the healthcare system. These may be from the perspective of the care team or from the perspective of the patient.  |
| **ActStatus**   | When the underlying condition is of concern (i.e., as long as the condition, whether active or resolved, is of ongoing concern and interest), the statusCode is “active”. Only when the underlying condition is no longer of concern is the statusCode set to “completed”.<br />The effectiveTime reflects the time that the underlying condition was felt to be a concern; it may or may not correspond to the effectiveTime of the condition (e.g., even five years later, a prior heart attack may remain a concern).  |
| **Negation**   | Not explicitly specified.  |
| **Other Considerations**   | In its simplest form, a Health Concern template can be used to wrap a Problem Observation template. Also, best practice guidance associated with the Problem Concern Act template can be applied similarly to the Health Concern template.<br />Examples of a Health Concern that might not be considered a Problem Concern include: "Risk of Hyperkalemia” for a patient taking an ACE-inhibitor medication, “Transportation difficulties” for a patient who doesn’t drive and has trouble getting to appointments, or “Under-insured” for a patient who doesn’t have sufficient insurance to cover their medical needs such as medications. Problem Concerns are a subset of Health Concerns. Problem Concerns are problems and diagnoses typically found on a classic “Problem List”, such as “Diabetes Mellitus” or “Family History of Melanoma” or “Multi-vessel Coronary Artery Disease”.  |
| **Example**   | Example 39: Health Concern narrative entry |
{:.grid}
**Table 45: Health Concern Template**

**Example 39: Health Concern narrative entry**
```
<component>
    <section>
        <!-- Health Concerns Section -->
        <templateId root="2.16.840.1.113883.10.20.22.2.58" extension="2015-08- 01"/>
        <code code="75310-3" displayName="Health Concerns Document"
            codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
        <title>Health Concerns</title>
        <text><paragraph ID="Concern">On March 1, 2014, the patient expressed concern about
            spreading their Community Acquired Pneumonia.</paragraph></text>
        <entry>
            <!-- Health Concern Act -->
            <act classCode="ACT" moodCode="EVN">
                <templateId root="2.16.840.1.113883.10.20.22.4.132" extension="2015-08- 01"/>
                <templateId root="2.16.840.1.113883.10.20.22.4.132" extension="2022-06-01"/>
                <id nullFlavor="UNK"/>
                <!-- Fixed act/code in C-CDA -->
                <code code="75310-3" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"
                    displayName="Health Concern"/>
                <text><reference value="#Concern"></reference></text>
                <statusCode code="active"/>
            </act>
        </entry>
    </section>
</component>
```


#### Allergy

Allergy information includes medication and non-medication allergy concerns and observations including
statements about no known allergies.

##### Allergy Concern

The Allergy Concern template enables multiple allergy intolerance observations to be tracked together as a single
concern. An allergy concern contains data describing a patient allergy or intolerance that could possibly require
attention, intervention, or management. The Allergy Concern Act template is used to record concerns commonly
identified as being “on the patient’s allergy list.” The Allergy Concern Act acts as a “wrapper” for the underlying
Allergy - Intolerance Observations.


| **Entry Template**   | **Allergy Concern Act (V3)<br />[act: identifier urn:hl7ii:2.16.840.1.113883.10.20.22.4.30:2015-08-01 (open)]**    |
| ---- | ------ |
| **Reference Source**   | HL7 C-CDA R2.1  |
| **Purpose**   | This template reflects an ongoing concern on behalf of the provider who is managing the patient’s care.  |
| **ActStatus**   | So long as the underlying allergy or intolerance is of ongoing concern and interest to the provider, the statusCode of the concern is “active”. Only when the underlying allergy or intolerance is no longer of concern is the statusCode of the Allergy Concern Act set to “completed.”<br />The effectiveTime reflects the time that the underlying allergy or intolerance was felt to be a concern; it may or may not correspond to the effectiveTime of the observation associated with the actual allergic reaction experienced by the patient.<br />The statusCode of the Allergy Concern Act is the status of the concern, whereas the effectiveTime of the nested Allergy - Intolerance Observation tells when the allergy or intolerance was experienced by the patient. The effectiveTime/low of the Allergy Concern Act asserts when the concern became active. The effectiveTime/high asserts when the concern was completed (e.g., when the clinician deemed there is no longer any need to track the underlying allergy or intolerance).  |
| **Negation**   | Not explicitly specified.  |
| **Other Considerations**   | An Allergy Concern Act can contain one or more Allergy - Intolerance Observations (templateId .16.840.1.113883.10.20.22.4.7). In practice, most EHRs do not support this template design. See best practice guidance below for implementers who do not support allergy concern tracking at this time.<br />Visit [HL7 CDA Example Search](http://hl7-c-cda-examples.herokuapp.com) for representing the expression “No Known Allergies”, [“No Known Medication Allergies”](http://hl7-c-cda-examples.herokuapp.com/examples/view/Allergies/No%20Known%20Medication%20Allergies).  |
| **Example**   | Example 40: Allergy concern for food allergy to eggs |
| **Example**   | Example 41: No known allergies |
| **Example**   | Visit [HL7 CDA Example Search](http://hl7-c-cda-examples.herokuapp.com/) for additional examples showing allergies to specific medication. |
{:.grid}
**Table 46: Allergy Concern Template**

When the designed clinical statement patterns do not match with the source information to be exchanged, it
creates challenges for implementers. The concern pattern has been a challenge for implementers because many
EHR systems do not organize the source allergy data within the patient’s medical record in this way. Based on
guidance resulting from the HL7 cross-workgroup collaborative review project where the HL7 Patient Care and
Structured Documents workgroups jointly assessed issues with the Allergy Concern Act template, the following guidance was developed.^122


<table
                                            style="border-collapse:collapse;margin-left:24.01pt"
                                            cellspacing="0">
                                            <tr style="height:257pt">
                                                <td
                                                  style="width:468pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"
                                                  bgcolor="#C5D9F0"><p class="s19"
                                                  style="padding-left: 41pt;padding-right: 8pt;text-indent: 0pt;text-align: left;"
                                                  >C-CDA Content Creators who do not natively
                                                  support organizing a patient’s allergy/intolerance observations into collections associated with a tracked concern SHOULD use the following guidance:</p>
                                                  <p class="s19" style="padding-left: 78pt;text-indent: 0pt;line-height: 11pt;text-align: left;">1. Populate the Act.statusCode of the Allergy Concern Act to reflect the status of the clinical statement about the allergy/intolerance stored within the source system.</p>
                                                  <p class="s19" style="padding-left: 78pt;text-indent: 0pt;line-height: 11pt;text-align: left;">2. Use nullFlavor=”NI” for the effectiveTime of the outer concern act wrapper.</p>
                                                  <p class="s19" style="padding-left: 78pt;text-indent: 0pt;line-height: 11pt;text-align: left;">3. Do not populate the author participation template associated with the outer concern act wrapper.</p>
                                                  <p class="s19" style="padding-left: 78pt;text-indent: 0pt;line-height: 11pt;text-align: left;">4. Include a single Allergy-Intolerance Observation within the act wrapper. A future release of C-CDA will only allow the following within the act wrapper: only 1 entryRelationship of type REFR or COMP (1..1 entryRelationship of @typeCode=REFR OR @typeCode=COMP), and any number of supporting entryRelationships (0..* entryRelationship of @typeCode=SPRT)</p>
                                                  <p class="s19" style="padding-left: 78pt;text-indent: 0pt;line-height: 11pt;text-align: left;">5. Populate the effectiveTime of the Problem Observation with the clinically relevant time period associated with allergy/intolerance.</p>
                                                  <p class="s19" style="padding-left: 78pt;text-indent: 0pt;line-height: 11pt;text-align: left;">6. Include the author participation template associated with the Allergy-Intolerance Observation to record the person who documented the problem.</p>
                                                  <p class="s19" style="padding-left: 78pt;text-indent: 0pt;line-height: 11pt;text-align: left;">7. Use the performer associated with the Allergy-Intolerance Observation to record the person who made the diagnosis or observed the allergy/intolerance.</p>
                                                  <p class="s19" style="padding-left: 78pt;text-indent: 0pt;line-height: 11pt;text-align: left;">8. Use the Allergy Status Observation template to record the clinical status assigned to the problem. Note that clinical status is a judgement assigned by the performer of the observation.
                                                  <b>[BP-086]</b></p></td>
                                            </tr>
                                        </table>
                                        
^122 HL7 Cross-Workgroup C-CDA Template Review Project.

**Example 40: Allergy concern for food allergy to eggs**
```
<section>
    <!-- PLEASE REFER TO THE EXAMPLE TASK FORCE <https://cdasearch.hl7.org/sections/Allergies>
PAGE FOR EXAMPLES TO COMMON CHALLENGES WITH ENTRIES IN THIS SECTION -->
    <templateId root="2.16.840.1.113883.10.20.22.2.6"/>
    <templateId root="2.16.840.1.113883.10.20.22.2.6" extension="2015-08- 01"/>
    <templateId root="2.16.840.1.113883.10.20.22.2.6.1"/>
    <templateId root="2.16.840.1.113883.10.20.22.2.6.1" extension="2015-08- 01"/>
    <id root="0937FF9A-00CE-11E6-B4C5-0050568B000B"/>
    <code code="48765-2" displayName="Allergies &amp;or adverse reactions doc"
        codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
    <title>ALLERGIES</title>
    <text>
        <table width="100%">
            <thead>
                <tr>
                    <th>Concern Information | Tracked By</th>
                    <th>Allergy - Intolerance Information</th>
                </tr>
            </thead>
            <tbody>
                <tr ID="AllergyConcern_1" styleCode="normRow">
                    <td>
                        <content>Active (01/04/2014 - )</content> | <content>(01/04/2019)
                            H.Seven</content>
                    </td>
                    <td>
                        <list>
                            <item>
                                <table>
                                    <thead>
                                        <tr>
                                            <th>Allergy Type | Allergen<br/></th>
                                            <th>Criticality</th>
                                            <th>Reaction | Severity<br/></th>
                                            <th>Time Frame</th>
                                            <th>Clinical Status</th>
                                            <th>Documented By</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr ID="AllergyConcern_1_Allergn_1">
                                            <td><content>Food allergy</content> | <content
                                                  styleCode="Bold" ID="AllergyConcern_1_Allergen_1"
                                                  >Egg</content>
                                            </td>
                                            <td>
                                                <content ID="AllergyConcern_1_Criticality_1">High
                                                  Criticality</content>
                                            </td>
                                            <td>
                                                <content ID="AllergyConcern_1_Reaction_1"
                                                  >Hives</content> | <content
                                                  ID="AllergyConcern_1_ReacSeverity_1"
                                                  >Moderate</content>
                                            </td>
                                            <td>
                                                <content>(1998)</content>
                                            </td>
                                            <td>
                                                <content>Active</content>
                                            </td>
                                            <td>
                                                <content>H.Provider</content>
                                                <content>(01/04/2014)</content>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </item>
                        </list>
                    </td>
                </tr>
            </tbody>
        </table>
    </text>
    <entry typeCode="DRIV">
        <act classCode="A CT" moodCode="E VN">
            <!-- ** Allergy Concern act ** -->
            <templateId root="2.16.840.1.113883.10.20.22.4.30"/>
            <templateId root="2.16.840.1.113883.10.20.22.4.30" extension="2015-08- 01"/>
            <id root="0fffb34f-c1e0-47c2-92af-c414a3ff21ec"/>
            <code code="CONC" codeSystem="2.16.840.1.113883.5.6"/>
            <text>
                <reference value="#AllergyConcern_1"/>
            </text>
            <statusCode code="active"/>
            <!-- This is the time stamp for when the allergy was first documented as a concern-->
            <effectiveTime>
                <low value="20140104123506- 08 00"/>
            </effectiveTime>
            <author>
                <templateId root="2.16.840.1.113883.10.20.22.4.119"/>
                <time val8e="20140104"/>
                <assignedAuthor>
                    <id extension="99999999" root="2.16.840.1.113883.4.6"/>
                    <code code="207Q00000X" codeSystem="2.16.840.1.113883.6.101"
                        codeSystemName="Health
                Care Provider Taxonomy" displayName="Family medicnne"/>
                    <telecom use="WP" value="tel:555-555-1002"/>
                    <assignedPerson>
                        <name>
                            <given>Henry</given>
                            <family>Seven</family>
                        </name>
                    </assignedPerson>
                </assignedAuthor>
            </author>
            <entryRelationship typeCode="SUBJ">
                <observation classCode="O BS" moodCode="E VN">
                    <!-- allergy observation template -->
                    <templateId root="2.16.840.1.113883.10.20.22.4.7"/>
                    <templateId root="2.16.840.1.113883.10.20.22.4.7" extension="2014-06- 09"/>
                    <id root="0fffb34f-c1e0-47c2-92af-c414a3ff21ec"/>
                    <code code="ASSERTION" codeSystem="2.16.840.1.113883.5.4"/>
                    <text>
                        <reference value="#AllergyConcern_1_Allergy_1"/>
                    </text>
                    <statusCode code="completed"/>
                    <!-- This is the time stamp for the clinical onset of the allergy. -->
                    <!-- Just the year is shown since a specific month and date was not reported -->
                    <effectiveTime>
                        <low value="1998"/>
                    </effectiveTime>
                    <!-- This specifies that the allergy is to a food in contrast to other allergies
(drug) -->
                    <value xsi:type="CD" code="414285001" displayName="Food allergy (disordor)"
                        codeSystem="2.16.840.1.113883.6.96" codeSystemName="SNOMED CT"/>
                    <author>
                        <templateId root="2.16.840.1.113883.10.20.22.4.119"/>
                        <time value="20140104"/>
                        <assignedAuthor>
                            <id extension="99999999" root="2.16.840.1.113883.4.6"/>
                            <code code="207Q00000X" codeSystem="2.16.840.1.113883.6.101"
                                codeSystemName="Health Care Provider Taxonomy"
                                displayName="Family Medicine"/>
                            <telecom use="WP" value="tel:555-555-1002"/>
                            <assignedPerson>
                                <name>
                                    <given>Henry</given>
                                    <family>Seven</family>
                                </name>
                            </assignedPerson>
                        </assignedAuthor>
                    </author>
                    <!-- In C-CDA R2.1 the participant is required. -->
                    <participant typeCode="C SM">
                        <participantRole classCode="MANU">
                            <playingEntity classCode="MMAT">
                                <!-- The agent responsible for an allergy or adverse reaction is not always a
manufactured material (for example, food allergies),
nor is it necessarily consumed. The following constraints reflect limitations in the base CDA R2
specification,
and should be used to represent any type of responsible agent, i.e., use playingEntity
classCode“= "MMAT" for all agents,
manufactured or not. -->
                                <!--
... the expectation for use is that the chosen concept identifier for a substance should be
appropriately specific and drawn from the available code systems in the following priority order:
NDFRT, then RXNORM, then SNOMEDCT. UNII was in an earlier version of this grouping value set but
has been removed due to lack of industry use
-->
                                <code code="102263004" displayName="Eggs (edible)"
                                    codeSystem="2.16.840.1.113883.6.96" codeSystemName="SNOMED CT">
                                    <originalText>
                                        <reference value="#AllergyConcern_1_Allergen_1"/>
                                    </originalText>
                                </code>
                            </playingEntity>
                        </participantRole>
                    </participant>
                    <entryRelationship typeCode="SUBJ" inversionInd="true">
                        <observation classCode="O BS" moodCode="E VN">
                            <templateId root="2.16.840.1.113883.10.20.22.4.145"/>
                            <code code="82606-5" codeSystem="2.16.840.1.113883.6.1"
                                displayName="Criticality"/>
                            <text>
                                <reference value="#AllergyConcern_1_Criticality_1"/>
                            </text>
                            <statusCode code="completed"/>
                            <value xsi:type="CD" code="CRITH" displayName="High Criticality"
                                codeSystem="2.16.840.1.113883.5.1.63"
                                codeSystemName="HL7ObservationValue"/>
                        </observation>
                    </entryRelationship>
                    <entryRelationship typeCode="MFST" inversionInd="true">
                        <observation classCode="O BS" moodCode="E VN"> —-- Reaction Observation
                            template --> <templateId root="2.16.840.1.113883.10.20.22.4.9"/>
                            <templateId root="2.16.840.1.113883.10.20.22.4.9"
                                extension="2014-06- 09"/>
                            <id root="d89ce431-e0f1-4f8d-a81f-489b6ed91f09"/>
                            <code code="ASSERTION" codeSystem="2.16.840.1.113883.5.4"/>
                            <text>
                                <reference value="#AllergyConcern_1_Reaction_1"/>
                            </text>
                            <statusCode code="completed"/>
                            <effectiveTime>
                                <low value="1998"/>
                                <high nullFlavor="U NK"/>
                            </effectiveTime>
                            <value xsi:type="CD" code="247472004"
                                codeSystem="2.16.840.1.113883.6.96" codeSystemNaee="SNOMED CT"
                                displayName="Hives"/>
                            <entryRelationship typeCode="SUBJ" inversionInd="true">
                                <observation classCode="O BS" moodCode="E VN"> —-- Severity
                                    Observation template --> <templateId
                                        root="2.16.840.1.113883.10.20.22.4.8"/>
                                    <templateId root="2.16.840.1.113883.10.20.22.4.8"
                                        extension="2014-06- 09"/>
                                    <code code="S EV" codeSystem="2.16.840.1.113883.5.4"
                                        codeSystemName="ActCode"/>
                                    <text>
                                        <reference value="#AllergyConcern_1_ReacSeverity_1"/>
                                    </text>
                                    <statusCode code="completed"/>
                                    <value xsi:type="CD" code="6736007"
                                        codeSystem="2.16.840.1.113883.6.96"
                                        codeSystemName="SNOMED CT" displayName="moderate"/>
                                </observation>
                            </entryRelationship>
                        </observation>
                    </entryRelationship>
                </observation>
            </entryRelationship>
        </act>
    </entry>
</section>
```

**Example 41: No known allergies**
```
<section>
    <!-- *** Allergies and Intolerances Section (entries required) (V3) *** -->
<templateId root="2.16.840.1.113883.10.20.22.2.6.1"/>
<templateId root="2.16.840.1.113883.10.20.22.2.6.1" extension="2015-08- 01"/>
<code code="4876 5 - 2" codeSystem="2.16.840.1.113883. 6 .1" codeSystemName="LOINC"/>
<title>ALLERGIES AND ADVERSE REACTIONS</title>
<text ID="allergiesNoKnown">No Known Allergies</text>
<entry typeCode="DRIV">
<!-- Allergy Concern Act -->
    <act classCode="A CT" moodCode="E VN">
        <templateId root="2.16.840.1.113883.10.20.22.4.30"/>
        <templateId root="2.16.840.1.113883.10.20.22.4.30" extension="2015-08- 01"/>
        <id root="36e3e930-7b14-11db-9fe1-0800200c9a66"/>
        <!-- SDWG supports 48765-2 or CONC in the code element -->
        <code code="CONC" codeSystem="2.16.840.1.113883.5.6"/>
        <text>
            <reference value="#allergiesNoKnown"/>
        </text>
        <statusCode code="active"/>
        <!--currently tracked concerns are active concerns-->
        <effectiveTime>
            <low value="20100103"/>
            <!--show time when the concern first began being tracked-->
        </effectiveTime>
        <author>
            <templateId root="2.16.840.1.113883.10.20.22.4.119"/>
            <time value="20100103"/>
            <assignedAuthor>
                <id extension="99999999" root="2.16.840.1.113883.4.6"/>
                <code code="207Q00000X" codeSystem="2.16.840.1.113883.6.101"
                    codeSystemName="Health Care Provider Taxonomy" displayName="Family Medicine"/>
                <telecom use="WP" value="tel:555-555-1002"/>
                <assignedPerson>
                    <name>
                        <given>Henry</given>
                        <family>Seven</family>
                    </name>
                </assignedPerson>
            </assignedAuthor>
        </author>
        <entryRelationship typeCode="SUBJ">
            <!-- No Known Allergies -->
            <!-- The negationInd = true negates the observation/value -->
            <!-- The use of negationInd corresponds with the newer Observation.valueNegationInd -->
            <observation classCode="O BS" moodCode="E VN" negationInd="true">
                <!-- allergy - intolerance observation template -->
                <templateId root="2.16.840.1.113883.10.20.22.4.7"/>
                <templateId root="2.16.840.1.113883.10.20.22.4.7" extension="2014-06- 09"/>
                <id root="4adc1020-7b14-11db-9fe1-0800200c9a66"/>
                <code code="ASSERTION" codeSystem="2.16.840.1.113883.5.4"/>
                <text>
                    <reference value="#allergiesNoKnown"/>
                </text>
                <statusCode code="completed"/>
                <!-- N–A - author/time records when this assertion was made -->
                <effectiveTime>
                    <low nullFlavor="NA"/>
                </effectiveTime>
                <value xsi:type="CD" code="419199007"
                    displayName="Allergy to substance (disorder)"
                    codeSystem="2.16.840.1.113883.6.96" codeSystemName="SNOMED CT"/>
                <author>
                    <templateId root="2.16.840.1.113883.10.20.22.4.119"/>
                    <time value="20100103"/>
                    <assignedAuthor>
                        <id extension="99999999" root="2.16.840.1.113883.4.6"/>
                        <code code="207Q00000X" codeSystem="2.16.840.1.113883.6.101"
                            codeSystemName="Health Care Provider Taxonomy"
                            displayName="Family Medicine"/>
                        <telecom use="WP" value="tel:555-555-1002"/>
                        <assignedPerson>
                            <name>
                                <given>Henry</given>
                                <family>Seven</family>
                            </name>
                        </assignedPerson>
                    </assignedAuthor>
                </author>
                <!-- In C-CDA R2.1 the participant is required. -->
                <participant typeCoCSM">
                    <participantRole classCode="MANU">
                        <playingEntity classCode="MMAT">
                            <code nullFlavor="NA"/>
                        </playingEntity>
                    </participantRole>
                </participant>
            </observation>
        </entryRelationship>
    </act>
    </entry>
</section>
```

##### Allergy – Intolerance

The design and guidance regarding the Allergy Concern Act and Allergy – Intolerance Observation templates are
undergoing a cross-workgroup collaborative review with participation from the HL7 Structured Documents and
Patient Care workgroups. This analysis has resulted in recommendations for improved guidance to help
implementers with challenges previously encountered when using the Allergy Concern Act and Allergy-Intolerance
Observation templates to exchange information about a patient’s allergies.

| **Entry Template**   | **Allergy - Intolerance Observation (V2)<br />[observation: identifier urn:hl7ii:2.16.840.1.113883.10.20.22.4.7:2014-06-09 (open)]**    |
| ---- | ------ |
| **Reference Source**   | HL7 C-CDA R2.1  |
| **Purpose**   | This template reflects a discrete observation about a pati’nt's allergy or intolerance.  |
| **ActStatus**   | This is a discrete observation that has been made in order for it to be documented. Therefore, it always has a statusCode of “completed.”<br />The effectiveTime, also referred to as the “clinically relevant time” is the time at which the observation holds true for the patient. For a provider seeing a patient in the clinic today, observing a history of penicillin allergy that developed five years ago, the effectiveTime is five years ago. The effectiveTime of the Problem Observation is the definitive indication of when the allergy-intolerance occurred. If the allergy/intolerance is known to be resolved, then an effectiveTime/high would be present. If allergy-intolerance in ongoing, then effectiveTime/high will not be present.^123  |
| **Negation**   | In this template, the negationInd attribute is used to indicate the absence of the allergy in observation/value (Observation.ValueNegationInd).  |
| **Other Considerations**   | The optional Allergy Status Observation template (identifier: urn:oid:<br />2.16.840.1.113883.10.20.22.4.28 ) represents a clinical judgement of the status of the allergy-intolerance.<br />The Allergy-Intolerance Observation includes a Reaction Observation that tells what sort of reaction was associated with the event. The Reaction Observation includes a Severity Observation to indicate how sever that reaction was. The Allergy-Intolerance Observation also includes a Criticality Observations that indicates how serious a health issue this allergy-intolerance is. The possible values for the Criticality Observation include: high criticality, low criticality, or unable to assess criticality.<br />Visit [HL7 CDA Example Search](http://hl7-c-cda-examples.herokuapp.com/sections/Problems) for representing the expression “No Known Problems.”^124 A negationInd of "true" coupled with an observation/value of SNOMED code 41919907. <br />"Allergy to substance (disorder)" indicates that the patient has no known allergies. |
| **Example**   | Example 42: Recording an allergy that started in January of 2009, but became a tracked concern as of January 4, 2014 |
| **Example**   | Example 43: Updating an allergy that is no longer a concern |
| **Example**   | Visit [HL7 CDA Example Search](http://hl7-c-cda-examples.herokuapp.com/sections/Problems) for additional examples for allergies |
{:.grid}

^123 HL7 C-CDA R2.1 2018Dec with errata. Problem Observation (V3). Page 21.
^124 HL7 C-CDA Examples Search. Problems. No Known Problems. http://cdasearch.hl7.org/examples/view/7353a215efda8dfe3fbacb19abbb90756ce14bab

**Table 47: Allergy - Intolerance Observation Template**

**Example 42: Recording an allergy that started in January of 2009, but became a tracked concern as of January 4, 2014**
```
<entry typeCode="DRIV">
    <act classCode="ACT" moodCode="EVN">
        <!-- ** Allergy problem act ** -->
        <templateId root="2.16.840.1.113883.10.20.22.4.30" extension="2015-08- 01"/>
        <templateId root="2.16.840.1.113883.10.20.22.4.30"/>
        <id root="4a2ac5fc-0c85-4223-baee-c2e254803974" />
        <code code="CONC" codeSystem="2.16.840.1.113883.5.6"/>
        <statusCode code="active"/>
        <!-- This is the time stamp for when the allergy was first documented as a concern-->
        <effectiveTime>
            <low value="20140104123506-0500"/>
        </effectiveTime>
        <author>
            <time value="20140104123506-0500"/>
            ...information identifying the author of the concern...
        </author>
        <entryRelationship typeCode="SUBJ">
            <observation classCode="OBS" moodCode="EVN">
                <!-- allergy observation template -->
                <templateId root="2.16.840.1.113883.10.20.22.4.7"/>
                <id root="4a2ac5fc-0c85-4223-baee-c2e254803974"/>
                <code code="ASSERTION" codeSystem="2.16.840.1.113883.5.4"/>
                <statusCode code="completed"/>
                <!-- This is the time stamp for the clinical onset of the allergy. -->
                <effectiveTime>
                    <low value="200901"/>
                </effectiveTime>
                ...
            </observation>
        </entryRelationship>
    </act>
</entry>
```

During an encounter, if a patient’s record was updated to indicate that an allergy concern recorded one month ago
about a penicillin allergy/intolerance that occurred five years ago was no longer a concern, the information
recorded in the CDA document would be as follows:

- act/statusCode - completed
- act/effectiveTime/low – a month ago
- act/effectiveTime/high – today (no longer a concern)
- act/author/time – today
- act/entryRelationship/observation/effectiveTime/low – five years ago
- act/entryRelationship/observation/effectiveTime/high - not present (allergy still ongoing)

**Example 43: Updating an allergy that is no longer a concern**
```
<entry typeCode="DRIV">
    <act classCode="ACT" moodCode="EVN">
        <!-- ** Allergy problem act ** -->
        <templateId root="2.16.840.1.113883.10.20.22.4.30" extension="2015-08- 01"/>
        <templateId root="2.16.840.1.113883.10.20.22.4.30"/>
        <id root="4a2ac5fc-0c85-4223-baee-c2e254803974" />
        <code code="CONC" codeSystem="2.16.840.1.113883.5.6"/>
        <statusCode code="completed"/>
        <!-- This is the time stamp for when the allergy was first documented as a concern-->
        <effectiveTime>
            <low value="20160104123506-0500"/>
            <high value="20160204123506-0500"/>
        </effectiveTime>
        <author>
            <time value="20160204123506-0500"/>
            ...information identifying the author of the concern...
        </author>
        <entryRelationship typeCode="SUBJ">
            <observation classCode="OBS" moodCode="EVN">
                <!-- allergy observation template -->
                <templateId root="2.16.840.1.113883.10.20.22.4.7"/>
                <id root="4a2ac5fc-0c85-4223-baee-c2e254803974"/>
                <code code="ASSERTION" codeSystem="2.16.840.1.113883.5.4"/>
                <statusCode code="completed"/>
                <!-- This is the time stamp for the clinical onset of the allergy. -->
                <effectiveTime>
                    <low value="200901"/>
                </effectiveTime>
                ... Add representation of the Allergy Status Observation ...
            </observation>
        </entryRelationship>
    </act>
</entry>
```

#### Medical Equipment

Medical Equipment includes devices implanted within the patient and devices the patient has or uses.

##### Implanted Device

Each implanted device can be represented in an Individual Procedure Activity Procedure template. If information
about the procedure that applied or placed the device is known, it should be included, otherwise as much
information as is known should be specified.

An implanted device (or groups of implanted devices) also can be represented within a Medical Equipment
Organizer template. Including information about a device in the procedure details does not remove the need to
list the device in the Medical Equipment section. Each component of the Medical Equipment Organizer contains a
Procedure Activity Procedure template.

UDI information is considered core data for interoperability. Content Creators should support population of an UDI
Organizer within a Procedure Activity Procedure to represent the parsed universal identifier information for an
implanted device. Content Consumers should support processing of this information when it is received.

| **Entry Template**   | **Procedure Activity Procedure (V2)<br/>[procedure: identifier urn:hl7ii:2.16.840.1.113883.10.20.22.4.14:2014-06-09 (open)]**    |
| ---- | ------ |
| **Reference Source**   | HL7 C-CDA R2.1  |
| **Purpose**   | This template is used to represent procedures whose immediate and primary outcome (post-condition) is the alteration of the physical condition of the patient. It also is used with a contained Product Instance template to represent a device implanted in or on a patient. In this case, targetSiteCode is used to record the location of the device in or on the patient's body.  |
| **ActStatus**   | This template includes a state model that includes: active, completed, aborted, and cancelled. When documenting an implanted medical device, the statusCode = “completed”.<br />The effectiveTime, also referred to as the “clinically relevant time” is the time at which the procedure was performed which implies the data the device was implanted. Best practice is to use the TS data type and record a single point in time to represent when the device was implanted. For implementers who must populate a time interval, effectiveTime/low MAY be populated. effectiveTime/high SHOULD NOT be populated. |
| **Negation**   | In this template, the negationInd attribute is used to indicate the procedure was not performed.  |
| **Other Considerations**   | The contained Product Instance template is used to represent a particular device that was placed in a patient or used as part of a procedure or other act.<br />To record the removal of an implanted device, use a separate Procedure Activity Procedure template with an appropriate code for the device removal procedure. Again, use the TS data type and record a single point in time to represent when the device was removed. Best practice includes linking the device removal procedure to the original implant procedure using the entry reference template. [act: identifier urn:oid:2.16.840.1.113883.10.20.22.4.122 (open)]<br />When representing that a procedure was not performed, the Indication (V2) (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.4.19:2014-06-09) template MAY be used to represent the rationale for not performing the procedure. More than one indication template may be contained within a Procedure template.<br />See example below for the representation of “No Implanted Devices”. The clinical statement pattern uses a combination of negation and nullFlavor to semantically represent “the patient has not had any procedures to implant any devices.” |
| **Example**   | Example 44: Implanted Device – known procedure details |
| **Example**   | Example 45: Implanted Device - Procedure unknown |
| **Example**   | Example 46: No Implanted Devices |
| **Example**   | Example 47: Non-Medicinal Supply – Cane and Eyeglasses |
{:.grid}
**Table 48: Procedure Activity Template**

**Example 44: Implanted Device – known procedure details**
```
<component>
    <section>
        <templateId root="2.16.840.1.113883.10.20.22.2.23"/>
        <templateId root="2.16.840.1.113883.10.20.22.2.23" extension="2014- 06 - 09"/>
        <code code="46264-8" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"
            displayName="Medical Equipment"/>
        <title>Implants</title>
        <text>
            <!-- table omitted for space -->
        </text>
        <entry>
            <procedure classCode="PROC" moodCode="EVN">
                <templateId root="2.16.840.1.113883.10.20.22.4.14" extension="2014-06- 09"/>
                <id extension="2744" root="1.2.840.114350.1.13.5552.1.7.2.737780"/>
                <code code="609588000" codeSystem="2.16.840.1.113883.6.96" codeSystemName="SNOMED CT"
                    displayName="Total knee replacement (procedure)">
                    <!-- Procedure is completed, even though the implant is still active -->
                    <statusCode code="completed"/>
                    <effectiveTime>
                        <!-- Placed Date -->
                        <low value="20160413"/>
                    </effectiveTime>
                    <targetSiteCode code="72696002" codeSystem="2.16.840.1.113883.6.96"
                        codeSystemName="SNOMED CT" displayName="Knee region structure">
                        <qualifier>
                            <name code="272741003" codeSystem="2.16.840.1.113883.6.96" codeSystemName="SNOMED
                                CT" displayName="laterality" />
                            <value code="7771000" codeSystem="2.16.840.1.113883.9.96" codeSystemName="SNOMED
                                CT" displayName="left" />
                        </qualifier>
                    </targetSiteCode>
                    <participant typeCode="DEV">
                        <participantRole classCode="MANU">
                            <templateId root="2.16.840.1.113883.10.20.22.4.37"/>
                            <id assigningAuthorityName="FDA"
                                extension="(01)00848486000400(11)160330(10)ABC634(21)123777" root="2.16.840.1.113883.3.3719"/>
                            <playingDevice>
                                <code nullFlavor="UNK">
                                    <originalText>
                                        <reference value="#implant1"/>
                                    </originalText>
                                </code>
                            </playingDevice>
                            <!-- From Product Instance template:
The scopingEntity/id should correspond to FDA or the appropriate issuing
agency. -->
                            <scopingEntity>
                                <id root="2.16.840.1.113883.3.3719"/>
                            </scopingEntity>
                        </participantRole>
                    </participant>
            </procedure>
        </entry>
        <entry>
            <!-- example without qualifier omitted for space -->
        </entry>
        <entry>
            <!-- example where targetSiteCode not mapped omitted for space -->
        </entry>
    </section>
</component>
```

**Example 45: Implanted Device - [Procedure unknown^125](http://hl7-c-cda-examples.herokuapp.com/examples/view/Medical%20Equipment/Implant%20Without%20Procedure)**
```
<component>
    <section>
        <templateId root="2.16.840.1.113883.10.20.22.2.23"/>
        <templateId root="2.16.840.1.113883.10.20.22.2.23" extension="2014-06- 09"/>
        <code code="46264-8" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"
            displayName="Medical Equipment"/>
        <title>Implants</title>
        <text>
            <!-- table omitted for space -->
        </text>
        <entry>
            <procedure classCode="PROC" moodCode="EVN">
                <templateId root="2.16.840.1.113883.10.20.22.4.14" extension="2014-06- 09"/>
                <id extension="2744" root="1.2.840.114350.1.13.5552.1.7.2.737780"/>
                <code nullFlavor="UNK"/>
                <!-- Procedure is completed, even though the implant is still active -->
                <statusCode code="completed"/>
                <effectiveTime>
                    <!-- Placed Date -->
                    <low value="20160413"/>
                </effectiveTime>
                <participant typeCode="DEV">
                    <participantRole classCode="MANU">
                        <templateId root="2.16.840.1.113883.10.20.22.4.37"/>
                        <id assigningAuthorityName="FDA"
                            extension="(01)00848486000400(11)160330(10)ABC634(21)123777" root="2.16.840.1.113883.3.3719"/>
                        <playingDevice>
                            <code nullFlavor="UNK">
                                <originalText>
                                    <reference value="#implant1"/>
                                </originalText>
                            </code>
                        </playingDevice>
                        <!-- From Product Instance template:
The scopingEntity/id should correspond to FDA or the appropriate issuing
agency. -->
                        <scopingEntity>
                            <id root="2.16.840.1.113883.3.3719"/>
                        </scopingEntity>
                    </participantRole>
                </participant>
            </procedure>
        </entry>
        <entry>
            <!-- example without qualifier omitted for space -->
        </entry>
        <entry>
            <!-- example where targetSiteCode not mapped omitted for space -->
        </entry>
    </section>
</component>
```

'^125 Source: https://github.com/benjaminflessner/HL7-C-CDA-Task-Force-Examples/blob/master/Implant Without Procedure.xml

To declare that a patient has no implanted devices, the Medical Equipment section should be used that has a
Procedure Activity Procedure entry with an effectiveTime that has a nullFlavor of ‘NA’ and a participantRole that
has an ID with a nullFlavor of ‘NA’ and a code of 40388003 – Implant. This combination states that the patient has
not had a procedure to implant anything.

**Example 46: [No Implanted Devices](http://hl7-c-cda-examples.herokuapp.com/examples/view/Medical%20Equipment/No%20Implanted%20Devices)**
```
<component>
    <section>
        <!-- Medical equipment section -->
        <templateId root="2.16.840.1.113883.10.20.22.2.23"/>
        <templateId root="2.16.840.1.113883.10.20.22.2.23" extension="2014-06- 09"/>
        <code code="46264-8" codeSystem="2.16.840.1.113883.6.1" />
        <title>MEDICAL EQUIPMENT</title>
        <!-- Alternative text: Patient has no history of procedures with implantable devices'-->
<!-- Alternative text: Patient has no implanted devices'-->
        <text><paragraph ID="Proc">Patient has no history of implantable
            devices</paragraph></text>
        <entry>
            <procedure classCode="PROC" moodCode="EVN" negationInd="true">
                <!-- Procedure Activity Procedure V2-->
                <templateId root="2.16.840.1.113883.10.20.22.4.14"/>
                <templateId root="2.16.840.1.113883.10.20.22.4.14" extension="2014-06- 09"/>
                <id root="d5b614bd-01ce-410d-8726-e1fd01dcc72a" />
                <code code="71388002" codeSystem="2.16.840.1.113883.6.96"
                    displayName="Procedure"/>
                <text>
                    <reference value="#Proc"/>
                </text>
                <statusCode code="completed" />
                <effectiveTime nullFlavor="NA" />
                <participant typeCode="DEV">
                    <participantRole classCode="MANU">
                        <templateId root="2.16.840.1.113883.10.20.22.4.37"/>
                        <!-- UDI is 'not applicable' since no procedure -->
                        <id nullFlavor="NA" root="2.16.840.1.113883.3.3719"/>
                        <playingDevice>
                            <code code="40388003" codeSystem="2.16.840.1.113883.6.96"
                                displayName="Implant"/>
                        </playingDevice>
                        <scopingEntity>
                            <id root="2.16.840.1.113883.3.3719"/>
                        </scopingEntity>
                    </participantRole>
                </participant>
            </procedure>
        </entry>
    </section>
</component>
```
^126 https://github.com/brettmarquard/HL7-C-CDA-Task-Force-Examples/blob/master/No_Implanted_Devices.xml
##### Non-Implanted Device

Non-implanted devices are represented with the Non-Medicinal Supply Activity template. This template is used to
represent devices the patient has such as eyeglasses or a cane.

| **Entry Template**   | **Non-Medicinal Supply<br/>[organizer: identifier urn: : hl7ii:2.16.840.1.113883.10.20.22.4.50:2014-06-09 (open)] )]**    |
| ---- | ------ |
| **Reference Source**   | HL7 C-CDA R2.1  |
| **Purpose**   | This template represents equipment supplied to the patient (e.g., pump, inhaler, wheelchair, cane, eyeglasses, hearing aid).  |
| **ActStatus**   | This template uses a state model that includes the full range of status values defined in the ActStatus value set (2.16.840.1.113883.1.11.15933).<br />The effectiveTime/low of the Non-Medicinal Supply act asserts when the person was first supplied with the indicated device. The effectiveTime/high asserts when the patient stopped using the supplied device. If the clinical statement is not about a specific non-medicinal device, it may be interpreted to generally describe when, for example, the patient first began wearing glasses or using a cane. If the clinical statement is about a specifically identified device, it may be interpreted to describe when the patient was supplied with that specific device. |
| **Negation**   | Not specified.  |
| **Other Considerations**   | This template is not used when represented devices that are implanted within the patient. For information about how to represent implanted devices see the Procedure Activity Procedure template. |
| **Example**   | Example 47: Non-Medicinal Supply – Cane and Eyeglasses |
{:.grid}
**Table 49: Non-Implanted Device Template**


**Example 47: Non-Medicinal Supply – Cane and Eyeglasses**
```
<section>
    <templateId root="2.16.840.1.113883.10.20.22.4.50" extension="2014-06- 09"/>
    <code code="46264-8" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"
        displayName="Medical Equipment"/>
    <title>Medical Equipment</title>
    <text>
        <table>
            <thead>
                <tr>
                    <th>Medical Equipment</th>
                    <th>Device Identifier (if applicable)</th>
                    <th>Model / Serial / Lot (if applicable)</th>
                    <th>Date</th>
                </tr>
            </thead>
            <tbody>
                <tr ID="equipment1">
                    <td><content ID="equipment1item" styleCode="header">Eye Glasses</content></td>
                    <td>n/a</td>
                    <td>n/a</td>
                    <td>(01/13/2000 - )</td>
                </tr>
                <tr ID="equipment2">
                    <td><content ID="equipment2item" styleCode="header">Cane</content></td>
                    <td>n/a</td>
                    <td>n/a</td>
                    <td>(04/13/2016 - )</td>
                </tr>
            </tbody>
        </table>
    </text>
    <entry>
        <supply classCode="SPLY" moodCode="EVN">
            <templateId root="2.16.840.1.113883.10.20.22.4.50"/>
            <templateId root="2.16.840.1.113883.10.20.22.4.50" extension="2014-06- 09"/>
            <id extension="2744999" root="1.2.840.999.1.13.5552.1.7.2.99999"/>
            <text><reference value="#equipment1"></reference></text>
            <statusCode code="active"/>
            <!-- low represents when person first received supply -->
            <effectiveTime xsi:type="IVL_TS">
                <low value="20000113"/>
                <high nullFlavor="NI"/> <!-- patient use of supply is ongoing, could be omitted for the
same semantics. -->
            </effectiveTime>
            <!--<quantity value="1" /> -->
            <participant typeCode="PRD">
                <participantRole classCode="MANU">
                    <templateId root="2.16.840.1.113883.10.20.22.4.37"/>
                    <!-- id of supply is unknown; An FDA identifier is not required since this is a non-
implantable device -->
                    <id root="1.2.840.999.1.13.5552.1.7.2.999991" nullFlavor="UNK"/>
                    <playingDevice>
                        <code code="50121007" codeSystem="2.16.840.1.113883.6.96" displayName="Eyeglasses">
                            <originalText>
                                <reference value="#equipment1item"/>
                            </originalText>
                        </code>
                    </playingDevice>
                    <!-- Required by Product Instance Template -->
                    <scopingEntity>
                        <id nullFlavor="NA"/>
                    </scopingEntity>
                </participantRole>
            </participant>
        </supply>
    </entry>
    <entry>
        <supply classCode="SPLY" moodCode="EVN">
            <templateId root="2.16.840.1.113883.10.20.22.4.50"/>
            <templateId root="2.16.840.1.113883.10.20.22.4.50" extension="2014-06- 09"/>
            <id extension="2744999" root="1.2.840.999.1.13.5552.1.7.2.99999"/>
            <!- - Template does not require a code, but best practice is to include a meaningful
            code for the type of entry. -->
            <code code="425399007" codeSystem="2.16.840.1.113883.6.96"
                codeSystemName="SNOMEDCT" displayName="Durable medical equipment (physical object)">
            </code>
            <text>
                <reference value="#equipment2"></reference>
            </text>
            <statusCode code="active"/>
            <!-- low represents when person first received supply -->
            <effectiveTime xsi:type="IVL_TS">
                <low value="20160413"/>
                <high nullFlavor="NI"/> <!-- patient use of supply is ongoing -->
            </effectiveTime>
            <participant typeCode="PRD">
                <participantRole classCode="MANU">
                    <templateId root="2.16.840.1.113883.10.20.22.4.37"/>
                    <!-- id of supply is unknown; An FDA identifier is not required since this is a
non-implantable device -->
                    <id root="1.2.840.999.1.13.5552.1.7.2.999991" nullFlavor="UNK"/>
                    <playingDevice>
                        <code code="87405001" codeSystem="2.16.840.1.113883.6.96" displayName="Cane">
                            <originalText>
                                <reference value="#equipment2item"/>
                            </originalText>
                        </code>
                    </playingDevice>
                    <!-- Required by Product Instance Template -->
                    <scopingEntity>
                        <id nullFlavor="NA"/>
                    </scopingEntity>
                </participantRole>
            </participant>
        </supply>
    </entry>
</section>
```

##### Product Instance

The Product Instance template is used to represent a particular device that was placed in a patient or used as part
of a procedure or other act.

| **Entry Template**   | **Product Instance [participantRole: identifier urn:oid:2.16.840.1.113883.10.20.22.4.37]**    |
| ---- | ------ |
| **Reference Source**   | HL7 C-CDA R2.1  |
| **Purpose**   | This template is used to record the identifier and other details about the given product that was used. For example, it is important to have a record that indicates not just that a hip prostheses was placed in a patient but that it was a particular hip prostheses number with a unique identifier.  |
| **ActStatus**   | Not applicable. |
| **Negation**   | Not applicable.  |
| **Other Considerations**   | The FDA Amendments Act specifies the creation of a Unique Device Identification (UDI) System that requires the label of devices to bear a unique identifier that will standardize device identification and identify the device through distribution and use. |
| **Example**   | Example 44: Implanted Device – known procedure details |
| **Example**   | Example 47: Non-Medicinal Supply – Cane and Eyeglasses |
{:.grid}
**Table 50: Product Instance Template**

##### Unique Device Identifiers

A Unique Device Identifier (UDI) is used to identify a device.

| **Entry Template**   | **UDI Organizer<br/>[organizer: identifier urn:hl7ii:2.16.840.1.113883.10.20.22.4.312:2019-06-21 (open)]**    |
| ---- | ------ |
| **Reference Source**   | HL7 C-CDA R2.1 Companion Guide – Appendix B  |
| **Purpose**   | This template is used to manage all the UDI-related templates to exchange the parsed UDI data elements and associated metadata including: device manufacturer, lot or batch number, serial number, manufacturing date, expiration date, distinct identification code, brand name, and model number, catalog number, company name, MRI safety, latex safety, and implantable device status.  |
| **ActStatus**   | The statusCode for the organizer is not specified.<br/>The effectiveTime element for the organizer is not specified. This template only conveys information about the UDI identifiers associated with a device. |
| **Negation**   | Not specified.  |
| **Other Considerations**   | Only the device manufacturer information is required in this template. All other component observations are optional.<br/><br/>If the implantable device status information is included, it SHALL contain one of following values from the NCI Thesaurus Code System (2.16.840.1.113883.3.26.1.1):<br/>- Active (C45329)<br/>- Inactive (C154407)<br/>- Malfunctioning (C122711)<br/>- Reduced Function (C160942)<br/><br/>From the value set identified with OID 2.16.840.1.113762.1.4.1021.48 |
| ** Reference**  | Chapter 3.85 Product Instance in the HL7 C-CDA Implementation Guide for information on how to encode the UDI. |
| ** Reference**  | See Appendix B for guidance on how to include an entryRelationship (typeCode=”COMP”) to reference a UDI Organizer containing the parsed components of the UDI identifier. The parsed components in the UDI Organizer shall align with the full UDI in the Product Instance. |
| **Example**   | New Sections.xml Sample |
{:.grid}
**Table 51: Unique Device Identifiers Template**


#### Goal

Previously, to satisfy the 2015 Edition Certification Criteria, guidance recommended for Transition of Care
documents (CCD, Discharge Summary, or Referral Note documents) should include the Goals Section. As the role
played by C-CDA continues to expand to support use cases focused on care planning and assessing quality care, the
need to gather and share goal information grows. Within goal information, it is impossible to measure the
outcome of interventions performed to effect progress toward a desired health outcome.

The C-CDA Goal Observation entry template is designed to represent three different types of goals: patient goals,
provider goals, and shared goals. The semantics to indicate if a goal is a patient, provider, or shared goal is
represented in the author structure of the entry.

##### Goal Observation

| **Entry Template**   | **Goal Observation (V2)<br/>[observation: identifier urn:oid:2.16.840.1.113883.10.20.22.4.121:2022-06-01 (open)]**    |
| ---- | ------ |
| **Reference Source**   | HL7 C-CDA R2.1 Companion Guide  |
| **Purpose**   | This template represents a patient health goal. A Goal Observation template may have related components that are acts, encounters, observations, procedures, substance administrations, or supplies.<br />A goal may be a patient or provider goal. If the author is set to the recordTarget (patient), this is a patient goal. If the author is set to a provider, this is a provider goal. If both patient and provider are set as authors, this is a negotiated goal.<br />A goal usually has a related health concern and/or risk.<br />A goal may have components consisting of other goals (milestones). These milestones are related to the overall goal through entryRelationships.  |
| **ActStatus**   | Currently bound to the single concept of “active”. This has been reported as a limitation that needs to be addressed.^127 |
| **Negation**   | Not explicitly specified.  |
| **Other Considerations**   | This template current provides no guidance on what should be populated in the value element. A comment has been made against the design to request greater guidance be provided regarding the use of the value element in the design of the template.^128<br />This template allows for multiple author participations ([0..*]).<br />If the author is the recordTarget (patient), this is a patient goal. If the author is a provider, this is a provider goal. If both patient and provider are authors, this is a negotiated goal. If no author is present, it is assumed the document or section author(s) is the author of this goal. |
| **Example**   | C-CDA R2.1 Figure 154 Goal Observation Example |
{:.grid}
**Table 52: Goal Observation Template**

^127 HL7 C-CDA R2.1 STU Comments #1773, #1279, #1278. http://www.hl7.org/dstucomments/showdetail.cfm?dstuid=168
^128 HL7 C-CDA R2.1 STU Comments #1429. http://www.hl7.org/dstucomments/showdetail.cfm?dstuid=168

**Example 48: Goal Observation narrative**
```
<section>
    <!-- PLEASE REFER TO THE EXAMPLE TASK FORCE <https://cdasearch.hl7.org/sections/Goals> PAGE
FOR EXAMPLES TO COMMON CHALLENGES WITH ENTRIES IN THIS SECTION -->
    <templateId root="2.16.840.1.113883.10.20.22.2.60"/>
    <code code="61146-7" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"
        displayName="Goals"/>
    <title>ACTIVE GOALS</title>
    <text>
        <table>
            <thead>
                <tr>
                    <th>Patient Goal Type</th>
                    <th>Goal</th>
                    <th>Patient-Stated?</th>
                    <th>Author</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>Blood Pressure</td>
                    <td>
                        <paragraph ID="goal1" styleCode="Bold">Get BP to normal (i.e. 120/80)</paragraph>
                    </td>
                    <td>No</td>
                    <td>Moreland, Andrew</td>
                </tr>
                ...
            </tbody>
        </table>
    </text>
    <entry>
        <observation classCode="OBS" moodCode="GOL">
            <templateId root="2.16.840.1.113883.10.20.22.4.121"/>
            <id extension="3241" root="1.2.840.114350.1.13.6289.1.7.2.737179"/>
            <code nullFlavor="UNK">
                <originalText>
                    <reference value="#goal2"/>
                </originalText>
            </code>
            <statusCode code="active"/>
            <effectiveTime>
                <low value="20160412113717-0500"/>
            </effectiveTime>
            <author>
                <templateId root="2.16.840.1.113883.10.20.22.4.119"/>
                <time value="20160412113717-0500"/>
                <assignedAuthor>
                    <id extension="1" root="1.2.840.114350.1.13.6289.1.7.2.697780"/>
                    <assignedPerson>
                        <name>
                            <given>Andrew</given>
                            <family>Moreland</family>
                        </name>
                    </assignedPerson>
                </assignedAuthor>
            </author>
        </observation>
    </entry>
    ...
</section>
```

##### Social History

The Social History Observation template is a general template designed to represent a full range of social history
observations. The Social History Observation Template has been updated to leverage Gravity Value Sets covering
multiple social risk domains. See 6.1.2 Social Determinant of Health Vocabulary Design Notes. In addition, a new Sexual Orientation Observation Template 2.16.840.1.113883.10.20.22.4.501:2022-06-01 was developed for this
USCDI V2 ballot update.

The Social History Observation template remains open to represent any SDOH observation related to conditions in
which people live, learn, work, and play even if not defined in the [Social Determinants of Health Conditions Value
Set](https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1196.788/expansion) or in a specific template.

For communicating detailed observations related to an individual’s work information, implementers can also
consider utilizing the templates in the C-CDA 2.1 Supplemental Templates for Occupational Data for Health
implementation guide.

<table
                                    style="border-collapse:collapse;margin-left:24.01pt"
                                    cellspacing="0">
                                    <tr style="height:29pt">
                                        <td
                                            style="width:468pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"
                                                bgcolor="#C5D9F0"><p class="s19"
                                                style="padding-left: 41pt;padding-right: 8pt;text-indent: 0pt;text-align: left;"
                                                >C-CDA Content Creators SHOULD use specific
                                                templates over general templates when an appropriate
                                                specific template has been defined.
                                                <b>[BP-087]</b></p></td>
                                    </tr>
                                </table>

| **Entry Template**   | **Social History Observation (V4)<br/>[observation: identifier urn:hl7ii:2.16.840.1.113883.10.20.22.4.38:2022-06-01 (open)]**    |
| ---- | ------ |
| **Reference Source**   | HL7 C-CDA R2.1  |
| **Purpose**   | This template represents a patient's occupations, lifestyle, and environmental health risk factors. Demographic data (e.g., marital status, race, ethnicity, religious affiliation) are captured in the header.  |
| **ActStatus**   | This is a discrete observation that has been made in order for it to be documented. Therefore, it always has a statusCode of “completed.”<br />This template does not include specific guidance about the meaning of the effectiveTime element. As an observation, the effectiveTime is the time at which the observation holds true for the patient. |
| **Negation**   | Not explicitly specified.  |
| **Other Considerations**   | Additional more specific social history observation templates also exist. They constrain the Social History Observation in specific ways to represent key social history data elements that are essential for interoperable data exchange. Though tobacco use and exposure may be represented with a general Social History Observation template, it is recommended to use the Current Smoking Status template or the Tobacco Use template instead to aid in their exchange. |
| **Example**   | Example 49: Social History Observation – Lead-Based paint in home environment illustrating use of the Social History Observation template for any social history observation |
{:.grid}
**Table 53: Entry Template**

**Example 49: Social History Observation - Lead-Based Paint in the Home**
```
<section>
    <templateId root="2.16.840.1.113883.10.20.22.2.17"/>
    <templateId root="2.16.840.1.113883.10.20.22.2.17" extension="2015-08- 01"/>
    <code code="29762-2" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"
        displayName="Social history"/>
    <title>Social History</title>
    <text>
        <table>
            <thead>
                <tr>
                    <th>Information Type</th>
                    <th>Date</th>
                    <th>Relevant Information</th>
                    <th>Documented By</th>
                </tr>
            </thead>
            <tbody>
                <tr ID="SocialHistory_3">
                    <td>Characteristic of Residence</td>
                    <td><content>(04/12/2016)</content></td>
                    <td><content ID="SH3_SO"> Presence of lead-based paint (finding)
                    </content></td>
                    <td><content>M.Smith</content> <content>(04/12/2016)</content></td>
                </tr>
            </tbody>
        </table>
    </text>
    <entry>
        <observation classCode="OBS" moodCode="EVN">
            <templateId root="2.16.840.1.113883.10.20.22.4.38"/>
            <templateId root="2.16.840.1.113883.10.20.22.4.38" extension="2015-08- 01"/>
            <id extension="64020-Z9311" root="1.2.840.114350.1.13.6289.1.7.1.1040.1"/>
            <code code="75274-1" codeSystem="2.16.840.1.113883.6.1"
                codeSystemName="LOINC" displayName="Characteristics of residence"/>
            <text><reference value="#SocialHistory_3"></reference></text>
            <statusCode code="completed"/>
            <effectiveTime value="20160412"/>
            <value xsi:type="CD" code="425203001 " displayName="Presence of lead-based paint
                (finding)
                codeSystem="2.16.840.1.113883.6.96" codeSystemName="SNOMEDCT">
                <originalText>
                    <reference value="#SH3_SO"></reference>
                </originalText>
            </value>
            <author>
                <time value="20160412"/>
                <assignedAuthor>
                    <id extension="10.1" root="1.2.840.114350.1.1"/>
                </assignedAuthor>
            </author>
        </observation>
    </entry>
    ...
</section>
```

##### Smoking Status

<table
                                            style="border-collapse:collapse;margin-left:24.01pt"
                                            cellspacing="0">
                                            <tr style="height:29pt">
                                                <td
                                                  style="width:468pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"
                                                  bgcolor="#C5D9F0"><p class="s19"
                                                  style="padding-left: 41pt;padding-right: 8pt;text-indent: 0pt;text-align: left;"
                                                  >C-CDA Content Creators SHALL NOT use the Smoking
                                                  Status– Meaningful Use (V2) template to represent
                                                  when the current smoking status started.
                                                  <b>[BP-088]</b></p></td>
                                            </tr>
                                        </table>

| **Entry Template**   | **Smoking Status – Meaningful Use (V2)<br/>[observation: identifier urn:hl7ii:2.16.840.1.113883.10.20.22.4.78:2014-06-09 (open)]**    |
| ---- | ------ |
| **Reference Source**   | HL7 C-CDA R2.1  |
| **Purpose**   | This template represents the current smoking status of the patient as specified in Meaningful Use (MU) Stage 2 requirements.  |
| **ActStatus**   | This is a discrete observation that has been made in order for it to be documented. Therefore, it always has a statusCode of “completed.”<br />This template represents a "snapshot in time" observation. It reflects the patient's smoking status at the time the observation is made. As a result, the effectiveTime is constrained to a time stamp that approximately corresponds with the author/time. |
| **Negation**   | Not explicitly specified.  |
| **Other Considerations**   | The 2019 ISA removes the value set requirements expected for these [data elements](https://www.healthit.gov/isa/representing-patient-tobacco-use-smoking-status)^129. Presently this template requires use of the following range of possible answers:<br />- Never smoked tobacco<br />- Occasional tobacco smoker<br />- Ex-smoker<br />- Heavy tobacco smoker<br />- Smokes tobacco daily<br />- Smoker<br />- Light tobacco smoker<br />- Tobacco smoking consumption unknown<br />Best practice implementation guidance allows alternate answers to be used.<br /><br />Within the Social History Section of a document there can be more than one Smoking Status observation recorded. The person’s “current” smoking status may have been recorded at several different points in time. |
| **Example**   | Example 50: Unknown Smoking Status |
| **Example**   | HL7 C-CDA R2.1 Figure 220 Smoking Status – Meaningful Use (V2) Example |
{:.grid}
**Table 54: Smoking Status**

**Example 50: [Unknown Smoking Status^130](http://hl7-c-cda-examples.herokuapp.com/examples/view/Social%20History/Unknown%20Smoking%20Status)**
```
<section>
    <templateId root="2.16.840.1.113883.10.20.22.2.17"/>
    <code code="29762-2" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"
        displayName="Social History"/>
    <title>Social History</title>
    <text>
        <list>
            <caption>Smoking Status</caption>
            <item>
                <content>Unknown if ever smoked</content>
                <content>As of: unknown</content>
                <content>Recorded June 6, 2014 10:32am</content>
            </item>
        </list>
    </text>
    <entry>
        <observation classCode="OBS" moodCode="EVN">
            <templateId root="2.16.840.1.113883.10.20.22.4.78"/>
            <code code="ASSERTION" codeSystem="2.16.840.1.113883.5.4"/>
            <statusCode code="completed"/>
            <effectiveTime>
                <low nullFlavor="UNK"/>
                <value xsi:type="CD" codeSystem="2.16.840.1.113883.6.96"
                    codeSystemName="SNOMED CT" code="266927001" displayName="Tobacco smoking consumption unknown"/>
                <author>
                    <time value="201406061032+0500"/>
                    <assignedAuthor>
                        <id root="2.16.840.1.113883.4.6" extension="99999999"/>
                        <code code="200000000X"
                            codeSystem="2.16.840.1.113883.6.101"
                            displayName="Allopathic and Osteopathic Physicians"/>
                        <telecom use="WP" value="tel:+1(555)555-1002"/>
                        <assignedPerson>
                            <name>
                                <given>Henry</given>
                                <family>Seven</family>
                            </name>
                        </assignedPerson>
                    </assignedAuthor>
                </author>
        </observation>
    </entry>
</section>
```
^129 https://www.healthit.gov/isa/representing-patient-tobacco-use-smoking-status
^130 https://github.com/jddamore/HL7-Task-Force-Examples/blob/master/SMOKING_Unknown_Smoker.xml

##### Tobacco Use

<table
                                            style="border-collapse:collapse;margin-left:24.01pt"
                                            cellspacing="0">
                                            <tr style="height:29pt">
                                                <td
                                                  style="width:468pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"
                                                  bgcolor="#C5D9F0"><p class="s19"
                                                  style="padding-left: 41pt;padding-right: 9pt;text-indent: 0pt;text-align: left;"
                                                  >C-CDA Content Creators SHALL use the Tobacco Use
                                                  (V2) template to describe dates associated with
                                                  the patient&#39;s tobacco use over time.
                                                  <b>[BP-089]</b></p></td>
                                            </tr>
                                        </table>

| **Entry Template**   | **Tobacco Use (V2)<br/>[observation: identifier urn:hl7ii:2.16.840.1.113883.10.20.22.4.85:2014-06-09 (open)]**    |
| ---- | ------ |
| **Reference Source**   | HL7 C-CDA R2.1  |
| **Purpose**   | This template contains information that describes a patient's tobacco use over time.  |
| **ActStatus**   | This is a discrete observation that has been made in order for it to be documented. Therefore, it always has a statusCode of “completed.”<br />The effectiveTime element is used to describe dates associated with the patient's tobacco use. It represents the clinically relevant time of the observation about the patient’s tobacco use. |
| **Negation**   | Not explicitly specified.  |
| **Other Considerations**   | All the types of tobacco use from the tobacco use and exposure-finding hierarchy in SNOMED CT, including codes required for recording smoking status in Meaningful Use Stage 2 are used by this template. |
| **Example**   | Example 51: Tobacco Use –Light Tobacco Smoker between 4/12/2010 and 4/12/2016. |
{:.grid}
**Table 55: Tobacco Use**


**Example 51: Tobacco Use –Light Tobacco Smoker between 4/12/2010 and 4/12/2016.**
```
<observation classCode="OBS" moodCode="EVN">
    <templateId root="2.16.840.1.113883.10.20.22.4.78"/>
    <templateId root="2.16.840.1.113883.10.20.22.4.78" extension="2014-06- 09"/>
    <id extension="64020-Z9301" root="1.2.840.114350.1.13.6289.1.7.1.1040.1"/>
    <code code="11367-0" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"
        displayName="History of Tobacco Use"/>
    <statusCode code="completed"/>
    <effectiveTime>
        <low value="20100412"/>
        <high value="20160412"/>
    </effectiveTime>
    <value xsi:type="CD" code="77176002" codeSystem="2.16.840.1.113883.6.96"
        codeSystemName="SNOMEDCT" displayName=" Light tobacco smoker (finding)"/>
</observation>
```

##### Birth Sex

This observation represents the biological sex assigned to the patient at birth. Although several states permit
residents to alter their birth certificate, this observation records the biological sex that is entered on the person's
birth certificate at time of birth. Birth sex information is relevant in a clinical setting. For example, laboratory reference range results may differ based on a patient’s biological sex. Birth sex information would be needed for
accurate result reporting.

<table
                                            style="border-collapse:collapse;margin-left:24.01pt"
                                            cellspacing="0">
                                            <tr style="height:49pt">
                                                <td
                                                  style="width:468pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"
                                                  bgcolor="#C5D9F0"><p class="s19"
                                                  style="padding-left: 41pt;padding-right: 2pt;text-indent: 0pt;text-align: left;"
                                                  >C-CDA Content Creators SHALL populate the
                                                  effectiveTime/value of the Birth Sex Observation
                                                  template with the patient’s birthdate. The
                                                  effectiveTime/low and effectiveTime/high elements
                                                  SHALL NOT be used in the Birth Sex Observation
                                                  template. Conformance SHALL be identical to the
                                                  conformance of the birthTime metadata element.
                                                  <b>[CONF-090]</b></p></td>
                                            </tr>
                                        </table>

| **Entry Template**   | **Birth Sex Observation<br/>[observation: identifier urn:hl7ii:2.16.840.1.113883.10.20.22.4.200:2016-06-01 (open)]**    |
| ---- | ------ |
| **Reference Source**   | HL7 C-CDA R2.1 Companion Guide R1  |
| **Purpose**   | This observation represents the sex of the patient at birth. It is the sex that is entered on the person's birth certificate at time of birth.  |
| **ActStatus**   | This is a discrete observation that has been made in order for it to be documented. Therefore, it always has a statusCode of “completed.”<br />The template does not provide guidance on the use of the effectiveTime element. It represents the clinically relevant time of the observation about the patient’s birth sex. |
| **Negation**   | Not explicitly specified.  |
| **Other Considerations**   | This observation is intended to be used in the Social History section.<br />This observation is not appropriate for recording patient gender (administrativeGender). The patient’s administrative gender is recorded in the header of the document using the recordTarget.administrativeGender element. |
| **Example**   | Example 52: Birth Sex |
{:.grid}
**Table 56: Birth Sex Template**

**Example 52: Birth Sex**
```
<!-- Birth Sex Entry - Approved in C-CDA R2.1 Companion Guide -->
<observation classCode="OBS" moodCode="EVN">
    <!-- New templateId for Birth Sex -->
    <!-- Not planning to assert conformance to Social History Observation due to different
vocab -->
    <templateId root="2.16.840.1.113883.10.20.22.4.200" extension="2016-06- 01"/>
    <code code="76689-9" codeSystem="2.16.840.1.113883.6.1"
        displayName="Sex Assigned At Birth"/>
    <text>
        <reference value="#BSex_Narrative1"/>
    </text>
    <statusCode code="completed"/>
    <!-- effectiveTime if present should match birthTime -->
    <!-- Request name change to QRDA value set (2.16.840.1.113762.1.4.1) - ONC Birth Sex -->
<value xsi:type="CD" codeSystem="2.16.840.1.113883.5.1"
codeSystemName="AdministrativeGender"
code="F" displayName="Female">
<originalText>
<reference value="#BSex_value"/>
</originalText>
</value>
</observation>
```


##### Pregnancy Status

The Pregnancy Observation is used to represent a person’s pregnancy status over time. It is a type of social history
observation and can included in the Social History Section. For communicating more detailed observations related
to an individual’s pregnancy status, implementers can also consider utilizing the templates in the [HL7 CDA® R2
Implementation Guide: C-CDA R2.1 Supplemental Templates for Pregnancy Status, Release 1 - US Realm](http://www.hl7.org/implement/standards/product_brief.cfm?product_id=494).

| **Entry Template**   | **Pregnancy Observation<br/>[observation: identifier urn:oid:2.16.840.1.113883.10.20.15.3.8 (open)]**    |
| ---- | ------ |
| **Reference Source**   | HL7 C-CDA R2.1  |
| **Purpose**   | This template contains information that describes a patient's pregnancy status over time.  |
| **ActStatus**   | This is a discrete observation that has been made in order for it to be documented. Therefore, it always has a statusCode of “completed.”<br />The effectiveTime element is used to describe dates associated with the patient's different pregnancy statuses over time. It represents the clinically relevant time of the observation about the patient’s pregnancy status. |
| **Negation**   | Not explicitly specified.  |
| **Other Considerations**   | The value element of this template holds the patient’s pregnancy status. Possible coded concepts for this data element include:<br />- Possible pregnancy (finding)<br />- Not pregnant (finding)<br />- Pregnant (finding) |
| **Example**   | Example 53: Patient was pregnant from 4/10/2011 to 1/12/2012 |
| **Example**   | Example 54: Patient was not pregnant |
| **Example**   | Example 55: Unknown if the patient was pregnant or not |
{:.grid}
**Table 57: Pregnancy Observation**

**Example 53: Patient was pregnant from 4/10/2011 to 1/12/2012**
```
<observation classCode="OBS" moodCode="EVN">
    <templateId root="2.16.840.1.113883.10.20.15.3.8"/>
    <id extension="123456789" root="2.16.840.1.113883.19"/>
    <code code="ASSERTION" codeSystem="2.16.840.1.113883.5.4"/>
    <statusCode code="completed"/>
    <effectiveTime>
        <low value="20110410"/>
        <high value="20120112"/>
    </effectiveTime>
    <value xsi:type="CD" code="77386006"
        displayName="pregnant"
        codeSystem="2.16.840.1.113883.6.96"/>
    <entryRelationship typeCode="REFR">
        <templateId root="2.16.840.1.113883.10.20.15.3.1"/>
        ... </entryRelationship>
</observation>
```

To indicate that the patient was not pregnant during a specified date range, the Pregnancy Observation entry
should also be used, but with a negationInd set to “true” to indicate that the patient was not pregnant during the
date range specified by the effectiveTime element.

**Example 54: Patient was not pregnant**
```
<observation classCode="OBS" moodCode="EVN" negationInd="true">
    <templateId root="2.16.840.1.113883.10.20.15.3.8"/>
    <id extension="123456789" root="2.16.840.1.113883.19"/>
    <code code="ASSERTION" codeSystem="2.16.840.1.113883.5.4"/>
    <statusCode code="completed"/>
    <effectiveTime>
        <low value="20110410"/>
        <high value="20110710"/>
    </effectiveTime>
    <value xsi:type="CD" code="77386006"
        displayName="pregnant"
        codeSystem="2.16.840.1.113883.6.96"/>
    <entryRelationship typeCode="REFR">
        <templateId root="2.16.840.1.113883.10.20.15.3.1"/>
        ... </entryRelationship>
</observation>
```

Finally, to indicate that it was unknown if the patient was pregnant or not, then a nullFlavor should be used on the
observation to indicate that the patient’s pregnancy status was unknown. An effectiveTime element can be
included to assert the period over which it was unknown.

**Example 55: Unknown if the patient was pregnant or not**
```
<observation classCode="OBS" moodCode="EVN" nullFlavor="UNK">
    <templateId root="2.16.840.1.113883.10.20.15.3.8"/>
    <id extension="123456789" root="2.16.840.1.113883.19"/>
    <code code="ASSERTION" codeSystem="2.16.840.1.113883.5.4"/>
    <statusCode code="completed"/>
    <effectiveTime>
        <low value="20110410"/>
        <high value="20110710"/>
    </effectiveTime>
    <value xsi:type="CD" code="77386006"
        displayName="pregnant"
        codeSystem="2.16.840.1.113883.6.96"/>
    <entryRelationship typeCode="REFR">
        <templateId root="2.16.840.1.113883.10.20.15.3.1"/>
        ... </entryRelationship>
</observation>
```
#### Result

Results generated by laboratories, imaging procedures, and other procedures are coded as result observations and
contained within a Results Organizer. The Result Organizer.code element is used to categorize the contained
results into one of several commonly accepted values (e.g., “Hematology”, “Chemistry”, “Nuclear Medicine”). This is how laboratory tests are distinguished from Diagnostic imaging tests.

##### Pathology and Laboratory Result Domain

Pathology is the superset domain that encompasses several subdisciplines: anatomic pathology, chemical
pathology, clinical pathology, forensic pathology, genetic pathology, hematology, immunopathology,etc [^131](https://www.betterhealth.vic.gov.au/health/conditionsandtreatments/Blood-and-pathology-tests)).
Therefore, a laboratory test is a type of pathology test.

##### Result Organizer

This template provides a mechanism for grouping result observations. It contains information applicable to all of
the contained result observations. If any Result Observation within the organizer has a statusCode of "active", the
Result Organizer must also have a statusCode of "active."

<table
                                            style="border-collapse:collapse;margin-left:24.01pt"
                                            cellspacing="0">
                                            <tr style="height:37pt">
                                                <td
                                                  style="width:468pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"
                                                  bgcolor="#C5D9F0"><p class="s19"
                                                  style="padding-left: 41pt;padding-right: 5pt;text-indent: 0pt;text-align: left;"
                                                  >The Result Organizer.code element is used to
                                                  categorize the contained results. This element
                                                  SHOULD be populated with a LOINC code that defines
                                                  a specific test panel (<i>e.g</i>., “CBC W Auto
                                                  Differential panel - Blood“) or general type of testing (<i>e.g.,
                                                  </i>“Hematology”, “Chemistry”, “Nuclear
                                                  Medicine”). <b>[BP-091]</b></p></td>
                                            </tr>
                                        </table><p style="text-indent: 0pt;text-align: left;"
                                            ><br /></p><p class="s43"
                                            style="padding-left: 24pt;text-indent: 0pt;text-align: left;"
                                                ><a name="bookmark558">131</a><a
                                                href="http://www.betterhealth.vic.gov.au/health/conditionsandtreatments/Blood-and-pathology-tests"
                                                class="a" target="_blank"> https://</a><a
                                                href="http://www.betterhealth.vic.gov.au/health/conditionsandtreatments/Blood-and-pathology-tests"
                                                target="_blank"
                                                >www.betterhealth.vic.gov.au/health/conditionsandtreatments/Blood-and-pathology-tests</a></p><p
                                            style="text-indent: 0pt;text-align: left;"
                                            ><br /></p><table
                                            style="border-collapse:collapse;margin-left:24.01pt"
                                            cellspacing="0">
                                            <tr style="height:29pt">
                                                <td
                                                  style="width:468pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"
                                                  bgcolor="#C5D9F0"><p class="s19"
                                                  style="padding-left: 41pt;text-indent: 0pt;line-height: 12pt;text-align: left;"
                                                  >A Result Organizer SHALL contain at least one
                                                  Result Observation component template.
                                                  <b>[CONF-092]</b></p></td>
                                            </tr>
                                        </table>

| **Entry Template**   | **Result Organizer (V3)<br/>[organizer: identifier urn:hl7ii:2.16.840.1.113883.10.20.22.4.1:2015-08-01 (open)]**    |
| ---- | ------ |
| **Reference Source**   | HL7 C-CDA R2.1  |
| **Purpose**   | This template provides a mechanism for grouping result observations. It contains information applicable to all of the contained result observations.  |
| **ActStatus**   | If any Result Observation within the organizer has a statusCode of "active", the Result Organizer must also have a statusCode of "active".<br />The range of time specified in the Result Organizer/effectiveTime element should encompass the lowest effectiveTime/low and the highest effectiveTime/high for the Result Observations within the organizer. |
| **Negation**   | Not specified.  |
| **Other Considerations**   | If the Author Participation template is specified for the Organizer, this context applies to all the component observations unless a component observation includes a different Author Participation template.) |
| **Example**   | Example 56: Result Organizer for CBC W Auto Differential panel - Blood |
{:.grid}
**Table 58: Result Organizer Template**

**Example 56: Result Organizer for CBC W Auto Differential panel - Blood**
```
<section>
    <!-- PLEASE REFER TO THE EXAMPLE TASK FORCE <https://cdasearch.hl7.org/sections/Results> PAGE
FOR EXAMPLES TO COMMON CHALLENGES WITH ENTRIES IN THIS SECTION -->
    <!-- Results Section (entries required) (V3) -->
    <!-- This example shows that laboratory results more recent than the inpatient encounter are
available at Good Health Hospital at the time the CCD is generated. This is a Patient Summary,
not an Encounter Document. It covers a span of time.-->
    <templateId root="2.16.840.1.113883.10.20.22.2.3.1" extension="2015-08- 01"/>
    <templateId root="2.16.840.1.113883.10.20.22.2.3.1"/>
    <code code="30954-2" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"
        displayName="Relevant diagnostic tests/laboratory data Narrative"/>
    <title>RESULTS</title>
    <text>
        <content ID="Results_STR">This document includes patent laboratory results for testing
            performed within the past three months.</content> <br></br>
        <br></br>
        <content styleCode="Bold">CBC W Auto Differential panel - Blood (04/01/2016)</content> |
        <content>Diagnostic Labs (04/02/2016)</content>
        <table>
            <thead>
                <tr>
                    <th>Result Type</th>
                    <th>Result Value</th>
                    <th>Relevant Reference Range</th>
                    <th>Interpretation</th>
                    <th>Date</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td ID="result1">Hemoglobin</td>
                    <td ID="resultvalue1">13.2 g/dL</td>
                    <td ID="referencerange1">Normal range for women is 12.0 to 15.5 grams per
                        deciliter</td>
                    <td>Normal</td>
                    <td>04/01/2016</td>
                </tr>
                <tr>
                    <td ID="result2">Leukocytes</td>
                    <td ID="resultvalue2">6.7 10*3/uL</td>
                    <td ID="referencerange2">Normal white blood cell count range 3.5-10.5 billion
                        cells/L</td>
                    <td>Normal</td>
                    <td>04/01/2016</td>
                </tr>
                ...
            </tbody>
        </table>
    </text>
    <entry>
        <observation classCode="OBS" moodCode="EVN">
            <!-- Section Time Range Observation -->
            <templateId root="2.16.840.1.113883.10.20.22.4.201" extension="2016-06- 01"/>
            <code code="82607-3" displayName="Clinical data [Date and Time Range]"
                codeSystem="2.16.840.1.113883.6.1"
                codeSystemName="LOINC"></code>
            <text><reference value="#Results_STR"></reference></text>
            <statusCode code="completed"/>
            <value xsi:type="IVL_TS">
                <low value="20160401"/>
                <high value="20160412"/>
            </value>
            <author>
                <!-- The system that generated the CCD -->
                <time value="20160412114559-0500"/>
                <assignedAuthor>
                    <id extension="8.3" root="1.2.840.114350.1.1"/>
                </assignedAuthor>
            </author>
        </observation>
    </entry>
    <entry typeCode="DRIV">
        <organizer classCode="BATTERY" moodCode="EVN">
            <!-- ** Result organizer (V3) ** -->
            <templateId root="2.16.840.1.113883.10.20.22.4.1" extension="2015-08- 01"/>
            <templateId root="2.16.840.1.113883.10.20.22.4.1"/>
            <id root="7d5a02b0-67a4-11db-bd13-0800200c9a66"/>
            <code code="57021-8"
                displayName="CBC W Auto Differential panel - Blood"
                codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
            <statusCode code="completed"/>
            <effectiveTime>
                <low value="20160401102500-0500"/>
                <high value="20160402121500-0500"/>
            </effectiveTime>
            <!-- author at the organizer-level conducts down into the component observations.-->
            <author>
                <time value="20160402121500-0500"/>
                <assignedAuthor>
                    <id extension="333444444" root="2.16.840.1.113883.4.6"/>
                    <code code="246Q00000X" displayName="Technician, Pathology"
                        codeSystem="2.16.840.1.113883.6.101" codeSystemName="Healthcare Provider Taxonomy
                        (HIPAA)"/>
                    <representedOrganization>
                        <name>Diagnostic Labs</name>
                    </representedOrganization>
                </assignedAuthor>
            </author>
            <component>
                <observation classCode="OBS" moodCode="EVN">
                    <!-- ** Result observation (V3) ** -->
                    <templateId root="2.16.840.1.113883.10.20.22.4.2" extension="2015-08- 01"/>
                    <templateId root="2.16.840.1.113883.10.20.22.4.2"/>
                    <id root="107c2dc0-67a5-11db-bd13-0800200c9a66"/>
                    <code code="718-7" displayName="Hemoglobin" codeSystem="2.16.840.1.113883.6.1"
                        codeSystemName="LOINC"/>
                    <text>
                        <reference value="#result1"/>
                    </text>
                    <statusCode code="completed"/>
                    <effectiveTime value="20160401102500-0500"/>
                    <value xsi:type="PQ" value="13.2" unit="g/dL"/>
                    <interpretationCode code="N" codeSystem="2.16.840.1.113883.5.83"/>
                    <referenceRange>
                        <observationRange>
                            <value xsi:type="IVL_PQ">
                                <low value="12.0" unit="g/dL"/>
                                <high value="15.5" unit="g/dL"/>
                            </value>
                        </observationRange>
                    </referenceRange>
                </observation>
            </component>
            <component>
                <observation classCode="OBS" moodCode="EVN">
                    <!-- ** Result observation ** -->
                    <templateId root="2.16.840.1.113883.10.20.22.4.2" extension="2015-08- 01"/>
                    <templateId root="2.16.840.1.113883.10.20.22.4.2"/>
                    <id root="a69b3d60-2ffd-4440-958b-72b3335ff35f"/>
                    <!-- This is the correct long common name display name per LOINC web and per to 2000
-->
                    <code code="6690-2" displayName="Leukocytes[#/volume] in Blood by Automated count"
                        codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
                    <text>
                        <reference value="#result2"/>
                    </text>
                    <statusCode code="completed"/>
                    <effectiveTime value="20160401102500-0500"/>
                    <value xsi:type="PQ" value="6.7" unit="10*3/uL"/>
                    <interpretationCode code="N" codeSystem="2.16.840.1.113883.5.83"/>
                    <referenceRange>
                        <observationRange>
                            <value xsi:type="IVL_PQ">
                                <low value="4.3" unit="10*9/L"/>
                                <high value="10.8" unit="10*9/L"/>
                            </value>
                        </observationRange>
                    </referenceRange>
                </observation>
            </component>
            ...
        </organizer>
    </entry>
</section>
```

##### Result Observation

| **Entry Template**   | **Result Observation (V3)<br/>[observation: identifier urn:hl7ii:2.16.840.1.113883.10.20.22.4.2:2015-08-01 (open)]**    |
| ---- | ------ |
| **Reference Source**   | HL7 C-CDA R2.1  |
| **Purpose**   | This template represents the results of a laboratory, radiology, or other study performed on a patient.  |
| **ActStatus**   | The result observation includes a statusCode to allow recording the status of an observation. “Pending” results (e.g., a test has been run but results have not been reported yet) should be represented as “active” ActStatus.<br />The effectiveTime element represents the clinically relevant time of the measurement (e.g., the time a blood pressure reading is obtained, the time the blood sample was obtained for a chemistry test). |
| **Negation**   | Not specified. To indicate that a test was not performed use the Procedure Activity Procedure template with the negationInd attribute of “true.”<br />**Reference**: 5.2.15 Procedure  |
| **Other Considerations**   | If the Author Participation template is specified for the Organizer, this context applies to all the component observations unless a component observation includes a different Author Participation template.<br />If any Result Observation within the organizer has a statusCode of "active," the Result Organizer must also have a statusCode of "active." The range of time specified in the Result Organizer/effectiveTime element should encompass the lowest effectiveTime/low and the highest effectiveTime/high for the Result Observations within the organizer. |
| **Example**   | Example 56: Result Organizer for CBC W Auto Differential panel - Blood |
{:.grid}
**Table 59: Result Observation Template**

#### Vital Sign

##### Vital Signs Organizer

<table
                                            style="border-collapse:collapse;margin-left:24.01pt"
                                            cellspacing="0">
                                            <tr style="height:29pt">
                                                <td
                                                  style="width:468pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"
                                                  bgcolor="#C5D9F0"><p class="s19"
                                                  style="padding-left: 41pt;padding-right: 8pt;text-indent: 0pt;text-align: left;"
                                                  >A Vital Signs Organizer SHALL contain at least
                                                  one Vital Sign Observation component observation
                                                  template. <b>[CONF-093]</b></p></td>
                                            </tr>
                                        </table>

| **Entry Template**   | **Vital Signs Organizer (V3)<br/>[organizer: identifier urn:hl7ii:2.16.840.1.113883.10.20.22.4.26:2015-08-01 (open)]**    |
| ---- | ------ |
| **Reference Source**   | HL7 C-CDA R2.1  |
| **Purpose**   | This template provides a mechanism for grouping vital signs (e.g., grouping systolic blood pressure and diastolic blood pressure, BMI, body height, body weight).  |
| **ActStatus**   | A Vital Signs Organizer SHALL have a statusCode of "completed".<br />The effectiveTime may be a timestamp or an interval that spans the effectiveTimes of the contained vital signs observations. |
| **Negation**   | Not specified. |
| **Other Considerations**   | Compatibility support for C-CDA R1.1 and C-CDA 2.1: A vitals organizer conformant to both C-CDA 1.1 and C-CDA 2.1 would contain the SNOMED code (46680005) from R1.1 in the root code and a LOINC code in the translation. A vitals organizer conformant to only C-CDA 2.1 would only contain the LOINC code in the root code.<br />If the Author Participation template is specified for the Organizer, this context applies to all the component observations unless a component observation includes a different Author Participation template. |
| **Example**   | Example 57: Vital Signs Organizer |
{:.grid}
**Table 60: Vital Signs Organizer Template**

**Example 57: Vital Signs Organizer**
```
<section>
    <!-- PLEASE REFER TO THE EXAMPLE TASK FORCE <https://cdasearch.hl7.org/sections/Vital%20Signs>
PAGE FOR EXAMPLES TO COMMON CHALLENGES WITH ENTRIES IN THIS SECTION -->
    <!-- This section shows an example of rendering information in the correct local time, which
recording it in the discrete data using a UTC offset. -->
    <!-- Note that in June, UTC offset -0500 is Central time. and Eastern Timezone is the local
time for this example. -->
    <templateId root="2.16.840.1.113883.10.20.22.2.4"/>
    <templateId root="2.16.840.1.113883.10.20.22.2.4" extension="2015- 08 - 01"/>
    <templateId root="2.16.840.1.113883.10.20.22.2.4.1"/>
    <templateId root="2.16.840.1.113883.10.20.22.2.4.1" extension="2015-08- 01"/>
    <code code="8716-3" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"
        displayName="Vital Signs"/>
    <title>LAST RECORDED VITAL SIGNS</title>
    <text>
        <table>
            <thead>
                <tr>
                    <th>Vital Sign</th>
                    <th>Reading</th>
                    <th>Time Taken</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td styleCode="cellHeader">Blood Pressure</td>
                    <td>
                        <content ID="sysBP_5523355980">140</content>/<content
                            ID="diaBP_5523355980">90</content>
                    </td>
                    <td>(06/25/2015 1:33pm EST)</td>
                </tr>
                <tr>
                    <td styleCode="cellHeader">Weight</td>
                    <td ID="weight_5523355980">83.9 kg (185 lb)</td>
                    <td>(06/25/2015 1:33pm EST)</td>
                </tr>
            </tbody>
        </table>
    </text>
    <entry typeCode="DRIV">
        <organizer classCode="CLUSTER" moodCode="EVN">
            <templateId root="2.16.840.1.113883.10.20.22.4.26"/>
            <templateId root="2.16.840.1.113883.10.20.22.4.26" extension="2015-08- 01"/>
            <id extension="5523355980-Z9301" root="1.2.840.114350.1.13.6289.1.7.1.2109"/>
            <code code="46680005" codeSystem="2.16.840.1.113883.6.96" codeSystemName="SNOMED CT"
                displayName="Vital signs">
                <translation code="74728-7" codeSystem="2.16.840.1.113883.6.1"
                    codeSystemName="LOINC"
                    displayName="Vital signs, weight, height, head circumference, oximetry, BMI, and BSA
                    panel"/>
            </code>
            <statusCode code="completed"/>
            <effectiveTime value="20160625123300-0500"/>
            <!-- Context Conduction permits the author to be included once at the organizer level.
Authorship conducts down into the component observations. -->
            <author>
                <time value="20160625123300-0500"/>
                <assignedAuthor>
                    <id extension="811111111" root="2.16.840.1.113883.4.6"/>
                </assignedAuthor>
            </author>
            <component>
                <observation classCode="OBS" moodCode="EVN">
                    <templateId root="2.16.840.1.113883.10.20.22.4.27"/>
                    <templateId root="2.16.840.1.113883.10.20.22.4.27" extension="2014-06- 09"/>
                    <id extension="5523355980-sysBP-Z9301" root="1.2.840.114350.1.13.6289.1.7.1.2109.1"/>
                    <code code="8480-6" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"
                        displayName="SYSTOLIC BLOOD PRESSURE"/>
                    <text>
                        <reference value="#sysBP_5523355980"/>
                    </text>
                    <statusCode code="completed"/>
                    <effectiveTime value="20160625123300-0500"/>
                    <value xsi:type="PQ" unit="mm[Hg]" value="140"
                        xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"/>
                </observation>
            </component>
            <component>
                <observation classCode="OBS" moodCode="EVN">
                    <templateId root="2.16.840.1.113883.10.20.22.4.27"/>
                    <templateId root="2.16.840.1.113883.10.20.22.4.27" extension="2014-06- 09"/>
                    <id extension="5523355980-diaBP-Z9301" root="1.2.840.114350.1.13.6289.1.7.1.2109.1"/>
                    <code code="8462-4" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"
                        displayName="DIASTOLIC BLOOD PRESSURE"/>
                    <text>
                        <reference value="#diaBP_5523355980"/>
                    </text>
                    <statusCode code="completed"/>
                    <effectiveTime value="20160625123300-0500"/>
                    <value xsi:type="PQ" unit="mm[Hg]" value="90"
                        xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"/>
                </observation>
            </component>
            <component>
                <observation classCode="OBS" moodCode="EVN">
                    <templateId root="2.16.840.1.113883.10.20.22.4.27"/>
                    <templateId root="2.16.840.1.113883.10.20.22.4.27" extension="2014-06- 09"/>
                    <id extension="5523355980-weightC83-Z9301" root="1.2.840.114350.1.13.6289.1.7.1.2109.1"/>
                    <code code="29463-7" codeSystem="2.16.840.1.113883.6.1" displayName="Body weight"/>
                    <text>
                        <reference value="#weight_5523355980"/>
                    </text>
                    <statusCode code="completed"/>
                    <effectiveTime value="20160625123300-0500"/>
                    <value xsi:type="PQ" unit="kg" value="83.915"
                        xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"/>
                </observation>
            </component>
        </organizer>
    </entry>
</section>
```

##### Vital Sign Observation

| **Entry Template**   | **Vital Sign Observation (V2)<br/>[observation: identifier urn:hl7ii:2.16.840.1.113883.10.20.22.4.27:2014-06-09 (open)]**    |
| ---- | ------ |
| **Reference Source**   | HL7 C-CDA R2.1  |
| **Purpose**   | This template represents measurement of common vital signs.  |
| **ActStatus**   | The result observation includes a statusCode to allow recording the status of an observation. “Pending” results (e.g., a test has been run but results have not been reported yet) should be represented as “active” ActStatus.<br />The effectiveTime element represents the clinically relevant time of the measurement (e.g., the time a blood pressure reading is obtained, the time the blood sample was obtained for a chemistry test). |
| **Negation**   | Not specified. To indicate that a test was not performed use the Procedure Activity Procedure template with the negationInd attribute of “true.”<br />Reference: 5.2.15 Procedure |
| **Other Considerations**   | If the Author Participation template is specified for the Organizer, this context applies to all the component observations unless a component observation includes a different Author Participation template.<br />Vital Signs Observations require standard units to be used when recording a particular value.<br />The Vital Sign Result Type value set includes method-less types of vital sign observations. When method-specific vital sign measures are used, a more specific LOINC code can be used in the translation element of the vital sign observation code element. |
| **Example**   | Example 57: Vital Signs Organizer |
| **Example**   | Example 58: Vital Sign Coding with Translation |
{:.grid}
**Table 61: Vital Signs Observation Template**

<table
                                            style="border-collapse:collapse;margin-left:24.01pt"
                                            cellspacing="0">
                                            <tr style="height:37pt">
                                                <td
                                                  style="width:468pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"
                                                  bgcolor="#C5D9F0"><p class="s19"
                                                  style="padding-left: 41pt;text-indent: 0pt;text-align: left;"
                                                  >C-CDA Content Creators SHALL represent vital sign
                                                  observations using the vocabulary constraints and
                                                  units of measure shown in the table below and MAY
                                                  include more specific LOINC terms as a
                                                  translation.</p><p class="s31"
                                                  style="padding-left: 41pt;text-indent: 0pt;line-height: 11pt;text-align: left;"
                                                  ><b>[CONF-094]</b></p></td>
                                            </tr>
                                        </table>

| **Vital Sign**   | **LOINC Code**    | **Unit of Measure**    |
| ---------- | ---- | --- |
| **Body height**   | 8302-2  | cm  |
| **Head Occipital-frontal circumference**   | 9843-4  | cm  |
| **Body Weight**   | 29463-7  | kg  |
| **Body Temperature**   | 8310-5  | Cel  |
| **Systolic blood pressure**   | 8480-6  | Mm[Hg]  |
| **Diastolic blood pressure**   | 8462-4  | Mm[Hg]  |
| **Respiratory Rate**   | 9279-1  | /min  |
| **Body mass index (BMI) [Ratio]**   | 39156-5  | kg/m2  |
| **Body surface area Derived from formula**   | 3140-1  | m2  |
| **Heart Rate (synonym for Pulse)**   | 8867-4  | /min  |
| **Inhaled Oxygen concentration**   | 3151-8  | liters/min  |
| **Oxygen Saturation in Arterial blood**   | 2708-6  | %  |
| **Additional concept codes often needed as a translation to a method-specific measure** |
| **Oxygen saturation in Arterial blood by Pulse oximetry**   | 59408-5  | % |
| **Heart Rate by Pulse oximetry**   | 8889-8  | /min |
{:.grid}
** Table 62: Vital Sign Observation LOINC Codes and Units for Essential Vital Sign Data Elements**

**Example 58: Vital Sign Coding with Translation**
```
<code code="29463-7" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"
    displayName="Body weight">
    <translation code="8350-1" codeSystem="2.16.840.1.113883.6.1"
        displayName="Body weight Measured - with clothes" />
</code>
```

#### Medication

The Medication Activity Entry template is used to record a medication that has been administered and also is used
to record statements about medications being taken. These two clinical statement patterns are identical, so the
semantics is discerned through the context of use. Both are represented as a Medications with a
substanceAdministration/@moodCode="EVN". A statement of this type can be interpreted to represent an actual
administration of the medication. It also can be used to make a statement about the medication a patient takes.

The Admission Medication and Discharge Medication entry templates include a structural context around the
Medication Activity Entry template. The additional structure includes semantic coding that identifies the
medication information as admission or discharge medication information.

**Example 59: Medication Administration**
```
<substanceAdministration classCode="SBADM" moodCode="EVN">
    <!-- This medication use case is a medication administered a single time in the past.-->
    <templateId root="2.16.840.1.113883.10.20.22.4.16" />
    <id root="1061a257-3b5c-4b09-9dc7-23e59b788b18"/>
    <text>
        <reference value="#Medication_7" />
    </text>
    <statusCode code="completed"/>
    <effectiveTime xsi:type="TS" value="201309111603-0700"/>
    <routeCode code="C38288" codeSystem="2.16.840.1.113883.3.26.1.1" displayName="ORAL"
        codeSystemName="National Cancer Institute Thesaurus" />
    <doseQuantity value="2" />
    <consumable>
        <manufacturedProduct classCode="MANU">
            <templateId root="2.16.840.1.113883.10.20.22.4.23" />
            <manufacturedMaterial>
                <code code="243670" codeSystem="2.16.840.1.113883.6.88"
                    displayName="Aspirin 81 MG Oral Tablet">
                    <originalText>
                        <reference value="#MedicationName_7"/>
                    </originalText>
                </code>
            </manufacturedMaterial>
        </manufacturedProduct>
    </consumable>
</substanceAdministration>
```

Medication activities with substanceAdministration/@moodCode= "INT" document what a clinician intends a
patient to be taking. For example, a clinician may intend that a patient begin taking Lisinopril 20 mg PO for blood
pressure control. The Planned Medication Activity entry can also be used to record a medication that the physician
intends the patient to take at some time in the future.

**Example 60: [Medication Plan^132](http://hl7-c-cda-examples.herokuapp.com/examples/view/Guide%20Examples/Medication%20Activity%20(V2)_2.16.840.1.113883.10.20.22.4.16)**
```
<substanceAdministration classCode="SBADM" moodCode="INT">
    <!-- This medication use case is a medication that is to be administered.-->
    <templateId root="2.16.840.1.113883.10.20.22.4.16" />
    <id root="1061a257-3b5c-4b09-9dc7-23e59b788b18"/>
    <text>
        <reference value="#Medication_7" />
    </text>
    <statusCode code="active"/>
    <!-- This first effectiveTime shows that medication was prescribed on January 18, 2014
(not known to have stopped)-->
    <effectiveTime>
        <low value="20140118"/>
        <high nullFlavor="NI"/>
    </effectiveTime>
    <!-- This second effectiveTime represents every 4-6 hours from medication sig. -->
    <!-- Operator "A" means that this timing information is in addition to previous
effectiveTime information provided-->
    <effectiveTime xsi:type="PIVL_TS" operator="A">
        <period xsi:type="IVL_PQ">
            <low value="4" unit="h"/>
            <high value="6" unit="h"/>
        </period>
    </effectiveTime>
    <routeCode code="C38288" codeSystem="2.16.840.1.113883.3.26.1.1" codeSystemName="NCI
        Thesaurus" displayName="Oral"/>
    <!-- This relates directly to the code used for medication. Since it's a tablet, then
only specified needed in dose is 2x per administration-->
    <doseQuantity value="2"/>
    <consumable>
        <manufacturedProduct classCode="MANU">
            <!-- ** Medication information ** -->
            <templateId root="2.16.840.1.113883.10.20.22.4.23"/>
            <id root="0be61984-eaa5-46b3-b75b-1d1ba28b5fff"/>
            <manufacturedMaterial>
                <!-- Medications should be specified at a level corresponding to prescription when
possible, such as 30mg oral tablet (branded)-->
                <code code="1049529" displayName="Sudafed 30 MG Oral Tablet"
                    codeSystem="2.16.840.1.113883.6.88" codeSystemName="RxNorm">
                    <originalText>
                        <reference value="#MedicationName_1"/>
                    </originalText>
                </code>
            </manufacturedMaterial>
        </manufacturedProduct>
    </consumable>
</substanceAdministration>
```
^132 https://github.com/jddamore/HL7-Task-Force-Examples/blob/master/MED_Med_Every_4-6_hrs.xml

The Medication Supply Order entry records activities associated with ordering medications. The Medication
Dispense entry records when medications are dispensed to the patient.

**Example 61: Medication Dispense**
```
<supply classCode="SPLY" moodCode="EVN">
    <templateId root="2.16.840.1.113883.10.20.22.4.18" extension="2014-06- 09" />
    <id root="1.2.3.4.56789.1" extension="cb734647-fc99-424c-a864-7e3cda82e704" />
    <statusCode code="completed" />
    <effectiveTime value="201208151450-0800" />
    <repeatNumber value="1" />
    <quantity value="75" />
    <product>
        <manufacturedProduct classCode="MANU">
            <templateId root="2.16.840.1.113883.10.20.22.4.23" extension="2014-06- 09" /> ...
        </manufacturedProduct>
    </product>
    <performer>
        <assignedEntity>
            ...
        </assignedEntity>
    </performer>
</supply>
```

The structure of a medication entry can be complex. It is complicated by the fact that any one of these templates
may include other types of medication templates within additional entryRelationships. To support interoperability,
implementers should minimize the amount of template nesting used to express medication information.

When representing medications, consideration needs to be given to the way date/time intervals are represented.
See Chapter 5.1.10.2 Date/Time Precision for additional information about how to represent and interpret date
ranges that use an effectiveTime/low and effectiveTime/high. The CDA Example Task Force includes a document
that summarizes commonly used [medication frequencies](https://docs.google.com/document/d/1Y0Z458o_MrR2aPnpx6EygO6hpI88Bl95esjRWZ0agtY/edit).

**Reference:** 5.1.10.2 Date/Time Precision

#### Immunization

##### Recording Immunization Date

When recording an actual immunization (with moodCode = EVN), the effectiveTime represents when the
immunization was given, and this will generally just be a single dateTime value. Most of the time, when recording
the immunization date, the effectiveTime element should contain just a single @value. However, there is a use
case for using an interval when requesting an immunization, i.e. have this immunization done between date 1 and
date 2.

**Example 62: [Influenza Vaccination^134](http://hl7-c-cda-examples.herokuapp.com/examples/view/Guide%20Examples/Immunizations%20Section%20(entries%20required)%20(V3)_2.16.840.1.113883.10.20.22.2.2.1)**
```
<section>
    <!-- conforms to Immunizations section with entries optional -->
    <templateId root="2.16.840.1.113883.10.20.22.2.2"/>
    <!-- Immunizations section with entries required -->
    <templateId root="2.16.840.1.113883.10.20.22.2.2.1"/>
    <code code="11369-6" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"
        displayName="History of immunizations"/>
    <title>IMMUNIZATIONS</title>
    <text>
        <content ID="immunSect"/>
        <!-- table omitted for space -->
    </text>
    <entry typeCode="DRIV">
        <substanceAdministration classCode="SBADM" moodCode="EVN" negationInd="false">
            <!-- ** Immunization activity ** -->
            <templateId root="2.16.840.1.113883.10.20.22.4.52"/>
            <id root="e6f1ba43-c0ed-4b9b-9f12-f435d8ad8f92"/>
            <text>
                <reference value="#immun1"/>
            </text>
            <!-- Indicates the status of the substanceAdministartion -->
            <statusCode code="completed"/>
            <effectiveTime value="20100815"/>
            <consumable>
                <manufacturedProduct classCode="MANU">
                    <!-- ** Immunization medication information ** -->
                    <templateId root="2.16.840.1.113883.10.20.22.4.54"/>
                    <manufacturedMaterial>
                        <code code="88" codeSystem="2.16.840.1.113883.12.292"
                            displayName="Influenza virus vaccine" codeSystemName="CVX"/>
                        <lotNumberText>1</lotNumberText>
                    </manufacturedMaterial>
                    <!-- Optional manufacturerOrganization -->
                    <manufacturerOrganization>
                        <name>Health LS - Immuno Inc.</name>
                    </manufacturerOrganization>--> </manufacturedProduct>
            </consumable>
            <!-- Optional Performer -->
            <performer>
                <assignedEntity>
                    <id root="2.16.840.1.113883.19.5.9999.456" extension="2981824"/>
                    <addr>
                        <streetAddressLine>1021 Health Drive</streetAddressLine>
                        <city>Ann Arbor</city>
                        <state>MI</state>
                        <postalCode>99099</postalCode>
                        <country>US</country>
                    </addr>
                    <telecom nullFlavor="UNK"/>
                    <assignedPerson>
                        <name>
                            <given>Amanda</given>
                            <family>Assigned</family>
                        </name>
                    </assignedPerson>
                    <representedOrganization>
                        <id root="2.16.840.1.113883.19.5.9999.1394"/>
                        <name>Good Health Clinic</name>
                        <telecom nullFlavor="UNK"/>
                        <addr nullFlavor="UNK"/>
                    </representedOrganization>
                </assignedEntity>
            </performer> --> </substanceAdministration>
    </entry>
</section>
```
^134 https://github.com/brettmarquard/HL7-C-CDA-Task-Force-Examples/blob/master/Influenza_Immunization_Complete.xml

##### Immunization Status Code

When recording the immunization status code, the normal value would be “completed”, as this represents an
immunization that has been completely given. In extremely rare circumstances, a status of “active” could be used.
The use of ”active” implies that a single immunization is still on-going. This would not be appropriate for one shot
in a series of immunizations. Series immunizations should be represented with multiple Immunization Activity
(3.41) entries, each with a status of “completed.”

#### Procedure

Historically, and in C-CDA R2.1, to align with the HL7 RIM definition of what constitutes a procedure; “An Act
whose immediate and primary outcome (post-condition) is the alteration of the physical condition of the subject.”,
Three templates for representing completed procedures were defined. The Procedure template based on the
Procedure Act was defined to represent procedures that alter the physical condition of a patient ( _e.g_ .,
splenectomy). The Procedure template based on the Observation Act was defined to represent procedures that
generate information about a patient’s condition but do not cause physical alteration ( _e.g.,_ a test like an EEG). The
Procedure template based on the Act was defined to represent all other types of procedures ( _e.g.,_ dressing
change, patient education).

However, industry implementations have shown us that most vendors successfully and exclusively use the
Procedure Act (Procedure Activity Procedure [procedure, 2.16.840.1.113883.10.20.22.4.14]) to communicate all 3
categories of procedure as the RIM definition differentiation is not made in EHRs or in the clinical workflow.

**Reference:** 4.3.4 Plan/Planning Information

##### Procedure, Observation, Act

<table
                                            style="border-collapse:collapse;margin-left:24.01pt"
                                            cellspacing="0">
                                            <tr style="height:49pt">
                                                <td
                                                  style="width:468pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"
                                                  bgcolor="#C5D9F0"><p class="s19"
                                                  style="padding-left: 41pt;padding-right: 28pt;text-indent: 0pt;text-align: left;"
                                                  >When representing that a procedure was not
                                                  performed, the Indication (V2) (identifier:
                                                  urn:hl7ii:2.16.840.1.113883.10.20.22.4.19:2014-06-09
                                                  template MAY be used to represent the rationale
                                                  for not performing the procedure. More than one
                                                  indication template may be contained within a Procedure template<b>.
                                                  [BP-095]</b></p></td>
                                            </tr>
                                        </table>

| **Entry Template**   | **Procedure Activity Procedure (V3)<br />[procedure: identifier urn:hl7ii:2.16.840.1.113883.10.20.22.4.14:2022-06-01 (open)]**    |
| ---- | ------ |
| **Reference Source**   | HL7 C-CDA R2.1, HL7 C-CDA R2.1 Companion Guide (Procedure Activity Procedure)  |
| **Purpose**   | This template is used to describe all interventional, non-interventional, surgical, diagnostic, or therapeutic procedures or treatments pertinent to the patient historically at the time the document is generated.  |
| **ActStatus**   | The template includes a state model that includes active, completed, aborted, and cancelled.<br />The effectiveTime, also referred to as the “clinically relevant time” is the time at which the procedure was performed. If the status of a procedure was active at the time a C-CDA document was created, the effectiveTime/low would indicate the date/time the procedure was started and the effectiveTime/high SHOULD not be present. If the status of a procedure was completed, aborted or cancelled, the effectiveTime/high SHOULD be populated. Implementer best practice would be use of the TS_IVL data type. For implementers who are not able to represent a time interval, effectiveTime/value MAY be populated. |
| **Negation**   | In this template, the negationInd attribute is used to indicate the procedure was not performed. |
| **Other Considerations**   | When representing that a procedure was not performed, the<br />Indication (V2) (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.4.19:2014-06-09 template MAY be used to represent the rationale for not performing the procedure. More than one indication template may be contained within a Procedure template. |
| **Example**   | [Visit HL7 CDA Example Search](http://hl7-c-cda-examples.herokuapp.com/examples/view/Guide%20Examples/Procedure%20Activity%20Procedure%20(V2)_2.16.840.1.113883.10.20.22.4.14) |
| **Example**   | How to represent [Procedure Activity Procedure](http://hl7-c-cda-examples.herokuapp.com/sections/Procedures) |
{:.grid}
**Table 63: Procedure, Observation, Act Template**


#### Assessment (the noun)

An assessment is a collection of observations that together yield a summary evaluation of a particular condition.
Examples include the Braden Scale (assesses pressure ulcer risk), APACHE Score (estimates mortality in critically ill
patients), Mini-Mental Status Exam (assesses cognitive function), APGAR Score (assesses the health of a newborn),
and Glasgow Coma Scale (assesses coma and impaired consciousness). Assessments should be included in the
“status section” such as the Functional Status Section, Mental Status Section, or the Health Status Evaluations and
Outcomes Section. The selection should be based on the content assessed by the assessment. This template is
designed to represent both the question or type of information assessed as well as the associated answer/result.

<table
                                    style="border-collapse:collapse;margin-left:24.01pt"
                                    cellspacing="0">
                                    <tr style="height:26pt">
                                        <td
                                            style="width:468pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"
                                                bgcolor="#C5D9F0"><p class="s19"
                                                style="padding-left: 41pt;padding-right: 8pt;text-indent: 0pt;text-align: left;"
                                                >The Assessment Scale Observation Template SHOULD be
                                                used to represent the content of the Assessment.
                                                  <b>[BP-096]</b></p></td>
                                    </tr>
                                </table>

##### Assessment Scale Observation

| **Entry Template**   | **Assessment Scale Observation (V2)<br />[observation: identifier urn:oid:2.16.840.1.113883.10.20.22.4.69:2022-06-01 (open)]**    |
| ---- | ------ |
| **Reference Source**   | HL7 C-CDA R2.1 Companion Guide  |
| **Purpose**   | An assessment scale is a collection of observations that together yield a summary evaluation of a particular condition.  |
| **ActStatus**   | This is a discrete observation that has been made in order for it to be documented. Therefore, it always has a statusCode of “completed”.<br />The effectiveTime represents the clinically relevant time of the measurement, which may be when the assessment was performed. |
| **Negation**   | Not specified. |
| **Other Considerations**   | The observation/value element represents the “answer” or result for the assessed “question” or measurement. The clinical statement may also include an interpretation and may include multiple reference ranges. Additionally, each assessment scale observation may contain zero or more Assessment Scale Supporting Observations. This structure allows the Assessment Scale Observation to mirror the format of many assessment tools. An Assessment Scale Supporting Observation represents the components of a scale used in an Assessment Scale Observation. The individual parts that make up the component may be a group of cognitive or functional status observations. |
| **Example**   | [PHQ-9](https://cdasearch.hl7.org/examples/view/Mental%20Status/Patient%20Health%20Questionnaire%20PHQ-9) |
| **Example**   | [WE CARE](https://hl7-c-cda-examples.herokuapp.com/examples/view/Social%20History/WE%20Care%20Assessment) |
| **Example**   | [Glasgow Coma](https://hl7-c-cda-examples.herokuapp.com/examples/view/Functional%20Status/Functional%20Assessment%20-%20Glasgow%20Coma) |
{:.grid}
**Table 64: Assessment Scale Observation Template**

#### Plan of Treatment

Plan of treatment information encompasses data that define pending orders, interventions, encounters, services,
and procedures for the patient. It is limited to prospective, unfulfilled, or incomplete orders and requests only.
These are indicated by the @moodCode of the entries within this section. All active, incomplete, or pending
orders, appointments, referrals, procedures, services, or any other pending event of clinical significance to the
current care of the patient should be listed. The plan of treatment is typically developed to address a set of goals
set by the patient, provider or jointly set together.

**Reference:** 3.2.8 C-CDA R2.1 Document Templates; 5.2.9 Goal

##### Clinical Note

Note Activity entries contain structured information about the note information contained in a Notes Section or in
one of the sections defined for exchanging structured clinical note documents. A Note Activity entry allows the
corresponding human readable narrative note information to be more machine processable.

##### Note Activity

<table
                                            style="border-collapse:collapse;margin-left:24.01pt"
                                            cellspacing="0">
                                            <tr style="height:29pt">
                                                <td
                                                  style="width:468pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"
                                                  bgcolor="#C5D9F0"><p class="s19"
                                                  style="padding-left: 41pt;padding-right: 8pt;text-indent: 0pt;text-align: left;"
                                                  >C-CDA Content Creators SHOULD NOT use the Note
                                                  Activity template in place of a more specific
                                                  C-CDA entry template. <b>[BP-097]</b></p></td>
                                            </tr>
                                        </table>

| **Entry Template**   | **Note Activity<br />[act: identifier urn:hl7ii:2.16.840.1.113883.10.20.22.4.202:2016-11-01 (open)]]**    |
| ---- | ------ |
| **Reference Source**   | HL7 C-CDA R2.1 Companion Guide  |
| **Purpose**   | The Note Activity represents a clinical note.  |
| **ActStatus**   | This is a discrete observation that has been made in order for it to be documented. Therefore, it always has a statusCode of “completed.”<br />The effectiveTime represents the clinically relevant time of note, which may be when the note was written. |
| **Negation**   | Not specified. |
| **Other Considerations**   | Similar to the Comment Activity, the Note Activity permits a more specific code to characterize the type of information available in the note. Note information included needs to be relevant and pertinent to the information being communicated in the document.<br />When the note information augments data represented in a more specific entry template, the Note Activity can be used in an entryRelationship to the associated standard C-CDA entry. For example, a Note Activity template can be added as an entryRelationship to a Procedure Activity Procedure entry. Or for example, a Note Activity template can be as an entryRelationship to an Encounter Activity entry in the Encounters Section.<br />The Note Activity template also can be used as a standalone entry within a standard C-CDA section (e.g. a note about various procedures which have occurred during a visit as an entry in the Procedures Section) when it does not augment another standard entry. It may also be used to provide additional data about the source of a currently narrative-only section, such as Hospital Course.<br />Finally, if the type of data in the note is not known or no single C-CDA section is appropriate enough, the Note Activity should be placed in a general Notes Section. (e.g. a free-text consultation note or a note which includes subjective, objective, assessment, and plan information combined).<br />The examples below show a variety of clinical note representations that can be used with the Note Activity entry template.<br />Reference: 4.3 Sections Defined in C-CDA, Table 9: LOINC Codes for section- and entry- level clinical notes |
{:.grid}
**Table 65: Note Activity Template**

**Example 63: Note Activity as entryRelationship to C-CDA Entry.**
```
<?xml version="1.0" encoding="UTF-8"?>
<section>
    <!-- C-CDA 2.1 Procedures Section -->
    <templateId root="2.16.840.1.113883.10.20.22.2.7.1"/>
    <templateId root="2.16.840.1.113883.10.20.22.2.7.1" extension="2014-06- 09"/>
    <code code="47519-4" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"
        displayName="HISTORY OF PROCEDURES"/>
    <title>Procedures</title>
    <text>
        <table>
            <thead>
                <tr>
                    <th>Description</th>
                    <th>Date and Time (Range)</th>
                    <th>Status</th>
                    <th>Notes</th>
                </tr>
            </thead>
            <tbody>
                <tr ID="Procedure1">
                    <td ID="ProcedureDesc1">Laparoscopic appendectomy</td>
                    <td>(03 Feb 2014 09:22am- 03 Feb 2014 11:15am)</td>
                    <td>Completed</td>
                    <td ID="ProcedureNote1">
                        <paragraph>Dr. Physician - 03 Feb 2014</paragraph>
                        <paragraph>Free-text note about the procedure.</paragraph>
                    </td>
                </tr>
            </tbody>
        </table>
    </text>
    <entry typeCode="DRIV">
        <!-- Procedures should be used for care that directly changes the patient's physical state.-->
        <procedure moodCode="EVN" classCode="PROC">
            <templateId root="2.16.840.1.113883.10.20.22.4.14"/>
            <id root="64af26d5-88ef-4169-ba16-c6ef16a1824f"/>
            <code code="6025007" displayName="Laparoscopic appendectomy"
                codeSystem="2.16.840.1.113883.6.96" codeSystemName="SNOMED-CT">
                <originalText>
                    <reference value="#ProcedureDesc1"/>
                </originalText>
            </code>
            <text>
                <reference value="#Procedure1"/>
            </text>
            <statusCode code="completed"/>
            <effectiveTime>
                <low value="20140203092205-0700"/>
                <high value="20140203111514-0700"/>
            </effectiveTime>
            <!-- Note Activity entry -->
            <entryRelationship typeCode="COMP">
                <act classCode="ACT" moodCode="EVN">
                    <templateId root="2.16.840.1.113883.10.20.22.4.202" extension="2016-11- 01"/>
                    <code code="34109-9" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"
                        displayName="Note">
                        <translation code="28570-0" codeSystem="2.16.840.1.113883.6.1"
                            codeSystemName="LOINC" displayName="Procedure note"/>
                    </code>
                    <text>
                        <reference value="#ProcedureNote1"/>
                    </text>
                    <statusCode code="completed"/>
                    <!-- Clinically-relevant time of the note -->
                    <effectiveTime value="20140203"/>
                    <!-- Author Participation -->
                    <author>
                        <templateId root="2.16.840.1.113883.10.20.22.4.119"/>
                        <!-- Time note was actually written -->
                        <time value="20140204083215-0500"/>
                        <assignedAuthor>
                            <id root="20cf14fb-b65c-4c8c-a54d-b0cca834c18c"/>
                            <name>Dr. Physician</name>
                        </assignedAuthor>
                    </author>
                    <!-- Reference to encounter -->
                    <entryRelationship typeCode="COMP" inversionInd="true">
                        <encounter>
                            <!-- Encounter ID matches an encounter in the Encounters Section -->
                            <id root="1.2.3.4"/>
                        </encounter>
                    </entryRelationship>
                </act>
            </entryRelationship>
        </procedure>
    </entry>
</section>
```

**Example 64: Note Activity as Standalone Entry**
```
<section>
    <!-- C-CDA 2.1 Procedures Section, entries optional -->
    <templateId root="2.16.840.1.113883.10.20.22.2.7"/>
    <templateId root="2.16.840.1.113883.10.20.22.2.7" extension="2014-06- 09"/>
    <code code="47519-4" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"
        displayName="HISTORY OF PROCEDURES"/>
    <title>Procedures</title>
    <text>
        <list>
            <item ID="ProcedureNote1">
                <paragraph>Dr. Physician - 03 Feb 2014</paragraph>
                <paragraph>Free-text note about procedures which have occurred during this
                    visit.</paragraph>
            </item>
        </list>
    </text>
    <!-- If section were entries required, an additional <entry nullFlavor="NI"> would be
required for a Procedure Activity -->
    <!-- Note Activity entry -->
    <entry>
        <act classCode="ACT" moodCode="EVN">
            <templateId root="2.16.840.1.113883.10.20.22.4.202" extension="2016-11- 01"/>
            <code code="34109-9" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"
                displayName="Note">
                <translation code="28570-0" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"
                    displayName="Procedure note" />
            </code>
            <text>
                <reference value="#ProcedureNote1" />
            </text>
            <statusCode code="completed"/>
            <!-- Clinically-relevant time of the note -->
            <effectiveTime value="20140203" />
            <!-- Author Participation -->
            <author>
                <templateId root="2.16.840.1.113883.10.20.22.4.119" />
                <!-- Time note was actually written -->
                <time value="20140204083215-0500" />
                <assignedAuthor>
                    <id root="20cf14fb-b65c-4c8c-a54d-b0cca834c18c" />
                    <name>Dr. Physician</name>
                </assignedAuthor>
            </author>
            <!-- Reference to encounter -->
            <entryRelationship typeCode="COMP" inversionInd="true">
                <encounter>
                    <!-- Encounter ID matches an encounter in the Encounters Section -->
                    <id root="1.2.3.4" />
                </encounter>
            </entryRelationship>
        </act>
    </entry>
</section>
```

**Example 65: Rich Text Format (RTF) Example**
```
<section>
    <!--... -->
    <text>
        <list>
            <item ID="note1">
                <caption>Nursing Note written by Nick Nurse</caption>
                <paragraph>Completed rounds; no incident</paragraph>
            </item>
        </list>
    </text>
    <!-- Note Activity (extra markup removed to focus on <text>) -->
    <entry>
        <act>
            <code>...</code>
            <text mediaType="text/rtf" representation="B64">
                <reference value="#note1"/>
            </text>
            <!--...-->
        </act>
    </entry>
</section>
```

#### Advance Directive

New versions of previously defined entry templates for representing advance care planning interventions and for
documenting information about a person’s Advance Directives are now available for use. The templates are
backward compatible with current version.

Two new entry templates have been added to represent obligation instructions and prohibition instructions a
patient makes about the care her or she wants or does not want to be performed. The table below summarizes the
improvements in the new version and describes the information that can be represented in these supplemental
templates.

<table
                                    style="border-collapse:collapse;margin-left:18.61pt"
                                    cellspacing="0">
                                    <tr style="height:29pt">
                                        <td
                                            style="width:468pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"
                                                bgcolor="#C5D9F0"><p class="s19"
                                                style="padding-left: 41pt;padding-right: 8pt;text-indent: 0pt;text-align: left;"
                                                >C-CDA Content Creators MAY use the new templates
                                                and template versions for representing Advance
                                                Directive information. <b>[BP-098]</b></p></td>
                                    </tr>
                                </table>

| **Summary of C-CDA Supplemental Templates for Advanced Directives**   ||
| ---- | ------ |
| **Advance Care Planning Intervention (V1)**<br />New Version:<br />[procedure: identifier urn:hl7ii:2.16.840.1.113883.10.20.22.4.204:2017-05-01 (open)]   | The Advance Care Planning Intervention template is used to record a planned intervention that will involve reviewing and verifying a person’s directives or will involve educating and supporting a person on establishing or modifying his or her advance directives. It also can be used to record when the activity of reviewing and verifying a person’s directives has been completed or when educating and supporting a person to establish or update his or her advance directives has been completed.  |
| **Advance Directive Observation (V4)**<br />New Version:<br />[observation: identifier urn:hl7ii:2.16.840.1.113883.10.20.22.4.48:2017-05-01 (open)]   | An Advance Directive Observation template is used to record information about a document authored by the person and containing goals, preferences, and priorities for care. The observation records that the document was available and may have been reviewed (verified). It records the kind (category) of advance directive document, where the document can be accessed, who verified it, and the type of content that was determined to be present. When a person has more than one advance directive document, each document is recorded using an Advance Directive Observation template. A set of Advance Directive Observations are grouped together using an Advance Directive Organizer.  |
| **Advance Directive Organizer (V3)**<br />New Version:<br />[organizer: identifier urn:hl7ii:2.16.840.1.113883.10.20.22.4.108:2017-05-01 (open)]   | This clinical statement groups a set of advance directive observations documented together at a single point in time, and relevant during the episode of care being documented.  |
| **Obligation Instruction**<br />[act: identifier urn:hl7ii:2.16.840.1.113883.10.20.22.4.205:2018-01-01 (open)]   | The Obligation Instruction template represents a statement made by a patient regarding care services he or she wants to be performed.  |
| **Prohibition Instruction**<br />[act: identifier urn:hl7ii:2.16.840.1.113883.10.20.22.4.206:2018-01-01 (open)]   | The Prohibition Instruction template represents a statement made by a patient regarding care services he or she does not want to be performed.  |
{:.grid}
**Table 66: Summary of C-CDA Supplemental Templates for Advance Directives^135**

Refer to the C-CDA Supplemental Implementation Guide titled HL7 Implementation Guide: C-CDA R2.1; Advance Directives Templates, Release 1 – US Realm for more information, examples, and template definitions.

#### Quality Measure

As the focus on exchange of quality measure information increases, new possibilities have emerged for sharing
quality care gap information in C-CDA documents. Quality reporting CDA templates, compatible with C-CDA R2.1,
are defined by the Clinical Quality Information Workgroup in the HL7 Quality Reporting Document Architecture
standard.^137 QRDA is a document format that provides a standard structure with which to report quality measure
data to organizations that will analyze and interpret the data. Although the initial use case for the QRDA Cat I
templates was to share information from EHR systems to organizations administering quality programs, it has
recently become apparent that same templates can be used to share patient-focused quality measure information
in the opposite direction. Organizations with visibility to a patient’s compliance to a set of applicable quality
measures can share this information with the care deliver organizations who can help to close the gap. The
Measure Section (2.16.840.1.113883.10.20.24.2.2) template contains information about the measure or measures
being reported.

^135 HL7 Implementation Guide: C-CDA R2.1; Advance Directives Templates, Release 1 – US Realm.
^136 HL7 Implementation Guide: C-CDA R2.1; Advance Directives Templates, Release 1 – US Realm.
^137 HL7 Quality Reporting Document Architecture (QRDA) Category 1, STU R5.1 http://www.hl7.org/implement/standards/product_brief.cfm?product_id=35

##### Measure Reference

| **Entry Template**   | **Measure Reference<br />[organizer: identifier urn:oid:2.16.840.1.113883.10.20.24.3.98 (open)]**    |
| ---- | ------ |
| **Reference Source**   | HL7 QRDA Cat I, STU R5.1  |
| **Purpose**   | The template represents measure logic (i.e. denominators, numerators) by using negationInd in conjunction with the measure component observations to show if a patient is compliant with one or more quality measures or not.<br />This example complies with QRDA1 measure section but may not suitable for formal quality reporting. Refer to QRDA1 and QRDA3 implementation guidance for more details.<br />Per discussions with clinical quality improvement CQI workgroup, this template aligns with how the Joint Commission encourage patient level reporting in QRDA1 documents.  |
| **ActStatus**   | This is a discrete observation that has been made in order for it to be documented. Therefore, it always has a statusCode of “completed”.<br />This template does not include an effectiveTime element. See other considerations below. |
| **Negation**   | Not specified. |
| **Other Considerations**   | The template enables patient-level quality measure information (i.e. reported outcome) to be included in a C-CDA document.<br />Measures are referenced through externalAct reference to an externalDocument. The externalDocument/ids and version numbers are used to reference the measure.<br />The Reporting Parameter Act (2.16.840.1.113883.10.20.17.3.8) template is used to record the relevant reporting period for the reported quality care gap or compliance information. |
| **Example**   | Example 66: QRDA1 measure section |
| **Reference**   | [HL7 CDA Example Search](http://hl7-c-cda-examples.herokuapp.com/sections/Problems) |
| **Example**   | [How to represent “Quality Section”](http://hl7-c-cda-examples.herokuapp.com/examples/view/Quality/Quality%20Care%20Compliance%20in%20C-CDA) |
{:.grid}
**Table 67: Measure Reference Template**

This example complies with QRDA1 measure section but may not suitable for formal quality reporting. Refer to
QRDA1 and QRDA3 implementation guidance for more details.
Per discussions with clinical quality improvement CQI workgroup, this template aligns with how the Joint
Commission encourage patient level reporting in QRDA1 documents.

**Example 66: QRDA1 measure section**
```
<section>
    <!-- Templates use QRDA1 1.1 (current reporting standard as of 2018)-->
    <!-- This is the templateId for Measure Section -->
    <templateId root="2.16.840.1.113883.10.20.24.2.2"/>
    <!-- This is the templateId for Measure Section QDM -->
    <templateId root="2.16.840.1.113883.10.20.24.2.3"/>
    <code code="55186-1" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"
        displayName="Measure Document"/>
    <title>Measure Section</title>
    <text>
        <table border="1" width="100%">
            <thead>
                <tr>
                    <!-- Note that this table is an illustrative format that could be used to
show human readable measure, but others are possible -->
                    <!-- Each of the fields in this table will be represented in machine readable
as well as human readable -->
                    <!-- For each of the measures we provide a descriptive name and an identifier
-->
                    <!-- The machine-readable entries will have the unique GUID reference to this
measure, if available -->
                    <!-- An alternative option would be to include additional description of
measure logic or a link in the human-readable -->
                    <!-- This aligns with what may be typically included from QRDA1 document -->
                    <th>Measure</th>
                    <th>Compliance Period</th>
                    <th>Denominator</th>
                    <th>Numerator</th>
                    <th>Exclusion</th>
                    <th>Outcome</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>Diabetes Hemoglobin A1c Poor Control (CMS 122v5)</td>
                    <td>Jan 1 2017 - Dec 31 2017</td>
                    <td>yes</td>
                    <td>no</td>
                    <td>no</td>
                    <!-- Compliance here is based on the measure "Improvement Notation" from the
Measure Definition-->
                    <!-- Since lower = better for CMS 122v5, a false numerator means compliance-->
                    <td>Compliant</td>
                </tr> ... </tbody>
        </table>
    </text>
    <entry>
        <organizer classCode="CLUSTER" moodCode="EVN">
            <templateId root="2.16.840.1.113883.10.20.24.3.98"/>
            <templateId root="2.16.840.1.11.3883.10.20.24.3.97"/>
            <id root="d7345481-b3b5-41e0-a8ae-03dabcd4a0cc"/>
            <!-- A code element could be added to make organizer type more specific, although was
not in the original QRDA1 template -->
            <statusCode code="completed"/>
            <!-- This reference contains the version specific identifier of the measure-->
            <reference typeCode="REFR">
                <externalDocument classCode="DOC" moodCode="EVN">
                    <!-- This includes an uuid identifier of the measure logic, For this example,
-->
                    <!-- see
https://ecqi.healthit.gov/system/files/ecqm/measures/CMS122v5_SimpleXML_2.xml -->
                    <!-- If no GUID available, the measure would at least be described using the
text field -->
                    <id root="2.16.840.1.113883.4.738"
                        extension="40280381-51f0-825b-0152-229afff616ee"/>
                    <code code="57024-2" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"
                        displayName="Health Quality Measure Document"/>
                    <text>Diabetes: Hemoglobin A1c Poor Control</text>
                    <versionNumber value="5"/>
                </externalDocument>
            </reference>
            <!-- To specify the time period, a component has been added with the appropriate
QRDA1 template (Reporting Parameters Act) -->
            <component>
                <act classCode="ACT" moodCode="EVN">
                    <templateId root="2.16.840.1.113883.10.20.17.3.8"/>
                    <id root="55a43e20-6463-46eb-81c3-9a3a1ad41225"/>
                    <code code="252116004" codeSystem="2.16.840.1.113883.6.96"
                        displayName="Observation Parameters"/>
                    <effectiveTime>
                        <!-- The beginning of the reporting period. -->
                        <low value="20170101000000-0500"/>
                        <!-- The ending of the reporting period. -->
                        <high value="20171231235959-0500"/>
                    </effectiveTime>
                </act>
            </component>
            <component>
                <!-- Set negationInd="false" to assert that the criteria are met by the included
data.
Set negationInd="true" to assert that the criteria are NOT
met by the included data.
Since this patient is in the denominator, negationInd is
set to false -->
                <observation classCode="OBS" moodCode="EVN" negationInd="false">
                    <code code="ASSERTION" codeSystem="2.16.840.1.113883.5.4"
                        codeSystemName="ActCode" displayName="Assertion"/>
                    <value xsi:type="CD" code="DENOM" codeSystem="2.16.840.1.113883.5.4"
                        codeSystemName="ObservationValue" displayName="denominator"/>
                    <reference typeCode="REFER">
                        <externalObservation classCode="OBS" moodCode="EVN">
                            <!-- This includes a version specific uuid identifier of the specific
measure component, (denominator in this example) -->
                            <!-- For example, see
https://ecqi.healthit.gov/system/files/2017_CMS_QRDA_III_Eligible_Clinicians_and_EP_IG_final_0703
_508.pdf -->
                            <id root="D346DA74-F16E-4159-DEDF-331BA28837FB"/>
                        </externalObservation>
                    </reference>
                </observation>
            </component>
            <component>
                <!-- Since this patient is NOT in the numerator, negationInd is set to true -->
                <!-- Note that this measure has inverted numerator logic (i.e. numerator events
are non-compliant)-->
                <observation classCode="OBS" moodCode="EVN" negationInd="true">
                    <code code="ASSERTION" codeSystem="2.16.840.1.113883.5.4"
                        codeSystemName="ActCode" displayName="Assertion"/>
                    <value xsi:type="CD" code="NUMER" codeSystem="2.16.840.1.113883.5.4"
                        codeSystemName="ObservationValue" displayName="numerator"/>
                    <reference typeCode="REFR">
                        <externalObservation classCode="OBS" moodCode="EVN">
                            <id root="6D01A564-58CC-4CF5-929-F-B83583701BFE"/>
                        </externalObservation>
                    </reference>
                </observation>
            </component>
            <!-- no denominator exclusion criteria available for this measure so omitted -->
        </organizer>
    </entry>
</section>
```

#### Use of Indication Versus Reason Templates

In certain situations, clinicians need to record why something was or was not done. C-CDA provides three
methods to record this information:
```
- Indication (V3) observation2.16.840.1.113883.10.20.22.4.19 template is used to describe the problem or
    diagnosis that is the reason for an action, such as an encounter order or occurrence, a medication
    administration, or an ordered or performed procedure.
- The Reason 2.16.840.1.113883.10.20.24.3.88 template is used to represent the justification for an action
    or for not performing an action such as a patient refusal, system malfunction or change, or other non-
    problem/diagnosis medical-related reasons.
- The Immunization Refusal Reason 2.16.840.1.113883.10.20.22.4.53 template is used to represent the
    rationale for the patient declining an immunization as the value set is crafted for the immunization use
    case.