These General Guidance Pages are drawn from C-CDA R2.1 and the C-CDA Companion Guide R4.1 guidance pages. The content has been merged and deduplicated with references and links updated for this StructureDefintion publication. The pages from the Companion Guide covering Document, Section and Entry Level guidance are largely unchanged. The Representing Discrete Data page was renamed "Entry Level Guidance", otherwise only links and references are updated.
### What is CDA
Clinical Document Architecture (CDA) is the underlying standard that Consolidated Clinical Document Architecture (C-CDA) is derived from. The HL7 CDA is a document markup standard that specifies the structure and semantics of a clinical document (such as a discharge summary, progress note, procedure report) for the purpose of exchange. A CDA document is a defined and complete information object that can include text, images, sounds, and other multimedia content. It can be transferred within a message, and can exist independently, outside the transferring message.

CDA documents are encoded in Extensible Markup Language (XML). They derive their machine processable meaning from the HL7 RIM and use the HL7 Version 3 data types. CDA incorporates concepts from standard coding systems such as Systemized Nomenclature of Medicine Clinical Terms (SNOMED CT) and Logical Observation Identifiers Names and Codes (LOINC).

The CDA specification is richly expressive and flexible and is designed to be broad enough to cover the domain of clinical documents. Templates and implementation guides are used to constrain the CDA specification within a particular implementation and to provide validation rule sets that check conformance to these constraints.

For more detail about CDA, C-CDA’s underlying standard, please see the [Overview]({{site.data.fhir.hl7_cda_uv_core}}/overview.html)in the StructureDefinition publication of CDA.

### Templated CDA

CDA can be constrained through creating rules which provide the semantic and syntactic rules for representing data elements. The “templated CDA” approach uses a library of modular CDA template definitions. Templates can be reused across any number of CDA document types, as shown in the following figure. Each template meets a defined purpose. Templates are managed over time through versioning. A template version is a specific set of conformance constraints (rules) designed to meet the template’s purpose.
<img src="templated-cda.png" style="float: none; display: block; margin-left: auto; margin-right: auto;" />

The types of templates defined in this guide are Document, Section, Entry and Participation and other templates:

* Document-level templates: These templates constrain fields in the CDA header, and define containment relationships to CDA sections. For example, a History and Physical document-level template might require that the patient’s name be present, and that the document contain a Physical Exam section.
* Section-level templates: These templates constrain fields in the CDA section, and define containment relationships to CDA entries. For example, a Physical Exam section-level template might require that the section/code be fixed to a particular LOINC code, and that the section contains a Systolic Blood Pressure observation.
* Entry-level templates: These templates constrain the CDA clinical statement model in accordance with real-world observations and acts. For example, a Systolic Blood Pressure entry-level template defines how the CDA Observation class is constrained (how to populate observation/code, how to populate observation/value, etc.) to represent the notion of a systolic blood pressure.
* Participation and Other templates: Templates that exist to establish a set of constraints that are reused in the CDA document. These other templates are only used within another template, rather than on their own as a complete clinical statement. For example, [US Realm Date and Time (Point in Time)](StructureDefinition-USRealmDateTime.html) includes a set of common constraints for recording time. This template is referenced several times with other templates used in the implementation guide. They reduce the need to repeat constraints in templates that use the common set.

A CDA implementation guide (such as this one) defines templates of these various types specifying them to represent particular use cases and/or data elements.

Regarding implementation, the creator of a CDA instance populates the template identifier (templateId) field to assert conformance to a given template version. On the receiving side, the recipient can then not only test the instance for conformance against the CDA Extensible Markup Language (XML) schema, but also test the instance for conformance against asserted templates, historically, using custom schematron.

StructureDefinition publishing provides inherent validation and versioning without needing to develop custom schematron. However, the validity and reliability of this has not been fully tested and there is wide use of schematron in the industry. This current publication retains the templateIDs, as a secondary StructureDefininition.ID, but the publication does not rely on it for QA and validation within the specification itself. Tooling is being investigated to support instance validation using inherent processes that can be made available for the industry to leverage in sending and receiving instances

#### Template Versioning
C-CDA templates are identified with a templateId. The templateId is a two-part identifier that consists of a root that is an Object Identifier (OID) and an optional date extension. The root identifies the named template and the extension identifies the version of that template. Initially C-CDA templates did not include versions so the templateId/@extension attribute was not used.  Some of these templates are still present on C-CDA 3.0.

StructureDefinition publishing provides inherent validation and versioning without needing to develop custom schematron. However, the validity and reliability of this has not been fully tested and there is wide use of schematron validation. This current publication retains the templateIDs as an identifier on the template StructureDefinition and as a required slice on the templateId within the CDA structure. When validating CDA instances, the templateID is still used to identify the template to validate against. Tooling is being investigated to support instance validation.

#### Open and Closed Templates

In CDA. templates are declared to be either Open or Closed templates. In Open templates, all of the features of the CDA R2 base specification are allowed except as constrained by the templates. Open templates allow HL7 CDA implementers to develop additional structured content not constrained within this guide. HL7 encourages implementers to bring their use cases forward as candidate requirements to be formalized in a subsequent version of the standard to maximize the use of shared semantics.
By contrast, a Closed template specifies everything that is allowed and nothing further may be included. There are only 2 templates in C-CDA 3.0 that are closed templates. [Estimated Date of Delivery](StructureDefinition-EstimatedDateofDelivery.html) and [Medication Free Text Sig](StructureDefinition-MedicationFreeTextSig.html). Closed templates are indicated by a "sig-closed": constraint.

### Template Conformance

Conformance statements inherited from the pdf publications (C-CDA R2.1 and prior and the Companion Guides) may be  identified with unique identifiers (e.g., CONF:86-7345) produced by the previous publication tooling. These historical identifiers are now present on the “Detailed Description pages” and on the “Description & Constraints”column on the “Formal Views of Profile” and are expected to be removed in a future version of C-CDA.

This StructureDefinition publication of C-CDA adheres to the FHIR Conformance Rules . C-CDA StructureDefinitions defines the minimum elements, extensions, vocabularies, and ValueSets that **SHALL** or **SHOULD** be present and constrains the way the elements are used when using the template.

The Template elements consist of **SHALL** (Mandatory), **SHOULD** (Best Practice), and USCDI Requirements elements. **SHALL** elements have a minimum cardinality of 1 (min=1). **SHOULD** elements are identified with a minimum cardinality of 0 (min=0) and a “C” with a constraint (invariant), (e.g. should-NPI (the constraint identifier) with the description “**SHOULD** be NPI”). Additional **SHALL** and **SHOULD** requirements are represented as constraints (invariants) with a severity of error (Mandatory) or warning (Best Practice).
USCDI classes or data elements are flagged with (USCDI) on the CDA element and/or on an entire template and identify data elements required for ONC Health IT Certification.

Terminology Conformance
All terminology constraints are represented as value set or code system bindings in the template. All bound value sets are represented by the name of the value set and this name is a direct hyperlink to the appropriate value set found in [National Library of Medicine’s Value Set Authortiy Center (VSAC)](https://vsac.nlm.nih.gov/valueset/expansions?pr=all) which can also be retrieved as a downloadable package: [Value Set Authority Center(VSAC)C-CDA Value Sets](https://vsac.nlm.nih.gov/download/ccda), in [HL7 Terminology Home (THO)](https://terminology.hl7.org/3.1.0/index.html) or within the US Core Implementation Guide [US Core Terminology]{{site.data.fhir.hl7_US-Core/terminology.html). **SHALL** bindings are represented as Required bindings while **SHOULD** and **MAY** bindings are represented as Preferred bindings.

### Context Conduction

CDA establishes a "context" in its header, which generally applies to the entire document but can be overridden in specific sections or entries. This context encompasses various components such as Author, Confidentiality, and Human Language, ensuring that information (like the subject of observations or authorship) remains consistent throughout the document unless explicitly altered. 
Notably:
The CDA Header sets initial context, with certain participants (e.g., Author, Confidentiality) having propagating values applicable across the document unless overridden. CDA participants that have propagating values:

- Author
- Confidentiality
- Data enterer
- Human language
- Informant
- Legal authenticator
- Participant
- Record target

Context components can be overridden at various levels:

- Document Level: Confidentiality and Human language
- Section Level: Author, Confidentiality, Human Language, Informant, Subject
- Entry Level: Author, Confidentiality, Human Language, Informant, Participant, Subject

Contextual information trickles down from broader ("outer") contexts to more specific ("nested") contexts and can be specifically overridden at each level.
In instances of unknown or imprecise context, overriding with a null value is employed.

The objective of the CDA Context rule is to render practices explicit in relation to the RIM (Reference Information Model), ensuring computerized understanding of document context aligns with human interpretation. This approach maintains coherent information flow and facilitates logical data propagation and override when necessary within nested document components.
### CDA Participations
A CDA participant (e.g., Author, Informant), is an association between an Act and a Role with an Entity playing that Role. Each Entity (in a Role) involved in an Act in a certain way is linked to the Act by one Participation-instance. The kind of involvement in the Act is specified by the Participation.typeCode.

CDA principles when asserting participations include:

- Participation persistence: An object’s participations (and participation time stamps) don’t change just because that object is reused. For instance, authorship of an object doesn’t change just because that object is now included in a summary document.
- Participation evolution: Additional participations (and participation time stamps) can be ascribed to an object over its lifetime. (In some cases, an electronic health record (EHR) system will create a new object instead of adding participants to an existing object, such as when an EHR has imported a CCD and the receiving clinician chooses to create a local problem list entry corresponding to a problem in the CCD).
- Device participation: Devices do not participate as legally responsible entities, but can participate as authors in some scenarios.

### Assessing the Status of a Clinical Statement

It's essential for a recipient to ascertain the status of the data in a clinical statement, which can encompass various items such as problems, medication administrations, and more. The precise determination hinges upon the combined factors from multiple components of the act, like the statusCode and effectiveTime. 
Key principles to understand when delineating or interpreting the status of a clinical statement:

Role of Act.statusCode: 

- The Act.statusCode directly indicates the state of the entry. As per the RIM definition, the statusCode mirrors the current state of the activity. For instance, when referencing an Observation, the statusCode represents the status of the observational activity rather than the status of the observed item.

Interplay Between Act.statusCode and Act.moodCode:
- An act in the EVN (event) mood typically signifies a distinct event (like a user observing, listening, or recording actions). Hence, most acts in the EVN mood usually have a statusCode of "completed."
- There are exceptions, such as prolonged observations. In this scenario, the observation in the EVN mood might be "active."
- For an Observation in the RQO (request) mood, the statusCode is usually "active" until the request is finalized. Once done, the statusCode switches to "completed."
- If an Observation is in the GOL (goal) mood, the statusCode often stays "active" provided the observation remains a current goal for the patient

Relationship Between Act.statusCode and Act.effectiveTime:
- The effectiveTime, sometimes termed the "biologically pertinent time," denotes the moment the act is relevant to the patient. This means while the effectiveTime indicates the medically significant period, the statusCode represents the action's current state.
- To illustrate, for a healthcare provider reviewing a patient's medical history noting a heart attack that took place 5 years prior, the observation's status is "completed," with the effectiveTime being five years in the past.

### Rendering Header Information for Human Presentation
Metadata carried in the header may already be available for rendering from EHRs or other sources external to the document. An example of this would be a doctor using an EHR that already contains the patient’s name, date of birth, current address, and phone number. When a CDA document is rendered within that EHR, those pieces of information may not need to be displayed since they are already known and displayed within the EHR’s user interface.

Good practice recommends that the following be present whenever the document is viewed:
- Document title and document dates
- Service and encounter types, and date ranges as appropriate
- Names of all persons along with their roles, participations, participation date ranges, identifiers, address, and telecommunications information
- Names of selected organizations along with their roles, participations, participation date ranges, identifiers, address, and telecommunications information
- Date of birth for recordTarget(s)

In Operative and Procedure Notes, the following information is typically displayed in the EHR and/or rendered directly in the document:

- The performers of the surgery or procedure, including any assistants
- The surgery or procedure performed (serviceEvent)
- The date of the surgery or procedure

HL7 has created a style sheet available for the community to use, as is, or to customize for their vendor’s implementations. The [HL7 CDA style sheet](https://github.com/HL7/cda-core-xsl) is housed in the CDA GitHub location

### The Use of Sections for Document Organization in C-CDA

Section templates are open, allowing for the inclusion of subsections to enhance the organization of narrative content. This structured approach may facilitate a more efficient and less cumbersome interpretation of the information. Entries linked to the primary section can also be nested within its relevant subsections. When processing sections in a CDA document, machines should be prepared to handle potential subsection divisions.

To ensure clarity and minimize complexity, it's advisable to limit subsection depth to three levels: a main section followed by up to two subsection layers.

Subsections utilize codes from the LOINC Document Ontology to signify the information's context within them. When designating entries for a particular subsection, a translation of the entry's primary code element can correspond to the LOINC code associated with that subsection. While this method of applying translation to entry.code diverges from typical vocabulary translation practices, it may aid in the systematic categorization of entries, facilitating machine processing in alignment with the intended document structure.

### Narrative Referencing

The C-CDA R3.0 recommends that clinical statements include a link between the narrative (section.text) and coded clinical data (entry). Please see the [Narrative Block]({{site.data.fhir.hl7_cda_uv_core}}/narrative.html) section in the StructureDefinition publication of CDA for implementation details about referencing. Each template contains conformance statements recommending (SHOULD) textReferencing unless explicitly prohibited.

### Unknown and No Known Information
Information technology solutions store and manage data, but sometimes data are not available. An item may be unknown, not relevant, or not computable or measureable, such as where a patient arrives at an emergency department unconscious and with no identification.

In many cases, the C-CDA standard will stipulate that a piece of information is required (e.g., via a SHALL conformance verb). However, in most of these cases, the standard provides an “out”, allowing the sender to indicate that the information isn’t known.

Here, we provide guidance on representing unknown information. Further details can be found in the HL7 V3 Data Types Release 1 specification that accompanies the CDA R2 normative standard. However, it should be noted that the focus of Consolidated CDA is on the unambiguous representation of known data, and that in general, the often subtle nuances of unknown information representation are less relevant to the recipient.

Many fields in C-CDA contain a “@nullFlavor” attribute, used to indicate an exceptional value. Some flavors of Null are used to indicate that the known information falls outside of value set binding constraints. Not all uses of the @nullFlavor attribute are associated with a case in which information is unknown. Allowable values for populating the attribute give details about the reason the information is unknown, as shown in the following example.

**nullFlavor Example**

```
<birthTime nullFlavor=”UNK”/> <!--Sender does not know the birthTime, but a proper value is applicable -->
```

Use null flavors for unknown, required, or optional attributes:

| NI | No information. This is the most general and default null flavor. |
| NA | Not applicable. Known to have no proper value (e.g., last menstrual period for a male). |
| UNK | Unknown. A proper value is applicable, but is not known. |
| ASKU | Asked, but not known. Information was sought, but not found (e.g., the patient was asked but did not know). |
| NAV | Temporarily unavailable. The information is not available, but is expected to be available later. |
| NASK | Not asked. The patient was not asked. |
| MSK | There is information on this item available but it has not been provided by the sender due to security, privacy, or other reasons. There may be an alternate mechanism for gaining access to this information. |
| OTH | The actual value is not an element in the value domain of a variable. (e.g., concept not provided by required code system). |

The list above contains those null flavors that are commonly used in clinical documents. For the full list and descriptions, see the nullFlavor vocabulary domain in the CDA R2 normative edition.10

Any SHALL, SHOULD or MAY conformance statement may use nullFlavor, unless the nullFlavor is explicitly disallowed (e.g., through another conformance statement which includes a SHALL conformance for a vocabulary binding to the @code attribute, or through an explicit SHALL NOT allow use of nullFlavor conformance).

**Attribute Required (nullFlavor not allowed)**

1. *SHALL* contain exactly one [1..1] code (CONF:15407).
  a. This code *SHALL* contain exactly one [1..1] @code="11450-4" Problem List (CodeSystem: LOINC 2.16.840.1.113883.6.1) (CONF:15408).
  or
2. *SHALL* contain exactly one [1..1] *effectiveTime/@value* (CONF:5256).

**Allowed nullFlavors When Element is Required (with xml examples)**

1. *SHALL* contain at least one [1..*] id
2. *SHALL* contain exactly one [1..1] code which SHALL be selected from ValueSet ValueSetName
3. *SHALL* contain exactly one [1..1] effectiveTime

```
<entry>
 <observation classCode="OBS" moodCode="EVN">
  <id nullFlavor="NI"/>
  <code nullFlavor="OTH">
   <originalText>New Grading system</originalText>
  </code>
  <statusCode code="completed"/>
  <effectiveTime nullFlavor="UNK"/>
  <value xsi:type="CD" nullFlavor="OTH">
   <originalText>Spiculated mass grade 5</originalText>
  </value>
 </observation>
</entry>
```

If a sender wants to state that a piece of information is unknown, the following principles apply:

1. If the sender doesn’t know an attribute of an act, that attribute can be null.

**Unknown Medication Example**

1. *SHALL* contain exactly one [1..1] code

```
<entry>
 <text>patient was given a medication but I do not know what it was</text>
 <substanceAdministration moodCode="EVN" classCode="SBADM">
  <consumable>
   <manufacturedProduct>
    <manufacturedLabeledDrug>
     <code nullFlavor="NI"/>
    </manufacturedLabeledDrug>
   </manufacturedProduct>
  </consumable>
 </substanceAdministration>
</entry>
```

2. If the sender doesn’t know if an act occurred, the nullFlavor is on the act (detail could include specific allergy, drug, etc.).

**Unknown Medication Use of Anticoagulant Drug Example**

```
<entry>
 <substanceAdministration moodCode="EVN" classCode="SBADM" nullFlavor="NI">
  <text>I do not know whether or not patient received an anticoagulant drug</text>
  <consumable>
   <manufacturedProduct>
    <manufacturedLabeledDrug>
     <code code="81839001" displayName="anticoagulant drug" codeSystem="2.16.840.1.113883.6.96" codeSystemName="SNOMED CT"/>
    </manufacturedLabeledDrug>
   </manufacturedProduct>
  </consumable>
 </substanceAdministration>
</entry>
```

3. If the sender wants to state "no known", a negationInd can be used on the corresponding act (substanceAdministration, Procedure, etc.) Previously, CCD, IHE, and HITSP recommended using specific codes to assert no known content, for example 160244002 No known allergies or 160245001 No current problems or disability. Specific codes are still allowed; however, use of these codes is not recommended. These next examples illustrate nuances of representing information in coded fields when information is a negative assertion, for example it is not the case that the patient has an allergy or it is not the case that a patient takes a medication. The phrases "no known allergies" or "no known medications" are typically associated with this type of negative assertion.

**No Known Medications Example**

```
<entry>
 <substanceAdministration moodCode="EVN" classCode="SBADM" negationInd=”true”>
  <text>No known medications</text>
  <consumable>
   <manufacturedProduct>
    <manufacturedLabeledDrug>
     <code code="410942007" displayName="drug or medication" codeSystem="2.16.840.1.113883.6.96" codeSystemName="SNOMED CT"/>
    </manufacturedLabeledDrug>
   </manufacturedProduct>
  </consumable>
 </substanceAdministration>
</entry>
```

**Value Known, Code for Value Not Known**

```
<entry>
 <observation classCode="OBS" moodCode="EVN">
  …
  <value xsi:type="CD" nullFlavor="OTH">
   <originalText>Spiculated mass grade 5</originalText>
  </value>
 </observation>
</entry>
```

**Value Completely Unknown**

```
<entry>
 <observation classCode="OBS" moodCode="EVN">
  …
  <value xsi:type="CD" nullFlavor="UNK"/>
 </observation>
</entry>
```

**Value Known, Code in Required Code System Not Known But Code from Another Code System is Known**

```
<entry>
 <observation classCode="OBS" moodCode="EVN">
  …
  <value xsi:type="CD" nullFlavor="OTH">
   <originalText>Spiculated mass grade 5</originalText>
   <translation code="129742005" displayName="spiculated lesion" codeSystem="2.16.840.1.113883.6.96" codeSystemName="SNOMED CT"/>
  </value>
 </observation>
</entry>
```

### Template Versioning
TBD

### Schema and Schema Extensions
CDA defines a standard schema, based on the HL7 RIM, for all CDA documents.The XML Schema is designed to achieve the intentions of the CDA architecture. Please see section [The "A" in CDA]({{site.data.fhir.hl7_cda_uv_core}}/overview.html#the-a-in-cda) in CDA 2.0 StructureDefinition for more information. When there is a need to represent information where there is no suitable representation in the schema, the CDA standard permits extensions to be developed. The HL7 Structured Documents Work Group (SDWG) maintains a complete list of [CDA R2 extensions](https://confluence.hl7.org/display/SD/CDA+Extensions) that are approved for use within the sdtc namespace. These extensions exist in the stdc schema. The most current [CDA Schema](https://github.com/HL7/cda-core-2.0) is housed in the HL7 CDA GitHib 

### Validation Note

Schema, together with template specific rules, called schematron, have been the historical method that C-CDA documents are validated for conformance to the specifications. With this StructureDefinition publication of CDA and C-CDA, validation rules are inherent in the StructureDefinitions. However, headed into the ballot the accuracy of this method has not been fully tested. In addition, how this inherent new method can be deployed in industry is not yet known. 
By publication of this Implementation Guide post ballot, we anticipate testing will have occurred and plans to assist the industry will be in place. For more discussion, please see [Validation]({{site.data.fhir.hl7_cda_uv_core}}/validation.html)
