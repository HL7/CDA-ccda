This Supporting Guidance Page provides guidance aimed at increasing consistency in the way data in C-CDA templates are represented and used across all implementations. The information was derived from learnings gleaned since 2012 from cross vendor C-CDA implementations, C-CDA Implementation-A-Thons and quality review of HIE C-CDAs such as [CareEquality](https://carequality.org/).

This pages provides generalized document, section and entry guidance and additional guidance for specific types of C-CDA documents.

### Document Level Guidance
#### Reusable, Nesting Templates

C-CDA establishes two document header templates. These header templates establish consistent rules for
populating the data elements in a C-CDA document header. Document header elements create context for the
information contained in the body of the document.

The US Realm General Header is used for documents that are authored by clinicians and systems supporting
clinicians, and the US Realm Patient Generated Header is used for documents that are authored by patients and systems supporting patients.


<table
    style="border-collapse:collapse;margin-left:24.01pt" cellspacing="0">
    <tr style="height:37pt">
        <td
            style="width:462pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"
                bgcolor="#C5D9F0"><p class="s19"
                style="padding-left: 41pt;text-indent: 0pt;text-align: left;"
                >Each document template defined in C-CDA indicates the
                header template that the document is expected to conform to,
                and each MAY include additional header constraints that are
                relevant to the type of clinical note being represented in the document.
                    <b>[BP-028]</b></p></td>
    </tr>
</table>
                        
Additionally, document templates define the sections of content that **SHALL**, **SHOULD**, or **MAY** be present for exchanging clinical notes. Each section is identified with a code that tells the recieving systems the type of information in the section.

Further, the sections define entry templates which **SHALL**, **SHOULD**, or **MAY** be used to represent the information in each section using discrete representations that aid further computer processing of the clinical information in the section.

#### Nested Content and Context Conduction

CDA context is set in the CDA header and applies to the entire document. Context can be overridden at the level of
the section, and/or CDA entry. A document, in a sense, is a contextual wrapper for its contents. Assertions in the
document header are typically applicable to statements made in the body of the document, unless overridden. For
instance, the patient identified in the header is assumed to be the subject of observations described in the body of
the document, unless a different subject is explicitly stated. The author identified in the header is assumed to be
the author of the information in the sections and entries of the document, unless a different author is explicitly
identified on a section or on individual entries. The objective of the CDA context rule is to make these practices
explicit with relationship to the RIM, such that a computer will understand the context of a portion of a document
the same way that a human interprets it.

CDA's approach to context, and the propagation of that context to nested document components, follows these design principles :

- The CDA Header sets context for the entire document. A propagating value specified in the document
    header holds true throughout the document, unless explicitly overridden. This principal applies only
    to designated participations and attributes of the CDA Header that support propagating context
    conduction. Contextual header components (i.e., those that have propagating values) include:
       o Author
       o Confidentiality
       o Data enterer
       o Human language
       o Informant
       o Legal authenticator
       o Participant
       o Record target
- Context components that can be overridden at the level of the document body include:
    o Confidentiality
    o Human language
- Context components that can be overridden at the level of a document section include:
    o Author
    o Confidentiality
    o Human language
    o Informant
    o Subject

- Context components that can be overridden at the level of a CDA entry include:
    o Author
    o Confidentiality
    o Human language
    o Informant
    o Participant
    o Subject
- Context propagates from outer context to nested context. Context that is specified on an outer tag
    holds true for all nested tags, unless overridden on a nested tag. Context specified on a tag within the
    CDA body always overrides context propagated from an outer tag. For instance, the specification of
    authorship at a document section level overrides all authorship propagated from the header. The
    outer context for an entryRelationship component in an entry is the outer entry act. The outer
    context for an entry is the encompassing section. The outer context for a section is the document
    header.
- Context is sometimes known precisely, and is sometimes unknown, such as in the case where a
    document is comprised of a large unparsed narrative block that potentially includes statements that
    contradict outer context. Because CDA context always propagates unless overridden, the
    representation of unknown context is achieved by overriding with a null value.
- To override the Confidentiality at the entry level, an implementation must use Confidentiality see [HL7 Data Security for Privacy](http://www.hl7.org/implement/standards/product_brief.cfm?product_id=354) and HL7 Privacy Consent Directives implementation guides define
for how to override confidentiality context at the entry level.

**Example 4: Section with narrative text and a nullFlavor for the author**

This example explains explains that the author of the section is not known. Thus the author in the header does not
conduct to be the author of the unparsed narrative information contained in the section.
```
<section>
    <templateId root="1.3.6.1.4.1.19376.1.5.3.1.1.13.2.1"/>
    <code code="10154-3" displayName="Chief complaint Reported"
        codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
    <title>Chief Complaint Section</title>
    <text><content>No complaints, annual wellness exam</content>
        <content>Author of this section not known.</content>
    </text>
    <author nullFlavor="UNK">
        <time/>
        <assignedAuthor>
            <id/>
        </assignedAuthor>
    </author>
</section>
```
**Reference:** For additional information on Context Conduction mechanisms in CDA documents,see [CDA Context](https://build.fhir.org/ig/HL7/CDA-core-sd/overview.html#cda-context) the HL7 CDA R2.0 Structure Definition Publication. 

**Reference:** The [HL7 Data Security for Privacy](http://www.hl7.org/implement/standards/product_brief.cfm?product_id=354) and HL7 Privacy Consent Directives implementation guides define
how to override confidentiality context at the entry level.


#### Structured Header

All CDA documents include a structured header regardless if the document is CDA document with a structured
structuredBody element (a “structured document”) or a CDA document with a nonXMLBody element (an
“unstructured document”). The structured header permits computer processing (parsing) to occur on its content.

#### Patient

The recordTarget represents the medical record that this document belongs to. In the uncommon case where a
clinical document (such as a group encounter note) is placed into more than one patient chart, more than one
recordTarget participants can be stated. The recordTarget records the administrative and demographic data of
the patient whose health information is described by the clinical document; each recordTarget must contain at
least one patientRole element.

The recordTarget contains many elements that hold core data for interoperability. The table below summarizes
data elements present in the recordTarget.

Patient matching continues to be one of the major challenges for interoperability due to the lack of a universal patient identifier, similar to a Social Security Number, but used for healthcare.


| **Data Element**   | **Data element xPath**    |
| ---- | ------ |
| **First Name**   | /ClinicalDocument/recordTarget/patientRole/patient/name/given[1]  |
| **Last Name**   | /ClinicalDocument/recordTarget/patientRole/patient/name/family  |   
| **Previous Name**   | /ClinicalDocument/recordTarget/patientRole/patient/name/family/@qualifier  |
| **Middle Name**   | /ClinicalDocument/recordTarget/patientRole/patient/name/given[2]  |
| **Suffix**   | /ClinicalDocument/recordTarget/patientRole/patient/name/suffix  |   
| **Administrative Gender**   | /ClinicalDocument/recordTarget/patientRole/patient/administrativeGenderCode  |
| **Birth Sex**   | **Reference:** [Birth Sex](StructureDefinition-BirthSexObservation)  |
| **Date of Birth**   | /ClinicalDocument/recordTarget/patientRole/patient/birthTime  |   
| **Race**   | /ClinicalDocument/recordTarget/patientRole/patient/raceCode  |
| **Ethnicity**   | /ClinicalDocument/recordTarget/patientRole/patient/ethnicGroupCode  |
| **Preferred Language (requires preferenceInd="true")**   | /ClinicalDocument/recordTarget/patientRole/patient/languageCommunication<br />/ClinicalDocument/recordTarget/patientRole/patient/languageCommunication/preferenceInd  |   
| **Address**   | /ClinicalDocument/recordTarget/patientRole/addr  |
| **Phone Number**   | /ClinicalDocument/recordTarget/patientRole/telecom  | 
{:.grid}

**Table 10: Patient Data Elements**

<table
    style="border-collapse:collapse;margin-left:24.01pt"
    cellspacing="0">
    <tr style="height:49pt">
        <td
            style="width:462pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"
            bgcolor="#C5D9F0"><p class="s19"
                style="padding-left: 41pt;text-indent: 0pt;text-align: left;"
                >C-CDA Content Creators SHOULD include identifiers
                that improve the accuracy of automated patient
                matching mechanisms. <b>[BP-029]</b></p><p
                class="s19"
                style="padding-left: 57pt;text-indent: 0pt;text-align: left;"
                >Note: Testability would require business decisions
                to be made about what type of identifiers improve automated matching.</p></td>
    </tr>
    <tr style="height:26pt">
        <td
            style="width:462pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"
            bgcolor="#C5D9F0"><p class="s19"
                style="padding-left: 41pt;text-indent: 0pt;text-align: left;"
                >C-CDA Content Creators SHALL include the patient’s
                administrative gender in the demographic information
                of the recordTarget. <b>[CONF-030]</b></p></td>
    </tr>
    <tr style="height:26pt">
        <td
            style="width:462pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"
            bgcolor="#C5D9F0"><p class="s19"
                style="padding-left: 41pt;text-indent: 0pt;text-align: left;"
                >When C-CDA Content Creators include birth sex they
                SHALL use the Birth Sex Observation in the Social
                History Section. <b>[CONF-031]</b></p></td>
    </tr>
    <tr style="height:26pt">
        <td
            style="width:462pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"
                bgcolor="#C5D9F0"><p class="s80"
                style="padding-left: 41pt;padding-right: 6pt;text-indent: 0pt;text-align: left;"
                >C-CDA Content Creators who choose to include a
                non-null patient address SHOULD follow the
                 guidance in the <a href="https://oncprojectracking.healthit.gov/wiki/pages/viewpage.action?pageId=180486153&amp;preview=/180486153/237306191/Project%20US%40%20FINAL%20Technical%20Specification%20Version%201.0.pdf">
                 Project US@ Technical Specification</a>
                <b>[BP-099]</b>
                  </p></td>
    </tr>
</table>


**Example 5: recordTarget with demographic data**

```
<recordTarget>
    <patientRole>
        <!-- Here is a public id that has an external meaning based on a root OID that is
publically identifiable. -->
        <!-- root="1.3.6.1.4.1.41179.2.4" is the assigningAuthorityName for
DirectTrust's Patient/Consumer addresses "DT.org PATIENT" -->
        <id root="1.3.6.1.4.1.41179.2.4" extension="lisarnelson@direct.myphd.us"
            assigningAuthorityName="DT.org PATIENT"/>
        <!-- More ids may be used. -->
        <!-- Here is the patient's MRN at RVHS -->
        <id root="2.16.840.1.113883.1.111.12345" extension="12345-0828"
            assigningAuthorityName="River Valley Health Services local patient Medical
            Record Number" />
        <addr>
            <streetAddressLine>1 Happy Valley Road</streetAddressLine>
            <city>Westerly</city>
            <state>RI</state>
            <postalCode>02891</postalCode>
            <country nullFlavor="UNK"/>
        </addr>
        <telecom use="WP" value="tel:+1-4013482345"/>
        <telecom use="HP" value="tel:+1-4016412345"/>
        <telecom value="mailto:lisanelson@gmail.com"/>
        <telecom value="mailto:lisarnelson@direct.myphd.us"/>
        <patient>
            <name use="L">
                <family>Nelson</family>
                <given qualifier="CL">Lisa</given>
            </name>
            <administrativeGenderCode code="F" displayName="Female"
                codeSystem="2.16.840.1.113883.5.1" codeSystemName="HL7
                AdministrativeGender"/>
            <birthTime value="19620828"/>
            <maritalStatusCode code="M" displayName="Married"
                codeSystem="2.16.840.1.113883.5.2"
                codeSystemName="HL7 MaritalStatus"/>
            <raceCode code="2106-3" displayName="White"
                codeSystem="2.16.840.1.113883.6.238"
                codeSystemName="CDC Race and Ethnicity"/>
            <ethnicGroupCode code="2186-5" displayName="Not Hispanic or Latino"
                codeSystem="2.16.840.1.113883.6.238" codeSystemName="CDC Race and
                Ethnicity"/>
            <languageCommunication>
                <templateId root="2.16.840.1.113883.3.88.11.32.2"/>
                <languageCode code="eng"/>
                <preferenceInd value="true"/>
            </languageCommunication>
        </patient>
        <providerOrganization>
            <!-- This is a public id where the root is registered to indicate the
National Provider ID -->
            <id root="2.16.840.1.113883.4.6" extension="1417947383"
                assigningAuthorityName="National Provider ID"/>
        </providerOrganization>
    </patientRole>
</recordTarget>
```

**Example 6: recordTarget including the provider organization context for the clinical documentation**
```
<recordTarget>
    <patientRole>
        <!-- Here is a public id that has an external meaning based on a root OID that is publicly identifiable. -->
        <!-- root="1.3.6.1.4.1.41179.2.4" is the assigningAuthorityName for
DirectTrust's Patient/Consumer addresses "DT.org PATIENT" -->
        <id root="1.3.6.1.4.1.41179.2.4" extension="lisarnelson@direct.myphd.us"
            assigningAuthorityName="DT.org PATIENT"/>
        <!-- More ids may be used. -->
        <!-- Here is the patient's MRN at RVHS -->
        <id root="2.16.840.1.113883.1.111.12345" extension="12345-0828"
            assigningAuthorityName="River Valley Health Services local patient Medical Record Number" />
        <addr>
            <streetAddressLine>1 Happy Valley Road</streetAddressLine>
            <city>Westerly</city>
            <state>RI</state>
            <postalCode>02891</postalCode>
            <country nullFlavor="UNK"/>
        </addr>
        <telecom use="WP" value="tel:+1-4013482345"/>
        <telecom use="HP" value="tel:+1-4016412345"/>
        <telecom value="mailto:lisanelson@gmail.com"/>
        <telecom value="mailto:lisarnelson@direct.myphd.us"/>
        <patient>
            <name use="L">
                <family>Nelson</family>
                <given qualifier="CL">Lisa</given>
            </name>
            <administrativeGenderCode code="F" displayName="Female"
                codeSystem="2.16.840.1.113883.5.1" codeSystemName="HL7 AdministrativeGender"/>
            <birthTime value="19620828"/>
            <maritalStatusCode code="M" displayName="Married" codeSystem="2.16.840.1.113883.5.2"
                codeSystemName="HL7 MaritalStatus"/>
            <raceCode code="2106-3" displayName="White" codeSystem="2.16.840.1.113883.6.238"
                codeSystemName="CDC Race and Ethnicity"/>
            <ethnicGroupCode code="2186-5" displayName="Not Hispanic or Latino"
                codeSystem="2.16.840.1.113883.6.238" codeSystemName="CDC Race and Ethnicity"/>
            <languageCommunication>
                <templateId root="2.16.840.1.113883.3.88.11.32.2"/>
                <languageCode code="eng"/>
                <preferenceInd value="true"/>
            </languageCommunication>
        </patient>
        <providerOrganization>
            <!-- This is a public id where the root is registered to indicate the National Provider ID -->
            <id root="2.16.840.1.113883.4.6" extension="1417947383"
                assigningAuthorityName="National Provider ID"/>
            <!-- This is a public id where the root indicates this is a Provider Direct Address. -->
            <!-- root="1.3.6.1.4.1.41179.2.1" is the assigningAuthorityName for
DirectTrust's Covered Entity addresses "DT.org CE" -->
            <id root="1.3.6.1.4.1.41179.2.1" extension="rvhs@rvhs.direct.md" assigningAuthorityName="DT.org CE (Covered Entity)"/>
            <!-- By including a root OID attribute for a healthcare organization, you can use this information to
indicate a patient's MRN id at that organization.-->
            <id root="2.16.840.1.113883.1.111.12345"
                assigningAuthorityName="River Valley Health Services local patient Medical Record Number" />
            <name>River Valley Health Services</name>
            <telecom use="WP" value="tel:+1-4015394321"/>
            <telecom use="WP" value="mailto:rvhs@rvhs.direct.md"/>
            <addr>
                <streetAddressLine>823 Main Street</streetAddressLine>
                <city>River Valley</city>
                <state>RI</state>
                <postalCode>028321</postalCode>
                <country>US</country>
            </addr>
        </providerOrganization>
    </patientRole>
</recordTarget>
```

The CDA Examples Search tool provides useful examples showing the Patient Demographic data elements
represented in a C-CDA document. The examples below show how to include information about a patient’s prior
name or prior address in a C-CDA document. The relevance and pertinence of including this type of information in
an exchange document remains a business decision to be made by organizations engaged in sharing information.

[CDA Header: Patient Demographic Information](https://cdasearch.hl7.org/examples/view/Header/Patient%20Demographic%20Information)

**Example 7: How to represent Patient demographic Information**
```
<recordTarget>
    <patientRole>
        <!-- The @root OID below (which is fictional) would be specific to an institution's
record identifier system. -->
        <id root="2.16.840.1.113883.3.6132" extension="345678912-0154"/>
        <!-- HP is "primary home" from valueSet 2.16.840.1.113883.1.11.10637 -->
        <addr use="HP">
            <!-- You can have multiple [1..4] streetAddressLine elements. Single shown below -->
            <streetAddressLine>1436 Jennyhill Ln.</streetAddressLine>
            <city>Hollywood</city>
            <!-- 5 or 9 digit zip codes from valueSet 2.16.840.1.113883.3.88.12.80.2-->
            <!-- PostalCode is required if the country is US. If country is not specified, it's
assumed to be US. If country -->
            <!-- is something other than US, the postalCode MAY be present but MAY be bound to
different vocabularies -->
            <postalCode>90068</postalCode>
            <!-- State is required if the country is US. If country is not specified, it's
assumed to be US. -->
            <!-- If country is something other than US, the state MAY be present but MAY be bound
to different vocabularies -->
            <!-- OR is "Oregon" from valueSet 2.16.840.1.113883.3.88.12.80.1 -->
            <state>CA</state>
            <!-- US is the two digit code for "United States" -->
            <country>US</country>
        </addr>
        <!-- MC is "mobile contact" from HL7 AddressUse 2.16.840.1.113883.5.1119 -->
        <telecom value="tel:+1(565)867-5309" use="MC"/>
        <!-- Multiple telecoms are possible -->
        <telecom value="mailto://adam@diameterhealth.com" use="WP"/>
        <patient>
            <name use="L">
                <given>Adam</given>
                <family>Everyman</family>
            </name>
            <!-- From CDA R2 on administrativeGender Code: This attribute does not include terms
related to clinical gender.
Gender is a complex physiological, genetic and sociological concept
that requires multiple observations in order to be
comprehensively described. The purpose of this attribute is to
provide a high level classification that can additionally
be used for the appropriate allocation of inpatient bed assignment.-->
            <!-- Sex at birth and gender identity may be specified in social history -->
            <administrativeGenderCode code="M" codeSystem="2.16.840.1.113883.5.1"
                displayName="Male" codeSystemName="AdministrativeGender"/>
            <birthTime value="19621022"/>
            <maritalStatusCode code="M" displayName="Married" codeSystem="2.16.840.1.113883.5.2"
                codeSystemName="MaritalStatus"/>
            <religiousAffiliationCode code="1013" displayName="Christian (non-Catholic, non-
                specific)" codeSystem="2.16.840.1.113883.5.1076" codeSystemName="HL7 Religious Affiliation"/>
            <!-- CDC Race and Ethnicity code set contains the five minimum race and the two
minimum ethnicity categories defined by OMB Standards -->
            <raceCode code="2106-3" displayName="White" codeSystem="2.16.840.1.113883.6.238"
                codeSystemName="OMB Standards for Race and Ethnicity"/>
            <ethnicGroupCode code="2186-5" displayName="Not Hispanic or Latino"
                codeSystem="2.16.840.1.113883.6.238" codeSystemName="OMB Standards for Race and Ethnicity"/>
            <languageCommunication>
                <languageCode code="eng"/>
                <!-- "eng" is ISO 639-2 alpha-3 code for "English" -->
                <modeCode code="ESP" displayName="Expressed spoken"
                    codeSystem="2.16.840.1.113883.5.60" codeSystemName="LanguageAbilityMode"/>
                <proficiencyLevelCode code="E" displayName="Excellent"
                    codeSystem="2.16.840.1.113883.5.61" codeSystemName="LanguageAbilityProficiency"/>
                <preferenceInd value="true"/>
            </languageCommunication>
            <!-- Multiple languages are permitted. Only one should have a preferenceInd = true -->
            <languageCommunication>
                <languageCode code="ita"/>
                <!-- "ita" is ISO 639-2 alpha-3 code for "Italian" -->
                <modeCode code="ESP" displayName="Expressed spoken"
                    codeSystem="2.16.840.1.113883.5.60" codeSystemName="LanguageAbilityMode"/>
                <proficiencyLevelCode code="G" displayName="Good"
                    codeSystem="2.16.840.1.113883.5.61" codeSystemName="LanguageAbilityProficiency"/>
                <!-- Patient's preferred language -->
                <preferenceInd value="false"/>
            </languageCommunication>
        </patient>
    </patientRole>
</recordTarget>
```

**Example 8: How to represent Patient with Previous Name**
```
<recordTarget>
    <!-- Note: several other data elements (telecom, address, etc.) are required to meet C-CDA requirements -->
    <patientRole>
        <id extension="444222222" root="2.16.840.1.113883.4.1"/>
        <patient>
            <!-- SDWG reviewed and approved approach for recording a birth name and legal name -->
            <name use="L">
                <given>Alice</given>
                <given>Jones</given>
                <family>Newman</family>
            </name>
            <name>
                <given qualifier="BR">Alicia</given> <!-- BR = Birth name-->
                <given>Jones</given>
                <family qualifier="BR">Newman</family> <!-- BR = Birth name-->
                <!-- Optional valid time - best practice -->
                <validTime>
                    <low value="20010505"/>
                    <high value="20010510"/>
                </validTime>
            </name>
        </patient>
    </patientRole>
</recordTarget>
```

[Previous Name](https://cdasearch.hl7.org/examples/view/Header/Patient%20Previous%20Name)

**Example 9: How to represent Patient with Prior Address**
```
<!-- recordTarget example from C-CDA-Examples/Header/Patient Demographic Information
added multiple home addresses
-->
<recordTarget>
    <patientRole>
        <id root="2.16.840.1.113883.3.6132" extension="345678912-0154"/>
        <!-- HP is "primary home" from valueSet 2.16.840.1.113883.1.11.10637
and in this instance represents patient's current address -->
        <addr use="HP">
            <streetAddressLine>152 Creek Lane</streetAddressLine>
            <city>Shelburne</city>
            <state>VT</state>
            <postalCode>05455</postalCode>
            <country>US</country>
            <useablePeriod xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                xsi:type="IVL_TS">
                <low value="20110822"/>
            </useablePeriod>
            <!-- It is permissible to omit a low element to indicate current residence -->
            <!-- It is permissible to omit a high element or use nullFlavor='NA' -->
        </addr>
        <addr use="H">
            <streetAddressLine>191 S OAK AVE</streetAddressLine>
            <city>BURLINGTON</city>
            <state>VT</state>
            <postalCode>05422</postalCode>
            <country>US</country>
            <useablePeriod xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                xsi:type="IVL_TS">
                <low value="20110131"/>
                <high value="20110821"/>
            </useablePeriod>
        </addr>
        <addr use="H">
            <streetAddressLine>1141 W MAIN AVE</streetAddressLine>
            <city>CHICAGO</city>
            <state>IL</state>
            <postalCode>60613</postalCode>
            <country>US</country>
            <useablePeriod xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                xsi:type="IVL_TS">
                <low value="20070513"/>
                <high value="20110130"/>
            </useablePeriod>
        </addr>
        <telecom value="tel:+1(565)867-5309" use="MC"/>
        <telecom value="mailto://adam@diameterhealth.com" use="WP"/>
        <patient>
            <name use="L">
                <given>Adam</given>
                <family>Everyman</family>
            </name>
            <administrativeGenderCode code="M" codeSystem="2.16.840.1.113883.5.1"
                displayName="Male" codeSystemName="AdministrativeGender"/>
            <birthTime value="19621022"/>
            <maritalStatusCode code="M" displayName="Married" codeSystem="2.16.840.1.113883.5.2"
                codeSystemName="MaritalStatus"/>
            <religiousAffiliationCode code="1013" displayName="Christian (non-Catholic, non-
                specific)" codeSystem="2.16.840.1.113883.5.1076" codeSystemName="HL7 Religious Affiliation"/>
            <raceCode code="2106-3" displayName="White" codeSystem="2.16.840.1.113883.6.238"
                codeSystemName="OMB Standards for Race and Ethnicity"/>
            <ethnicGroupCode code="2186-5" displayName="Not Hispanic or Latino"
                codeSystem="2.16.840.1.113883.6.238" codeSystemName="OMB Standards for Race and Ethnicity"/>
            <languageCommunication>
                <languageCode code="eng"/>
                <modeCode code="ESP" displayName="Expressed spoken"
                    codeSystem="2.16.840.1.113883.5.60" codeSystemName="LanguageAbilityMode"/>
                <proficiencyLevelCode code="E" displayName="Excellent"
                    codeSystem="2.16.840.1.113883.5.61" codeSystemName="LanguageAbilityProficiency"/>
                <preferenceInd value="true"/>
            </languageCommunication>
            <languageCommunication>
                <languageCode code="ita"/>
                <modeCode code="ESP" displayName="Expressed spoken"
                    codeSystem="2.16.840.1.113883.5.60" codeSystemName="LanguageAbilityMode"/>
                <proficiencyLevelCode code="G" displayName="Good"
                    codeSystem="2.16.840.1.113883.5.61" codeSystemName="LanguageAbilityProficiency"/>
                <preferenceInd value="false"/>
            </languageCommunication>
        </patient>
    </patientRole>
</recordTarget>
```

[Prior Address](http://hl7-c-cda-examples.herokuapp.com/examples/view/Header/Patient%20With%20Prior%20Addresses)

##### @use and @qualifier attributes for Patient name

The US Realm Patient Name template (2.16.840.1.113883.10.20.22.5.1) supports the @use attribute on the name
tag. This template also supports the @qualifier attribute on the given and family tags.

These value sets are available in the C-CDA Value Set Release Package available from the Downloads page of the
[Value Set Authority Center](https://vsac.nlm.nih.gov/download/ccda).

<table
    style="border-collapse:collapse;margin-left:24.01pt"
    cellspacing="0">
    <tr style="height:26pt">
        <td
          style="width:462pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"
          bgcolor="#C5D9F0"><p class="s19"
          style="padding-left: 41pt;text-indent: 0pt;text-align: left;"
          >Concepts available for use with the @use
          attribute of the name element SHALL be selected
          from the EntityNameUse value set
          (2.16.840.1.113883.1.11.15913 ).
          <b>[CONF-032]</b></p></td>
    </tr>
    <tr style="height:26pt">
        <td
          style="width:462pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"
          bgcolor="#C5D9F0"><p class="s19"
          style="padding-left: 41pt;text-indent: 0pt;text-align: left;"
          >Concepts available for use with the @qualifier
          attribute of the name element SHALL be selected
          from the EntityPersonNamePartQualifier value set
          (2.16.840.1.113883.11.20.9.26 ).
          <b>[CONF-033]</b></p></td>
    </tr>
</table>

**Example 10: Logical display order of name pieces**

(i.e., such that a receiver which only extracts the text and ignores the markup around <given>, <family>, etc. would still display
the name in a way a human would interpret correctly).
```
    <recordTarget>
        <!-- Examples of how systems send names and logical display order -->
        <!-- Note: This snippet omits other data elements required to meet C-CDA requirements
(telecom, address, etc.) -->
        <patientRole>
            <id nullFlavor="NI" />
            <patient>
                <!-- This is okay; "Robin Taylor" is a logical display order -->
                <name>
                    <given>Robin</given>
                    <family>Taylor</family>
                </name>
                <!-- This is okay; "Taylor, Robin" implies Lastname, Firstname ordering in the US -->
                <name>
                    <family>Taylor</family>
                    <delimiter>, </delimiter>
                    <given>Robin</given>
                </name>
                <!-- This is okay; "Dr. Robin Taylor" is a logical display order -->
                <name>
                    <prefix qualifier="AC TITLE">Dr. </prefix><!-- Space in element is intentional
(see CDA R2.0 Section 2.23.4) -->
                    <given>Robin</given>
                    <family>Taylor</family>
                </name>
                <!-- This is okay; "Robin Taylor MD" is a logical display order -->
                <name>
                    <given>Robin</given>
                    <family>Taylor</family>
                    <suffix qualifier="AC TITLE"> MD</suffix><!-- Space in element is intentional
(see CDA R2.0 Section 2.23.4) -->
                </name>
                <!-- Don't do this; "Robin Taylor Dr." isn't a logical display order -->
                <name>
                    <given>Robin</given>
                    <family>Taylor</family>
                    <prefix qualifier="AC TITLE">Dr. </prefix><!-- Space in element is intentional -->
</name>
<!-- Don't do this; "Taylor Robin" is confusing (is Taylor the given name?) -->
                    <name>
                        <family>Taylor</family>
                        <given>Robin</given>
                    </name>
            </patient>
        </patientRole>
    </recordTarget>
```

Some systems may collect a patient’s Social Security number but organizational business rules prohibit distribution
of the full number and require that all but the final four digits of the identifier to be masked when distributing this
information to data sharing partners.

<table
	style="border-collapse:collapse;margin-left:24.01pt"
	cellspacing="0">
	<tr style="height:26pt">
	    <td
	      style="width:462pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"
	      bgcolor="#C5D9F0"><p class="s19"
	      style="padding-left: 41pt;text-indent: 0pt;text-align: left;"
	      >Content Consumers SHALL NOT treat id elements that
	include a nullFlavor attribute as globally unique
	identifiers. <b>[BP-034]</b></p></td>
	</tr>
</table>

**Example 11: How to represent a social security number (SSN) that has been masked to show only the last four digits**
```
<recordTarget>
    <patientRole>
        <!-- Example Social Security Number using the root for the Social Security Administration
assigningAuthority. -->
        <id assigningAuthorityName="US Social Security Administration" root="2.16.840.1.113883.4.1"
            extension="414122222"/>
        <!-- SSN provided, but masked to include only the last 4 characters. -->
        <!-- Note: both examples are shows for comparison. It would not make sense to use both of
these options in a real C-CDA Document. -->
        <!-- When recording SSN in the extension dashes (-) are permitted but not required" -->
        <!-- Receiving systems may decide whether to store the last 4 or discard -->
        <!-- an id with a nullFlavor SHALL NOT be used for matching or indexing -->
        <id assigningAuthorityName="US Social Security Administration" root="2.16.840.1.113883.4.1"
            extension="***-**- 2222" nullFlavor="MSK"/>
        <addr use="HP">
            <!-- HP is "primary home" from codeSystem 2.16.840.1.113883.5.1119 -->
            <streetAddressLine>1357 Amber Dr</streetAddressLine>
            <city>Beaverton</city>
            <state>OR</state>
            <postalCode>97006</postalCode>
            <country>US</country>
            <!-- US is "United States" from ISO 3166-1 Country Codes: 1.0.3166.1 -->
        </addr>
        <telecom value="tel:+1(555)- 777 - 1234" use="MC"/>
        <telecom value="tel:+1(555)- 723 - 1544" use="HP"/>
        <!-- HP is "primary home" from HL7 AddressUse 2.16.840.1.113883.5.1119 -->
        <patient> </patient>
        <providerOrganization> </providerOrganization>
    </patientRole>
</recordTarget>
```

#### Representing Multiple Races or Multiple Ethnicities

The recordTarget utilizes two CDA R2 extensions for representing multiple races and multiple ethnicities.

<table
    style="border-collapse:collapse;margin-left:24.01pt"
    cellspacing="0">
    <tr style="height:41pt">
        <td
          style="width:469pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"
          bgcolor="#C5D9F0"><p class="s19"
          style="padding-left: 41pt;text-indent: 0pt;text-align: left;"
          >This patient <b>SHALL </b>contain exactly one
          [1..1] <b>raceCode</b>, which <b>SHALL </b>be
          selected from ValueSet <b>Race Category Excluding
          Nulls </b>urn:oid:2.16.840.1.113883.3.2074.1.1.3
          <b>DYNAMIC </b>[CONF:1198-5322].</p></td>
    </tr>
    <tr style="height:92pt">
        <td
          style="width:469pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"
          bgcolor="#C5D9F0"><p class="s19"
          style="padding-left: 41pt;padding-right: 2pt;text-indent: 0pt;text-align: left;"
          >This patient <b>MAY </b>contain zero or more
          [0..*] <b>sdtc:raceCode</b>, which <b>SHALL </b>be
          selected from ValueSet <b>Race
          </b>urn:oid:2.16.840.1.113883.1.11.14914
          <b>DYNAMIC </b>(CONF:1198-7263). Note: The
          sdtc:raceCode is only used to record additional
          values when the patient has indicated multiple
          races or additional race detail beyond the five
          categories required for Meaningful Use Stage 2.
          The prefix sdtc: SHALL be bound to the namespace
          “urn:hl7-org:sdtc”. The use of the namespace
          provides a necessary extension to CDA R2 for the
          use of the additional raceCode elements. a. If
          sdtc:raceCode is present, then the patient
          <b>SHALL </b>contain [1..1] raceCode
          [CONF:1198-31347].</p></td>
    </tr>
    <tr style="height:38pt">
        <td
          style="width:469pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"
          bgcolor="#C5D9F0"><p class="s19"
          style="padding-left: 41pt;text-indent: 0pt;line-height: 12pt;text-align: left;"
          >This patient <b>SHALL </b>contain exactly one
          [1..1] <b>ethnicGroupCode</b>, which <b>SHALL
          </b>be selected from ValueSet <b>Ethnicity </b> <span class="s19"
          >urn:oid:2.16.840.1.114222.4.11.837 </span> <b>DYNAMIC </b>
          <span class="s19"
          >[CONF:1198-5323].</span></p></td>
    </tr>
    <tr style="height:37pt">
        <td
          style="width:469pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"
          bgcolor="#C5D9F0"><p class="s19"
          style="padding-left: 41pt;text-indent: 0pt;text-align: left;"
          >This patient MAY contain zero or more [0..*]
          sdtc:ethnicGroupCode, which <b>SHALL </b>be
          selected from ValueSet Detailed Ethnicity
          urn:oid:2.16.840.1.114222.4.11.877 DYNAMIC
          (CONF:1198-32901).</p></td>
    </tr>
</table>

#### Patient Identifiers

Patient identifiers are included in a C-CDA within the patientRole structure of the recordTarget. The @extension
attribute of the id tag holds the identifier. The @root attribute holds an OID associated with the assigning
authority of the identifier. The @assigningAuthorityName attribute holds the name of the assigning authority.
Many organizations that assign trusted identifiers exist today and have registered OIDs to support exchange of the
identifiers they assign. The table below includes some examples.

| **Assigning Authority Name**   | **Assigning Authority OID identifier**    |
| ---- | ------ |
| **U.S. Social Security Administration**   | 2.16.840.1.113883.4.1  |
| **Driver’s license issuing authority**   | 2.16.840.1.113883.12.333  |   
| **DT.org PATIENT (DirectTrust assigned identity for Consumer entity)**   | 1.3.6.1.4.1.41179.2.4  |
{:.grid}
**Table 11: Patient Identifiers**

**Example 12: How to represent a patient's social security number**
```
<recordTarget>
    <patientRole>
        <id assigningAuthorityName="EPI"
            extension="700000305" root="1.2.840.114350.1.13.6289.1.7.5.737384.14"/>
        <id assigningAuthorityName="US Social Security Administration"
            root="2.16.840.1.113883.4.1" extension="999-99- 9999"/>
        <id assigningAuthorityName="Driver’s license issuing authority"
            extension="43721-643" root="2.16.840.1.113883.4.3.24"/>
        <patient>
            <name use="L"><given>Barbara</given><family>Epic</family></name>
        </patient>
    </patientRole>
</recordTarget>
```

#### recordTarget Provider Organization

While the recordTarget represents the medical record that this document belongs to, the providerOrganization
within the recordTarget represents the provider organization to which the medical record belongs.

<table
    style="border-collapse:collapse;margin-left:24.01pt"
    cellspacing="0">
    <tr style="height:32pt">
        <td
          style="width:467pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"
          bgcolor="#C5D9F0"><p class="s19"
          style="padding-left: 40pt;padding-right: 4pt;text-indent: 0pt;line-height: 107%;text-align: left;"
          >C-CDA Content Creators SHOULD populate the
          providerOrganization within the recordTarget when
          the document represents information from a
          provider’s medical record system.
          <b>[CONF-035]</b></p></td>
    </tr>
    <tr style="height:45pt">
        <td
          style="width:467pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"
          bgcolor="#C5D9F0"><p class="s19"
          style="padding-left: 40pt;padding-right: 4pt;text-indent: 0pt;line-height: 107%;text-align: left;"
          >C-CDA Content Creators SHOULD include an
          identifier for the provider organization in the
          id/@extension attribute and SHOULD identify the
          assigning authority for the identifier using a
          globally unique identifier (GUID or OID) in the
          id/@root attribute. <b>[CONF-036]</b></p></td>
    </tr>
</table>



#### Authors Versus Performers

CDA includes structures to record the author of information, and separately, the performer of a service. It is
important for implementers to avoid recording a performer as an author, if that performer was not the individual
who authored content.

A performer participant represents a clinician who actually and principally carried out a service. A performer
participation indicated at one location in a document does not conduct throughout the document and must be
repeated at each entry to indicate involvement. For example, the performer indicated in the serviceEvent in the
CDA header is not automatically implied to be the performer in procedures or medication activities represented by
the entries in the document. An author represents the human or machine that authored content. Authors listed in
the header are responsible for all content in the document, while authors recorded in a section or entry are only
responsible for content within that structure and override the author in the header. Section authorship applies to
the full content of a section, including both the narrative block and any entries. Entry authorship applies only to the specific entry.

One example where confusion between these roles might arise for implementers is related to quality
measurement use cases, which require clinical documentation to indicate who diagnosed a patient’s condition and
when a clinician made or re-confirmed the diagnosis. The provider who documents the diagnosis (data enterer or
author) may not be the provider who makes the diagnosis (performer).

The Author Participation template (2.16.840.1.113883.10.20.22.4.119) is used to explicitly indicate an Author in a
section or entry. The template provides conformance rules for representing the author and author.time elements
associated with individual entries. The HL7 Basic Provenance project also developed additional guidance on
sharing the Author in the Provenance - [Provenance - Author Participation](StructureDefinition-ProvenanceAuthorParticipation.html).

The C-CDA specification requires the following:

<table
    style="border-collapse:collapse;margin-left:24.01pt"
    cellspacing="0">
    <tr style="height:32pt">
            <td
              style="width:467pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"
              bgcolor="#C5D9F0"><p class="s19"
              style="padding-left: 40pt;padding-right: 4pt;text-indent: 0pt;line-height: 107%;text-align: left;"
              >1. <b>SHALL </b><span class="s19">contain exactly one [1..1]
        </span><b>templateId </b><span class="s19">(CONF:1098-32017)
            such that it</span></p><p class="s31"
              style="padding-top: 5pt;padding-left: 85pt;padding-right: 14pt;text-indent: -9pt;text-align: left;"
              ><b>a. SHALL </b><span class="s19">contain exactly one
              ["..1] </span><b>@root</b><span class="s19"
              >=&quot;2.16.840.1.113883.10”20.22.4.119&quot;
              (CONF:1098- 32018).</span></p><p class="s31"
        style="padding-top: 6pt;padding-left: 51pt;text-indent: -9pt;text-align: left;"
        bgcolor="#C5D9F0">2. <b>SHALL </b><span class="s19">contain exactly one [1..1]
        </span><b>time </b><span class="s19"
        >(CONF:1098-31471).</span></p><p class="s31"
        style="padding-top: 6pt;padding-left: 51pt;text-indent: -9pt;text-align: left;"
        bgcolor="#C5D9F0">3. <b>SHALL </b><span class="s19">contain exactly one [1..1]
        </span><b>assignedAuthor </b><span class="s19"
            >(CONF:1098-31472).</span></p><p class="s19"
              style="padding-top: 6pt;padding-left: 82pt;text-indent: -9pt;text-align: left;"
              >a. This assignedAuthor <b>SHALL </b>contain at least
              one [1..*] <b>id </b>(CONF:1098-31473).</p><br/><p class="s19"
            style="padding-top: 5pt;padding-left: 40pt;padding-right: 3pt;text-indent: 1pt;text-align: left;"
            >Note: This id may be set equal to (a pointer to) an
            id on a participant elsewhere in the document
            (header or entries) or a new author participant can
            be described here. If the id is pointing to a
            participant already described elsewhere in the
            document, assignedAuthor/id is sufficient to
            identify this participant and none of the remaining
            details of assignedAuthor are required to be set.
            Application Software must be responsible for
            resolving the identifier back to its original object
            and then rendering the information in the correct
            place in the containing section&#39;s narrative
            text. This id must be a pointer to another author
            participant.</p><p class="s19"
            style="padding-top: 6pt;padding-left: 41pt;padding-right: 8pt;text-indent: 0pt;text-align: left;"
            >If’ the ID isn&#39;t referencing an author
            described elsewhere in the document, then the author
            components required in US Realm Header are required
            here as well (CONF:1098-32628).</p><p class="s19"
            style="padding-left: 90pt;padding-right: 3pt;text-indent: 0pt;text-align: left;"
            >This assignedAuthor SHOULD contain zero or one [0..1] code, 
            which <b>SHOULD </b> be selected from ValueSet <b>Healthcare 
            Provider Taxonomy (HIPAA) </b> 
            urn:oid:2.16.840.1.114222.4.11.1066 <b>DYNAMIC </b> 
            (CONF:1098-31671). i. If the content is patient authored 
            the code <b>SHOULD </b>be selected
            from Personal And Legal Relationship Role Type
            (2.16.840.1.113883.11.20.12.1)
            (CONF:1098-32315).</p><p class="s19"
            style="padding-left: 108pt;text-indent: 0pt;text-align: left;"
            >i. The representedOrganization, if present, <b>MAY </b> contain 
            zero or more [0..*] <b>id </b>(CONF:1098-31478).</p><p class="s19"
            style="padding-left: 108pt;text-indent: 0pt;text-align: left;"
            >ii. The representedOrganization, if present, <b>MAY </b> contain zero 
            or more [0..*] <b>name </b>(CONF:1098-31479).</p><p class="s19"
            style="padding-left: 108pt;text-indent: 0pt;text-align: left;"
            >The representedOrganization, if present, <b>MAY </b> contain zero 
            or more [0..*] <b>telecom </b>(CONF:1098-31480).</p><p class="s19"
            style="padding-left: 108pt;text-indent: 0pt;text-align: left;"
            >The representedOrganization, if present, <b>MAY </b> contain zero 
            or more [0..*] <b>addr </b>(CONF:1098-31481).</p></td>
    </tr>
</table>


**Figure 4: Author Participation**

Inclusion of an entry-level author is allowed in open entry templates in C-CDA where use of entry-level authors has
not explicitly been prohibited. Its use is required on only one entry template, the [Handoff Communication Participants template](StructureDefinition-HandoffCommunicationParticipants.html).

[Basic Provenance](https://confluence.hl7.org/display/SEC/Basic+Provenance+Implementation+Guide)

[Author Participation](StructureDefinition-AuthorParticipation.html)

<table
    style="border-collapse:collapse;margin-left:18.61pt"
    cellspacing="0">
    <tr style="height:28pt">
        <td
            style="width:468pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"
                bgcolor="#C5D9F0"><p class="s19"
                style="padding-left: 33pt;padding-right: 10pt;text-indent: 0pt;text-align: left;"
                >C-CDA Content Creators MAY explicitly indicate the
                performer for observations and acts, not just the
                author who documents those activities.
                  <b>[BP-038]</b></p></td>
    </tr>
</table>

#### Identifying Practitioners

The example below shows how to identify a practitioner playing the role of author, performer or other roles such
as authenticator and legal authenticator. It shows how to represent the provider’s National Provider Identifier (NPI)
number and his or her Direct Address. It also shows how to represent a provider Organization’s NPI number and
Direct Address. It includes how to indicate the preferred telecom addresses for various forms of communication.

**Example 13: How to represent a provider and the provider’s organization in the role of author**

This representation pattern is applicable for other roles such as performer, authenticator, legal
authenticator, etc. The example shows how to represent NPI information for the provider and for the
provider organization. It also shows how to represent Direct address information and how to indicate the
preferred telecom address to use.

```
<!-- an appropriate participation such as author/assignedAuthor -->
<author>
    <time value="20180801095245-0400"/>
    <assignedAuthor>
        <!-- This is a public id where the root is registered to indicate the National Provider ID -->
<id root="2.16.840.1.113883.4.6" extension="1417947383"
assigningAuthorityName="National Provider ID"/>
<!-- This is a public id where the root indicates this is a Provider Direct Address. -->
        <!-- root="1.3.6.1.4.1.41179.2.1" is the assigningAuthorityName for
Direct Trust's Covered Entity addresses "DT.org CE" -->
        <id root="1.3.6.1.4.1.41179.2.1" extension="rvhs@rvhs.direct.md"
            assigningAuthorityName="DT.org CE (Covered Entity)"/>
        <addr>
            <streetAddressLine>823 Main Street</streetAddressLine>
            <city>River Valley</city>
            <state>RI</state>
            <postalCode>028321</postalCode>
            <country>US</country>
        </addr>
        <telecom use="WP" value="tel:+1-(401)539-4321"/>
        <!-- The provider's preferred Direct Address is the address identified with his practice. See
below.-->
        <telecom use="WP" value="mailto:rvhs@rvhs.direct.md"/>
        <assignedPerson>
            <name>
                <given>Terry</given>
                <given>A</given>
                <family>Manning</family>
                <delimeter>, </delimeter>
                    <suffix>MD</suffix>
            </name>
        </assignedPerson>
        <representedOrganization>
            <id extension="334" root="1.3.6.1.4.1.22812.4.222.334"/>
            <!-- This is a public id where the root is registered to indicate the National Provider
ID -->
            <!-- Based on context, this is the NPI of the organization -->
            <id root="2.16.840.1.113883.4.6" extension="9999999999"
                assigningAuthorityName="National Provider ID"/>
            <!-- This is a public id where the root indicates this is a Provider Direct Address. -->
            <!-- root="1.3.6.1.4.1.41179.2.1" is the assigningAuthorityName for
Direct Trust's Covered Entity addresses "DT.org CE" -->
            <id root="1.3.6.1.4.1.41179.2.1" extension="rvhs@rvhs.direct.md"
                assigningAuthorityName="DT.org CE (Covered Entity)"/>
            <name>River View Health Services</name>
            <telecom use="WP" value="tel:+1-(401)539-4321"/>
            <telecom use="WP" value="mailto:rvhs@rvhs.direct.md"/>
            <addr>
                <streetAddressLine>823 Main Street</streetAddressLine>
                <city>River Valley</city>
                <state>RI</state>
                <postalCode>028321</postalCode>
                <country>US</country>
            </addr>
        </representedOrganization>
    </assignedAuthor>
</author>
<!-- end of the appropriate role block -->
```

If a provider’s NPI number is not known, it can be represented using a nullFlavor of UNK. However, is it important
to note the id’s populated with a nullFlavor cannot be used as a globally unique identifier.

**Example 14: Provider with an unknown NPI number.**
```
<assignedAuthor>
    <!-- This is a public id where the root is registered to indicate the National Provider ID -->
<!-- Use nullFlavor UNK if the provider’s NPI number is not known. -->
    <id root="2.16.840.1.113883.4.6" nullFlavor="UNK"
        assigningAuthorityName="National Provider ID"/>
    <!-- This is a public id where the root indicates this is a Provider Direct Address. -->
    <!-- root="1.3.6.1.4.1.41179.2.1" is the assigningAuthorityName for
Direct Trust's Covered Entity addresses "DT.org CE" -->
    <id root="1.3.6.1.4.1.41179.2.1" extension="rvhs@rvhs.direct.md"
        assigningAuthorityName="DT.org CE (Covered Entity)"/>
    <addr>
        <streetAddressLine>823 Main Street</streetAddressLine>
        <city>River Valley</city>
        <state>RI</state>
        <postalCode>028321</postalCode>
        <country>US</country>
    </addr>
    <telecom use="WP" value="tel:+1-(401)539-4321"/>
    <!-- The provider's preferred Direct Address is the address identified with his practice. See
below.-->
    <telecom use="WP" value="mailto:rvhs@rvhs.direct.md"/>
    <assignedPerson>
        <name>
            <given>Terry</given>
            <given>A</given>
            <family>Manning</family>
            <delimeter>, </delimeter>
                <suffix>MD</suffix>
        </name>
    </assignedPerson>
</assignedAuthor>
```

#### Custodian

Every CDA document has exactly one custodian. The custodian represents the organization who is in charge of
maintaining the document. The custodian is the steward that is entrusted with the care of the document. The
custodian participation satisfies the CDA definition of Stewardship.

#### Care Team Members

Recommendations for care team member representation in the header of documents are included below. This
guidance aims to explain the options available for representation of care team members and clarify which care
team members belong in the available header structures.

Implementers can help reduce variability in the representation of care team members by adopting these
recommendations.

This guide includes representation of care team members in a care team section template with structured
entries. The care team section documents care team members involved in support of care provision and
coordination for the patient. Business rules are used to determine which care team members are involved in the
encounter or services represented and documented in the header. Care team members established in the header
should be included in the care team section template as well as any others who are relevant to the patient’s care.

**Reference:** [Care Team Organizer](StructureDefinition-CareTeamOrganizer.html)

Because of the variability of how care team members are represented in the header, and because there is a lack of
normative guidance on which header items must be rendered, it is recommended that receiving systems should
render ALL the participants in the header, rather than only rendering participants of a particular type. The [HL7 CDA style sheet](https://github.com/HL7/cda-core-xsl) supports complete participant rendering.

The term “care team member” encompasses any participant in the care of a patient. A patient’s care team may
include individuals providing support to the patient, such as family members or caregivers, as well as physician
providers and non-physician providers, including nurses, social workers, behavioral health specialists, community-
based providers, technicians, and assistants. In fact, a patient may have more than one care team. Different care
teams exist for different purposes and at different times.

When exchanging information about a care team member, it is recommended to capture the name, identification
number, and contact information, along with codes to indicate the type of provider and the role they play on
the patient’s care team. These details help to distinguish care team members from different care settings and
helps clarify who is involved in the patient’s care and in what ways.

Within CDA, care team members are represented as participants in elements of the document header and may be
associated with the patient (i.e. guardian), the clinical encounter, and/or service event(s) detailed in the document,
and the document itself. Applicable header elements for documenting care team members from Chapter 1.1 of the
C- CDA Implementation Guide are described in the following table.


| **Participant**   | **Description**    |
| ---- | ------ |
| **documentationOf/<br />serviceEvent/<br />performer**   | Care team member who performs the service event detailed in the document.<br />Examples: PCP, surgeon, consulting physician  |
| **encompassingEncounter/<br />responsibleParty**   | Care team member who is responsible for the patient encounter described in the document.<br />Examples: PCP, surgeon, consulting physician, home health nurse  |
| **recordTarget**   | The patient, his or herself, is considered a member of the Care team.  |
| **author**   | Care team member who documents events included in the documentation of the encounter or documentation of the provision of care over time.<br />Example: PCP, surgeon, consulting physician, home health nurse  |
| **custodian**   |  The steward of the document is likely an organization with a role on the patient’s care team, although not necessarily.<br />Example: PCP practice, Hospital, home health agency, HIE |
| **legalAuthenticator**   | Care team member who authenticates content contained in the document and accepts legal responsibility.<br />Examples: PCP, consulting physician, attending physician  |
| **authenticator**   | Care team member who authenticates content contained in the document.<br />Examples: PCP, consulting physician, attending physician  |
| **informationRecipient**   | Care team member who the document is intended for.<br />Examples: PCP, caregiver, consulting physician  |
| **participant**   | Other supporting care team members associated with the patient.<br />Examples: Caregiver, family member, emergency contact  |
{:.grid}
**Table 12: Header Elements for Care Team Members**

In the header of an Encounter Summary, a care team member may be documented as fulfilling more than one
responsibility. For example, a consulting physician who sees a patient in a clinical encounter may be:

1. the author of the Consultation Note,
2. the responsible party for the Encounter (rendering physician), or
3. the authenticator (physician attesting to the human readable content in the document).

The physician also may be the person who legally authenticates the information contained in the document. In this
example, the consulting physician is participating as the encompassingEncounter/responsibleParty, the author, the
authenticator and the legalAuthenticator.

In the header of a Patient Summary, it is most common to see care team members identified in the
documentationOf/serviceEvent as performers who were involved in the provision of care for the patient during the
range of time covered by the summary. Again, depending on the use case behind how the Patient Summary is
generated, care team members also may be documented in other roles such as the author, the authenticator and
the legalAuthenticator.

Semantically, the actRelationships hold the key data elements for documenting Care Team members in the header.
These are the data elements that tell who was responsible for the patient encounter and who was responsible for
performing care services.

<table
    style="border-collapse:collapse;margin-left:24.01pt"
    cellspacing="0">
    <tr style="height:37pt">
        <td
            style="width:468pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"
                bgcolor="#C5D9F0"><p class="s19"
                style="padding-left: 39pt;text-indent: 0pt;text-align: left;"
                >For Encounter Summary documents, C-CDA Content
                Creators SHALL document the provider who is
                responsible for the encounter in the
                componentOf/encompassingEncounter/responsibleParty.
                  <b>[BP-039]</b></p></td>
    </tr>
    <tr style="height:37pt">
        <td
            style="width:468pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"
            bgcolor="#C5D9F0"><p class="s19"
                style="padding-left: 39pt;padding-right: 5pt;text-indent: 0pt;text-align: left;"
                >For Patient Summary documents, C-CDA Content
                Creators SHALL document providers who played the
                role of Primary Care Provider for the patient during
                the range of time covered in the summary using</p><p
                class="s19"
                style="padding-left: 39pt;text-indent: 0pt;line-height: 11pt;text-align: left;"
                >the documentationOf/serviceEvent/performer.
                  <b>[BP-040]</b></p></td>
    </tr>
    <tr style="height:37pt">
        <td
            style="width:468pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"
            bgcolor="#C5D9F0"><p class="s19"
                style="padding-left: 39pt;padding-right: 5pt;text-indent: 0pt;text-align: left;"
                >C-CDA Content Creators SHALL populate the
                functionCode element with the provider’s or person’s
                role on the patient’s care team. Coded concepts for
                the functionCode SHALL be selected from the
                Care</p><p class="s19"
                style="padding-left: 39pt;text-indent: 0pt;line-height: 11pt;text-align: left;"
                >Team Member Function value set
                (2.16.840.1.113762.1.4.1099.30).
            <b>[BP-041]</b></p></td>
    </tr>
</table>


#### sdtc:signatureText in Authenticator and legalAuthenticator

Sharing clinical documents with payers is one use case for C-CDA. To meet the needs of this use case,
document authentication and signing of C-CDA documents guidance is provided.

The legalAuthenticator is recorded in ClinicalDocument.legalAuthenticator, and represents a participant who has
legally authenticated the document. Authenticators are recorded in ClinicalDocument.authenticator, and each
authenticator represents a participant who has attested to the accuracy of the document, but who does not have
privileges to legally authenticate the document. An example would be a resident physician who sees a patient and
dictates a note, and signs it. Later an attending physician may sign it who would be reprensented by the legalAuthenticator participant.

Additional Guidance is in the following table:

<table
    style="border-collapse:collapse;margin-left:24.01pt"
    cellspacing="0">
    <tr style="height:92pt">
        <td
            style="width:468pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"
            bgcolor="#C5D9F0"><p class="s19"
                style="padding-left: 41pt;padding-right: 5pt;text-indent: 0pt;text-align: left;"
                >All documents SHALL have a <i>legalAuthenticator.
                </i>In the case of generated summary documents,
                institutions may meet the requirement for a Legal
                Authenticator by extending the practice of
                maintaining a “Signature on File”. The person,
                entity, organization, role, etc. indicated is
                responsible for the contents of the note where it is
                understood that this Legal Authenticator is not an
                author of the document. Policy for determining who
                is responsible for legal authentication of the
                summary document rests with the originating
                organization. In real-world exchange, organizations
                and roles are being used as legalAuthenticators;
                this is consistent with the CDA base standard.
                  <b>[AIGEX-HD4]</b></p></td>
    </tr>
    <tr style="height:32pt">
        <td
            style="width:468pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"
            bgcolor="#C5D9F0"><p class="s19"
                style="padding-left: 41pt;padding-right: 3pt;text-indent: 0pt;text-align: left;"
                >All documents that contain
                  <i>sdtc:signatureText</i>, SHALL conform to the
                HL7 Digital Signatures and Delegation of Rights
                Implementation Guide R1<i>.
                </i><b>[AIGEX-HD7]</b></p></td>
    </tr>
</table>

The HL7 Digital Signatures and Delegation of Rights Implementation Guide R1 defines the standards for [digitally
signing C-CDA documents](http://www.hl7.org/implement/standards/product_brief.cfm?product_id=375).

<table
    style="border-collapse:collapse;margin-left:24.01pt"
    cellspacing="0">
    <tr style="height:26pt">
        <td
            style="width:468pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"
            bgcolor="#C5D9F0"><p class="s19"
                style="padding-left: 41pt;padding-right: 8pt;text-indent: 0pt;text-align: left;"
                >C-CDA Content Creators MAY include the
                sdtc:signatureText extension for Authenticators and
                LegalAuthenticators. <b>[BP-042]</b></p></td>
    </tr>
    <tr style="height:26pt">
        <td
            style="width:468pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"
            bgcolor="#C5D9F0"><p class="s19"
                style="padding-left: 41pt;padding-right: 8pt;text-indent: 0pt;text-align: left;"
                >C-CDA Content Consumers MAY render certificate
                information associated with digital signed C-CDA
                Documents when rendering the document.
                  <b>[BP-043]</b></p></td>
    </tr>
</table>

#### Context of Care

Two common use cases for C-CDA are exchanging Patient Summary Dcouments and Exchanging Encounter Summary Documents.

In a Patient Summary, the documentationOf/serviceEvent holds the key information about the
range of time covered by the document and the key providers involved in the provision of the summarized care.

In an Encounter Summary, the header needs to capture the context of care for a particular encounter via the encompasssingEncounter.

For more information and Guidance see [Concise Consolidated CDA: Deploying Encounter Summary CDA Documents with Clinical Notes ](https://www.commonwellalliance.org/wp-content/uploads/2019/01/Improve-Joint-Document-Content-Whitepaper.pdf).

#### Encompassing Encounter

<table
    style="border-collapse:collapse;margin-left:24.01pt"
    cellspacing="0">
    <tr style="height:49pt">
        <td
          style="width:468pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"
          bgcolor="#C5D9F0"><p class="s19"
          style="padding-left: 41pt;text-indent: 0pt;text-align: left;"
          >In an Encounter Summary, C-CDA Content Creators
          SHALL populate the
          encompassingEncounter/effectiveTime and the
          encompassingEncounter/location/healthCareFacility/serviceProviderOrganization
          and the</p><p class="s19"
          style="padding-left: 41pt;text-indent: 0pt;line-height: 11pt;text-align: left;"
          >encompassingEncounter/responsibleParty/assignedEntity.
          <b>[CONF-044]</b></p></td>
    </tr>
</table>

#### Service Events

<table
    style="border-collapse:collapse;margin-left:24.01pt"
    cellspacing="0">
    <tr style="height:26pt">
        <td
          style="width:468pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"
          bgcolor="#C5D9F0"><p class="s19"
          style="padding-left: 41pt;padding-right: 8pt;text-indent: 0pt;text-align: left;"
          >In an Encounter Summary, C-CDA Content Creators
          MAY populate the documentationOf/serviceEvent,
          including the serviceEvent/effectiveTime,
          serviceEvent/code, and serviceEvent/performer(s).
          <b>[BP-045]</b></p></td>
    </tr>
    <tr style="height:26pt">
        <td
          style="width:468pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"
          bgcolor="#C5D9F0"><p class="s19"
          style="padding-left: 41pt;padding-right: 8pt;text-indent: 0pt;text-align: left;"
          >In a Patient Summary, C-CDA Content Creators
          SHALL populate the documentationOf/serviceEvent
          based on conformance requirements of the C-CDA
          specification for CCD documents.
          <b>[CONF-046]</b></p></td>
    </tr>
</table>

#### Orders Fulfilled

If an Encounter occurred as a result of a previously placed order (e.g., a visit to perform an MRI), the id of that
order should be provided as context for the Encounter.

<table
    style="border-collapse:collapse;margin-left:24.01pt"
    cellspacing="0">
    <tr style="height:37pt">
        <td
          style="width:468pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"
          bgcolor="#C5D9F0"><p class="s19"
          style="padding-left: 41pt;text-indent: 0pt;text-align: left;"
          >In an Encounter Summary, C-CDA Content Creators
          SHOULD populate the infulfillmentOf/order and the
          infulfillmentOf/order/id element where the
          order/id references the id of a previously placed
          order.</p><p class="s31"
          style="padding-left: 41pt;text-indent: 0pt;line-height: 11pt;text-align: left;"
          ><b>[BP-047]</b></p></td>
    </tr>
    <tr style="height:26pt">
        <td
          style="width:468pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"
          bgcolor="#C5D9F0"><p class="s19"
          style="padding-left: 41pt;text-indent: 0pt;text-align: left;"
          >The Order Fulfilled area of the header MAY carry
          information about fulfilled orders, rereferrals or
          other requests that have been fulfilled.
          <b>[BP-048]</b></p></td>
    </tr>
</table>

#### Related Parent Document

The ParentDocument represents the source of a document revision, addendum, or transformation. The
relatedDocument/parentDocument/id element is a mechanism used to link a revised, addendum, or transformed
document to its original source document. There are many situations where a document may be updated. For
example, a pending laboratory result or a missing note may trigger an update. The base CDA standard provides this
mechanism to replace or append a previously sent document through the parentDocument relationship.

C-CDA Content Creators cannot know with certainty what documents a Content Consumer has previously stored.
Therefore, it always is preferable for Content Creators to send a complete document that replaces a prior
document rather than sending an addendum to a prior document. Indicate the parent document is being
replaced by using a replaceRelationship type of RPLC.

<table
    style="border-collapse:collapse;margin-left:24.01pt"
    cellspacing="0">
    <tr style="height:37pt">
        <td
          style="width:468pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"
          bgcolor="#C5D9F0"><p class="s19"
          style="padding-left: 41pt;text-indent: 0pt;text-align: left;"
          >C-CDA Content Creators SHOULD populate the ClinicalDocument/relatedDocument using
          @typeCode="RPLC" when a document replaces a prior document.</p><p class="s31"
          style="padding-left: 41pt;text-indent: 0pt;line-height: 11pt;text-align: left;"
          ><b>[BP-049]</b></p></td>
    </tr>
</table>

**Example 15: Replacement Discharge Summary Document with Hospital Course Added**
```
<ClinicalDocument> <realmCode code="US">
    <typeId root="2.16.840.1.113883.1.3" extension="POCD_HD000040"/>
    <templateId root="2.16.840.1.113883.10.20.22.1.1" extension="2015-08- 01" >
        <templateId root="2.16.840.1.113883.10.20.22.1.8" extension="2015-08- 01" >
            <id root="2.16.840.1.113883.19.5.99999.1" extension="20160414145050">
                <code codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC" code="18842-5"
                    displayName="Discharge Summary" />
                <title>Health Summary</title>
                <effectiveTime value="20160414145050-0500">
                    <confidentialityCode codeSystem="2.16.840.1.113883.5.25" code="N">
                        <languageCode code="en-US">
                            <setId extension="20160414014447" root="2.16.840.1.113883.19.5.99999.19" I>
<versionNumber value="2">
    <relatedDocument typeCode="RPLC"›
        <parentDocument> <id root="2.16.840.1.113883.19.5.99999.1" extension="20160414014447">
            <code codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC" code="18842-5"
                displayName="Discharge Summary" I>
                <setId extension="20160414014447" root="2.16.840.1.113883.19.5.99999.19">
                    <versionNumber value="1"> </parentDocument>
    </relatedDocument>
    <section>
        <templateId root="1.3.6.1.4.1.19376.1.5.3.1.3.5"/>
        <code code="8648-8" displayName="HOSPITAL COURSE" codeSystem="2.16.840.1.113883.6.1"
            codeSystemName="LOINC"/>
        <title>Hospital Course</title>
        <text>The patient was admitted
        </text>
```


#### C-CDA Document Templates

While all C-CDA documents share a common US Realm Header template, the C-CDA implementation guide
defines distinct types of document templates for exchanging different types of clinical notes.

Document-level templates describe the purpose and rules for constructing a conforming CDA document.
Document templates include constraints on the CDA header and indicate contained section-level templates.

Each document-level template contains the following information:

- Scope and intended use of the document type.
- Description and explanatory narrative.
- Template metadata ( _e.g.,_ templateId).
- Header constraints ( _e.g._ , document type, template id, participants)
- Required and optional section-level templates.

Templates for structured documents (those that include a structuredBody) also define required and optional
section-level templates.

All section-level templates include human readable narrative that conveys the information in that section. CDA
calls this the Narrative Block. Each section-level template also includes:

- Scope and intended use within a document.
- Description and explanatory narrative.
- Template metadata ( _e.g.,_ templateId).

The section may also define required and optional entry-level templates. Entry-level templates are structures for
representing the information in the Narrative Block using machine representations that facilitates computerized
information processing.

The table below describes the various document types defined by C-CDA for use in representing clinical notes
as structured documents that facilitate digital information exchange.


| **Document-Level Templates for Representing Clinical Notes as Structured Documents**   | **Description**    |
| ---- | ------ |
| **Care Plan**   | A Care Plan (including Home Health Plan of Care [HHPoC]) is a consensus-driven dynamic plan that represents a patient’s and Care Team Members’ prioritized concerns, goals, and planned interventions.<br />The CDA Care Plan represents an instance of this dynamic Care Plan at a point in time. The CDA document itself is NOT dynamic.  |
| **Consultation Note**   | The Consultation Note is generated by a request from a clinician for an opinion or advice from another clinician.  |
| **Continuity of Care Document (CCD)**   | The Continuity of Care Document (CCD) represents a core data set of the most relevant administrative, demographic, and clinical information facts about a patient's healthcare, covering one or more healthcare encounters. It provides a means for one healthcare practitioner, system, or setting to aggregate all of the pertinent data about a patient and forward it to another to support the continuity of care.  |
| **Discharge Summary**   | The Discharge Summary is a document which synopsizes a patient's admission to a hospital, LTPAC provider, or other setting. It provides information for the continuation of care following discharge.  |
| **History and Physical**   | A History and Physical (H&P) Note is a medical report that documents the current and past conditions of the patient. It contains essential information that helps determine an individual's health status.  |
| **Operative Note**   | The Operative Note is a frequently used type of procedure note with specific requirements set forth by regulatory agencies. The Operative Note is created immediately following a surgical or other high-risk procedure. It records the pre- and post-surgical diagnosis, pertinent events of the procedure, as well as the condition of the patient following the procedure.  |
| **Progress Note**   | This template represents a patient’s clinical status during a hospitalization, outpatient visit, treatment with a LTPAC provider, or other healthcare encounter.  |
| **Procedure Note**   | This template encompasses many types of non-operative procedures including interventional cardiology, gastrointestinal endoscopy, osteopathic manipulation, and many other specialty fields. Procedure Notes are differentiated from Operative Notes because they do not involve incision or excision as the primary act.  |
| **Referral Note**   | A Referral Note communicates pertinent information from a provider who is requesting services of another provider of clinical or non-clinical services.  |
| **Transfer Summary**   | The Transfer Summary standardizes critical information for exchange of information between providers of care when a patient moves between health care settings.  |
{:.grid}
**Table 13: C-CDA Document-Level Templates for Representing Clinical Notes as Structured Documents**

The table below describes the document template defined by C-CDA for use in representing clinical notes as
an unstructured document that facilitates digital information exchange.

| **Document Templates for Unstructured Clinical Notes**   | **Description**    |
| ---- | ------ |
| **Unstructured Document**   | An Unstructured Document (UD) document type can<br />(1) include unstructured content, such as a graphic, directly in a text element with a mediaType attribute, or<br />(2) reference a single document file, such as a word-processing document using a text/reference element.  |
{:.grid}
**Table 14: Document Templates of Unstructured Clinical Notes**

The C-CDA Unstructured Document template defines a C-CDA document with a structured header and a non-
XML body. This template is used to convey information as an embedded object or referenced file. It may be
appropriate for use cases where the exchange of clinical information does not require structured representation of
the content. Simply having the structured header information may be beneficial for information exchange.

When the content to be exchanged does not have structured document templates defined in C-CDA, such as for
Laboratory Report Narrative or Pathology Report Narrative, the Unstructured Document template can be used to
represent the clinical note information.

<table
    style="border-collapse:collapse;margin-left:24.01pt"
    cellspacing="0">
    <tr style="height:49pt">
        <td
            style="width:468pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"
                bgcolor="#C5D9F0"><p class="s19"
                style="padding-left: 41pt;padding-right: 8pt;text-indent: 0pt;text-align: left;"
                >C-CDA Content Creators MAY support the Unstructured
                Document template for representing clinical note
                types when the type of clinical note to be exchanged
                does not have an appropriate structured document
                template or when it is not possible for the C-CDA
                Content Creator to represent the clinical</p><p
                class="s19"
                style="padding-left: 41pt;text-indent: 0pt;line-height: 11pt;text-align: left;"
                >note information using a structured document
                template. <b>[BP-050]</b></p></td>
    </tr>
</table>

#### Section Structure by Document Type

The following tables describe the required and optional section templates for each document type defined in C-CDA. They include sections that support best practices for representing data for exchange such as Patient Goals and Health Concerns.

<table
    style="border-collapse:collapse;margin-left:24.01pt" cellspacing="0">
    <tr style="height:32pt">
        <td
            style="width:468pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"
                bgcolor="#C5D9F0"><p class="s19"
                style="padding-left: 45pt;text-indent: 0pt;line-height: 12pt;text-align: left;"
                >Transition of Care C-CDA Documents SHALL include a Health
                Concerns section and a Goals Section.</p><p class="s31"
                style="padding-left: 45pt;text-indent: 0pt;text-align: left;"
                ><b>[CONF-051]</b></p></td>
    </tr>
</table>

#### Care Plan: Document Template

A Care Plan is a consensus-driven dynamic plan that represents a
patient’s and Care Team Members’ prioritized concerns, goals, and planned interventions. It serves as a blueprint
shared by all Care Team Members (including the patient, their caregivers and providers), to guide the patient’s
care. A Care Plan integrates multiple interventions proposed by multiple providers and disciplines for multiple
conditions.

A Care Plan represents one or more Care Plans and serves to reconcile and resolve conflicts between the
various Care Plans developed for a specific patient by different providers. Care Plans include the patient’s life goals and require Care Team Members (including patients) to prioritize goals and
interventions, the reconciliation process becomes more complex as the number of merged Care Plans increase. The
Care Plan also serves to enable longitudinal coordination of care.

The C-CDA Care Plan represents an instance of a dynamic Care Plan at a point in time. The CDA document itself is NOT dynamic.

This document template enables Care Plan information to be shared in a way that includes:

- The ability to identify patient and provider priorities with each act.
- A header participant to indicate occurrences of Care Plan review.


A Care Plan document can include entry references from the information in these sections to the information (entries) in other sections. 

##### Structured Sections

The table below describes the required and optional sections in a Care Plan document template: Care Plan [Care Plan](StructureDefinition-CarePlan.html)

| **Document Type**   | **Required Sections**    | **Optional Sections** |
| -- | -------- | ------ |
| **Care Plan**   | Health Concerns Section<br />Goals Section  | Activities Section<br />Health Status Evaluations and Outcomes Section  |
| **Sample**   | CarePlan.xml Sample  | Included with this Companion Guide  |
{:.grid}
**Table 16: Care Plan: Document Template.**

#### Consultation Note: Document Template

The Consultation Note is generated by a request from a clinician for an opinion or advice from another clinician.
Consultations may involve face-to-face time with the patient or may fall under the auspices of telemedicine visits.
Consultations may occur while the patient is inpatient or ambulatory. The Consultation Note should also be used
to summarize an Emergency Room or Urgent Care encounter. A Consultation Note includes the reason for the
referral, history of present illness, physical examination, and decision-making components (Assessment and Plan).

##### Structured Sections

The table below describes the required and optional sections in a Consultation Note document template:[Consultation Note](StructureDefinition-ConsultationNote.html)

| **Document Type**   | **Required Sections**    | **Optional Sections** |
| -- | -------- | ------ |
| **Consultation Note**   | History of Present Illness Section<br />Allergies and Intolerances Section<br />Problem Section  | Assessment Section<br />Assessment and Plan Section<br />Plan of Treatment Section<br />Reason for Visit Section<br />Physical Exam Section<br />Chief Complaint Section<br />Chief Complaint and Reason for Visit Section<br />Family History Section<br />General Status Section<br />Past Medical History<br />Immunizations Section<br /> Medications Section <br /> Procedures Section<br />Results Section<br />Social History Section<br />Vital Signs Section<br />Functional Status Section<br />Review of Systems Section<br />Medical Equipment Section  |
{:.grid}
**Table 17: Consultation Note: Document Template.**

#### Continuity of Care Document (CCD): Document Template

The Continuity of Care Document (CCD) represents a
core data set of the most relevant administrative, demographic, and clinical information facts about a patient's
healthcare, covering one or more healthcare encounters. It provides a means for one healthcare practitioner,
system, or setting to aggregate all of the pertinent data about a patient and forward it to another to support the
continuity of care. The primary use case for the CCD is to provide a snapshot in time containing the germane
clinical, demographic, and administrative data for a specific patient. The key characteristic of a CCD is that the
ServiceEvent is constrained to "PCPR" “care provision.” This means that the contents of the document reflect the
care that was actually provided within the time range indicated in serviceEvent.effectiveTime range. It reports on
care that has already been provided. The CCD provides a historical tally of the care over a range of time and is not
a record of new services delivered. More specific use cases, such as a Discharge Summary, Transfer Summary,
Referral Note, Consultation Note, or Progress Note, are available as alternative documents in this guide.

##### Structured Sections

The table below describes the required and optional sections in a Continuity of Care Document (CCD) document
template: [Continuity of Care Document (CCD)](StructureDefinition-ContinuityofCareDocumentCCD.html)

| **Document Type**   | **Required Sections**    | **Optional Sections** |
| -- | -------- | ------ |
| **Continuity of Care Document (CCD)**   | Allergies and Intolerances Section<br />Medications Section<br />Problem Section<br />Results Section<br />Social History Section<br />Vital Signs Section  | Procedures Section<br />Encounters Section<br />Family History Section<br />Functional Status Section<br />Immunizations Section<br />Medical Equipment Section<br />Payers Section<br />Plan of Treatment Section<br />Mental Status Section<br />Nutrition Section<br />Advance Directives Section<br />Goals Section<br />Health Concerns Section  |
{:.grid}
**Table 18: Continuity of Care Document: Document Template.**

#### Discharge Summary: Document Template

The Discharge Summary is a document which summarizes a patient's admission to a hospital, LTPAC provider, or
other setting. It provides information for the continuation of care following discharge. [The Joint Commission](http://www.jointcommission.org/)
requires the following information to be included in the Discharge Summary:

- Reason for hospitalization (the admission)
- Procedures performed, as applicable
- Care, treatment, and services provided
- Patient’s condition and disposition at discharge
- Information provided to the patient and family
- Provisions for follow-up care

The best practice for a Discharge Summary is to include the discharge disposition in the display of the header.

##### Structured Sections

The table below describes the required and optional sections in a Discharge Summary document template: [Discharge Summary](StructureDefinition-DischargeSummary.html)

| **Document Type**   | **Required Sections**    | **Optional Sections** |
| -- | -------- | ------ |
| **Discharge Summary**   | Allergies and Intolerances SectionHospital Course Section<br />Discharge Diagnosis Section<br />Plan of Treatment Section (DIR)  | Discharge Medications Section<br />Chief Complaint Section<br />Chief Complaint and Reason for Visit Section<br />Nutrition Section<br />Family History Section<br />Functional Status Section<br />Past Medical History<br />History of Present Illness Section<br />Admission Diagnosis Section<br />Admission Medications Section<br />Hospital Consultations Section<br />Hospital Discharge Instructions Section<br />Hospital Discharge Studies Summary Section<br />Immunizations Section<br />Procedures Section<br />Reason for Visit Section<br />Review of Systems Section<br />Social History Section<br />Vital Signs Section<br />Discharge Medications Section<br />Goals Section<br />Health Concerns Section  |
| **Example**   | DischargeSummary.xml Sample  | Included with this Companion Guide  |
{:.grid}
**Table 20: Discharge Summary: Document Template.**


#### History and Physical: Document Template

A History and Physical (H&P) Note is a medical report that documents the current and past conditions of the
patient. It contains essential information that helps determine an individual's health status. The first portion of the
report is a current collection of organized information unique to an individual. This is typically supplied by the
patient or the caregiver, concerning the current medical problem or the reason for the patient encounter. This
information is followed by a description of any past or ongoing medical issues, including current medications and
allergies. Information is also obtained about the patient's lifestyle, habits, and diseases among family members.
The next portion of the report contains information obtained by physically examining the patient and gathering
diagnostic information in the form of laboratory tests, imaging, or other diagnostic procedures. The report ends
with the clinician's assessment of the patient's situation and the intended plan to address those issues. A History
and Physical Examination is required upon hospital admission as well as before operative procedures. An initial
evaluation in an ambulatory setting is often documented in the form of an H&P Note.

##### Structured Sections

The table below describes the required and optional sections in a History and Physical document template: [History and Physical](StructureDefinition-HistoryandPhysical.html)

| **Document Type**   | **Required Sections**    | **Optional Sections** |
| -- | -------- | ------ |
| **History and Physical**   | Allergies and Intolerances SectionFamily History Section<br />General Status Section<br />Past Medical History<br />Medications Section<br />Physical Exam Section<br />Results Section Review of Systems Section<br />Social History Section<br />Vital Signs Section  | Assessment Section<br />Plan of Treatment Section<br />Assessment and Plan Section<br />Chief Complaint Section<br />Chief Complaint and Reason for Visit Section<br />History of Present Illness Section<br />Immunizations Section<br />Instructions Section<br />Problem Section<br />Procedures Section<br />Reason for Visit Section  |
{:.grid}
**Table 21: History and Physical: Document Template.**

#### Operative Note: Document Template

The Operative Note is a frequently used type of procedure note with specific requirements set forth by regulatory
agencies. The Operative Note is created immediately following a surgical or other high-risk procedure. It records
the pre- and post-surgical diagnosis, pertinent events of the procedure, as well as the condition of the patient
following the procedure. The report should be sufficiently detailed to support the diagnoses, justify the treatment,
document the course of the procedure, and provide continuity of care.

##### Structured Sections

The table below describes the required and optional sections in an Operative Note document template: [Operative Note](StructureDefinition-OperativeNote.html)

| **Document Type**   | **Required Sections**    | **Optional Sections** |
| -- | -------- | ------ |
| **Operative Note**   | Anesthesia SectionComplications Section<br />Preoperative Diagnosis Section<br />Procedure Estimated Blood Loss Section Procedure Findings Section<br />Procedure Specimens Taken Section<br />Procedure Description Section<br />Postoperative Diagnosis Section  | Procedure Implants Section<br />Operative Note Fluids Section<br />Operative Note<br />Surgical Procedure Section<br />Plan of Treatment Section<br />Planned Procedure Section<br />Procedure Disposition Section<br />Procedure Indications Section<br />Surgical Drains Section  |
{:.grid}
**Table 22 Operative Note: Document Template.**

#### Procedure Note: Document Template

A Procedure Note encompasses many types of non-operative procedures including interventional cardiology,
gastrointestinal endoscopy, osteopathic manipulation, and many other specialty fields. Procedure Notes are
differentiated from Operative Notes because they do not involve incision or excision as the primary act. The
Procedure Note is created immediately following a non-operative procedure. It records the indications for the
procedure and, when applicable, post-procedure diagnosis, pertinent events of the procedure, and the patient’s
tolerance for the procedure. It should be detailed enough to justify the procedure, describe the course of the
procedure, and provide continuity of care.

##### Structured Sections

The table below describes the required and optional sections in [Procedure Note](StructureDefinition-ProcedureNote.html)

| **Document Type**   | **Required Sections**    | **Optional Sections** |
| -- | -------- | ------ |
| **Procedure Note**   | Complications Section<br />Procedure Description Section<br />Procedure Indications Section<br />Postprocedure Diagnosis Section  | Assessment Section<br />Assessment and Plan Section<br />Plan of Treatment Section<br />Allergies and Intolerances Section<br />Anesthesia Section<br />Chief Complaint Section<br />Chief Complaint and Reason for Visit Section<br />Family History Section<br />Past Medical History<br />History of Present Illness Section<br />Medical (General) History Section<br />Medications Section<br />Medications Administered Section<br />Physical Exam Section<br />Planned Procedure Section<br />Procedure Disposition Section<br />Procedure Estimated Blood Loss Section<br />Procedure Findings Section<br />Procedure Implants Section<br />Procedure Specimens Taken Section<br />Procedures Section<br />Reason for Visit Section<br />Review of Systems Section<br />Social History Section  |
{:.grid}
**Table 23: Procedure Note: Document Template.**

#### Progress Note: Document Template

The Progress Note represents a patient’s clinical status during a hospitalization, outpatient visit, treatment with a
LTPAC provider, or other healthcare encounter. [Taber’s medical dictionary](https://www.tabers.com/tabersonline/) defines a Progress Note as “An ongoing
record of a patient's illness and treatment. Physicians, nurses, consultants, and therapists record their notes
concerning the progress or lack of progress made by the patient between the time of the previous note and the
most recent note. A Progress Note is not a re-evaluation note. A Progress Note is not intended to be a
Progress Report for Medicare. Medicare B Section 1833(e) defines the requirements of a Medicare Progress
Report. The [Joint Document Content Work Group](www.commonwellalliance.org/wp-content/uploads/2019/01/Improve-Joint-Document-Content-Whitepaper.pdf)recommends use of the Progress Note document template to
represent an encounter summary for a non-inpatient setting in Chapter 2.2 Outpatient/Ambulatory Summary (Progress Note Document). The Progress Note document template does not
include any required sections and the open nature of the template enables Content Creators to include the right
sections to express the source data or the needed sections to satisfy the requirements of Content Consumers.

##### Structured Sections

The table below describes the required and optional sections in a Progress Note document template: [Progress Note](StructureDefinition-ProgressNote.html)

| **Document Type**   | **Required Sections**    | **Optional Sections** |
| -- | -------- | ------ |
| **Progress Note**   |   | Assessment Section<br />Plan of Treatment Section<br />Assessment and Plan Section<br />Allergies and Intolerances Section<br />Chief Complaint Section<br />Activities Section<br />Instructions Section<br /><br />Medications Section<br />Objective Section<br />Physical Exam Section<br />Problem Section<br />Results Section<br />Review of Systems Section<br />Subjective Section<br />Vital Signs Section<br />Nutrition Section  |
| **Example**   | ProgressNote.xml Sample  | Included with this Companion Guide  |
{:.grid}
**Table 24 Progress Note: Document Template.**

#### Referral Note: Document Template

A Referral Note communicates pertinent information from a provider who is requesting services of another
provider of clinical or non-clinical services which includes the reason for the referral and additional information
that would augment decision making and care delivery. Examples of referral situations include when a patient is:

- Referred from a family physician to a cardiologist for cardiac evaluation.
- Sent by a cardiologist to an emergency department for angina.
- Referred by a nurse practitioner to an audiologist for hearing screening.
- Referred by a hospitalist to social services.

##### Structured Sections

The table below describes the required and optional sections in a Referral Note document template: [Referral Note](StructureDefinition-ReferralNote.html) 

| **Document Type**   | **Required Sections**    | **Optional Sections** |
| -- | -------- | ------ |
| **Referral Note**   | Problem Section<br />Allergies and Intolerances Section<br />Medications Section<br />Reason for Referral Section  | Plan of Treatment Section<br />History of Present Illness Section<br />Family History Section<br />Immunizations Section<br />Procedures Section<br />Results Section<br />Review of Systems Section<br />Social History Section<br />Vital Signs SectionFunctional Status Section<br />Physical Exam Section<br />Nutrition Section<br />Mental Status Section<br />Medical Equipment Section<br />Assessment Section<br />Assessment and Plan Section<br />Past Medical History<br />General Status Section<br />Advance Directives Section<br />Health Concerns Section<br />Goals Section  |
| **Example**   | ReferralNote.xml Sample  | Included with this Companion Guide  |
{:.grid}
**Table 25: Referral Note: Document Template.**

#### Transfer Summary: Document Template

The Transfer Summary template describes constraints on the Clinical Document Architecture (CDA) header and
body elements for a Transfer Summary. The Transfer Summary standardizes critical information for exchange of
information between providers of care when a patient moves between health care settings. Standardization of
information used in this form will promote interoperability; create information suitable for reuse in quality
measurement, public health, research, and for reimbursement.

##### Structured Sections

The table below describes the required and optional sections in a Transfer Summary document template: [Transfer Summary](StructureDefinition-TransferSummary.html) 

| **Document Type**   | **Required Sections**    | **Optional Sections** |
| -- | -------- | ------ |
| **Transfer Summary**   | Allergies and Intolerances Section<br />Medications Section<br />Problem Section<br />Results Section<br />Vital Signs Section<br />Reason for Referral Section  | Physical Exam Section<br />Encounters Section<br />Family History Section<br />Functional Status Section<br />Discharge Diagnosis Section<br />Immunizations Section<br />Medical Equipment Section<br />Payers Section<br />Plan of Treatment Section<br />Procedures Section<br />Social History Section<br />Mental Status Section<br />General Status Section<br />Review of Systems Section<br />Nutrition Section<br />Past Medical History<br />History of Present Illness Section<br />Assessment and Plan Section<br />Assessment Section<br />Admission Medications Section<br />Admission Diagnosis Section<br />Course of Care Section
{:.grid}
**Table 26: Transfer Summary: Document Template.**

#### Other Section-Level Templates Available for Use in C-CDA Documents

Implementers may use templates developed in other CDA implementation guides which are compatible with C-
CDA. Employing additional C-CDA compatible templates within existing document types will expand the range of
interoperable information available for exchange and help address emerging use cases for data exchange.

<table
    style="border-collapse:collapse;margin-left:24.01pt"
    cellspacing="0">
    <tr style="height:32pt">
        <td
            style="width:462pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"
                bgcolor="#C5D9F0"><p class="s19"
                style="padding-left: 45pt;text-indent: 0pt;text-align: left;"
                >C-CDA Content Creators MAY include in existing
                C-CDA documents, other C-CDA compatible section-
                level templates defined in other implementation
                guides. <b>[BP-052]</b></p></td>
    </tr>
</table>

A C-CDA compatible template is a template that further constrains a template defined in C- CDA or a template
that does not conflict with templates defined in C-CDA. Determining if a template is C-CDA compliant may require
human discernment and consensus building within the C-CDA implementer community. A particularly important
collection of C-CDA compatible templates are the Supplemental Implementation Guides, which define new
template versions and templates for additional use cases. These Supplemental Implementation Guides are
published within the main [C-CDA specification Product Brief page](https://www.hl7.org/implement/standards/product_brief.cfm?product_id=492)

<table
    style="border-collapse:collapse;margin-left:24.01pt"
    cellspacing="0">
    <tr style="height:26pt">
        <td
            style="width:468pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"
                bgcolor="#C5D9F0"><p class="s19"
                style="padding-left: 41pt;padding-right: 8pt;text-indent: 0pt;text-align: left;"
                >C-CDA Content Creators MAY support further
                constraints on the document templates defined in
                C-CDA <b>[BP-053]</b></p></td>
    </tr>
</table>

### Section Level Guidance

The idea of improving the communication of information contained in clinical notes has been around for decades.
Long before C-CDA, a documentation methodology called “SOAP (Subjective, Objective, Assessment, and Plan)
notes” was invented. The birth of the problem-oriented medical record (POMR) and SOAP note marked an epoch
in the history of health care. [Dr. Lawrence Weed, developer of the SOAP note and professor of medicine and
pharmacology at Yale University](https://journals.lww.com/academicmedicine/fulltext/2019/01000/remembering_lawrence_weed__a_pioneer_of_the_soap.9.aspx), challenged conventional medical documentation and advocated for a scientific
structure to frame clinical reasoning in the 1950s. xxxx Today, the SOAP note is the most common method of
documentation used by providers to input notes into patients’ medical records. They allow providers to record and
share information in a universal, systematic and easy to read format. Ineffective communication contributes to
the top causes of sentinel events and continues to be an unremitting area for refinement.

After the development of the HL7 Clinical Document Architecture R2 standard in 2005, an alliance of healthcare
vendors, providers and associations pooled resources in a rapid-development initiative. In a span of three years,
the Health Story Project produced eight Health Level Seven (HL7) data standards for the flow of information using
common types of healthcare documents. The alliance examined thousands of common clinical notes generated by
a variety of medical transcription solutions and identified what structured sections were needed to represent the
SOAP notes commonly generated by current-day clinicians. The “Health Story Guides,” as they were originally
named, defined the initial set of section templates based on this analysis. Every section template includes a
section.text element designed to hold the human readable narrative of that section of the structured document.

While no longer active today, the [HIMSS Health Story Project](https://www.hcinnovationgroup.com/clinical-it/clinical-documentation/news/13022021/himss-introduces-health-story-project) provided education to the health IT community on
tools and resources to aid in the creation of comprehensive electronic records that tell a patient's _complete health
story._ Some especially educational concepts from this initiative are summarized in the following chapters.

#### The Storytelling Power of C-CDA

This roundtable presentation explained the twelve common clinical document types that are defined in
Consolidated CDA (C-CDA) and described how each can be leveraged for information exchange in different care
settings and for different encounter types. When should each C-CDA clinical document type be leveraged? What
sections are used in C-CDA clinical documents and how do they differ from a Continuity of Care Document (CCD)?
The Roundtable showed how to apply the SOAP framework to reveal the storytelling power of C-CDA by thinking of
the section templates in terms of the subjective, objective, assessment, and plan information each contains. In
some cases, the information in one section may be classified in multiple SOAP categories. The categorization is an
approximation designed to improve understanding of the full collection of C-CDA section templates.

<table><tr><td><img src="Figure 5 Visualizing C-CDA section templates by applying the SOAP framework.png" /></td></tr></table>
**Figure 5: Visualizing C-CDA section templates by applying the SOAP framework**

##### A More Meaningful Patient Story Using C-CDA: Tell it. Use it. Share it.

This presentation explained how documentation-based exchange via Consolidated Clinical Document Architecture
(C-CDA), when implemented correctly, has the power to capture and share a more comprehensive electronic
record that can be used to improve care.

By 2011, when C-CDA R1.0 was first published, a larger industry effort brought together CDA templates for clinical
SOAP notes that had been defined by several organizations including Integrating the Healthcare Enterprise (IHE),
HITSP, and HL7. The harmonized work included not only definitions for section templates needed to structure
common clinical note types, but also included entry templates that defined how to represent the human readable
section information using machine processable “clinical statements”. Clinical statements were templated using the
syntax and data structures supported by the HL7 CDA R2 standard which derived its data types and modeling from
an Version 2.0.7 of the V3 RIM found here [HL7 V3 Reference Information Model (RIM](https://www.hl7.org/implement/standards/rim.cfm). The HL7 V3 RIM is the cornerstone of all HL7 Version
3 standards. It is a shared model between all domains and, as such, forms a common basis from which all domains
can create information exchange artifacts and messages.

Today in C-CDA and in the C-CDA Supplemental Implementation Guides, the C-CDA standards development
community has defined and published a wide array of section templates to represent clinical information in the
context of structured documents. It is important to note that the purpose of each section template is dependent
on the context of its intended use within a larger document structure. While some templates have been defined
generically and are suitable for reuse in multiple structured documents, others due to the nature of their
definitions may not be appropriate for re-use across other documents. For this reason, is it important for the
context of the overarching document to be considered when determining if it is appropriate to include a particular
type of section template in a particular type of document template.

<table
    style="border-collapse:collapse;margin-left:24.01pt"
    cellspacing="0">
    <tr style="height:26pt">
        <td
            style="width:468pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"
                bgcolor="#C5D9F0"><p class="s19"
                style="padding-left: 41pt;padding-right: 8pt;text-indent: 0pt;text-align: left;"
                >C-CDA Content Creators SHOULD use section templates
                that are appropriate within the context of a
                document based on the defined purpose of the section
                template. <b>[BP-054]</b></p></td>
    </tr>
</table>

#### General Section-Level Guidance

The following guidance elements are not specific to any one C-CDA template but rather are overarching guidance
elements that apply to an entire C-CDA document.

##### Data Provenance for a Section

The author role is key to understanding the provenance of the information.

The roles populated in the header of the document apply to each section of content as well, unless explicitly
indicated otherwise. If the author information for a section is not explicitly declared, then the author of the
information in that section can be assumed to be the author contained in the document header. This is behavior
within a CDA document is called context conduction.

This assumption extends to entries contained in the section as well. If the author information for an entry is not
explicitly declared, then the author of the information in that entry can be assumed to be the author contained in
the encompassing section.

While it is generally preferred that provenance be conveyed either at the document level, or at the entry level, it is
possible for provenance to be conveyed at the section level when the default context conduction does not apply.

When representing a clinical note using structured sections, each section of information receives its context from
the document’s header. If author information for a section is not explicitly declared, then the author of that
section of information can be assumed to be the same as the author information contained in the document
header.

The recordTarget, author, and informant roles populated in the header of the document apply to each section of
content as well, unless explicitly indicated otherwise. The author role is key to understanding the provenance of
the information in the document. If the author information for a section is not explicitly declared, then the author
of that section of information can be assumed to be the same as the author information contained in the header.

This assumption extends to entries contained in the section as well, unless the author information is explicitly
declared at the entry level. While it is generally preferred that provenance be conveyed at the entry level,
provenance information included at the document or section level conducts to the entry when provenance at the
entry level is not stated explicitly.

##### Declaring Section Template Conformance

Template conformance may be declared at any
level of a C-CDA document—header, section, entry, or within an entry at a sub-structural level.

A template declaration in a C-CDA section asserts the constraints applicable for that section of XML. The template
declaration tells validators and Content Consumers what to expect in terms of the information that, may, should,
or shall be populated within this section of the document.

C- CDA templates are identified with a templateId. The templateId is a two-part identifier that consists of a root
and an extension. The root identifies the named template and the extension identifies the version of that
template. Initially C-CDA templates did not include versions. The templateId/@extension attribute was not used.
Many of those original template versions are still used in C-CDA today.
A duplicate templateId declaration is a template declaration for the same structural part of a C-CDA document (i.e.,
document, section, entry, entry-part) with identical @root and @extension information. The order of the @root
and @extension attributes does not matter when determining duplication.

To avoid confusion and minimize inclusion of unnecessary information in C-CDA documents, implementers should avoid including duplicate or irrelevant templateId declarations.

<table
    style="border-collapse:collapse;margin-left:24.01pt"
    cellspacing="0">
    <tr style="height:26pt">
        <td
            style="width:468pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"
            bgcolor="#C5D9F0"><p class="s19"
                style="padding-left: 41pt;text-indent: 0pt;text-align: left;"
                >C-CDA Content Creators SHOULD NOT declare
                conformance to irrelevant templates.
                <b>[BP-066]</b></p></td>
    </tr>
    <tr style="height:26pt">
        <td
            style="width:468pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"
            bgcolor="#C5D9F0"><p class="s19"
                style="padding-left: 41pt;text-indent: 0pt;line-height: 12pt;text-align: left;"
                >C-CDA Content Creators SHALL NOT include
                duplicate templateId declarations.
                <b>[CONF-067]</b></p></td>
    </tr>
</table>

As standards evolve an implementer community may decide to deprecate a version of a template or a collection of
templates published in a version of an implementation guide. It should be anticipated that implementer
communities may determine that a certain version of a template should not be used going forward.

<table
    style="border-collapse:collapse;margin-left:24.01pt"
    cellspacing="0">
    <tr style="height:26pt">
        <td
            style="width:468pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"
            bgcolor="#C5D9F0"><p class="s19"
                style="padding-left: 41pt;padding-right: 8pt;text-indent: 0pt;text-align: left;"
                >C-CDA Content Creators and C-CDA Content Consumers
                SHOULD NOT attribute semantic meaning to templateId
                declarations in C-CDA documents.
            <b>[BP-057]</b></p></td>
    </tr>
    <tr style="height:26pt">
        <td
            style="width:468pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"
            bgcolor="#C5D9F0"><p class="s19"
                style="padding-left: 41pt;padding-right: 8pt;text-indent: 0pt;text-align: left;"
                >C-CDA Content Creators SHOULD support template
                deprecation requiring discontinued use of all
                versions of a templateId or a specific version of a
                templateId. <b>[BP-058]</b></p></td>
    </tr>
</table>

**Example 16: Declaring template conformance at the section level.**
```
<!-- Allergies and Intolerances Section-->
<component>
    <section>
        <!-- Conformant to C-CDA Allergies and Intolerances Section-->
        <templateId root="2.16.840.1.113883.10.20.22.2.6.1" extension="2015-08- 01"/>
        <!-- Conformant to C-CDA R1.1 Allergies and Intolerances Section -->
        <templateId root="2.16.840.1.113883.10.20.22.2.6.1"/>
        <id root="0937FF9A-00CE-11E6-B4C5-0050568B000B"/>
        <code code="48765-2" displayName="Allergies &amp;or adverse reactions Doc"
            codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
        <title>Allergies</title>
        <text>
        </text>
    </section>
</component>
```

**Example 17: Declaring conformance to multiple templates.**
```
<!—Substance or Device Allergy -->
<templateId root="2.16.840.1.113883.10.20.24.3.90" extension="2014-06- 09" />
<templateId root="2.16.840.1.113883.10.20.24.3.90"/>
<!— Allergy – Intolerance Observation -->
<templateId root="2.16.840.1.113883.10.20.22.4.7" extension="2014-06- 09" />
<templateId root="2.16.840.1.113883.10.20.22.4.7"/>
```

**Example 18: (Wrong) Duplicate template declarations at the section level.**
```
<!-- Allergies and Intolerances Section-->
<component>
    <section>
        <templateId root="2.16.840.1.113883.10.20.22.2.6.1"/>
        <templateId extension="2015-08- 01" root="2.16.840.1.113883.10.20.22.2.6.1" />
        <id root="0937FF9A-00CE-11E6-B4C5-0050568B000B"/>
        <code code="48765-2" displayName="Allergies &amp;or adverse reactions Doc"
            codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
        <title>Allergies</title>
        <text>
        </text>
    </section>
</component>
```


**Figure 6: Example of how to include templateIds for Companion Guide templates**
```
<observation classCode="OBS" moodCode="EVN">
    <!-- ** Problem Observation ** -->
    <!-- Problem Observation (C-CDA 1.1) -->
    <templateId root="2.16.840.1.113883.10.20.22.4.4" />
    <!-- Problem Observation (C-CDA 2.1) -->
    <templateId root="2.16.840.1.113883.10.20.22.4.4" extension="2015-08- 01" />
    <!-- Problem Observation (C-CDA Companion Guide R3) -->
    <templateId root="2.16.840.1.113883.10.20.22.4.4" extension="2022- 06 - 01" />
    <id root="ab1791b0-5c71-11db-b0de-0800200c9a66" />
    ...
</observation>
```

#### Narrative Block Formatting

The CDA requirement for human readability guarantees that a receiver of a CDA document can algorithmically
display the clinical content of the note on a standard Web browser. This requirement impacts C-CDA in the
following ways:

- There must be a deterministic way for a recipient of an arbitrary CDA document to render the
    attested content.
- Human readability shall not require a sender to transmit a special style sheet along with a CDA
    document. It must be possible to render all CDA documents with a single style sheet and general-
    market display tools.
- Human readability applies to the authenticated content.
- When structured content is derived from narrative, there must be a mechanism to describe the
    process (e.g. by author, by human coder, by natural language processing algorithm, by specific
    software) by which machine-processable portions were derived from a block of narrative.
- When narrative is derived from structured content, there must be a mechanism to identify the
    process by which narrative was generated from structured data.

These principles and requirements have led to the current approach, where the material to be rendered is placed
into the section.text field. In some cases, the data design of the entry templates required in the section heavily
influence what clinical information can be expected to be present in the Narrative Block. In other cases, where
entry templates are optional or not defined at all, the content in the Narrative Block may reflect information
gathered in source systems as text and human crafted notes.

If the CDA Body is structured, the Content Creator includes the attested narrative content in the appropriate
section.text field, regardless of whether information is also conveyed in CDA entries. An originator of a CDA
document is not required to fully encode all narrative into CDA entries within the CDA body. Within specific
implementations, trading partners may ascribe additional originator responsibilities to create various entries that
meet certain conformance requirements or meet the conformance requirements described by defined templates.



**Example 19: Sample Narrative Block in a Section**
```
<section>
    ...
    <text>
        <table>
            <colgroup>
                <col width="25%"/>
                <col width="25%"/>
                <col width="25%"/>
                <col width="25%"/>
            </colgroup>
            <thead>
                <tr>
                    <th>Information Type</th>
                    <th>Date</th>
                    <th>Relevant Information</th>
                    <th>Documented By</th>
                </tr>
            </thead>
            <tbody>
                <tr ID="SocialHistory_1">
                    <td>Tobacco smoking status:</td>
                    <td><content>(04/12/2016)</content></td>
                    <td><content>Never smoked</content></td>
                    <td><content>M.Smith</content> <content>(04/12/2016)</content></td>
                </tr>
            </tbody>
        </table>
    </text>
    ...
    <entry typeCode="DRIV">
        <observation classCode="OBS" moodCode="EVN">
            <templateId root="2.16.840.1.113883.10.20.22.4.78"/>
            <templateId root="2.16.840.1.113883.10.20.22.4.78"
                extension="2014-06- 09"/>
            <id extension="64020-Z9301" root="1.2.840.114350.1.13.6289.1.7.1.1040.1"/>
            <code code="72166-2" codeSystem="2.16.840.1.113883.6.1"
                codeSystemName="LOINC" displayName="Tobacco smoking status"/>
            <text><reference value="#SocialHistory_1"></reference></text>
            <statusCode code="completed"/>
            <effectiveTime value="20160412"/>
            <value xsi:type="CD" code="266919005" codeSystem="2.16.840.1.113883.6.96"
                displayName="Never smoked tobacco" />
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

CDA permits additional information conveyed in the document that is there primarily for machine processing that
is not authenticated and need not be rendered. However, the requirement that all attested content be present in
the section.text field, suggests best practice is for all clinical content to be rendered through section.text.

<table
    style="border-collapse:collapse;margin-left:24.01pt"
    cellspacing="0">
    <tr style="height:26pt">
        <td
            style="width:468pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"
                bgcolor="#C5D9F0"><p class="s19"
                style="padding-left: 41pt;padding-right: 47pt;text-indent: 0pt;text-align: left;"
                >C-CDA Content Creators SHOULD include all clinical
                content conveyed by a document in the section.text
                field. <b>[BP-059]</b></p></td>
    </tr>
</table>


##### Tags for formatting Narrative Text

The content model of the CDA Narrative Block schema is specially hand crafted to meet the requirements outlined above.
The table below provides information on some of the formatting tags commonly used to organize and render the human readable information in the Narrative Block.

| **Tag Description**   | **Description**    |
| ---- | ------ |
| **&lt;content&gt;**   | The CDA <content> element is used to wrap a string of text so that it can be explicitly referenced, or so that it can suggest rendering characteristics. The <content> element contains an optional identifier, that can serve as the target of a reference. All values of attributes of type XML ID must be unique within the document (per the [W3C XML specification](https://www.w3.org/TR/xml/). The originalText component of a RIM attribute present in any CDA entry can make explicit reference to the identifier, thereby indicating the original text associated with the attribute in the CDA entry.  |
| **&lt;br&gt;**   | The CDA <br/> element is used to indicate a hard line break. It differs from the CDA <paragraph> element in that the <br/> element has no content. Receivers are required to interpret this element when rendering so as to represent a line break.  |
| **&lt;list&gt;**   | A CDA <list> is similar to the HTML list. A CDA <list> has an optional caption and contains one or more <item> elements. A CDA <item> element contains an optional caption, which if present must come first before any other character data. The required listType attribute specifies whether the <list> is ordered or unordered (with unordered being the default). Unordered lists are typically rendered with bullets, whereas ordered lists are typically rendered with numbers, although this is not a requirement.  |
| **&lt;table&gt;**   | The CDA <table> is similar to the HTML table. The table markup is for presentation purposes only and, unlike a database table, does not possess meaningful field names.  |
| **&lt;linkHtml&gt;**   | The CDA <linkHtml> is a generic referencing mechanism, similar, but not identical, to the HTML anchor tag. It can be used to reference identifiers that are either internal or external to the document.  |
| **styleCode attribute**   | The styleCode attribute is used within the CDA Narrative Block to give the instance author the ability to suggest rendering characteristics of the nested character data (e.g. Bold, Underline, Italics). Receivers are not required to render documents using the style hints provided and can present stylized text in accordance with their local style conventions. Reference: HL7 CDA Chapter 4.3.5.11 for information on additional stylecodes.  |
{:.grid}
**Table 27: Tags for formatting Narrative Text**


#### Multiple Views and styleCodes

Sharing documents requires different views based on user needs. HL7 Relevant and Pertinent Survey highlights the need to enhance CDA document rendering. CDA uses XML stylesheets with @styleCode, as defined by IHE's MCV Profile. Refer to [IHE Multiple Content Views (MCV) Profile](https://www.ihe.net/uploadedFiles/Documents/PCC/IHE_PCC_Suppl_MCV.pdf)for details and examples.

Implementers should use MCV Profile's @styleCode values for consistency in rendering human-readable content, covering codes, dates, dateTimes, alerts, and more. These values enhance clinical content rendering features, ensuring information is not omitted or obscured unless a specific rendering view calls for it.

#### Date/Time Guidance

Temporal information is often included as relevant and pertinent information to be exchanged. However,
implementers need to be diligent when representing date/time information to make sure irrelevant or inaccurate
levels of precision are not introduced when representing this type of information.

#### Use of Open Templates

CDA features prioritize template reusability and flexibility for tailored content in sections, aligning with patient, provider, or setting needs. Most C-CDA templates are open, allowing additional relevant content.
Example: The Social History Section focuses on data influencing a patient's health (e.g., smoking, pregnancy). Information like education, housing, food security, or transportation can be added here if not covered elsewhere. Implementers can also explore external CDA templates from Supplemental Implementation Guides for expanded use cases within the C-CDA standard.[C-CDA Specification Product Brief](https://www.hl7.org/implement/standards/product_brief.cfm?product_id=492).
Caution: Implementers should be aware that recipients may not understand templates included at an unexpected location within a document.

##### Table 38: Section Time Range Observation Template

To indicate the application of business rules limiting information in a C-CDA section, Content Creators should clarify the time range in the section's human-readable text.
For example, the Vital Signs Section includes recent vital signs based on business rules, like the most recent readings within a requested time interval, documented in the section.
The [Section Time Range Observation](StructureDefinition-SectionTimeRangeObservation.html) template is helpful when responding to queries requesting extensive data. It allows specifying the business logic for data constraint within a section.
This template communicates the 'business logic' used to restrict information to a specific time range. For instance, if a CCD document request covers 5 years but the system only returns one year of past lab results, the Section Time Range template indicates this limitation. The business logic is stated in the value element using datatype IVL_TS. No effectiveTime element is included.

**Example 20: Example of Section Time Range Observation**
```
<section>
    ...
    <title>Procedures</title>
    <text>
        <content ID="Proc_STR">Procedures performed between 08/15/2012 and 08/15/2015.</content>
        ...
    </text>
    <entry>
        <observation classCode="OBS" moodCode="EVN">
            <templateId root="2.16.840.1.113883.10.20.22.4.201" extension="2016-06- 01"/>
            <code code="82607-3" codeSystem="2.16.840.1.113883.6.1"
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

#### Sections Defined in C-CDA (ordered using SOAP framework)

As explained in the [Health Story Roundtable presentation titled The Storytelling Power of C-CDA](www.himss.org/sites/hde/files/HSP%20March%202019%20Roundtable%20Q%26A.pdf), understanding
the purpose of the C-CDA section templates is not facilitated by considering them in alphabetical order. The C-
CDA Implementation Guide presents them in alphabetical order to speed access for readers. Considering the C-
CDA section templates using the SOAP framework makes it easier to see how these sections can be used in a
structured document to express the content of a clinical SOAP note.

The application of the SOAP framework does not produce a perfect classification result. Some sections don’t fit
well into the SOAP framework. They have been classified as “other types of sections”. Some sections are defined to
contain “heterogeneous” information, meaning the section’s content spans the boundaries of the SOAP
framework. For example, the Assessment and Plan Section contains both assessment (A) and plan (P) information.
Section structures that contain “homogeneous” information, all of the same type with the same purpose, improves
information processing.


<table style="border-collapse:collapse;margin-left:24.01pt"
    cellspacing="0">
    <tr style="height:37pt">
        <td
            style="width:468pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"
                bgcolor="#C5D9F0"><p class="s19"
                style="padding-left: 41pt;padding-right: 8pt;text-indent: 0pt;text-align: left;"
                >C-CDA Content Creators SHOULD use section templates
                containing “homogeneous” information with regards to not
                mixing subjective, objective, assessment, and plan types of
                information together in a single section. <b>[BP-060]</b></p></td>
    </tr>
</table>

##### Subjective Information


| **Section Name<br />LOINC<br />OID**   | **Purpose Description**    |
| ---- | ------ |
| **Subjective Section**<br />61150-9<br />2.16.840.1.113883.10.20.21.2.2  | This section describes in a narrative format the patient’s current condition and/or interval changes as reported by the patient or by the patient’s guardian or another informant.  |
| **Reason for Visit**<br />29299-5<br />2.16.840.1.113883.10.20.22.2.12  | This section records the patient’s reason for the patients’ visit (as documented by the provider). Local policy determines whether Reason for Visit and Chief Complaint are in separate or combined sections.  |
| **Reason for Referral**<br />42349-1<br />1.3.6.1.4.1.19376.1.5.3.1.3.1:2014-06-09  | This section describes the clinical reason why a provider is sending a patient to another provider for care. The reason for referral may become the reason for visit documented by the receiving provider.  |
| **Chief Complaint**<br />10154-3<br />2.16.840.1.113883.10.20.22.2.13  | This section records the patient’s chief complaint (the patient’s own description).  |
| **Chief Complain and Reason for Visit**<br />46239-0<br />2.16.840.1.113883.10.20.22.2.13  | This section records the patient’s chief complaint (the patient’s own description) and/or the reason for the patient’s visit (the provider’s description of the reason for visit). Local policy determines whether the information is divided into two sections or recorded in one section serving both purposes.<br /> |
| **Health Concerns Section**<br />75310-3<br />2.16.840.1.113883.10.20.22.2.58:2015-08-01  | This section contains data describing an interest or worry about a health state or process that could possibly require attention, intervention, or management. A Health Concern is a health-related matter that is of interest, importance or worry to someone, who may be the patient, patient’s family or patient’s health care provider. Health concerns are derived from a variety of sources within IEHR.<br />Health concerns can be medical, surgical, nursing, allied health or patient-reported concerns. “Transportation difficulties” for someone who doesn't drive and has trouble getting to appointments, or “Underinsured” for someone who doesn't have sufficient insurance to properly cover their medical needs such as medications. Problem Concerns are a subset of Health Concerns that have risen to the level of importance that they typically would be described in the Problems Section.  |
| **Allergies and Intolerances Section**<br />48765-2<br />2.16.840.1.113883.10.20.22.2.6.1:2015-08-01  | This section lists and describes any medication allergies, adverse reactions, idiosyncratic reactions, anaphylaxis/anaphylactoid reactions to food items, and metabolic variations or adverse reactions/allergies to other substances (such as latex, iodine, tape adhesives). At a minimum, it should list currently active and any relevant historical allergies and adverse reactions.  |
| **Review of Systems Section**<br />10187-3<br />1.3.6.1.4.1.19376.1.5.3.1.3.18  | This section contains a relevant collection of symptoms and functions systematically gathered by a clinician. It includes symptoms the patient is currently experiencing, some of which were not elicited during the history of present illness, as well as a potentially large number of pertinent negatives, for example, symptoms that the patient denied experiencing.  |
| **History of Present Illness**<br />10164-2<br />1.3.6.1.4.1.19376.1.5.3.1.3.4  | This section describes the history related to the reason for the encounter. It contains the historical details leading up to and pertaining to the patient’s current complaint or reason for seeking medical care.  |
| **Past Medical History**<br />11348-0<br />2.16.840.1.113883.10.20.22.2.20:2015-08-01  | This section contains a record of the patient’s past complaints, problems, and diagnoses. It contains data from the patient’s past, up to the patient’s current complaint or reason for seeking medical care.  |
| **Social History Section**<br />29762-2<br />2.16.840.1.113883.10.20.22.2.17:2015-08-01  | This section contains social history data that influence a patient’s physical, psychological or emotional health (e.g., smoking status, pregnancy, work). Demographic data, such as marital status, race, ethnicity, and religious affiliation, is captured in the header.  |<br />
| **Family History Section**<br />10157-6<br />2.16.840.1.113883.10.20.22.2.15:2015-08-01  | This section contains data defining the patient’s genetic relatives in terms of possible or relevant health risk factors that have a potential impact on the patient’s healthcare risk profile.  |
{:.grid}
**Table 28: Subjective Information**

##### Objective Information

| **Sections defined in C-CDA<br />LOINC<br />OID**   | **Purpose Description**    |
| ---- | ------ |
| **Objective Section**<br />61149-1<br />2.16.840.1.113883.10.20.21.2.1  | This section contains data about the patient gathered through tests, measures, or observations that produce a quantified or categorized result. It includes important and relevant positive and negative test results, physical findings, review of systems, and other measurements and observations.  |
| **Problems Section**<br />11450-4<br />2.16.840.1.113883.10.20.22.2.5.1:2015-08-01  | This section lists and describes all relevant clinical problems at the time the document is generated. At a minimum, all pertinent current and historical problems should be listed. Overall health status may be represented in this section.  |
| **Medical (General) History Section**<br />11329-0<br />2.16.840.1.113883.10.20.22.2.39  | This section describes all aspects of the medical history of the patient even if not pertinent to the current procedure, and may include chief complaint, past medical history, social history, family history, surgical or procedure history, medication history, and other history information. The history may be limited to information pertinent to the current procedure or may be more comprehensive. The history may be reported as a collection of random clinical statements or it may be reported categorically. Categorical report formats may be divided into multiple subsections including Past Medical History, Social History.  |
| **Medications Section**<br />10160-0<br />2.16.840.1.113883.10.20.22.2.1.1:2014-06-09  | This section contains a patient’s current medications and pertinent medication history. At a minimum, the currently active medications are listed. An entire medication history is an option. The section can describe a patient’s prescription and dispense history and information about intended drug monitoring.  |
| **Immunizations Section**<br />11369-6<br />2.16.840.1.113883.10.20.22.2.2.1:2015-08-01  | This section defines a patient’s current immunization status and pertinent immunization history. The primary use case for the Immunization Section is to enable communication of a patient’s immunization status. The section should include current immunization status and may contain the entire immunization history that is relevant to the period of time being summarized.  |
| **Medical Equipment Section**<br />46264-8 2.16.840.1.113883.10.20.22.2.23:2014-06-09  | This section defines a patient’s implanted and external health and medical devices and equipment. This section lists any pertinent durable medical equipment (DME) used to help maintain the patient’s health status. All equipment relevant to the diagnosis, care, or treatment of a patient should be included. Devices applied to, or placed in, the patient are represented with the Procedure Activity Procedure template. Equipment supplied to the patient (e.g., pumps, inhalers, wheelchairs) is represented by the Non-Medicinal Supply Activity template. These devices may be grouped together within a Medical Equipment Organizer.  |
| **Procedures Section**<br />47519-4<br />2.16.840.1.113883.10.20.22.2.7.1:2014-06-09  | This section describes all interventional, surgical, diagnostic, or therapeutic procedures or treatments pertinent to the patient historically at the time the document is generated. The section should include notable procedures.  |
| **Results Section**<br />30954-2<br />2.16.840.1.113883.10.20.22.2.3.1:2015-08-01  | This section contains the results of observations generated by laboratories, imaging and other procedures. The scope includes observations of hematology, chemistry, serology, virology, toxicology, microbiology, plain x-ray, ultrasound, CT, MRI, angiography, echocardiography, nuclear medicine, pathology, and procedure observations. This section often includes notable results such as abnormal values or relevant trends.  |
| **Vital Signs Section**<br />8716-3<br />2.16.840.1.113883.10.20.22.2.4.1:2015-08-01  | This section contains relevant vital signs for the context and use case of the document type, such as blood pressure, heart rate, respiratory rate, height, weight, body mass index, head circumference, pulse oximetry, temperature, and body surface area. The section should include notable vital signs such as the most recent, maximum and/or minimum, baseline, or relevant trends. Vital signs are represented in the same way as other results. However, they are represented in their own section to follow clinical conventions.  |
| **Course of Care Section**<br />8648-8<br />2.16.840.1.113883.10.20.22.2.64  | This section describes what happened during the course of an encounter.  |
| **General Status Section**<br />10210-3<br />2.16.840.1.113883.10.20.2.5  |This section describes general observations and readily observable attributes of the patient, including affect and demeanor, apparent age compared to actual age, gender, ethnicity, nutritional status based on appearance, body build and habitus (e.g., muscular, cachectic, obese), developmental or other deformities, gait and mobility, personal hygiene, evidence of distress, and voice quality and speech.   |
| **Functional Status Section**<br />47420-5 2.16.840.1.113883.10.20.22.2.14:2014-06-09  | This section contains observations and assessments of a patient’s physical abilities. A patient’s functional status may include information regarding the patient’s ability to perform Activities of Daily Living (ADLs) in areas such as Mobility (e.g., ambulation), Self-Care (e.g., bathing, dressing, feeding, grooming) or Instrumental Activities of Daily Living (IADLs) (e.g., shopping, using a telephone, balancing a check book). Problems that impact function (e.g., dyspnea, dysphagia) can be contained in the section.  |
| **Mental Status Section**<br />10190-7<br />2.16.840.1.113883.10.20.22.2.56:2015-08-01  | This section contains observations and evaluations related to a patient’s psychological and mental competency and deficits including, but not limited to any of the following types of information: • Appearance (e.g., unusual grooming, clothing or body modifications) • Attitude (e.g., cooperative, guarded, hostile) • Behavior/psychomotor (e.g., abnormal movements, eye contact, tics) • Mood and affect (e.g., anxious, angry, euphoric) • Speech and Language (e.g., pressured speech, perseveration) • Thought process (e.g., logic, coherence) • Thought content (e.g., delusions, phobias) • Perception (e.g., voices, hallucinations) • Cognition (e.g., memory, alertness/consciousness, attention, orientation) – which were included in Cognitive Status Observation in earlier publications of C-CDA.• Insight and judgment (e.g., understanding of condition, decision making)  |
| **Nutrition Section**<br />61144-2<br />2.16.840.1.113883.10.20.22.2.57  |This section represents diet and nutrition information including special diet requirements and restrictions (e.g., texture modified diet, liquids only, enteral feeding). It also represents the overall nutritional status of the patient and nutrition assessment findings.   |
| **Specific to Inpatient Encounter Notes**  ||
| **Admission Diagnosis Section**<br />46241-6<br />2.16.840.1.113883.10.20.22.2.43:2015-08-01  | This section contains a narrative description of the problems or diagnoses identified by the clinician at the time of the patient’s admission. This section may contain a coded entry which represents the admitting diagnoses.  |
| **Admission Medications Section**<br />42346-7<br />2.16.840.1.113883.10.20.22.2.44:2015-08-01  | This section contains the medications taken by the patient prior to and at the time of admission to the facility.  |
| **Hospital Course Section**<br />8648-8<br />1.3.6.1.4.1.19376.1.5.3.1.3.5  | This section describes the sequence of events from admission to discharge in a hospital facility.  |
| **Hospital Consultations Section**<br />18841-7<br />2.16.840.1.113883.10.20.22.2.42  | This section records consultations that occurred during the admission.  |
| **Hospital Discharge Studies Summary Section**<br />11493-4<br />2.16.840.1.113883.10.20.22.2.16  | This section records the results of observations generated by laboratories, imaging procedures, and other procedures. The scope includes hematology, chemistry, serology, virology, toxicology, microbiology, plain x-ray, ultrasound, CT, MRI, angiography, echocardiography, nuclear medicine, pathology, and procedure observations. This section often includes notable results such as abnormal values or relevant trends and could record all results for the period of time being documented.  |
| **Hospital Discharge Physical Section**<br />10184-0<br />1.3.6.1.4.1.19376.1.5.3.1.3.2  | This section records a narrative description of the patient’s physical findings generated by the discharge physician at the time of discharge.  |
| **Discharge Medications Section**<br />10183-2<br />2.16.840.1.113883.10.20.22.2.11.1:2015-08-01  | This section contains the medications the patient is intended to take or stop after discharge. Current, active medications must be listed. The section may also include a patient’s prescription history and indicate the source of the medication list.  |
| **Specific to Procedure and Operative Notes**  ||
| **Medications Administered Section**<br />29549-3<br />2.16.840.1.113883.10.20.22.2.38:2014-06-09  | This section usually resides inside a Procedure Note describing a procedure. This section defines medications and fluids administered during the procedure, its related encounter, or other procedure related activity excluding anesthetic medications.  |
| **Anesthesia Section**<br />59774-0<br />2.16.840.1.113883.10.20.22.2.25:2014-06-09  | This section records the type of anesthesia (e.g., general or local) and may state the actual agent used. This may be a subsection of the Procedure Description Section. The full details of anesthesia are usually found in a separate Anesthesia Note.  |
| **Procedure Indications Section**<br />59768-2<br />2.16.840.1.113883.10.20.22.2.29:2014-06-09  | This section contains the reason(s) for the procedure or surgery. This section may include the pre-procedure diagnoses as well as symptoms contributing to the reason for the procedure.  |
| **Medical Equipment Section**<br />46264-8<br />urn:hl7ii:2.16.840.1.113883.10.20.22.2.23:2014-06-09  | This section contains devices that have been placed in a patient. This section is also relevant for recording information about non-implanted medical equipment and non-medicinal supplied equipment (e.g. wheelchair, hearing aid, walker).<br /> |
| **Complications Section**<br />55109-3<br />2.16.840.1.113883.10.20.22.2.37:2015-08-01  | This section contains problems that occurred during or around the time of a procedure. The complications may be known risks or unanticipated problems.  |
{:.grid}
**Table 29: Objective Information**

##### Assessment Information

| **Sections defined in C-CDA<br />LOINC<br />OID**   | **Purpose Description**    |
| ---- | ------ |
| **Assessment Section**<br />51848-0<br />2.16.840.1.113883.10.20.22.2.8  | This section (also referred to as “impression” or “diagnoses” outside of the context of CDA) represents the clinician’s conclusions and working assumptions that will guide treatment of the patient. The assessment may be a list of specific disease entities or a narrative block.  |
| **Assessment and Plan Section**<br />51847-2<br />2.16.840.1.113883.10.20.22.2.9:2014-06-09  | This section represents the clinician’s conclusions and working assumptions that will guide treatment of the patient. The Assessment and Plan Section may be combined or separated to meet local policy requirements. Best practice is to separate these distinct types of information by using the Assessment Section: templateId 2.16.840.1.113883.10.20.22.2.8 and the Plan of Treatment Section: templateId 2.16.840.1.113883.10.20.22.2.10:2014-06-09<br />  |
|**Specific to Inpatient Encounter Notes:**||
| **Discharge Diagnosis Section**<br />11535-2<br />2.16.840.1.113883.10.20.22.2.24:2015-08-01  | This section represents problems or diagnoses present at the time of discharge which occurred during the hospitalization. This section includes an optional entry to record patient diagnoses specific to this visit. Problems that need ongoing tracking should also be included in the Problem Section.  |
|**Specific to Procedure and Operative Notes:**||
| **Postprocedure Diagnosis Section**<br />59769-0<br />2.16.840.1.113883.10.20.22.2.36:2015-08-01  | This section records the diagnosis or diagnoses discovered or confirmed during the procedure. Often it is the same as the preprocedure diagnosis or indication.  |
| **Postoperative Diagnosis Section**<br />10219-4<br />2.16.840.1.113883.10.20.22.2.35  | This section records the diagnosis or diagnoses discovered or confirmed during the surgery. Often it is the same as the preoperative diagnosis.  |
{:.grid}
**Table 30: Assessment Information**


##### Plan/Planning Information

| **Sections defined in C-CDA <br />LOINC<br />OID**   | **Purpose Description**    |
| ---- | ------ |
| **Goals Section**<br />61146-7<br />2.16.840.1.113883.10.20.22.2.60  | This section represents patient Goals. A goal is a defined outcome or condition to be achieved in the process of patient care. Goals include patient-defined over-arching goals and health concern-specific or intervention-specific goals to achieve desired outcomes.  |
| **Advance Directives Section**<br />42348-3<br />2.16.840.1.113883.10.20.22.2.21.1:2015-08-01  | This section contains data defining the patient’s advance directives and any reference to supporting documentation, including living wills, healthcare proxies, and CPR and resuscitation status. If the referenced documents are available, they can be included in the exchange package.  |
| Assessment and Plan Section<br />51847-2<br />2.16.840.1.113883.10.20.22.2.9:2014-06-09  | This section represents the clinician’s conclusions and working assumptions that will guide treatment of the patient. The Assessment and Plan Section may be combined or separated to meet local policy requirements. Best practice is to separate these distinct types of information by using the Assessment Section: templateId 2.16.840.1.113883.10.20.22.2.8 and the Plan of Treatment Section: templateId 2.16.840.1.113883.10.20.22.2.10:2014-06-09<br /> |
| **Plan of Treatment Section**<br />18776-5<br />2.16.840.1.113883.10.20.22.2.10:2014-06-09  | This section, formerly known as "Plan of Care", contains data that define pending orders, interventions, encounters, services, and procedures for the patient. It is limited to prospective, unfulfilled, or incomplete orders and requests only. All active, incomplete, or pending orders, appointments, referrals, procedures, services, or any other pending event of clinical significance to the current care of the patient should be listed.  |
| **Instructions Sections**<br />69730-0<br />2.16.840.1.113883.10.20.22.4.20:2014-06-09  | This section can be used in several ways, such as to record patient instructions within a Medication Activity or to record fill instructions within a supply order.  |
| **Specific to Procedure and Operative Notes:** |
| **Planned Procedures Section**<br />59772-4<br />2.16.840.1.113883.10.20.22.2.30:2014-06-09  | This section contains the procedure(s) that a clinician planned based on the preoperative assessment.  |
| **Specific to Procedure and Operative Notes:** |
| **Hospital Discharge Instructions Section**<br />8653-8<br />2.16.840.1.113883.10.20.22.2.41  | This section records instructions at discharge.  |
{:.grid}
**Table 31: Plan/Planning Information**

##### Other Information

| **Sections defined in C-CDA<br />LOINC<br />OID**   | **Purpose Description**    |
| ---- | ------ |
| **Encounters Section**<br />46240-8<br />2.16.840.1.113883.10.20.22.2.22.1:2015-08-01<br />2.16.840.1.113883.10.20.22.2.18:2015-08-01  | This section is relevant in nearly all documents. It lists and describes any healthcare encounters pertinent to the patient’s current health status or historical health history. An encounter is an interaction, regardless of the setting, between a patient and a practitioner who is vested with primary responsibility for diagnosing, evaluating, or treating the patient’s condition. It may include visits, appointments, or non-face-to-face interactions. An encounter also may be a contact between a patient and a practitioner who has primary responsibility (exercising independent judgment) for assessing and treating the patient at a given contact. This section may include a single encounter in an Encounter Summary. It contains relevant encounters for the time period being summarized in a Patient Summary Document.  |
| **Payers Section**<br />48768-6<br />2.16.840.1.113883.10.20.22.2.18:2015-08-01  | This section contains data on the patient’s payers, "third party" insurance, self-pay, other payer or guarantor, or some combination of payers, and is used to define which entity is the responsible fiduciary for the financial aspects of a patient’s care. Each unique instance of a payer and all the pertinent data needed to contact, bill to, and collect from that payer should be included. Authorization information that can be used to define pertinent referral, authorization tracking number, procedure, therapy, intervention, device, or similar authorizations for the patient or provider, or both should be included. At a minimum, the patient’s pertinent current payment sources should be listed.  |
{:.grid}
**Table 32: Other Information**

#### Supplemental C-CDA Section Templates

Several section templates have been developed specifically to supplement C-CDA. They are defined within the
context of C-CDA Supplemental Guides that have been balloted and reconciled separately from C-CDA, and are
published alongside the main C-CDA Specification<br/>[https://www.hl7.org/implement/standards/product_brief.cfm?product_id=492](https://www.hl7.org/implement/standards/product_brief.cfm?product_id=492). These guides are developed with
the intention of eventually replacing earlier version of the templates in C-CDA or eventually being added to be set
of templates considered a part of the C-CDA set of templates.

At the time of this publication, the following Supplemental Implementation Guides are published within the [C-CDA specification Product Brief page](https://www.hl7.org/implement/standards/product_brief.cfm?product_id=492)and may be used within a C-CDA 3.0 Templates:

- [C- CDA R2.1; Advance Directives Templates, Release 1 – US Realm](http://www.hl7.org/implement/standards/product_brief.cfm?product_id=473)
- [HL7 CDA® R2 Implementation Guide: C-CDA R2.1 Supplemental Templates for Nutrition, Release 1 - US Realm](http://www.hl7.org/implement/standards/product_brief.cfm?product_id=478)
- [HL7 CDA® R2 Implementation Guide: C-CDA R2.1 Supplemental Templates for Pregnancy Status, Release 1 - US Realm](http://www.hl7.org/implement/standards/product_brief.cfm?product_id=494)
- [HL7 CDA® R2 Implementation Guide: C-CDA R2.1 Supplemental Templates for Infectious Disease, Release 1 – US Realm](https://www.hl7.org/implement/standards/product_brief.cfm?product_id=502)
- [HL7 CDA® R2 Implementation Guide: C-CDA R2.1 Supplemental Templates for Occupational Data for Health Release 1, STU Release 1.1 – US Realm](https://www.hl7.org/implement/standards/product_brief.cfm?product_id=522)

### Entry Level Guidance
#### General Entry-Level Guidance

The guidance below pertains when document sections include machine processable discrete data to aid processing
of information contained in the section. The following general entry-level guidance is applicable to all C-CDA entry
templates.

##### Narrative Text Linking (Referencing)

Best practice for CDA creation is to represent all human readable text in the section, then reference the text from
the discrete entries that represent the human readable information as machine processable data. To include
narrative text linking, the text element of the primary (outer-most) act in an entry should point, by reference, to
the portion of the narrative text corresponding to the meaning of the entire clinical statement expressed in the
discrete entry.

**Example 21: Narrative Text with Links to Machine Processable Data**
```
<section>
    <templateId root="2.16.840.1.113883.10.20.22.2.7.1" extension="2014-06- 09" />
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
CDA stylesheet. it is recommended to regularly test using the HL7
[CDA stylesheet approved by SDWG and managed in the HL7 GitHub](https://hl7.org/permalink/?CDAStyleSheet).

##### OriginalText

When a CDA document section contains coded discrete entries (such as allergy, medication, problem, etc. to
support machine processing of the available human readable information), coded data within the discrete entry
SHOULDD include an originalText element to link the coded information back to the original human readable
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


The referencing mechanism when used with the original text component of a coded CDA entry:

Sometimes the original text will be repeated in the originalText element rather than
using a reference link into the narrative text. This is not incorrect and should not be flagged as an error. In
this case, the originalText element, allows the human readable information to include a quality check.


The HL7 CDA standard recommends use of narrative text linking to minimize mismatch errors
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

It is valuable to send the local code that represents the originalText as a translation,
along with one or more translations to publicly defined code systems. This practice is encouraged in FHIR
when using data elements of type [CodableConcept](https://www.hl7.org/fhir/datatypes.html#CodeableConcept). In CDA this can be accomplished through translationCode.

The following best practices were agreed upon by HL7 SD Work Group and the HL7 Vocabulary Work Group
in [January of 2017](https://confluence.hl7.org/display/VOC/Vocabulary+WG+Policy+on+Use+of+translationCode+in+the+V3+%28and+CDA%29+Datatypes) :

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
##### DisplayName Representation

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

The guidance for the use of the displayName element are:

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

For example, a new version of SNOMED CT is released with a new problem code of 99999123 and a display name
of “Obsessional thoughts of augmented reality video games” and this code is used in a Problem Observation. If
neither originalText nor display were included in the xml entry, the human readable narrative for the entry (if not otherwise prcoessed)) might only say, “Problem 99999123 began on July 6, 2016 as noted by Dr. Ishihara.” This would violate the core CDA
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

##### Use of Consistent Identifiers

The "id" element serves as a globally unique identifier for data collections, such as documents, sections, entries, or sub-entries (e.g., authors).

Consistency in using ids is crucial within a document and across different document instances from the same system. If data remains the same, the id remains constant. Any changes leading to a new instance of data result in a new id.

For instance, if a patient's penicillin allergy is documented in a CCD, the id for this allergy should remain the same in subsequent C-CDA documents unless there's a fundamental change. Consistent ids simplify data reconciliation and matching, increasing accuracy.

One way to implement consistent unique ids is by maintaining multiple GUIDs for each object in a database. Object Identifiers (OIDs) can identify the assigning authority for each GUID. CDA id elements consist of a root (GUID or OID) and an optional extension, ensuring global uniqueness.

Vendors have flexibility in generating valid GUIDs.

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

##### Use of nullFlavor and Handling Missing Information

HL7 V3 CDA handles unavailable, unknown, or incomplete data with 'null flavors,' representing coded values that explain the missing information.
Assigning a value for missing data is required for validation and considered good practice in other cases. Precision in indicating null flavors is encouraged to convey the reason for missing data. The CDA R2 standard's null flavor vocabulary provides a complete hierarchy of these values.
The @nullFlavor attribute is especially informative when used with intervals. For instance, in a Tobacco Use observation, "effectiveTime/high/@nullFlavor='UNK'" indicates the patient has stopped using a tobacco product, but the exact cessation time is unknown. Other nullFlavors like NI (no information), NAV (not available), and NASK (not asked) convey uncertainty about the patient's current substance use.

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
        xsi:type="CD"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"/>
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
        xsi:type="CD"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"/>
</observation>
```
If the resolution to a problem is not known, its effectiveTime/high should contain a value or nullFlavor=UNK. If the nullFlavor=NA, then the problem is definitely
_not_ resolved. And if the nullFlavor is anything else, then it is unclear as to whether the problem is still active or if it
has been resolved.

The @nullFlavor attribute also conveys when information is unknown. However, a nullFlavor SHALL NOT be used
to bypass IG requirements for convenience ( _e.g._ you may send a nullFlavor=UNK for a patient’s birthTime when it
is not recorded in a chart, but you must not send it simply because it is too difficult to convert the method your
system uses to record birth dates to an HL7 timestamp). NullFlavor attributes need not be included for non-
required elements, such as religiousAffiliationCode. If an element is optional and unknown, it may simply be
omitted.

##### Unknown Data in Sections That Require Entries

The following guidelines clarify the use of the “No Information” nullflavor=”NI” pattern for a section with no information:

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

Machine-readable data in these sections is essential for clinical best practice and should not be omitted unless the entire section contains no information (section/@nullFlavor=NI). In such cases, you may use "unknown" information within specific acts, like Procedure Activity, along with a description and a code for the nature of the unknown data.

The goal is to describe unknown information explicitly for accurate communication. Fields related to problems, medications, and medication allergies cannot be left blank; instead, the section must be included with a null value, and the narrative text should explicitly state that the information is unknown.

**Example 28: No Information Problems Section**
```
<!-- ************************* PROBLEM LIST ****************************** -->
<component>
    <!-- nullFlavor of NI indicates No Information.-->
    <section nullFlavor="NI">
        <!-- conforms to Problems section -->
        <templateId root="2.16.840.1.113883.10.20.22.2.5.1" extension="2015-08- 01"/>
        <code code="11450-4" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"
            displayName="PROBLEM LIST"/>
        <title>PROBLEMS</title>
        <text>No Information</text>
    </section>
</component>
```

##### Representing “no known” Information Versus “no information”

Distinguishing between "no information" and "no known information" is important. In the case of "no known information," the author isn't asserting the presence or absence of data for the element. "No information" explicitly states that there's no data for that element in the system.
For example, "I don't know if the patient has any allergies" (no information) versus "The patient claims no allergies" (no known).
When asserting "no known" information, use negation indicators (negationInd). Avoid explicit codes like "no known allergies"; instead, use a negation indicator on the act, accompanied by a text description and a code indicating the data lacks value.
Acknowledging some ambiguity due to earlier RIM versions in CDA R2, specific examples like "no known problems" and "no known allergies" have been adopted. 

**Example 29: Allergy List**
```
<!-- ************************* ALLERGY LIST ****************************** -->
<component>
    <section>
        <!-- Allergies section-->
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

To indicate a section has "no information," include the section with a null value of NI. To show that a section contains information in the source system but is excluded from the exchange document, include the section with a null value of MSK, indicating that the sender has not provided this information due to security, privacy, or other reasons. The specific wording for "no information" and "masked information" in the narrative text can be determined locally.

**Example 30: Allergies Section with No Information**
```
<!-- ************************* ALLERGY LIST ****************************** -->
<component>
    <!-- nullFlavor of NI indicates No Information.-->
    <section nullFlavor="NI">
        <!-- Allergies section-->
        <templateId root="2.16.840.1.113883.10.20.22.2.6.1"/>
        <templateId root="2.16.840.1.113883.10.20.22.2.6.1" extension="2015-08- 01"/>
        <code code="48765-2" codeSystem="2.16.840.1.113883.6.1"/>
        <title>ALLERGIES, ADVERSE REACTIONS, ALERTS</title>
        <text>No Information</text>
    </section>
```

**Example 31: Excluding section due to business rules.**

Entire section excluded because business rules of the author determine the section of information is not present due to security, privacy, or other reasons
<br/>
```
<section nullFlavor="MSK">
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



##### Detailed Date/Time Guidance

A study by the Association for Healthcare Documentation Integrity, presented at the [HIMSS Health Story Project Roundtable on March 5, 2019](https://www.himss.org/sites/hde/files/HSP%20March%202019%20Roundtable%20Q%26A.pdf), showed that consistent style in healthcare records enhances clear communication, boosts patient safety, and improves information exchange. Applying style standards to human-readable text can reduce physician burden, with a focus on improving the representation of temporal date/time information in the narrative text. While temporal details are vital for clinical understanding, excessive date/time prcision can overwhelm or mislead. The Roundtable urged C-CDA creators to ensure that date/time information in the Narrative Block is relevant, pertinent, and appropriately styled to ease physician burden.

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

###### Timestamp Data Representation

Time values are represented in ISO 8601 compliant form, which is traditional in HL7 and lacks dashes, colons, and a "T" between date and time. The syntax is "YYYYMMDDHHMMSS.UUUU[+|-ZZzz]," with the option to omit digits for less precision. Common forms are "YYYYMMDD" and "YYYYMMDDHHMM," but truncation on the right side can occur with other variants.
The ".UUUU" part allows for precision down to tenths of a millisecond (e.g., ".001"). Timezone information is indicated using offsets from UTC, like -0500 for Eastern Standard Time (EST) and -0400 for Eastern Daylight Saving Time (EDT). UTC Time is represented as -0000.
Without a timezone offset, assumptions about time should not be made unless there's a local exchange agreement. When timezone is NULL (unknown), it implies "local time," which is context-dependent and should not be converted to UTC. Specifying timezone for all TS values is important to avoid loss of precision during TS comparisons.
In administrative data, values often lack a timezone. For instance, specifying a timezone for a date of birth in administrative data could alter the date when converted to other timezones. Therefore, administrative data typically has a NULL timezone (not applicable).
See [TS Point in Time in the StructureDefinition Publication of CDA V3 Data Types]({{site.data.fhir.cda}}/StructureDefinition-TS.html)
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



###### Date/Time Precision

When specifying dates and times, care should be taken to only capture data with as much precision as is known.
The timestamp format allows for partial dates and partial times to be specified. For information see [TS - Detailed Description](https://build.fhir.org/ig/HL7/CDA-core-sd/StructureDefinition-TS.html)from the CDA V3 Data Type Specification StructureDefinition publication.

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



#### Referencing Information Within a Document

The [Entry Reference](StructureDefinition-EntryReference.html) template represents the act of referencing another entry in the same CDA document instance.
Its purpose is to remove the need to repeat the complete XML representation of the referred entry when relating
one entry to another. This template can be used to reference many types of Act class derivations, such as 
encounters, observations, procedures etc., as it is often necessary when authoring CDA documents to repeatedly
reference other Acts of these types. For example, in a Care Plan it is necessary to repeatedly relate Health
Concerns, Goals, Activities and Outcomes.

The ID is required and must be the same ID as the entry/id it is referencing. The ID cannot be a null value. Act/Code
is set to nullFlavor=“NP” (Not Present). This means the value is not present in the message (in act/Code).

The `<linkHtml>` tag, is a generic referencing mechanism that can be used to reference identifiers that are internal
to a document. Note that security considerations need to be given to support for linking mechanisms. Not all
stylesheets enable the linking features of the `<linkHtml>` tag to be operationalized.


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

#### Referencing Information in an External Acts

The base HL7 CDA standard supports four act classes that enable information in one document to reference
information in an external document, external procedure, external observation, or external act. 

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


#### How Negation Works in C-CDA Templates

C-CDA entry templates include a negationInd attribute for Act classes (act, procedure, encounter, substanceAdministration, supply, and observation). When Act.negationInd is set to "true," it asserts that the Act as a whole is negated. Certain properties like Act.id, Act.moodCode, and participations remain unaffected and retain their original meaning.

A statement with negationInd still conveys information about the specific fact described by the Act. For example, a negated "finding of wheezing on July 1" means the author denies the presence of wheezing on that date, assuming the same responsibility and evidence requirement as for a non-negated statement.

In the case of observations, entry templates may specify whether the observation.negationInd attribute applies to the entire act or only to the observation.value element. CDA template definitions should explicitly describe this intention.

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


#### Specific Entry-Level Guidance

This guidance is specific to individual entry templates and has been collected from various sources, including C-CDA implementer community feedback, published implementation guides, C-CDA Implementation-A-Thons,HL7's Cross Work Group work on mappings between C-CDA and FHIR, and efforts by the HL7 C-CDA Examples Task Force.

Each entry template described below includes its purpose, details about any associated state model, information on representing negated data, and special considerations from the C-CDA implementer community's experience.

The data classes listed provide guidance for relevant entry templates associated with each data class.


#### Provenance

As demand increases for higher quality, more trusted clinical data in C-CDA documents, new efforts have emerged
to clarify basic information requirements for representing data “provenance.” Provenance provides traceability of
information and supports clinical information reconciliation and incorporation.

| **Entry Template**   | **Provenance Author Participation<br />[author: identifier urn:oid:2.16.840.1.113883.10.20.22.5.6:2019-10-01 (open)]**    |
| ---- | ------ |
| **Template**   | [Provenance Author Participation](StructureDefinition-ProvenanceAuthorParticipation.html) |
| **Purpose**   | This template provides a mechanism to record basic Provenance in an Author Participation.  |
| **ActStatus**   | Not applicable  |
| **Negation**   | Not applicable  |
| **Other Considerations**   | This template constrains the CDA Author Participation and is appropriate at the Header, Section, or Entry level. The conformance criteria specializes the C-CDA Author Participation (2.16.840.1.113883.10.20.22.4.119) but does not require generators to include this additional templateId.  |
| **Example**   | Example 33: Use of the Provenance Author Participation  |
{:.grid}
**Table 36: Provenance Author Participation Template**


**Example 33: Use of the Provenance Author Participation**

```
<section>
    <!-- *** Allergies and Intolerances Section *** -->
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

#### Provenance mapping to FHIR

Systems can use the [Provenance Author Participation](StructureDefinition-ProvenanceAuthorParticipation.html)to identify the author of content. This corresponds to a FHIR Provenance.agent.type="author" with a relevant Provenance.target.

When a system transforms a CDA entry using a Provenance - Author template assertion, the information from the template should go into the FHIR Provenance.agent and may also fill an appropriate Resource element.

If a CDA entry lacks an explicit Provenance-Author template assertion, it may not provide enough role specificity for populating a FHIR Provenance Resource with certainty.

Implementers will need to determine suitable mappings based on the specific situation.


#### Section Time Range

The [Section Time Range Observation](StructureDefinition-SectionTimeRangeObservation.html)defines a machine-readable business rule for restricting the time interval of information within a section. It's optional and can be applied in any section to avoid overwhelming or irrelevant content. This entry links to human-readable information that explains the applied business rules found in the section's narrative text.

#### Section Time Range Observation

| **Entry Template**   | **Section Time Range Observation<br />[observation: identifier urn:hl7ii:2.16.840.1.113883.10.20.22.4.201:2016-06-01 (open)]**    |
| ---- | ------ |
| **Template**   | [Section Time Range Observation](StructureDefinition-SectionTimeRangeObservation.html)  |
| **Purpose**   | This observation describes a date/time range applied by the document creator to limit the range of information contained in a section.  |
| **ActStatus**   | Section Time Range observation always has a statusCode of “completed”.<br />This template does not include an effectiveTime element. See other considerations below.  |
| **Negation**   | Not specified.  |
| **Other Considerations**   | Narrative text linking applies for this entry. The human readable information describing the date/time range used to limit the information SHOULD be reported in the Narrative Block and SHOULD NOT be implied by the section.title only.<br />The specified date/time range of the content limit is specified in the observation.value element.  |
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

The C-CDA document header contains roles filled by those involved in patient care. The roles are implicit, but the [Care Teams Section](StructureDefinition-CareTeamsSection.html)and [Care Team Organizer](StructureDefinition-CareTeamOrganizer.html) templates allow for explicit documentation of care team information. These templates offer more details about the type of care team and the roles of its members, providing greater expressiveness.

##### Care Team Organizer

| **Entry Template**   | **Care Team Organizer<br />[organizer: identifier urn:hl7ii:2.16.840.1.113883.10.20.22.4.500:2019-07-01 (open)]**    |
| ---- | ------ |
| **Template**   | [Care Team Organizer](StructureDefinition-CareTeamOrganizer.html) |
| **Purpose**   | This organizer template contains information about a single care team.<br /> The author of the organizer is the person who documented the care team information.<br /> The participants of the organizer are the care team lead(s) and the care team organization.<br /> The components of the organizer contain the following information:<br /> - The encounter that caused the care team to be formed<br /> - Narrative information about the care team<br /> - The care team members<br /> - Reasons for the care team<br /> - The care team type(s) - a care team can have multiple care team types  |
| **ActStatus**   | The actStatus of this entry is statically bound to ValueSet ActStatus urn:oid:2.16.840.1.113883.1.11.15933. Implementers need to be prepared to address the specified state model. Possible states include: active, completed, cancelled, held, suspended, new, normal, nullified, obsolete, and aborted.  |
| **Negation**   | Not explicitly specified.  |
| **Other Considerations**   | Implementers are encouraged to take guidance from the structure of this entry, even if only populating the Narrative Block of the Care Teams Section.<br />Implementers should note the functionCode element vocabulary binding extends the set of concepts for a Care Team member’s role on the Care Team. A new value set called “Care Team Member Function” is grouped with the original value set called “ParticipationFunction.” In cases where a concept overlaps between these two value sets, implementers should use the concept from the ParticipationFunction value set.  |
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

The [Encounters Section](StructureDefinition-EncountersSection.html) lists past and ongoing patient encounters, including the one that led to the document's creation. Future appointments and requested encounters should be mentioned in the Plan of Treatment Section.

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

The [Encounter Activity](StructureDefinition-EncounterActivity.html) entry with a matching ID in the encompassingEncounter header represents the primary encounter.

Encounter Diagnosis is always shown as an entryRelationship to an Encounter Activity, even for single encounters. Historical encounters are each documented as an Encounter Activity, with information recorded through entryRelationships within the corresponding Encounter Activity. Additional details, like free-text notes, can be conveyed through extra entryRelationships within the associated Encounter Activity.

To add a note to the Encounter, use the Note Activity entry, and link it with an entryRelationship to this new Note Activity entry template.

##### Encounter Activity

| **Entry Template**   | **Encounter Activity<br />[encounter: identifier urn:hl7ii:2.16.840.1.113883.10.20.22.4.49:2015-08-01 (open)]**    |
| ---- | ------ |
| **Template**   | [Encounter Activity](StructureDefinition-EncounterActivity.html)  |
| **Purpose**   | This clinical statement describes an interaction between a patient and clinician. Interactions may include in-person encounters, telephone conversations, and email exchanges.  |
| **ActStatus**   | No constraint specified.  |
| **Negation**   | No constraint specified.  |
| **Other Considerations**   | This template may leverage the sdtc:dischargeDispositionCode extension, which records patient discharge disposition information. It may also include data on involved practitioners, encounter locations, encounter reasons, and multiple encounter diagnoses.  |
| **Reference**   | Visit [HL7 CDA Example Search](http://hl7-c-cda-examples.herokuapp.com/sections/Encounters)  |
| **Example**   | How to represent [Outpatient Encounter with Diagnoses](http://hl7-c-cda-examples.herokuapp.com/examples/view/Encounters/Outpatient%20Encounter%20with%20Diagnoses)  |
{:.grid}
**Table 39: Encounter Activity Template**


##### Encounter Diagnosis

| **Entry Template**   | **Encounter Diagnosis<br />[act: identifier urn:hl7ii:2.16.840.1.113883.10.20.22.4.80:2015-08-01 (open)]**    |
| ---- | ------ |
| **Template**   | [Encounter Diagnosis](StructureDefinition-EncounterDiagnosis.html)  |
| **Purpose**   | This template wraps relevant problems or diagnoses at the close of a visit or that need to be followed after the visit.  |
| **ActStatus**   | Fixed to 'completed'.  |
| **Negation**   | No constraint specified.  |
| **Other Considerations**   | This template requires at least one contained Problem Observation template.  |
| **Reference**   | Visit [HL7 CDA Example Search](http://hl7-c-cda-examples.herokuapp.com/sections/Encounters)  |
| **Example**   | How to represent [Outpatient Encounter with Diagnoses](http://hl7-c-cda-examples.herokuapp.com/examples/view/Encounters/Outpatient%20Encounter%20with%20Diagnoses)  |
{:.grid}
**Table 40: Encounter Diagnosis Template**


##### Hospital Admission Diagnosis

| **Entry Template**   | **Hospital Admission Diagnosis<br />[act: identifier urn:hl7ii:2.16.840.1.113883.10.20.22.4.34:2015-08-01 (open)]**    |
| ---- | ------ |
| **Template**   | [Hospital Admission Diagnosis](StructureDefinition-HospitalAdmissionDiagnosis.html)  |
| **Purpose**   | This template represents problems or diagnoses identified by the clinician at the time of the patient’s admission.  |
| **ActStatus**   | No constraint specified.  |
| **Negation**   | Not explicitly specified.  |
| **Other Considerations**   | This Hospital Admission Diagnosis act can contain multiple Problem Observations to represent multiple diagnoses during hospital admission. The only distinction from a Hospital Discharge Diagnosis is the LOINC code in the Act.code element, which is 46241-6 for Hospital Admission Diagnosis.<br />(Hospital admission diagnosis Narrative - Reported), while Hospital Discharge Diagnosis uses LOINC code 11535-2 (Hospital discharge Dx Narrative)  |
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

| **Entry Template**   | **Hospital Discharge Diagnosis<br />[act: identifier urn:hl7ii:2.16.840.1.113883.10.20.22.4.33:2015-08-01 (open)]**    |
| ---- | ------ |
| **Template**   | [Hospital Discharge Diagnosis](StructureDefinition-HospitalDischargeDiagnosis.html)   |
| **Purpose**   | This template represents problems or diagnoses present at the time of discharge which occurred during the hospitalization or need to be monitored after hospitalization.  |
| **ActStatus**   | No constraint specified.  |
| **Negation**   | Not explicitly specified.  |
| **Other Considerations**   | This template requires at least one contained Problem Observation template. The primary difference between a Discharge Diagnosis and a Hospital Discharge Diagnosis is the LOINC code used in the Act.code element of the act wrapper. Encounter Diagnosis uses LOINC code 29308-4 (Diagnosis), while Hospital Discharge Diagnosis uses LOINC code 11535-2 (Hospital discharge Dx Narrative)  |
| **Reference**   | [Hospital Discharge Diagnosis](StructureDefinition-HospitalDischargeDiagnosis.html) |
| **Example**   | How to reference [Hospital Discharge Encounter with Billable Diagnoses](http://hl7-c-cda-examples.herokuapp.com/examples/view/Encounters/Hospital%20Discharge%20Encounter%20with%20Billable%20Diagnoses)  |
{:.grid}
**Table 42: Hospital Discharge Diagnosis Template**

#### Orders

**Fulfilled Orders**: The inFulfillmentOf/order in the document header records fulfilled orders within the [Encompassing Encounter]({{site.data.fhir.cda}}/StructureDefinition-EncompassingEncounter.html) or [Service Event]({{site.data.fhir.cda}}/StructureDefinition-ServiceEvent.html). For instance, when a provider orders an X-Ray, and it's performed, the X-Ray order identifier goes in inFulfillmentOf/order, while the performed X-Ray procedure is documented in documentationOf/ServiceEvent. In the document body, templates are used to represent the service activities fulfilling the order, such as tests, procedures, substance administrations, supplies, encounters, or other acts.

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

#### Fulfilled Order

Entry templates defined to represent performed service acts are [Intervention Act](StructureDefinition-InterventionAct.html), [Procedure Activity Procedure](StructureDefinition-ProcedureActivityProcedure.html), [Immunization Activity](StructureDefinition-ImmunizationActivity.html), [Encounter Activity](StructureDefinition-EncounterActivity.html), [Medication Activity](StructureDefinition-MedicationActivity.html), [Non-Medicinal Supply Activity](StructureDefinition-NonMedicinalSupplyActivity.html), etc. Templates types are discussed in the context of the data class used to categorize the type of service act.

#### Placed Order

Entry templates defined to represent ordered service acts such as [Planned Encounter](StructureDefinition-PlannedEncounter.html), [Planned Medication Activity](StructureDefinition-PlannedMedicationActivity.html), [Planned Observation](StructureDefinition-PlannedObservation.html), [Planned Procedure](StructureDefinition-PlannedProcedure.html), [Planned Supply](StructureDefinition-PlannedSupply.html), [Planned Act](StructureDefinition-PlannedAct.html), etc.

Templates of these types are discussed in the context of the data class used to categorize the type of service
activity. The key distinction for representing a placed order is to utilize the moodCode attribute with a value of
RQO. RQO in comes from the HL7 ActMood code system and conceptually means “requested”. It is used to represent an ordered service activity.

#### Problem

Problem information encompasses health concerns, problem concerns, and problem observations, including statements about no known allergies.

A patient's problem is represented using templates designed for health concerns, which describe health-related matters of interest, importance, or worry, derived from various EHR sources. Problem concerns are a specific subset that typically appear on a "Problem List" and are of broad interest to the care team. Other health concerns, not typically considered problem concerns, address specific issues like transportation difficulties or underinsurance. Risk concerns, like "Risk of Hyperkalemia" for a patient taking an ACE-inhibitor medication, are also identified.

Currently, the Problem Section uses the Problem Concern template for concerns on the patient's problem list. The Health Concerns section employs Health Concern and Risk Concern templates for broader concerns and risks not typically on the problem list.

Implementers face challenges when source information doesn't align with the designed clinical statement patterns, especially regarding the concern pattern because many EHR systems organize source problem data differently in the patient's record.

#### Problem Concern

| **Entry Template**   | **Problem Concern Act<br />[act: identifier urn:hl7ii:2.16.840.1.113883.10.20.22.4.3:2015-08-01 (open)]**    |
| ---- | ------ |
| **Template**   | [Problem Concern Act](StructureDefinition-ProblemConcernAct.html)  |
| **Purpose**   | This template reflects an ongoing concern on behalf of the provider who is managing the patient’s condition.  |
| **ActStatus**   | The statusCode of a concern is "active" as long as it's of interest to the provider, regardless of whether the condition is resolved. It becomes "completed" only when the condition is no longer a concern. <br />The effectiveTime reflects when the condition was concerning, which may differ from the condition's actual timeline.<br />The statusCode of the Problem Concern Act indicates the concern's status, while the effectiveTime of the nested Problem Observation specifies when the patient experienced the problem. The effectiveTime/low of the Problem Concern Act marks when the concern became active, and the effectiveTime/high indicates when it was completed, i.e., when there's no longer a need to track the condition.  |
| **Negation**   | Not explicitly specified.  |
| **Other Considerations**   | A Problem Concern Act can contain one or more Problem Observations (templateId 2.16.840.1.113883.10.20.22.4.4). In practice, most EHRs do not support this template design. See best practice guidance below for implementers who do not support problem concern tracking at this time.<br />Visit [HL7 CDA Example Search](http://hl7-c-cda-examples.herokuapp.com/sections/Problems)for representing the expression [“No Known Problems”](http://hl7-c-cda-examples.herokuapp.com/examples/view/Problems/No%20Known%20Problems)<br /> |
| **Reference**   | Visit [HL7 CDA Example Search](http://hl7-c-cda-examples.herokuapp.com/sections/Problems) |
| **Example**   | Example 37: Problem Concern containing a Problem Observation  |
{:.grid}
**Table 43: Problem Concern Template**

The following is guidance with respect to the relationship between the Problem Concern Act and the Problem Observation.

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

**Example 37: Problem Concern containing a Problem Observation**

C-CDA Examples Task Force [Problem Section entry](https://hl7-c-cda-examples.herokuapp.com/sections/Problems) examples

```

<section>
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
                        xsi:type="CD"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
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


#### Problem Observation

| **Entry Template**   | **Problem Observation<br />[observation: identifier urn:hl7ii:2.16.840.1.113883.10.20.22.4.4:2022-06-01 (open)]**    |
| ---- | ------ |
| **Template**   | [Problem Observation](StructureDefinition-ProblemObservation.html)  |
| **Purpose**   | This template reflects a discrete observation about a patient's problem.  |
| **ActStatus**   | This template always has a statusCode of “completed”.<br />The effectiveTime, also referred to as the “clinically relevant time” is the time at which the observation holds true for the patient. For a provider seeing a patient in the clinic today, observing a history of heart attack that occurred five years ago, the effectiveTime is five years ago. The effectiveTime of the Problem Observation is the definitive indication of when the problem occurred. If the problem is known to be resolved, then an effectiveTime/high would be present. If the date of resolution is not known, then effectiveTime/high will be present with a nullFlavor of "UNK". |
| **Negation**   | In this template, the negationInd attribute is used to indicate the absence of the condition in observation/value (Observation.ValueNegationInd).  |
| **Other Considerations**   | The optional Problem Status Observation template (identifier: urn:oid:2.16.840.1.113883.10.20.22.4.6) represents a clinical judgement of the status of the problem.<br /> negationInd of "true" coupled with an observation/value of SNOMED code 55607006 "Problem" indicates that the patient has [no known conditions](http://hl7-c-cda-examples.herokuapp.com/examples/view/Problems/No%20Known%20Problems).  |
| **Example**   | Example 37: Problem Concern containing a Problem Observation |
| **Example**   | Example 38: No Known Problems  |
{:.grid}
**Table 44: Problem Observation Template**


**Example 38: No Known Problems**
```
<section>
    <templateId root="2.16.840.1.113883.10.20.22.2.5.1"/>
    <!-- Problem Section -->
    <templateId root="2.16.840.1.113883.10.20.22.2.5.1" extension="2015-08- 01"/>
    <!-- Problem Section -->
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

#### Health Concern, Risk Concern

A health concern signifies interest or worry about a health state, possibly requiring attention. It's a health-related matter of importance to the patient, family, or healthcare provider, derived from various EHR sources. Problem Concerns are a subset of Health Concerns, specifically those on the patient's "Problem List."

A Health Concern Act tracks suboptimal physical or psychological situations drawing the patient to healthcare. If the underlying condition remains of concern, the statusCode is "active"; it switches to "completed" when it's no longer a concern. The effectiveTime marks when the condition became concerning, not necessarily corresponding to the condition's timeline. Health concerns guide interventions to achieve care goals.

A Risk Concern Act represents potential health issues needing intervention. It's derived similarly to Health Concerns but carries different semantics with Act.code. The templates are otherwise identical, following implementer best practices for Health Concerns.

In summary, Health Concerns express health-related worries, Problem Concerns are those on the Problem List, and Risk Concerns address potential issues requiring attention, all tracked with similar templates.

| **Entry Template**   | **Health Concern<br />[act: identifier urn:hl7ii:2.16.840.1.113883.10.20.22.4.132:2022-06-01 (open)]**    |
| ---- | ------ |
| **Template**   | [Health Concern Act](StructureDefinition-HealthConcernAct.html)  |
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

The Allergy Concern template groups multiple allergy intolerance observations into one concern. It represents patient allergies or intolerances that may need attention, intervention, or management and is typically used for items on the patient's allergy list. The Allergy Concern Act template serves as a wrapper for the underlying Allergy - Intolerance Observations.


| **Entry Template**   | **Allergy Concern Act<br />[act: identifier urn:hl7ii:2.16.840.1.113883.10.20.22.4.30:2015-08-01 (open)]**    |
| ---- | ------ |
| **Template**   | [Allergy Concern Act](StructureDefinition-AllergyConcernAct.html)  |
| **Purpose**   | This template reflects an ongoing concern on behalf of the provider who is managing the patient’s care.  |
| **ActStatus**   | So long as the underlying allergy or intolerance is of ongoing concern and interest to the provider, the statusCode of the concern is “active”. Only when the underlying allergy or intolerance is no longer of concern is the statusCode of the Allergy Concern Act set to “completed.”<br />The effectiveTime reflects the time that the underlying allergy or intolerance was felt to be a concern; it may or may not correspond to the effectiveTime of the observation associated with the actual allergic reaction experienced by the patient.<br />The statusCode of the Allergy Concern Act is the status of the concern, whereas the effectiveTime of the nested Allergy - Intolerance Observation tells when the allergy or intolerance was experienced by the patient. The effectiveTime/low of the Allergy Concern Act asserts when the concern became active. The effectiveTime/high asserts when the concern was completed (e.g., when the clinician deemed there is no longer any need to track the underlying allergy or intolerance).  |
| **Negation**   | Not explicitly specified.  |
| **Other Considerations**   | An Allergy Concern Act can contain one or more Allergy - Intolerance Observations (templateId .16.840.1.113883.10.20.22.4.7). In practice, most EHRs do not support this template design. See best practice guidance below for implementers who do not support allergy concern tracking at this time.<br />Visit [HL7 CDA Example Search](http://hl7-c-cda-examples.herokuapp.com) for representing the expression “No Known Allergies”, [“No Known Medication Allergies”](http://hl7-c-cda-examples.herokuapp.com/examples/view/Allergies/No%20Known%20Medication%20Allergies).  |
| **Example**   | Example 40: Allergy concern for food allergy to eggs |
| **Example**   | Example 41: No known allergies |
| **Example**   | Visit [HL7 CDA Example Search](http://hl7-c-cda-examples.herokuapp.com/) for additional examples showing allergies to specific medication. |
{:.grid}
**Table 46: Allergy Concern Template**

This guidance for allergy concerns is needed because mismatches between clinical statement patterns and source information pose challenges for implementers. Many EHR systems don't organize allergy data in this manner, creating implementation difficulties.


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

**Example 40: Allergy concern for food allergy to eggs**
Please see the Example Task Forces [Allergy Examples](https://hl7-c-cda-examples.herokuapp.com/sections/Allergies)
```
<section>
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
    <!-- *** Allergies and Intolerances Section *** -->
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

This guidance for allergy observations is needed because mismatches between clinical statement patterns and source information pose challenges for implementers. Many EHR systems don't organize allergy data in this manner, creating implementation difficulties.

| **Entry Template**   | **Allergy - Intolerance Observation<br />[observation: identifier urn:hl7ii:2.16.840.1.113883.10.20.22.4.7:2014-06-09 (open)]**    |
| ---- | ------ |
| **Template**   | [Allergy - Intolerance Observation](StructureDefinition-AllergyIntoleranceObservation.html)  |
| **Purpose**   | This template reflects a discrete observation about a patient's allergy or intolerance.  |
| **ActStatus**   | This is a discrete observation documented with a "completed" statusCode.<br />The effectiveTime, or clinically relevant time, indicates when the observation holds true for the patient. For instance, if a provider notes a penicillin allergy history from five years ago during a current clinic visit, the effectiveTime is five years ago. It serves as the definitive indication of when the allergy-intolerance occurred. If resolved, an effectiveTime/high is present; if ongoing, it's not.  |
| **Negation**   | In this template, the negationInd attribute is used to indicate the absence of the allergy in observation/value (Observation.ValueNegationInd).  |
| **Other Considerations**   | The optional Allergy Status Observation template (identifier: urn:oid:<br />2.16.840.1.113883.10.20.22.4.28 )signifies the status of the allergy-intolerance.<br />Within the Allergy-Intolerance Observation, there is a Reaction Observation detailing the associated reaction, including its severity. Additionally, a Criticality Observation is included to indicate the seriousness of the allergy-intolerance, with possible values being high, low, or unable to assess criticality. Visit [HL7 CDA Example Search](https://hl7-c-cda-examples.herokuapp.com/examples/view/Allergies/No%20Known%20Allergies) for representing the expression “No Known Allergies. A negationInd of "true" coupled with an observation/value of SNOMED code 41919907. <br />"Allergy to substance (disorder)" indicates that the patient has no known allergies. |
| **Example**   | Example 42: Recording an allergy that started in January of 2009, but became a tracked concern as of January 4, 2014 |
| **Example**   | Example 43: Updating an allergy that is no longer a concern |
| **Example**   | Visit [HL7 CDA Example Search](http://hl7-c-cda-examples.herokuapp.com/sections/Allergies) for additional examples for allergies |
{:.grid}


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

During an encounter, if a patient's record was updated to indicate that a penicillin allergy/intolerance concern noted one month ago, relating to an event five years ago, is no longer a concern, the CDA document would show:

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

#### Implanted Device

Each implanted device can be represented in an Individual Procedure Activity Procedure template. 

Implanted devices can also go in a Medical Equipment Organizer template. Adding device info in procedure details doesn't replace listing it in the Medical Equipment section. Each part of the Medical Equipment Organizer has a Procedure Activity Procedure template.

UDI information is essential for interoperability. Content Creators should use a UDI Organizer in a Procedure Activity Procedure to represent parsed universal identifier data for implanted devices. Content Consumers should process this info when received

| **Entry Template**   | **Procedure Activity Procedure<br/>[procedure: identifier urn:hl7ii:2.16.840.1.113883.10.20.22.4.14:2014-06-09 (open)]**    |
| ---- | ------ |
| **Template**   | [Procedure Activity Procedure](StructureDefinition-ProcedureActivityProcedure.html)  |
| **Purpose**   | This template is used to represent any type of procedure from a surgical procedure to an education session . It may be used with a contained Product Instance template to represent a device implanted in or on a patient. In this case, targetSiteCode is used to record the location of the device in or on the patient's body.  |
| **ActStatus**   | This template has a state model with states: active, completed, aborted, and cancelled. When documenting an implanted medical device, use statusCode "completed."<br />The effectiveTime, or clinically relevant time, represents when the procedure was performed, indicating when the device was implanted. Best practice is to use the TS data type to record a single point in time for the implantation.|
| **Negation**   | In this template, the negationInd attribute is used to indicate the procedure was not performed.  |
| **Other Considerations**   | A Product Instance template is used template represents a specific device used in a patient or procedure.<br />For device removal, use a separate Procedure Activity Procedure template with the device removal code. Use TS data type to record the removal time and link it to the original implant procedure using the [Entry Reference template](StructureDefinition-EntryReference.html).<br />To indicate a procedure was not performed, you may use the Indication template to explain the rationale. Multiple indication templates can be in a Procedure template.


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

**Example 45: **
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
                <!-- Procedure Activity Procedure -->
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

#### Non-Implanted Device

Non-implanted devices are represented with the Non-Medicinal Supply Activity template. This template is used to
represent devices the patient has such as eyeglasses or a cane.

| **Entry Template**   | **Non-Medicinal Supply<br/>[organizer: identifier urn: : hl7ii:2.16.840.1.113883.10.20.22.4.50:2014-06-09 (open)] )]**    |
| ---- | ------ |
| **Template**   | [Non-Medicinal Supply Activity](StructureDefinition-NonMedicinalSupplyActivity.html) |
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

#### Product Instance

The Product Instance template is used to represent a particular device that was placed in a patient or used as part
of a procedure or other act.

| **Entry Template**   | **Product Instance [participantRole: identifier urn:oid:2.16.840.1.113883.10.20.22.4.37]**    |
| ---- | ------ |
| **Template**   | [Product Instance](StructureDefinition-ProductInstance.html) |
| **Purpose**   | This template is used to record the identifier and other details about the given product that was used. For example, it is important to have a record that indicates not just that a hip prostheses was placed in a patient but that it was a particular hip prostheses number with a unique identifier.  |
| **ActStatus**   | Not applicable. |
| **Negation**   | Not applicable.  |
| **Other Considerations**   | The FDA Amendments Act specifies the creation of a Unique Device Identification (UDI) System that requires the label of devices to bear a unique identifier that will standardize device identification and identify the device through distribution and use. |
| **Example**   | Example 44: Implanted Device – known procedure details |
| **Example**   | Example 47: Non-Medicinal Supply – Cane and Eyeglasses |
{:.grid}
**Table 50: Product Instance Template**

#### Unique Device Identifiers

A Unique Device Identifier (UDI) is used to identify a device.

| **Entry Template**   | **UDI Organizer<br/>[organizer: identifier urn:hl7ii:2.16.840.1.113883.10.20.22.4.312:2019-06-21 (open)]**    |
| ---- | ------ |
| **Template**   | [UDI Organizer](StructureDefinition-UDIOrganizer.html) |
| **Purpose**   | This template is used to manage all the UDI-related templates to exchange the parsed UDI data elements and associated metadata including: device manufacturer, lot or batch number, serial number, manufacturing date, expiration date, distinct identification code, brand name, and model number, catalog number, company name, MRI safety, latex safety, and implantable device status.  |
| **ActStatus**   | The statusCode for the organizer is not specified.<br/>The effectiveTime element for the organizer is not specified. This template only conveys information about the UDI identifiers associated with a device. |
| **Negation**   | Not specified.  |
| **Other Considerations**   | Only the device manufacturer information is required in this template. All other component observations are optional.<br/><br/>If the implantable device status information is included, it SHALL contain one of following values from the NCI Thesaurus Code System (2.16.840.1.113883.3.26.1.1):<br/>- Active (C45329)<br/>- Inactive (C154407)<br/>- Malfunctioning (C122711)<br/>- Reduced Function (C160942)<br/><br/>From the value set identified with OID 2.16.840.1.113762.1.4.1021.48 |
| ** Reference**  | [Product Instance](StructureDefinition-ProductInstance.html), [UDI Organizer](StructureDefinition-UDIOrganizer.html), [Device Identifier Observation](StructureDefinition-DeviceIdentifierObservation.html)|
| ** Reference**  | See [UDI Organizer](StructureDefinition-UDIOrganizer.html)for guidance on how to include an entryRelationship (typeCode=”COMP”) to reference a UDI Organizer containing the parsed components of the UDI identifier. The parsed components in the UDI Organizer shall align with the full UDI in the Product Instance. |
| **Example**   | [C-CDA Excamples Task Force Medical Equipment Section Examples](http://cdasearch.hl7.org/sections/Medical%20Equipment) |
{:.grid}
**Table 51: Unique Device Identifiers Template**

#### Goal

The C-CDA Goal Observation entry template is designed to represent three different types of goals: patient goals,
provider goals, and shared goals. The semantics to indicate if a goal is a patient, provider, or shared goal is
represented in the author structure of the entry. The [Progress Toward Goal observation](StructureDefinition-ProgressTowardGoalObservation.html)is designed to sit inside the Goal and Outcome Observations to track the progress towards reaching a goal.

##### Goal Observation

| **Entry Template**   | **Goal Observation<br/>[observation: identifier urn:oid:2.16.840.1.113883.10.20.22.4.121:2022-06-01 (open)]**    |
| ---- | ------ |
| **Template**   | [Progress Toward Goal Observation](StructureDefinition-ProgressTowardGoalObservation.html)  |
| **Purpose**   | This template represents a patient health goal. A Goal Observation template may have related components that are acts, encounters, observations, procedures, substance administrations, or supplies.<br />A goal may be a patient or provider goal. If the author is set to the recordTarget (patient), this is a patient goal. If the author is set to a provider, this is a provider goal. If both patient and provider are set as authors, this is a negotiated goal.<br />A goal usually has a related health concern and/or risk.<br />A goal may have components consisting of other goals (milestones). These milestones are related to the overall goal through entryRelationships.  |
| **ActStatus**   | Currently bound to the single concept of “active”. This has been reported as a limitation that needs to be addressed. |
| **Negation**   | Not explicitly specified.  |
| **Other Considerations**   | This template current provides no guidance on what should be populated in the value element. A comment has been made against the design to request greater guidance be provided regarding the use of the value element in the design of the template.<br />This template allows for multiple author participations ([0..*]).<br />If the author is the recordTarget (patient), this is a patient goal. If the author is a provider, this is a provider goal. If both patient and provider are authors, this is a negotiated goal. If no author is present, it is assumed the document or section author(s) is the author of this goal. |
| **Example**   | C-CDA R2.1 Figure 154 Goal Observation Example |
{:.grid}
**Table 52: Goal Observation Template**
[Example task Force Goal examples](https://hl7-c-cda-examples.herokuapp.com/sections/Goals)
**Example 48: Goal Observation narrative**
```
<section>
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

#### Social History

The Social History Observation template is a general template designed to represent a full range of social history
observations. The Social History Observation Template has been updated to leverage Gravity Value Sets covering
multiple social risk domains. See the [Screening And Assessments](screeningandassessments.html) page.

The Social History Observation template remains open to represent any SDOH observation related to conditions in
which people live, learn, work, and play even if not defined in the [Social Determinants of Health Conditions Value
Set](https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1196.788/expansion) or in a specific template.


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

| **Entry Template**   | **Social History Observation<br/>[observation: identifier urn:hl7ii:2.16.840.1.113883.10.20.22.4.38:2022-06-01 (open)]**    |
| ---- | ------ |
| **Template**   | [Social History Observation](StructureDefinition-SocialHistoryObservation.html) |
| **Purpose**   | This template represents a patient's occupations, lifestyle, and environmental health risk factors. Demographic data (e.g., marital status, race, ethnicity, religious affiliation) are captured in the header.  |
| **ActStatus**   | This template always has a statusCode of “completed.”<br />This template does not include specific guidance about the meaning of the effectiveTime element. As an observation, the effectiveTime is the time at which the observation holds true for the patient. |
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

#### Smoking Status

<table
    style="border-collapse:collapse;margin-left:24.01pt"
    cellspacing="0">
    <tr style="height:29pt">
        <td
          style="width:468pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"
          bgcolor="#C5D9F0"><p class="s19"
          style="padding-left: 41pt;padding-right: 8pt;text-indent: 0pt;text-align: left;"
          >C-CDA Content Creators SHALL NOT use the Smoking
          Status– Meaningful Use template to represent
          when the current smoking status started.
          <b>[BP-088]</b></p></td>
    </tr>
</table>

| **Entry Template**   | **Smoking Status – Meaningful Use<br/>[observation: identifier urn:hl7ii:2.16.840.1.113883.10.20.22.4.78:2014-06-09 (open)]**    |
| ---- | ------ |
| **Template**   | [Smoking Status – Meaningful Use](StructureDefinition-SmokingStatusMeaningfulUse.html)  |
| **Purpose**   | This template represents the current smoking status of the patient as specified in Meaningful Use (MU) Stage 2 requirements.  |
| **ActStatus**   | This template always has a statusCode of “completed.”<br />This template represents a "snapshot in time" observation. It reflects the patient's smoking status at the time the observation is made. As a result, the effectiveTime is constrained to a time stamp that approximately corresponds with the author/time. |
| **Negation**   | Not explicitly specified.  |
| **Other Considerations**   | This template requires use of the following range of possible answers:<br />- Never smoked tobacco<br />- Occasional tobacco smoker<br />- Ex-smoker<br />- Heavy tobacco smoker<br />- Smokes tobacco daily<br />- Smoker<br />- Light tobacco smoker<br />- Tobacco smoking consumption unknown<br />Best practice implementation guidance allows alternate answers to be used.<br /><br />Within the Social History Section of a document there can be more than one Smoking Status observation recorded. The person’s “current” smoking status may have been recorded at several different points in time. |
| **Example**   | Example 50: Unknown Smoking Status |

{:.grid}
**Table 54: Smoking Status**

**Example 50:**
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


#### Tobacco Use

<table
    style="border-collapse:collapse;margin-left:24.01pt"
    cellspacing="0">
    <tr style="height:29pt">
        <td
          style="width:468pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"
          bgcolor="#C5D9F0"><p class="s19"
          style="padding-left: 41pt;padding-right: 9pt;text-indent: 0pt;text-align: left;"
          >C-CDA Content Creators SHALL use the Tobacco Use
          template to describe dates associated with
          the patient&#39;s tobacco use over time.
          <b>[BP-089]</b></p></td>
    </tr>
</table>

| **Entry Template**   | **Tobacco Use<br/>[observation: identifier urn:hl7ii:2.16.840.1.113883.10.20.22.4.85:2014-06-09 (open)]**    |
| ---- | ------ |
| **Template**   | [Tobacco Use](StructureDefinition-TobaccoUse.html)  |
| **Purpose**   | This template contains information that describes a patient's tobacco use over time.  |
| **ActStatus**   | This template always has a statusCode of “completed.”<br />The effectiveTime element is used to describe dates associated with the patient's tobacco use. It represents the clinically relevant time of the observation about the patient’s tobacco use. |
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

#### Birth Sex

This observation represents the biological sex assigned to the patient at birth. This observation often reflects the sex that is entered on the person's birth certificate at time of birth.

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
| **Template**   | [Birth Sex Observation](StructureDefinition-BirthSexObservation.html) |
| **Purpose**   | This observation represents the sex of the patient at birth. It is often the sex that is entered on the person's birth certificate at time of birth.  |
| **ActStatus**   | This template always has a statusCode of “completed.” |
| **Negation**   | Not explicitly specified.  |
| **Other Considerations**   | This observation is intended to be used in the Social History section.<br />This observation is not appropriate for recording patient gender (administrativeGender). The patient’s administrative gender is recorded in the header of the document using the recordTarget.administrativeGender element. |
| **Example**   | Example 52: Birth Sex |
{:.grid}
**Table 56: Birth Sex Template**

**Example 52: Birth Sex**
```
<!-- Birth Sex Entry -->
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


#### Pregnancy Status

The Pregnancy Observation is used to represent a person’s pregnancy status over time. It is a type of social history
observation and can included in the Social History Section. For communicating more detailed observations related
to an individual’s pregnancy status, implementers can also consider utilizing the templates in the [HL7 CDA® R2
Implementation Guide: C-CDA R2.1 Supplemental Templates for Pregnancy Status, Release 1 - US Realm](http://www.hl7.org/implement/standards/product_brief.cfm?product_id=494).

| **Entry Template**   | **Pregnancy Observation<br/>[observation: identifier urn:oid:2.16.840.1.113883.10.20.15.3.8 (open)]**    |
| ---- | ------ |
| **Template**   | [Pregnancy Observation](StructureDefinition-PregnancyObservation.html) |
| **Purpose**   | This template contains information that describes a patient's pregnancy status over time.  |
| **ActStatus**   | This template always has a statusCode of “completed.”<br />The effectiveTime element is used to describe dates associated with the patient's different pregnancy statuses over time. It represents the clinically relevant time of the observation about the patient’s pregnancy status. |
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

Pathology is the superset domain that encompasses several subdisciplines: anatomic pathology, chemical pathology, clinical pathology, forensic pathology, genetic pathology, hematology, immunopathology,etc.[Pathology Tests Definition](https://www.betterhealth.vic.gov.au/health/conditionsandtreatments/Blood-and-pathology-tests)
Therefore, a laboratory test is a type of pathology test.

##### Result Organizer

This template provides a mechanism for grouping result observations. It contains information applicable to all of
the contained result observations. If any Result Observation within the organizer has a statusCode of "active", the Result Organizer must also have a statusCode of "active."

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
                <tr style="height:37pt">
        <td
          style="width:468pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"
          bgcolor="#C5D9F0"><p class="s19"
          style="padding-left: 41pt;padding-right: 5pt;text-indent: 0pt;text-align: left;"
          >The Result Organizer should contain at least one Result Observation <b>[BP-092]</b></p></td>
    </tr>
</table>

| **Entry Template**   | **Result Organizer<br/>[organizer: identifier urn:hl7ii:2.16.840.1.113883.10.20.22.4.1:2015-08-01 (open)]**    |
| ---- | ------ |
| **Template**   | [Result Organizer](StructureDefinition-ResultOrganizer.html)  |
| **Purpose**   | This template provides a mechanism for grouping result observations. It contains information applicable to all of the contained result observations.  |
| **ActStatus**   | If any Result Observation within the organizer has a statusCode of "active", the Result Organizer must also have a statusCode of "active".<br />The range of time specified in the Result Organizer/effectiveTime element should encompass the lowest effectiveTime/low and the highest effectiveTime/high for the Result Observations within the organizer. |
| **Negation**   | Not specified.  |
| **Other Considerations**   | If the Author Participation template is specified for the Organizer, this context applies to all the component observations unless a component observation includes a different Author Participation template.) |
| **Example**   | Example 56: Result Organizer for CBC W Auto Differential panel - Blood |
{:.grid}
**Table 58: Result Organizer Template**

**Example 56: Result Organizer for CBC W Auto Differential panel - Blood**

C-CDA Example Task Force [Result Section](https://hl7-c-cda-examples.herokuapp.com/sections/Results) examples
```
<section>
    <!-- Results Section -->
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
            <!-- ** Result organizer ** -->
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
                    <!-- ** Result observation ** -->
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

#### Result Observation

| **Entry Template**   | **Result Observation<br/>[observation: identifier urn:hl7ii:2.16.840.1.113883.10.20.22.4.2:2023-05-01 (open)]**    |
| ---- | ------ |
| **Template**   | [Result Observation](StructureDefinition-ResultObservation.html) |
| **Purpose**   | This template represents the results of a laboratory, radiology, or other study performed on a patient.  |
| **ActStatus**   | The result observation includes a statusCode to allow recording the status of an observation. “Pending” results (e.g., a test has been run but results have not been reported yet) should be represented as “active” ActStatus.<br />The effectiveTime element represents the clinically relevant time of the measurement (e.g., the time a blood pressure reading is obtained, the time the blood sample was obtained for a chemistry test). |
| **Negation**   | Not specified. To indicate that a test was not performed use the Procedure Activity Procedure template with the negationInd attribute of “true.”<br />|
| **Other Considerations**   | If the Author Participation template is specified for the Organizer, this context applies to all the component observations unless a component observation includes a different Author Participation template.<br />If any Result Observation within the organizer has a statusCode of "active," the Result Organizer must also have a statusCode of "active." The range of time specified in the Result Organizer/effectiveTime element should encompass the lowest effectiveTime/low and the highest effectiveTime/high for the Result Observations within the organizer. |
| **Example**   | Example 56: Result Organizer for CBC W Auto Differential panel - Blood |
{:.grid}
**Table 59: Result Observation Template**

#### Vital Signs

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

| **Entry Template**   | **Vital Signs Organizer<br/>[organizer: identifier urn:hl7ii:2.16.840.1.113883.10.20.22.4.26:2015-08-01 (open)]**    |
| ---- | ------ |
| **Template**   | [Vital Signs Organizer](StructureDefinition-VitalSignsOrganizer.html) |
| **Purpose**   | This template provides a mechanism for grouping vital signs (e.g., grouping systolic blood pressure and diastolic blood pressure, BMI, body height, body weight).  |
| **ActStatus**   | A Vital Signs Organizer SHALL have a statusCode of "completed".<br />The effectiveTime may be a timestamp or an interval that spans the effectiveTimes of the contained vital signs observations. |
| **Negation**   | Not specified. |
| **Other Considerations**   | If the Author Participation template is specified for the Organizer, this context applies to all the component observations unless a component observation includes a different Author Participation template.|
| **Example**   | Example 57: Vital Signs Organizer |
{:.grid}
**Table 60: Vital Signs Organizer Template**
C-CDA Examples Task Force [Vital Sign Section examples](https://hl7-c-cda-examples.herokuapp.com/sections/Vital%20Signs)
**Example 57: Vital Signs Organizer**

```
<section>
    <!-- This section shows an example of rendering information in the correct local time, which
recording it in the discrete data using a UTC offset. -->
    <!-- Note that in June, UTC offset -0500 is Central time. and Eastern Timezone is the local
time for this example. -->
    <templateId root="2.16.840.1.113883.10.20.22.2.4.1"/>
    <templateId root="2.16.840.1.113883.10.20.22.2.4.1" extension="2015- 08 - 01"/>
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

| **Entry Template**   | **Vital Sign Observation<br/>[observation: identifier urn:hl7ii:2.16.840.1.113883.10.20.22.4.27:2014-06-09 (open)]**    |
| ---- | ------ |
| **Template**   | [Vital Sign Observation](StructureDefinition-VitalSignObservation.html)  |
| **Purpose**   | This template represents measurements of common vital signs.  |
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

**Example 60: Planned Medication**
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

C-CDA Examples Task Force [Medication Examples](https://hl7-c-cda-examples.herokuapp.com/sections/Medications)

#### Immunization

##### Recording Immunization Date

When recording an actual immunization (with moodCode = EVN), the effectiveTime represents when the
immunization was given, and this will generally just be a single dateTime value. Most of the time, when recording
the immunization date, the effectiveTime element should contain just a single @value. However, there is a use
case for using an interval when requesting an immunization, i.e. have this immunization done between date 1 and
date 2.

C-CDA Examples Task Force [Immunization Examples](https://hl7-c-cda-examples.herokuapp.com/sections/Immunizations)
```
<section>
    <!-- Immunizations section -->
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


#### Immunization Status Code

When recording the immunization status code, the normal value would be “completed”, as this represents an
immunization that has been completely given. In extremely rare circumstances, a status of “active” could be used.
The use of ”active” implies that a single immunization is still on-going. This would not be appropriate for one shot
in a series of immunizations. Series immunizations should be represented with multiple Immunization Activity entries.

#### Procedure

Historically, C-CDA, up to version 2.1, aligned with the HL7 v3 RIM definition of a procedure as an act that alters the physical condition of the subject. It defined three procedure types using the Observation and Act classes for procedures that do not alter the subject's physical condition. Industry uses the procedure template design regardless of procedure type, which is contained in C-CDA as the Procedure Activity Procedure Template. This template records current and historical procedures performed on or for a patient, encompassing various activities like surgical, diagnostic, endoscopic procedures, counseling, physiotherapy, and more. These procedures can be performed by healthcare professionals, service providers, friends or relatives, or even the patients themselves.

##### Procedure

<table
    style="border-collapse:collapse;margin-left:24.01pt"
    cellspacing="0">
    <tr style="height:49pt">
        <td
          style="width:468pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"
          bgcolor="#C5D9F0"><p class="s19"
          style="padding-left: 41pt;padding-right: 28pt;text-indent: 0pt;text-align: left;"
          >When representing that a procedure was not
          performed, the Indication (identifier:
          urn:hl7ii:2.16.840.1.113883.10.20.22.4.19:2023-05-01
          template MAY be used to represent the rationale
          for not performing the procedure. More than one
          indication template may be contained within a Procedure template<b>.
          [BP-095]</b></p></td>
    </tr>
</table>

| **Entry Template**   | **Procedure Activity Procedure<br />[procedure: identifier urn:hl7ii:2.16.840.1.113883.10.20.22.4.14:2022-06-01 (open)]**    |
| ---- | ------ |
| **Template**   | [Procedure Activity Procedure](StructureDefinition-ProcedureActivityProcedure.html) |
| **Purpose**   | This template records current and historical procedures performed on or for a patient, encompassing various activities like surgical, diagnostic, endoscopic procedures, counseling, physiotherapy, and more. These procedures can be performed by healthcare professionals, service providers, friends or relatives, or even the patients themselves. |
| **ActStatus**   | The template includes a state model that includes active, completed, aborted, and cancelled.<br />The effectiveTime, also referred to as the “clinically relevant time” is the time at which the procedure was performed. If the status of a procedure was active at the time a C-CDA document was created, the effectiveTime/low would indicate the date/time the procedure was started and the effectiveTime/high SHOULD not be present. If the status of a procedure was completed, aborted or cancelled, the effectiveTime/high SHOULD be populated. Implementer best practice would be use of the TS_IVL data type. For implementers who are not able to represent a time interval, effectiveTime/value MAY be populated. |
| **Negation**   | In this template, the negationInd attribute is used to indicate the procedure was not performed. |
| **Other Considerations**   | When representing that a procedure was not performed, the<br />Indication (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.4.19:2014-06-09 template MAY be used to represent the rationale for not performing the procedure. More than one indication template may be contained within a Procedure template. |
| **Example**   | How to represent [Procedure Activity Procedure](http://hl7-c-cda-examples.herokuapp.com/sections/Procedures) |
{:.grid}



#### Assessment

An assessment is a collection of observations that together yield a summary evaluation of a particular condition.
Examples include the Braden Scale (assesses pressure ulcer risk), APACHE Score (estimates mortality in critically ill
patients), Mini-Mental Status Exam (assesses cognitive function), APGAR Score (assesses the health of a newborn),
and Glasgow Coma Scale (assesses coma and impaired consciousness). This template is
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

| **Entry Template**   | **Assessment Scale Observation<br />[observation: identifier urn:oid:2.16.840.1.113883.10.20.22.4.69:2022-06-01 (open)]**    |
| ---- | ------ |
| **Template**   | [Assessment Scale Observation](StructureDefinition-AssessmentScaleObservation.html) |
| **Purpose**   | An assessment scale is a collection of observations that together yield a summary evaluation of a particular condition.  |
| **ActStatus**   | This template always has a statusCode of “completed”.<br />The effectiveTime represents the clinically relevant time of the measurement, which may be when the assessment was performed. |
| **Negation**   | Not specified. |
| **Other Considerations**   | The observation/value element represents the “answer” or result for the assessed “question” or measurement. The clinical statement may also include an interpretation and may include multiple reference ranges. Additionally, each assessment scale observation may contain zero or more Assessment Scale Supporting Observations. This structure allows the Assessment Scale Observation to mirror the format of many assessment tools. An Assessment Scale Supporting Observation represents the components of a scale used in an Assessment Scale Observation. The individual parts that make up the component may be a group of cognitive or functional status observations. |
| **Example**   | [PHQ-9](https://cdasearch.hl7.org/examples/view/Mental%20Status/Patient%20Health%20Questionnaire%20PHQ-9) |
| **Example**   | [WE CARE](https://hl7-c-cda-examples.herokuapp.com/examples/view/Social%20History/WE%20Care%20Assessment) |
| **Example**   | [Glasgow Coma](https://hl7-c-cda-examples.herokuapp.com/examples/view/Functional%20Status/Functional%20Assessment%20-%20Glasgow%20Coma) |
{:.grid}
**Table 64: Assessment Scale Observation Template**


#### Clinical Note

Note Activity entries provide structured information for notes found in a Notes Section or designated sections in clinical note documents, making the human-readable narrative notes more machine-processable.

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
| **Template**   | [Note Activity ](StructureDefinition-NoteActivity.html) |
| **Purpose**   | The Note Activity represents a clinical note.  |
| **ActStatus**   | This itemplate always has a statusCode of “completed.”<br />The effectiveTime represents the clinically relevant time of note, which may be when the note was written. |
| **Negation**   | Not specified. |
| **Other Considerations**   | Similar to Comment Activity, Note Activity allows for specific coding of note content, ensuring relevance to the document's message. It can augment data in a related standard C-CDA entry using entryRelationship, such as adding it to a Procedure Activity Procedure or an Encounter Activity in the Encounters Section. The Note Activity template can also stand alone in a C-CDA section (e.g., a note about procedures in the Procedures Section) or enhance a narrative-only section like Hospital Course. When the data type is unknown or no single section fits, place the Note Activity in a general Notes Section, such as a free-text consultation note or one with subjective, objective, assessment, and plan information combined. The examples below illustrate various clinical note representations using the Note Activity template.|
{:.grid}
**Table 65: Note Activity Template**

**Example 63: Note Activity as entryRelationship to C-CDA Entry.**
```
<?xml version="1.0" encoding="UTF-8"?>
<section>
    <!-- C-CDA Procedures Section -->
    <templateId root="2.16.840.1.113883.10.20.22.2.7.1"/>
    <templateId root="2.16.840.1.113883.10.20.22.2.7.1" extension="2015-08-01"/>
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
    <!-- C-CDA Procedures Section -->
    <templateId root="2.16.840.1.113883.10.20.22.2.7.1" extension="2014-06-09"/>
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

In addition to the entry templates defined in the [Advance Directive Section](StructureDefinition-AdvanceDirectivesSection.html). Additional Advance Directive C-CDA compatible templates from [HL7 CDA® R2 Implementation Guide: C-CDA R2.1; Advance Directives Templates, Release 1 ](https://www.hl7.org/implement/standards/product_brief.cfm?product_id=473), or newer versions of this Advance Directive guide, may be used in C-CDA documents.


<table
    style="border-collapse:collapse;margin-left:18.61pt"
    cellspacing="0">
    <tr style="height:29pt">
        <td
            style="width:468pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"
                bgcolor="#C5D9F0"><p class="s19"
                style="padding-left: 41pt;padding-right: 8pt;text-indent: 0pt;text-align: left;"
                >C-CDA Content Creators MAY use templates
                and template versions from HL7 CDA® R2 Implementation Guide: C-CDA R2.1; Advance Directives Templates, Release 1 or newer versions for representing Advance
                Directive information. <b>[BP-098]</b></p></td>
    </tr>
</table>


#### Indictations and Reasons
##### Use of Indication Versus Reason Templates

In certain situations, clinicians need to record why something was or was not done. C-CDA provides three
methods to record this information:

- [Indication](StructureDefinition-Indication.html) is used to represent the rationale for an action such as an encounter, a medication administration, or a procedure. 
- [Reason](StructureDefinition-Reason.html) is use to provide the rationale for why something was not done.
- [Immunization Refusal Reason](StructureDefinition-ImmunizationRefusalReason.html) is used to represent the rationale for the patient declining an immunization as the value set is crafted for the immunization use case.