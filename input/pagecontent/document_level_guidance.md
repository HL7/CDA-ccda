The C-CDA Companion Guide provides additional guidance aimed at increasing consistency in the way data in C-
CDA document templates are represented and used across all implementations. The goal is to increase awareness
about how to use the HL7 CDA and C-CDA standards to meet rising expectations and emerging regulations focused
on expanding interoperability.

This chapter provides generalized document header guidance and additional guidance for specific types of C-CDA
documents.

### Reusable, Nesting Templates

C-CDA establishes two document header templates. These header templates establish consistent rules for
populating the data elements in a C-CDA document header. Document header elements create context for the
information contained in the body of the document.

The US Realm General Header is used for documents that are authored by clinicians and systems supporting
clinicians, and the US Realm Patient Generated Header is used for documents that are authored by patients and
systems supporting patients.


<table
                            style="border-collapse:collapse;margin-left:24.01pt" cellspacing="0">
                            <tr style="height:37pt">
                                <td
                                    style="width:462pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"
                                        bgcolor="#C5D9F0"><p class="s19"
                                        style="padding-left: 41pt;text-indent: 0pt;text-align: left;"
                                        >Each document template defined in C-CDA R2.1 indicates the
                                        header template that the document is expected to conform to,
                                        and each MAY include additional header constraints that are
                                        relevant to the type of clinical note being represented in the document.
                                            <b>[BP-028]</b></p></td>
                            </tr>
                        </table>
                        
Additionally, document templates define the sections of content that SHALL, SHOULD, or MAY be present for
exchanging clinical notes. Each section is identified with a code that tells the computer the type of information in
the section.

Further, the sections define entry templates which SHALL, SHOULD, or MAY be used to represent the information
in each section using even more discrete representations that aid further computer processing of the clinical
information in the section.

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

CDA's approach to context, and the propagation of that context to nested document components, follows these
design principles :

- The CDA Header sets context for the entire document. A propagating value specified in the document
    header holds true throughout the document, unless explicitly overridden. This principal applies only
    to designated participations and attributes of the CDA Header that support propagating context
    conduction. Contextual header components (i.e., those that have propagating values) include:<br/>
       o Author<br/>
       o Confidentiality<br/>
       o Data enterer<br/>
       o Human language<br/>
       o Informant<br/>
       o Legal authenticator<br/>
       o Participant<br/>
       o Record target<br/>
- Context components that can be overridden at the level of the document body include:<br/>
    o Confidentiality<br/>
    o Human language<br/>
- Context components that can be overridden at the level of a document section include:<br/>
    o Author<br/>
    o Confidentiality<br/>
    o Human language<br/>
    o Informant<br/>
    o Subject<br/>

- Context components that can be overridden at the level of a CDA entry include:<br/>
    o Author<br/>
    o Confidentiality<br/>
    o Human language<br/>
    o Informant<br/>
    o Participant<br/>
    o Subject<br/>
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
- To override the Confidentiality at the entry level, an implementation must use Confidentiality
    Security Observation [Observation: templateId 2.16.840.1.113883.3.445.12] defined in ["HL7 CDA® R2
    Implementation Guide: Privacy Consent Directives, Release 1."](http://www.hl7.org/implement/standards/product_brief.cfm?product_id=280)

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
**Reference:** For additional information on Context Conduction mechanisms in CDA documents, consult the HL7 CDA
R2.0 specification.

**Reference:** The [HL7 Data Security for Privacy](http://www.hl7.org/implement/standards/product_brief.cfm?product_id=354) and HL7 Privacy Consent Directives^56 implementation guides define
how to override confidentiality context at the entry level.

**Reference:** [Provenance](representation_of_discrete_data.html#provenance), [Unknown Data in Sections That Require Entries](representation_of_discrete_data.html#unknown-data-in-sections-that-require-entries)

### Structured Header

All CDA documents include a structured header regardless if the document is CDA document with a structured
structuredBody element (a “structured document”) or a CDA document with a nonXMLBody element (an
“unstructured document”). The structured header permits computer processing (parsing) to occur on its content.

#### Patient

The recordTarget represents the medical record that this document belongs to. In the uncommon case where a
clinical document (such as a group encounter note) is placed into more than one patient chart, more than one
recordTarget participants can be stated.^57 The recordTarget records the administrative and demographic data of
the patient whose health information is described by the clinical document; each recordTarget must contain at
least one patientRole element.^58

The recordTarget contains many elements that hold core data for interoperability. The table below summarizes
data elements present in the recordTarget.

Patient matching continues to be one of the major challenges for interoperability due to the lack of a universal
patient identifier, similar to a Social Security Number, but used for healthcare.

^57 HL7 CDA Web Edition 2010. Chapter 4.2.2.11.
^58 HL7 Consolidated CDA R2.1. Chapter 1.1.1.2.


| **Data Element**   | **Data element xPath**    |
| ---- | ------ |
| **First Name**   | /ClinicalDocument/recordTarget/patientRole/patient/name/given[1]  |
| **Last Name**   | /ClinicalDocument/recordTarget/patientRole/patient/name/family  |   
| **Previous Name**   | /ClinicalDocument/recordTarget/patientRole/patient/name/family/@qualifier  |
| **Middle Name**   | /ClinicalDocument/recordTarget/patientRole/patient/name/given[2]  |
| **Suffix**   | /ClinicalDocument/recordTarget/patientRole/patient/name/suffix  |   
| **Administrative Gender**   | /ClinicalDocument/recordTarget/patientRole/patient/administrativeGenderCode  |
| **Birth Sex**   | **Reference:** [Birth Sex](representation_of_discrete_data.html#birth-sex)  |
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
                                                non-null patient address SHOULD follow the <a
                                                  href="https://oncprojectracking.healthit.gov/wiki/pages/viewpage.action?pageId=180486153&amp;preview=/180486153/237306191/Project%20US%40%20FINAL%20Technical%20Specification%20Version%201.0.pdf"
                                                  style=" color: #5E6C84; font-family:Calibri, sans-serif; font-style: normal; font-weight: normal; text-decoration: none; font-size: 10pt;"
                                                  target="_blank">guidance in the </a><span
                                                  class="s153">Project US@ Technical
                                                  Specification</span><span class="s81">. </span><a
                                                  href="#bookmark195"
                                                  style=" color: #5E6C84; font-family:Calibri, sans-serif; font-style: normal; font-weight: bold; text-decoration: none; font-size: 10pt;"
                                                  >[BP-099]</a><a href="#bookmark195" class="s84"
                                                  >59</a></p></td>
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

^60 https://cdasearch.hl7.org/examples/view/Header/Patient%20Demographic%20Information

**Example 7: How to represent Patient demographic Information^60**
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

**Example 8: How to represent Patient with Previous Name^61**
```
<recordTarget>
    <!-- Note: several other data elements (telecom, address, etc.) are required to meet C-CDA
R2.1 requirements -->
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

^61 https://cdasearch.hl7.org/examples/view/Header/Patient%20Previous%20Name

**Example 9: How to represent Patient with Prior Address^62**
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

^62 http://hl7-c-cda-examples.herokuapp.com/examples/view/Header/Patient%20With%20Prior%20Addresses

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
        <!-- Note: This snippet omits other data elements required to meet C-CDA R2.1 requirements
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

The following guidance in available in Chapter 1.1 of the HL7 C-CDA R2.1 Implementation Guide^64:

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
                                        
**Reference:** [Example 5: recordTarget with demographic data](document_level_guidance.html#example-5:-recordTarget-with-demographic-data) **,** [Example 6: recordTarget including the provider
organization context for the clinical documentation](document_level_guidance.html#example-6:-recordTarget-including-the-provider-organization-context-for-the-clinical-documentation)

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
the full content of a section, including both the narrative block and any entries. Entry authorship applies only to
the specific entry.

One example where confusion between these roles might arise for implementers is related to quality
measurement use cases, which require clinical documentation to indicate who diagnosed a patient’s condition and
when a clinician made or re-confirmed the diagnosis. The provider who documents the diagnosis (data enterer or
author) may not be the provider who makes the diagnosis (performer).

The Author Participation template (2.16.840.1.113883.10.20.22.4.119) is used to explicitly indicate an Author in a
section or entry. The template provides conformance rules for representing the author and author.time elements
associated with individual entries. The HL7 Basic Provenance project^65 also developed additional guidance on
sharing the Author in the Provenance - Author Participation template in Appendix A.

The C-CDA R2.1 specification requires the following:

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
not explicitly been prohibited. Its use is required on only one entry template, the Handoff Communication
Participants template [2.16.840.1.113883.10.20.22.4.141](http://www.hl7.org/ccdasearch/templates/2.16.840.1.113883.10.20.22.4.119.html).

^65 https://confluence.hl7.org/display/SEC/Basic+Provenance+Implementation+Guide
^66 http://www.hl7.org/ccdasearch/templates/2.16.840.1.113883.10.20.22.4.119.html.

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
at authenticator, legal authenticator. It shows how to represent the provider’s National Provider Identifier (NPI)
number and his or her Direct Address. It also shows how to represent a provider Organization’s NPI number and
Direct Address. It includes how to indicate the preferred telecom addresses for various forms of communication.

**Example 13: How to represent a provider and the provider’s organization in the role of author**

> This representation pattern is applicable for other roles such as performer, authenticator, legal
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
to note the id’s populated with a nullFlavor cannot me used as a globally unique identifier.

## Example 14: Provider with an unknown NPI number.
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
team members belong in the available header structures. Industry consensus has not been reached in this area.

However, implementers can help reduce variability in the representation of care team members by adopting these
recommendations.

This guide also includes representation of care team members in a care team section template with structured
entries. The care team section documents care team members involved in support of care provision and
coordination for the patient. Business rules are used to determine which care team members are involved in the
encounter or services represented and documented in the header. Care team members established in the header
should be included in the care team section template as well as any others who are relevant to the patient’s care.

**Reference:** [Care Team](representation_of_discrete_data.html#care_team)

Because of the variability of how care team members are represented in the header, and because there is a lack of
normative guidance on which header items must be rendered, it is recommended that receiving systems should
render ALL the participants in the header, rather than only rendering participants of a particular type. The CDA
R2.1 Stylesheet supports complete participant rendering.^67

The term “care team member” encompasses any participant in the care of a patient. A patient’s care team may
include individuals providing support to the patient, such as family members or caregivers, as well as physician
providers and non-physician providers, including nurses, social workers, behavioral health specialists, community-
based providers, technicians, and assistants. In fact, a patient may have more than one care team. Different care
teams exist for different purposes and at different times.

When exchanging information about a care team member, it is recommended to capture the name, identification
number, and contact information, along with codes to indicate the type of provider and the role he or she plays on
the patient’s care team. These details help to distinguish care team members from different care settings and
helps clarify who is involved in the patient’s care and in what ways.

Within CDA, care team members are represented as participants in elements of the document header and may be
associated with the patient (i.e. guardian), the clinical encounter, and/or service event(s) detailed in the document,
and the document itself. Applicable header elements for documenting care team members from Chapter 1.1 of the
C- CDA Implementation Guide are described in the following table.

^67 HL7 CDA R2.1 Stylesheet. https://hl7.org/permalink/?CDAStyleSheet
GitHub Project Folder.

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

**Reference:** [Care Team](representation_of_discrete_data.html#care_team)

#### sdtc:signatureText in Authenticator and legalAuthenticator

Sharing clinical documents with payers is an emerging use case for C-CDA. To meet the needs of this use case,
document authentication and signing of C-CDA documents needs to be addressed.

The HL7 CDA R2 Attachment IG: Exchange of C-CDA Based Documents, R1 – US Realm explains, “The
legalAuthenticator is recorded in ClinicalDocument.legalAuthenticator, and represents a participant who has
legally authenticated the document. Authenticators are recorded in ClinicalDocument.authenticator, and each
authenticator represents a participant who has attested to the accuracy of the document, but who does not have
privileges to legally authenticate the document. An example would be a resident physician who sees a patient and
dictates a note, then later signs it.”^68

It further includes these conformance requirements^69:

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

As focus has shifted from using C-CDA to exchange Patient Summary documents to using C-CDA to exchange
Encounter Summaries, new guidance is needed to clarify expectations for populating the actRelationships present

in the header. In a Patient Summary, the documentationOf/serviceEvent holds the key information about the
range of time covered by the document and the key providers involved in the provision of the summarized care.

In an Encounter Summary, the header needs to capture the context of care for a particular encounter.

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
                                                  R2.1 specification for CCD documents.
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

C- CDA Content Creators cannot know with certainty what documents a Content Consumer has previously stored.
Therefore, it always is preferable for Content Creators to send a complete document that replaces a prior
document rather than sending an addendum to a prior document. Indicate the parent document is being
replaced by using a [replace relationship (typeCode=”RPLC”)](https://www.commonwellalliance.org/wp-content/uploads/2019/01/Improve-Joint-Document-Content-Whitepaper.pdf).

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
**Reference:** [Content Creator Responsibilities](document_level_guidance.html#content_creator_responsibilities)

#### C-CDA R2.1 Document Templates

While all C-CDA documents share a common US Realm Header template, the C-CDA R2.1 implementation guide
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


Page 65 HL7 CDA® R2 IG: C-CDA Templates for Clinical Notes STU Companion Guide, Release 4 - US Realm

The section may also define required and optional entry-level templates. Entry-level templates are structures for
representing the information in the Narrative Block using machine representations that facilitates computerized
information processing.

The table below describes the various document types defined by C-CDA R2.1 for use in representing clinical notes
as structured documents that facilitate digital information exchange.


| **Document-Level Templates for Representing Clinical Notes as Structured Documents^73**   | **Description**    |
| ---- | ------ |
| **Care Plan**   | A Care Plan (including Home Health Plan of Care [HHPoC]) is a consensus-driven dynamic plan that represents a patient’s and Care Team Members’ prioritized concerns, goals, and planned interventions.<br />The CDA Care Plan represents an instance of this dynamic Care Plan at a point in time. The CDA document itself is NOT dynamic.  |
| **Consultation Note**   | The Consultation Note is generated by a request from a clinician for an opinion or advice from another clinician.  |
| **Continuity of Care Document (CCD)**   | The Continuity of Care Document (CCD) represents a core data set of the most relevant administrative, demographic, and clinical information facts about a patient's healthcare, covering one or more healthcare encounters. It provides a means for one healthcare practitioner, system, or setting to aggregate all of the pertinent data about a patient and forward it to another to support the continuity of care.  |
| **Diagnostic Imaging Report**   | A Diagnostic Imaging Report (DIR) is a document that contains a consulting specialist’s interpretation of image data. It conveys the interpretation to the referring (ordering) physician and becomes part of the patient’s medical record. It is for use in Radiology, Endoscopy, Cardiology, and other imaging specialties.  |
| **Discharge Summary**   | The Discharge Summary is a document which synopsizes a patient's admission to a hospital, LTPAC provider, or other setting. It provides information for the continuation of care following discharge.  |
| **History and Physical**   | A History and Physical (H&P) Note is a medical report that documents the current and past conditions of the patient. It contains essential information that helps determine an individual's health status.  |
| **Operative Note**   | The Operative Note is a frequently used type of procedure note with specific requirements set forth by regulatory agencies. The Operative Note is created immediately following a surgical or other high-risk procedure. It records the pre- and post-surgical diagnosis, pertinent events of the procedure, as well as the condition of the patient following the procedure.  |
| **Progress Note**   | This template represents a patient’s clinical status during a hospitalization, outpatient visit, treatment with a LTPAC provider, or other healthcare encounter.  |
| **Procedure Note**   | This template encompasses many types of non-operative procedures including interventional cardiology, gastrointestinal endoscopy, osteopathic manipulation, and many other specialty fields. Procedure Notes are differentiated from Operative Notes because they do not involve incision or excision as the primary act.  |
| **Referral Note**   | A Referral Note communicates pertinent information from a provider who is requesting services of another provider of clinical or non-clinical services.  |
| **Transfer Summary**   | The Transfer Summary standardizes critical information for exchange of information between providers of care when a patient moves between health care settings.  |
{:.grid}
**Table 13: C-CDA R2.1 Document-Level Templates for Representing Clinical Notes as Structured Documents**

**Reference:** [Section Level Guidance](section_level_guidance.html#), [Representation of Discrete Data](representation_of_discrete_data.html#)

The table below describes the document template defined by C-CDA R2.1 for use in representing clinical notes as
an unstructured document that facilitates digital information exchange.

| **Document Templates for Unstructured Clinical Notes**   | **Description**    |
| ---- | ------ |
| **Unstructured Document**   | An Unstructured Document (UD) document type can<br />(1) include unstructured content, such as a graphic, directly in a text element with a mediaType attribute, or<br />(2) reference a single document file, such as a word-processing document using a text/reference element.  |
{:.grid}
**Table 14: Document Templates of Unstructured Clinical Notes**

The C-CDA R2.1 Unstructured Document template defines a C-CDA document with a structured header and a non-
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

#### Further Constraints on C-CDA Documents

#### Nutrition-focused Constraints on C-CDA Documents

The table below identifies a supplemental document template defined to further constrain the C-CDA Care Plan
document template when exchanging nutrition care plan information.^74

| **Care Plan Summary Documents**   | **Description**    |
| ---- | ------ |
| **Care Plan (Nutrition)** <br />2.16.840.1.113883.10.20.22.1.16:2017-12-01  | This template is for supplemental use in a C-CDA Care Plan document.<br />The Care Plan (Nutrition) standardizes documentation of information gathered and developed through the process of the Nutrition Care Process (NCP). The four steps in the NCP align with sections in a Care Plan (Nutrition) document.<br />This template further constrains the C-CDA R2.1 Care Plan document-level template.  |
{:.grid}
**Table 15: Care Plan (Nutrition)**

### Section Structure by Document Type

The following tables describe the required and optional section templates for each document type defined in C-
CDA.^75 They include sections that support best practices for representing emerging data for exchange such as
Patient Goals and Health Concerns.

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

A Care Plan (including Home Health Plan of Care (HHPoC)) is a consensus-driven dynamic plan that represents a
patient’s and Care Team Members’ prioritized concerns, goals, and planned interventions. It serves as a blueprint
shared by all Care Team Members (including the patient, their caregivers and providers), to guide the patient’s
care. A Care Plan integrates multiple interventions proposed by multiple providers and disciplines for multiple
conditions.

A Care Plan represents one or more Plan(s) of Care and serves to reconcile and resolve conflicts between the
various Plans of Care developed for a specific patient by different providers. While both a plan of care and a care
plan include the patient’s life goals and require Care Team Members (including patients) to prioritize goals and
interventions, the reconciliation process becomes more complex as the number of plans of care increases. The
Care Plan also serves to enable longitudinal coordination of care.

The CDA Care Plan represents an instance of this dynamic Care Plan at a point in time. The CDA document itself is
NOT dynamic.

This document template enables Care Plan information to be shared in a way that includes:

- The ability to identify patient and provider priorities with each act.
- A header participant to indicate occurrences of Care Plan review.


A Care Plan document can include entry references from the information in these sections to the information
(entries) in other sections. Volume 1 of the C-CDA R2.1 implementation guide includes of a Care Plan Relationship
diagram and a story board to explain its use.

#### Structured Sections

The table below describes the required and optional sections in a Care Plan document template: Care Plan (V2)
[ClinicalDocument: identifier urn:hl7ii:2.16.840.1.113883.10.20.22.1.15:2015-08-01 (open)]

| **Document Type**   | **Required Sections**    | **Optional Sections** |
| -- | -------- | ------ |
| **Care Plan**   | Health Concerns Section (V2)<br />Goals Section  | Interventions Section (V3)<br />Health Status Evaluations and Outcomes Section  |
| **Sample**   | CarePlan.xml Sample  | Included with this Companion Guide  |
{:.grid}
**Table 16: Care Plan: Document Template.**

#### Consultation Note: Document Template

The Consultation Note is generated by a request from a clinician for an opinion or advice from another clinician.
Consultations may involve face-to-face time with the patient or may fall under the auspices of telemedicine visits.
Consultations may occur while the patient is inpatient or ambulatory. The Consultation Note should also be used
to summarize an Emergency Room or Urgent Care encounter. A Consultation Note includes the reason for the
referral, history of present illness, physical examination, and decision-making components (Assessment and Plan).

#### Structured Sections

The table below describes the required and optional sections in a Consultation Note document template:
Consultation Note (V3)[ClinicalDocument: identifier urn:hl7ii:2.16.840.1.113883.10.20.22.1.4:2015- 08 -01 (open)]

| **Document Type**   | **Required Sections**    | **Optional Sections** |
| -- | -------- | ------ |
| **Consultation Note**   | History of Present Illness Section<br />Allergies and Intolerances Section (entries required) (V3)<br />Problem Section (entries required) (V3)  | Assessment Section<br />Assessment and Plan Section (V2)<br />Plan of Treatment Section (V2)<br />Reason for Visit Section<br />Physical Exam Section (V3)<br />Chief Complaint Section<br />Chief Complaint and Reason for Visit Section<br />Family History Section (V3)<br />General Status Section<br />Past Medical History (V3)<br />Immunizations Section (entries optional) (V3) Medications Section (entries required) (V2) Procedures Section (entries optional) (V2)<br />Results Section (entries required) (V3)<br />Social History Section (V3)<br />Vital Signs Section (entries required) (V3)<br />Functional Status Section (V2)<br />Review of Systems Section<br />Medical Equipment Section  |
{:.grid}
**Table 17: Consultation Note: Document Template.**

#### Continuity of Care Document (CCD): Document Template

The Continuity of Care Document (CCD) was originally based on the Continuity of Care Document (CCD) Release 1.1
which itself was derived from HITSP C32 and CCD Release 1.0. The Continuity of Care Document (CCD) represents a
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

#### Structured Sections

The table below describes the required and optional sections in a Continuity of Care Document document
template: Continuity of Care Document (CCD) (V3) [ClinicalDocument: identifier
urn:hl7ii:2.16.840.1.113883.10.20.22.1.2:2015- 08 -01 (open)]

| **Document Type**   | **Required Sections**    | **Optional Sections** |
| -- | -------- | ------ |
| **Continuity of Care Document (CCD)**   | Allergies and Intolerances Section (entries required) (V3)<br />Medications Section (entries required) (V2)<br />Problem Section (entries required) (V3)<br />Results Section (entries required) (V3)<br />Social History Section (V3)<br />Vital Signs Section (entries required) (V3)  | Procedures Section (entries required) (V2)<br />Encounters Section (entries optional) (V3)<br />Family History Section (V3)<br />Functional Status Section (V2)<br />Immunizations Section (entries required) (V3)<br />Medical Equipment Section (V2)<br />Payers Section (V3)<br />Plan of Treatment Section (V2)<br />Mental Status Section (V2)<br />Nutrition Section<br />Advance Directives Section (entries optional) (V3)<br />Goals Section<br />Health Concerns Section (V2)  |
{:.grid}
**Table 18: Continuity of Care Document: Document Template.**

#### Diagnostic Imaging Report: Document Template

A Diagnostic Imaging Report (DIR) is a document that contains a consulting specialist’s interpretation of image
data. It conveys the interpretation to the referring (ordering) physician and becomes part of the patient’s medical
record. It is for use in Radiology, Endoscopy, Cardiology, and other imaging specialties.

#### Structured Sections

The table below describes the required and optional sections in a Diagnostic Imaging Report document template:
Diagnostic Imaging Report (V3)[ClinicalDocument: identifier urn:hl7ii:2.16.840.1.113883.10.20.22.1.5:2015- 08 -01
(open)]


| **Document Type**   | **Required Sections**    | **Optional Sections** |
| -- | -------- | ------ |
| **Diagnostic Imaging Report**   | Finding Sections (DIR)  | DICOM Object Catalog Section – DCM 121181  |
{:.grid}
**Table 19: Diagnostic Imaging Report: Document Template.**

#### Discharge Summary: Document Template

The Discharge Summary is a document which synopsizes a patient's admission to a hospital, LTPAC provider, or
other setting. It provides information for the continuation of care following discharge. [The Joint Commission](http://www.jointcommission.org/)
requires the following information to be included in the Discharge Summary:

- Reason for hospitalization (the admission)
- Procedures performed, as applicable
- Care, treatment, and services provided
- Patient’s condition and disposition at discharge
- Information provided to the patient and family
- Provisions for follow-up care

The best practice for a Discharge Summary is to include the discharge disposition in the display of the header.

#### Structured Sections

The table below describes the required and optional sections in a Discharge Summary document template:
Discharge Summary (V3)[ClinicalDocument: identifier urn:hl7ii:2.16.840.1.113883.10.20.22.1.8:2015- 08 -01 (open)]

| **Document Type**   | **Required Sections**    | **Optional Sections** |
| -- | -------- | ------ |
| **Discharge Summary**   | Allergies and Intolerances Section (entries optional) (V3)Hospital Course Section<br />Discharge Diagnosis Section (V3)<br />Plan of Treatment Section (V2) (DIR)  | Discharge Medications Section (entries optional) (V3)<br />Chief Complaint Section<br />Chief Complaint and Reason for Visit Section<br />Nutrition Section<br />Family History Section (V3)<br />Functional Status Section (V2)<br />Past Medical History (V3)<br />History of Present Illness Section<br />Admission Diagnosis Section (V3)<br />Admission Medications Section (entries optional) (V3)<br />Hospital Consultations Section<br />Hospital Discharge Instructions Section<br />Hospital Discharge Studies Summary Section<br />Immunizations Section (entries optional) (V3)<br />Procedures Section (entries optional) (V2)<br />Reason for Visit Section<br />Review of Systems Section<br />Social History Section (V3)<br />Vital Signs Section (entries optional) (V3)<br />Discharge Medications Section (entries required) (V3)<br />Goals Section<br />Health Concerns Section (V2)  |
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

#### Structured Sections

The table below describes the required and optional sections in a History and Physical document template: History
and Physical (V3)[ClinicalDocument: identifier urn:hl7ii:2.16.840.1.113883.10.20.22.1.3:2015- 08 -01 (open)]

| **Document Type**   | **Required Sections**    | **Optional Sections** |
| -- | -------- | ------ |
| **History and Physical**   | Allergies and Intolerances Section (entries optional) (V3)Family History Section (V3)<br />General Status Section<br />Past Medical History (V3)<br />Medications Section (entries optional) (V2)<br />Physical Exam Section (V3)<br />Results Section (entries optional) (V3) Review of Systems Section<br />Social History Section (V3)<br />Vital Signs Section (entries optional) (V3)  | Assessment Section<br />Plan of Treatment Section (V2)<br />Assessment and Plan Section (V2)<br />Chief Complaint Section<br />Chief Complaint and Reason for Visit Section<br />History of Present Illness Section<br />Immunizations Section (entries optional) (V3)<br />Instructions Section (V2)<br />Problem Section (entries optional) (V3)<br />Procedures Section (entries optional) (V2)<br />Reason for Visit Section  |
{:.grid}
**Table 21: History and Physical: Document Template.**

#### Operative Note: Document Template

The Operative Note is a frequently used type of procedure note with specific requirements set forth by regulatory
agencies. The Operative Note is created immediately following a surgical or other high-risk procedure. It records
the pre- and post-surgical diagnosis, pertinent events of the procedure, as well as the condition of the patient
following the procedure. The report should be sufficiently detailed to support the diagnoses, justify the treatment,
document the course of the procedure, and provide continuity of care.

#### Structured Sections

The table below describes the required and optional sections in an Operative Note document template: Operative
Note (V3)[ClinicalDocument: identifier urn:hl7ii:2.16.840.1.113883.10.20.22.1.7:2015- 08 -01 (open)]

| **Document Type**   | **Required Sections**    | **Optional Sections** |
| -- | -------- | ------ |
| **Operative Note**   | Anesthesia Section (V2)Complications Section (V3)<br />Preoperative Diagnosis Section (V3)<br />Procedure Estimated Blood Loss Section Procedure Findings Section (V3)<br />Procedure Specimens Taken Section<br />Procedure Description Section<br />Postoperative Diagnosis Section  | Procedure Implants Section<br />Operative Note Fluids Section<br />Operative Note<br />Surgical Procedure Section<br />Plan of Treatment Section (V2)<br />Planned Procedure Section (V2)<br />Procedure Disposition Section<br />Procedure Indications Section (V2)<br />Surgical Drains Section  |
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

#### Structured Sections

The table below describes the required and optional sections in a Procedure Note document template: Procedure
Note (V3)[ClinicalDocument: identifier urn:hl7ii:2.16.840.1.113883.10.20.22.1.6:2015- 08 -01 (open)]

| **Document Type**   | **Required Sections**    | **Optional Sections** |
| -- | -------- | ------ |
| **Procedure Note**   | Complications Section (V3)<br />Procedure Description Section<br />Procedure Indications Section (V2)<br />Postprocedure Diagnosis Section (V3)  | Assessment Section<br />Assessment and Plan Section (V2)<br />Plan of Treatment Section (V2)<br />Allergies and Intolerances Section (entries optional) (V3)<br />Anesthesia Section (V2)<br />Chief Complaint Section<br />Chief Complaint and Reason for Visit Section<br />Family History Section (V3)<br />Past Medical History (V3)<br />History of Present Illness Section<br />Medical (General) History Section<br />Medications Section (entries optional) (V2)<br />Medications Administered Section (V2)<br />Physical Exam Section (V3)<br />Planned Procedure Section (V2)<br />Procedure Disposition Section<br />Procedure Estimated Blood Loss Section<br />Procedure Findings Section (V3)<br />Procedure Implants Section<br />Procedure Specimens Taken Section<br />Procedures Section (entries optional) (V2)<br />Reason for Visit Section<br />Review of Systems Section<br />Social History Section (V3)  |
{:.grid}
**Table 23: Procedure Note: Document Template.**

#### Progress Note: Document Template

The Progress Note represents a patient’s clinical status during a hospitalization, outpatient visit, treatment with a
LTPAC provider, or other healthcare encounter. [Taber’s medical dictionary](https://www.tabers.com/tabersonline/) defines a Progress Note as “An ongoing
record of a patient's illness and treatment. Physicians, nurses, consultants, and therapists record their notes
concerning the progress or lack of progress made by the patient between the time of the previous note and the
most recent note.” Mosby’s medical dictionary defines a Progress Note as “Notes made by a nurse, physician,
social worker, physical therapist, and other health care professionals that describe the patient's condition and the
treatment given or planned.”^78 A Progress Note is not a re-evaluation note. A Progress Note is not intended to be a
Progress Report for Medicare. Medicare B Section 1833(e) defines the requirements of a Medicare Progress
Report.

#### Structured Sections

The table below describes the required and optional sections in a Progress Note document template: Progress
Note (V3)[ClinicalDocument: identifier urn:hl7ii:2.16.840.1.113883.10.20.22.1.9:2015- 08 -01 (open)]

| **Document Type**   | **Required Sections**    | **Optional Sections** |
| -- | -------- | ------ |
| **Progress Note**   |   | Assessment Section<br />Plan of Treatment Section (V2)<br />Assessment and Plan Section (V2)<br />Allergies and Intolerances Section (entries optional) (V3)<br />Chief Complaint Section<br />Interventions Section (V3)<br />Instructions Section (V2)<br /><br />Medications Section (entries optional) (V2)Objective Section<br />Physical Exam Section (V3)<br />Problem Section (entries optional) (V3)<br />Results Section (entries optional) (V3)<br />Review of Systems Section<br />Subjective Section<br />Vital Signs Section (entries optional) (V3)<br />Nutrition Section  |
| **Example**   | ProgressNote.xml Sample  | Included with this Companion Guide  |
{:.grid}
**Table 24 Progress Note: Document Template.**

^78 Mosby’s Medical Dictionary. 9th ed. St. Louis, MO: Mosby Elsevier, 2013. Print.


#### Referral Note: Document Template

A Referral Note communicates pertinent information from a provider who is requesting services of another
provider of clinical or non-clinical services which includes the reason for the referral and additional information
that would augment decision making and care delivery. Examples of referral situations include when a patient is:

- Referred from a family physician to a cardiologist for cardiac evaluation.
- Sent by a cardiologist to an emergency department for angina.
- Referred by a nurse practitioner to an audiologist for hearing screening.
- Referred by a hospitalist to social services.

#### Structured Sections

The table below describes the required and optional sections in a Referral Note document template: Referral Note
(V2)[ClinicalDocument: identifier urn:hl7ii:2.16.840.1.113883.10.20.22.1.14:2015- 08 -01 (open)]

| **Document Type**   | **Required Sections**    | **Optional Sections** |
| -- | -------- | ------ |
| **Referral Note**   | Problem Section (entries required) (V3)<br />Allergies and Intolerances Section (entries required) (V3)<br />Medications Section (entries required) (V2)<br />Reason for Referral Section (V2)  | Plan of Treatment Section (V2)<br />History of Present Illness Section<br />Family History Section (V3)<br />Immunizations Section (entries required) (V3)<br />Procedures Section (entries optional) (V2)<br />Results Section (entries required) (V3)<br />Review of Systems Section<br />Social History Section (V3)<br />Vital Signs Section (entries required) (V3)Functional Status Section (V2)<br />Physical Exam Section (V3)<br />Nutrition Section<br />Mental Status Section (V2)<br />Medical Equipment Section (V2)<br />Assessment Section<br />Assessment and Plan Section (V2)<br />Past Medical History (V3)<br />General Status Section<br />Advance Directives Section<br />Health Concerns Section (V2)<br />Goals Section  |
| **Example**   | ReferralNote.xml Sample  | Included with this Companion Guide  |
{:.grid}
**Table 25: Referral Note: Document Template.**

#### Transfer Summary: Document Template

The Transfer Summary template describes constraints on the Clinical Document Architecture (CDA) header and
body elements for a Transfer Summary. The Transfer Summary standardizes critical information for exchange of
information between providers of care when a patient moves between health care settings. Standardization of
information used in this form will promote interoperability; create information suitable for reuse in quality
measurement, public health, research, and for reimbursement.

#### Structured Sections

The table below describes the required and optional sections in a Transfer Summary document template Transfer
Summary (V2)[ClinicalDocument: identifier urn:hl7ii:2.16.840.1.113883.10.20.22.1.13:2015-08-01 (open)]

| **Document Type**   | **Required Sections**    | **Optional Sections** |
| -- | -------- | ------ |
| **Transfer Summary**   | Allergies and Intolerances Section (entries required) (V3)<br />Medications Section (entries required) (V2)<br />Problem Section (entries required) (V3)<br />Results Section (entries required) (V3)<br />Vital Signs Section (entries required) (V3)<br />Reason for Referral Section (V2)  | Physical Exam Section (V3)<br />Encounters Section (entries required) (V3)<br />Family History Section (V3)<br />Functional Status Section (V2)<br />Discharge Diagnosis Section (V3)<br />Immunizations Section (entries optional) (V3)<br />Medical Equipment Section (V2)<br />Payers Section (V3)<br />Plan of Treatment Section (V2)<br />Procedures Section (entries required) (V2)<br />Social History Section (V3)<br />Mental Status Section (V2)<br />General Status Section<br />Review of Systems Section<br />Nutrition Section<br />Past Medical History (V3)<br />History of Present Illness Section<br />Assessment and Plan Section (V2)<br />Assessment Section<br />Admission Medications Section (entries optional) (V3)<br />Admission Diagnosis Section (V3)<br />Course of Care Section
{:.grid}
**Table 26: Transfer Summary: Document Template.**

#### Other Section-Level Templates Available for Use in C-CDA Documents

As the library of available CDA templates grows and implementers become more experienced using the standard,
implementers may use templates developed in other CDA implementation guides which are compatible with C-
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
A C-CDA compatible template is a template that further constrains a template defined in C- CDA R2.1 or a template
that does not conflict with templates defined in C-CDA. Determining if a template is C-CDA compliant may require
human discernment and consensus building within the C-CDA implementer community. A particularly important
collection of C-CDA compatible templates is the Supplemental Implementation Guides, which define new
template versions and templates for additional use cases. These Supplemental Implementation Guides are
published alongside the main C-CDA specification:
https://www.hl7.org/implement/standards/product_brief.cfm?product_id=492


The Joint Document Content Work Group recommends all sections include the Section Time Range Observation to
describe the range of time used to limit the range of information contained in a section.^79

**Reference:** [Declaring Business Rules that Limit Section Content](section_level_guidance.html#declaring-business-rules-that-limit-section-content);  [Specifying Time Intervals for Sections with Limits](representation_of_discrete_data.html#specifying-time-interval-for-sections-with-limits);

The Joint Document Content Work Group also recommends use of the Progress Note document template to
represent an encounter summary for a non-inpatient setting.^80 The Progress Note document template does not
include any required sections and the open nature of the template enables Content Creators to include the right
sections to express the source data or the needed sections to satisfy the requirements of Content Consumers.
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
                                                C-CDA R2.1. <b>[BP-053]</b></p></td>
                                    </tr>
                                </table>
                                
^79 Joint Content Workgroup IG. Chapter 2.1.1 Section Time Range Observation.
^80 Joint Content Workgroup IG. Chapter 2.2 Outpatient/Ambulatory Summary (Progress Note Document)