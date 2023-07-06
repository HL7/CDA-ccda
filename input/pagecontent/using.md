[Previous Page - Design Considerations](designconsiderations.html)

This chapter describes the rules and formalisms used to constrain the CDA R2 standard. It describes the formal representation of CDA templates, the mechanism by which templates are bound to vocabulary, and additional information necessary to understand and correctly implement the normative content found in Volume 2 of this guide.

### Levels of Constraint

The CDA standard describes conformance requirements in terms of three general levels corresponding to three different, incremental types of conformance statements:

* Level 1 requirements impose constraints upon the CDA Header. The body of a Level 1 document may be XML or an alternate allowed format. If XML, it must be CDA-conformant markup.
* Level 2 requirements specify constraints at the section level of a CDA XML document: most critically, the section code and the cardinality of the sections themselves, whether optional or required.
* Level 3 requirements specify constraints at the entry level within a section. A specification is considered “Level 3” if it requires any entry-level templates.

Note that these levels are rough indications of what a recipient can expect in terms of machine-processable coding and content reuse. They do not reflect the level or type of clinical content, and many additional levels of reusability could be defined.

The contexts table for each document type lists the sections defined in the document template.

### Conformance Conventions Used in this Guide

#### Templates and Conformance Statements

Conformance statements within this implementation guide are presented as constraints
from Trifolia Workbench, a template repository. An algorithm converts constraints
recorded in Trifolia to a printable presentation. Each constraint is uniquely identified by
an identifier at or near the end of the constraint (e.g., CONF:86-7345). The digits in the
conformance number before the hyphen identify which implementation guide the
template belongs to and the number after the hyphen is unique to the owning
implementation guide. Together, these two numbers uniquely identify each constraint.
These identifiers are persistent but not sequential. Conformance numbers in this guide
associated with a conformance statement that is carried forward from a previous
version of this guide will carry the same conformance number from the previous
version. This is true even if the previous conformance statement has been edited. If a
conformance statement is entirely new it will have a new conformance number.

Bracketed information following each template title indicates the template type (section,
observation, act, procedure, etc.), the object identifier (OID) or uniform resource name (URN), and whether the template is open or closed. The identifier OID is the
templateId/@root value; all templateIds have an @root value. Versioned templates
also have an @extension value, which is a date identifying the version of this template;
such templates are identified by URN and the HL7 version (urn:hl7ii). The URN
identifier includes both the @root and @extension value for the templateId (for
example, identifier urn:hl7ii:2.16.840.1.113883.10.20.5.5.41:2014-06-09).

Each section and entry template in Volume 2 of this guide includes a context table. The
"Contained By" column indicates which templates use this template, and if the template
is optional or required in the containing template. The "Contains" column indicates any
templates that the template uses.

**Table 2: Contexts Table Example—Allergy Concern Act (V2)**

| **Contained By:**                                                     | **Contains:**                          |
|-----------------------------------------------------------------------|----------------------------------------|
| Allergies and Intolerances Section (entries optional) (V2) (optional) | Allergy - Intolerance Observation (V2) |
| Allergies and Intolerances Section (entries required) (V2) (required) | Author Participation                   |
{: .grid }

Each entry template also includes a constraints overview table to summarize the
constraints in the template.

**Table 3: Constraints Overview Example—Allergy Concern Act (V2)**

| **XPath**                                                              | **Card.** | **Verb** | **Data Type** | **CONF#**   | Value                                     |
|------------------------------------------------------------------------|-----------|----------|---------------|-------------|-------------------------------------------|
| act (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.4.30:2014-06-09)                                                                                                  |
| @classCode                                                             | 1..1      | SHALL    |               | 1098-7469   | 2.16.840.1.113883.5.6 (HL7ActClass) = ACT |
| @moodCode                                                              | 1..1      | SHALL    |               | 1098-7470   | 2.16.840.1.113883.5.1001 ActMood) = EVN   |
| templateId                                                             | 1..1      | SHALL    |               | 1098-7471   |                                           |
| @root                                                                  | 1..1      | SHALL    |               | 1098-10489  | 2.16.840.1.113883.10.20.22.4.30           |
| @extension                                                             | 1..1      | SHALL    |               | 1098-32543  | 2014-06-09                                |
| ...                                                                                                                                                                     |
{: .grid }

The expression "such that it" at the end of one conformance statement links that
conformance statement to the following subordinate conformance statement to further
constrain the first conformance statement. To understand the full effect of this
conformance construct, the two conformances must be considered as a single
compound requirement. The subordinate conformance statement functions as a
subordinate clause (like a "where" clause), which is being applied on the first
conformance statement.

The following example shows a compound conformance statement made up of two
conformance statements joined by a "such that it" clause. The effect of this syntax can
be interpreted as a "where" clause. Thus... 
    2. SHALL contain exactly one [1..1] templateId (CONF:81-7899) such that it
        a. SHALL contain exactly one [1..1]
           @root="2.16.840.1.113883.10.20.22.4.31" (CONF:81-10487).
...is understood as:
    This template SHALL contain exactly one [1..1] templateId where it contains
    exactly one [1..1] @root="2.16.840.1.113883.10.20.22.4.31".
This means that you must have a template id with
@root="2.16.840.1.113883.10.20.22.4.31", but you can also have other template
ids with different valued attributes.

The following figure shows a typical template’s set of constraints presented in this
guide. The next chapters describe specific aspects of conformance statements—open vs.
closed templates, conformance verbs, cardinality, vocabulary conformance,
containment relationships, and null flavors.

**Figure 15: Constraint Conformance Including "such that it" Syntax Example**
```
Age Observation
  [observation: identifier urn:oid:2.16.840.1.113883.10.20.22.4.31 (open)]

    1. SHALL contain exactly one [1..1] @classCode="OBS" Observation
       (CodeSystem: HL7ActClass 2.16.840.1.113883.5.6 STATIC) (CONF:81-
       7613).
    2. SHALL contain exactly one [1..1] @moodCode="EVN" Event (CodeSystem:
       ActMood 2.16.840.1.113883.5.1001 STATIC) (CONF:81-7614).
    3. SHALL contain exactly one [1..1] templateId (CONF:81-7899) such that it
        a. SHALL contain exactly one [1..1]
        @root="2.16.840.1.113883.10.20.22.4.31" (CONF:81-10487).
...
```

#### Template Versioning

A new version of an existing implementation guide reuses templates from the previous
version. During the ballot phase or update phase, templates carry the designation
“Published” to indicate the template is unchanged from the previous version or “Draft”
to indicate a new or revised template. Substantial revisions to previously published
templates are indicated by the version number (V2, V3, etc.) in all phases: ballot,
update, and published guides.

If there are no substantive changes to a template that has been successfully published,
the template will carry the same templateId/@root (identifier oid) and
templateId/@extension as in the previous implementation guide. (In the case of older
templates, the @extension attribute will not be present.) During a new ballot or update
phase, “Published” is appended to the main heading for the template to indicate that
the template cannot be commented on in the ballot or update. The “Published”
designation is removed in the final publication versions.

A revised version of a previously published template keeps the same
templateId/@root as the previous version but is assigned a new
templateId/@extension. The notation “(Vn)” (V2, V3, etc.) is also added to the
template name. Versions are not necessarily forward or backward compatible. A
versioning may be due to substantive changes in the template or because a contained
template has changed. The “(Vn)” designation is persistent; it appears with that
template when it is used in subsequent guides. During a new ballot or update phase,
“Draft” is appended to the main heading for the template to indicate that it may be
voted on in the ballot or commented on in the update; the “Draft” designation is
removed in the final publication versions.

Structured Documents Working Group collaborated with Templates Working Group to
establish template versioning recommendations, recently published in the following
specification: [HL7 Templates Standard: Specification and Use of Reusable Information
Constraint Templates, Release 1](http://www.hl7.org/dstucomments/showdetail.cfm?dstuid=132). SDWG will leverage that specification to create
guidance for template IDs and template versioning for future CDA implementation
guides, including future versions of C-CDA, but that work is still in progress. The
versioning approach used in this version of C-CDA is likely to be close to the final
guidance, but has not been formally approved by SDWG for all implementation guides
at this time. 

#### Open and Closed Templates

In open templates, all of the features of the CDA R2 base specification are allowed
except as constrained by the templates. By contrast, a closed template specifies
everything that is allowed and nothing further may be included.

Estimated Date of Delivery (templateId 2.16.840.1.113883.10.20.15.3.1) is an
example of a closed template in this guide.

Open templates allow HL7 implementers to develop additional structured content not
constrained within this guide. HL7 encourages implementers to bring their use cases
forward as candidate requirements to be formalized in a subsequent version of the
standard to maximize the use of shared semantics.

#### Comformance Verbs (Keywords)

The keywords SHALL, SHOULD, MAY, NEED NOT, SHOULD NOT, and SHALL NOT in this
document are to be interpreted as described in the HL7 Version 3 Publishing
Facilitator's Guide.[^11]
- SHALL: an absolute requirement
- SHALL NOT: an absolute prohibition against inclusion
- SHOULD/SHOULD NOT: best practice or recommendation. There may be valid
reasons to ignore an item, but the full implications must be understood and
carefully weighed before choosing a different course
- MAY/NEED NOT: truly optional; can be included or omitted as the author decides
with no implications
[^11]: HL7, Version 3 Publishing Facilitator's Guide. http://www.hl7.org/v3ballot/html/help/pfg/pfg.htm

The keyword "SHALL" allows the use of nullFlavor unless the requirement is on an
attribute or the use of nullFlavor is explicitly precluded.

When conformance statements are nested (or have subordinate clauses) the
conformance statements are to be read and interpreted in hierarchical order. These
hierarchical clauses can be interpreted as "if then, else" clauses. Thus...
    a. This structuredBody SHOULD contain zero or one [0..1] component
       (CONF:1098-29066) such that it
        i. SHALL contain exactly one [1..1] Plan of Treatment Section (V2)
           (identifier:
           urn:hl7ii:2.16.840.1.113883.10.20.22.2.10:2014-06-09)
           (CONF:1098-29067).
...is understood as:
    a. It is recommended (SHOULD) that the structureBody contains a component.
        i. If the component exists, then it must contain a Plan of Treatment
           Section (V2),
        ii. else the component does not exist, and the conformance statement
            about the Plan of Treatment Section (V2) should be skipped.
In the case where the higher level conformance statement is a SHALL, there is no
conditional clause. Thus...
    b. This structuredBody SHALL contain exactly one [1..1] component
       (CONF:1098-29086) such that it
        i. SHALL contain exactly one [1..1] Problem Section (entries
           required) (V2) (identifier:
           urn:hl7ii:2.16.840.1.113883.10.20.22.2.5.1:2014-06-09)
           (CONF:1098-29087).
...means that the structuredBody is always required to have a component.

#### Cardinality

The cardinality indicator (0..1, 1..1, 1..*, etc.) specifies the allowable occurrences within
a document instance. The cardinality indicators are interpreted with the following
format “m…n” where m represents the least and n the most:
- 0..1 zero or one
- 1..1 exactly one
- 1..* at least one
- 0..* zero or more
- 1..n at least one and not more than n

When a constraint has subordinate clauses, the scope of the cardinality of the parent
constraint must be clear. In the next figure, the constraint says exactly one participant
is to be present. The subordinate constraint specifies some additional characteristics of
that participant.

**Figure 16: Constraints Format – only one allowed**
```
1. SHALL contain exactly one [1..1] participant (CONF:2777).
  a. This participant SHALL contain exactly one [1..1] @typeCode="LOC"
     (CodeSystem: 2.16.840.1.113883.5.90 HL7ParticipationType)
     (CONF:2230).

```

In the next figure, the constraint says only one participant “like this” is to be present.
Other participant elements are not precluded by this constraint.

**Figure 17: Constraints Format – only one like this allowed**
```
1. SHALL contain exactly one [1..1] participant (CONF:2777) such that it
  a. SHALL contain exactly one [1..1] @typeCode="LOC" (CodeSystem:
    2.16.840.1.113883.5.90 HL7ParticipationType) (CONF:2230).
```

In the next figure, the constraint says only one participant "like this" is to be present.
Other participant elements are not precluded by this constraint.


#### Optional and Required with Cardinality

The terms optional and required describe the lower bound of cardinality as follows:

Optional means that the number of allowable occurrences of an element may be 0; the cardinality will be expressed as [0..1] or [0..\*] or similar. In these cases, the element may not be present in the instance. Conformances formulated with MAY or SHOULD are both considered "optional" conformances.

Required means that the number of allowable occurrences of an element must be at least 1; the cardinality will be expressed as [m..n], where m >=1 and n >=1 (for example, [1..1] or [1..\*]). In these cases, the element must be present in the instance.
Conformance statements formulated with SHALL are required conformances. If an
element is required but it is not known, the @nullFlavor attribute must be used. See
[Unknown and No Known Information](https://build.fhir.org/ig/HL7/CDA-ccda-2.1-sd/designconsiderations.html#unknown-and-no-known-information).

#### Containment Relationships

Containment constraints between a section and its entries allow indirect containment
in this guide. This means that where a section asserts containment of an entry, that
entry either can be a direct child or a further descendent of that section.

For example, in the following constraint:
    1. SHALL contain at least one [1..\*] entry (CONF:8647) such that it
        a. SHALL contain exactly one [1..1] Advance Directive Observation
           (templateId:2.16.840.1.113883.10.20.22.4.48) (CONF:8801).
The Advance Directive Observation can be a direct child of the section (i.e.,
section/entry/AdvanceDirectiveObservation) or a further descendent of that
section (i.e., section/entry/…/AdvanceDirectiveObservation). Either of these are
conformant.

All other constraints are direct and do not allow an indirect containment relationship,
for example:
    1. SHALL contain exactly one [1..1]
       templateId/@root="2.16.840.1.113883.10.20.22.2.21" (CONF:7928).
The templateId must be a direct child of the section (i.e., section/templateId).

#### Vocabulary Conformance

The templates in this document use terms from several code systems. These
vocabularies are defined in various supporting specifications and may be maintained by
other bodies, as is the case for the LOINC® and SNOMED CT® vocabularies.

Note that value set identifiers (e.g., ValueSet 2.16.840.1.113883.1.11.78
Observation Interpretation (HL7) DYNAMIC) used in the binding definitions of
template conformance statements do not appear in the XML instance of a CDA
document. The definition of the template must be referenced to determine or validate
the vocabulary conformance requirements of the template.

Value set bindings adhere to HL7 Vocabulary Working Group best practices, and
include both an indication of stability and of coding strength for the binding. Value set
bindings can be STATIC, meaning that they bind to a specified version of a value set, or
DYNAMIC, meaning that they bind to the most current version of the value set. If a STATIC
binding is specified, a date SHALL be included to indicate the value set version. If a
DYNAMIC binding is specified, the value set authority and link to the base definition of
the value set SHALL be included, if available, so implementers can access the current
version of the value set. When a vocabulary binding binds to a single code, the stability
of the binding is implicitly STATIC.

**Figure 18: Binding to a Single Code**
```
2. SHALL contain exactly one [1..1] code (CONF:15403).
  a) This code SHALL contain exactly one [1..1] @code="11450-4" Problem List
     (CONF:15408).
  b) This code SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.6.1"
     (CodeSystem: LOINC 2.16.840.1.113883.6.1 STATIC) (CONF: 31141).
```

The notation conveys the actual code (11450-4), the code’s displayName (Problem List),
the OID of the codeSystem from which the code is drawn (2.16.840.1.113883.6.1), and
the codeSystemName (LOINC).

HL7 Data Types Release 1 requires the codeSystem attribute unless the underlying
data type is “Coded Simple” or “CS”, in which case it is prohibited. The displayName
and the codeSystemName are optional, but recommended, in all cases.

The above example would be properly expressed as follows.

**Figure 19: XML Expression of a Single-Code Binding**
```
<code code="11450-4" codeSystem="2.16.840.1.113883.6.1"/>

<!-- or -->

<code code="11450-4" codeSystem="2.16.840.1.113883.6.1"
  displayName="Problem List"
  codeSystemName="LOINC"/>

```

A full discussion of the representation of vocabulary is outside the scope of this
document; for more information, see the [HL7 V3 Normative Edition 2010](http://www.hl7.org/memonly/downloads/v3edition.cfm) sections on
Abstract Data Types and XML Data Types R1.

There is a discrepancy between the HL7 R1 Data Types and this guide in the in the
implementation of translation code versus the original code. The R1 data type requires
the original code in the root. The convention agreed upon for this implementation guide
specifies a code from the required value set be used in the element and other codes not
included in the value set are to be represented in a translation for the element. This
discrepancy is resolved in HL7 Data Types R2.

In the next example, the conformant code is SNOMED-CT code 206525008.

**Figure 20: Translation Code Example**
```
<code code='206525008’
    displayName='neonatal necrotizing enterocolitis'
    codeSystem='2.16.840.1.113883.6.96'
    codeSystemName='SNOMED CT'>
  <translation code='NEC-1'
    displayName='necrotizing enterocolitis'
    codeSystem='2.16.840.1.113883.19'/>
</code>
```

Value set tables are present below a template, or are referenced if they occur elsewhere
in the specification, when there are value set bindings in the template. The value set
table provides the value set identifier, a description, and a link to the source of the
value set when possible. Ellipses in the last row indicate the value set members shown
are examples and the true source must be accessed to see all members.

If a value set binding has a DYNAMIC stability, implementers creating a CDA document
must go to the location in the URL to check for the most current version of the value set
expansion.


**Table 4: Example Value Set Table (Referral Types)**

| Value Set: Referral Types |                 |                        |                                                   |
| A value set of SNOMED-CT codes descending from "3457005" patient referral (procedure).                                   |
| Value Set Source:                                                                                                        |
| http://vtsl.vetmed.vt.edu/TerminologyMgt/RF2Browser/ISA.cfm?SCT_ConceptID=345                                            |
| 7005                                                                                                                     |
|---------------------------|-----------------|------------------------|---------------------------------------------------|
| **Code**                  | **Code System** | **Code System OID**    | **Print Name**                                    |
| 44383000                  | SNOMED CT       | 2.16.840.1.113883.6.96 | Patient referral for consultation                 |
| 391034007                 | SNOMED CT       | 2.16.840.1.113883.6.96 | Refer for falls assessment (procedure)            |
| 86395003                  | SNOMED CT       | 2.16.840.1.113883.6.96 | Patient referral for family planning (procedure)  |
| 306106002                 | SNOMED CT       | 2.16.840.1.113883.6.96 | Referral to intensive care service (procedure)    |
| 306140002                 | SNOMED CT       | 2.16.840.1.113883.6.96 | Referral to clinical oncology service (procedure) |
| 396150002                 | SNOMED CT       | 2.16.840.1.113883.6.96 | Referral for substance abuse (procedure)          |
| ...                       |                 |                        |                                                   |

#### Data Types

All data types used in a CDA document are described in the [CDA R2 normative edition](http://www.hl7.org/implement/standards/product_brief.cfm?product_id=7). All attributes of a data type are allowed unless 
explicitly prohibited by this specification.

#### Document-Level Templates "Properties" Heading
In Volume 2 of this implementation guide, each document-level template has a "Properties" heading for ease of navigation. The Properties heading is an organizational construct, underneath which relevant CDA act-relationships and roles are called out as headings in the document.

### XML Conventions Used in This Guide

#### XPath Notation

Instead of the traditional dotted notation used by HL7 to represent RIM classes, this document uses [XML Path Language (XPath) notation](http://www.w3.org/TR/xpath/) in conformance statements and elsewhere to identify the XML elements and attributes within the CDA document instance to which various constraints are applied. The implicit context of these expressions is the root of the document. This notation provides a mechanism that will be familiar to developers for identifying parts of an XML document.

XPath syntax selects nodes from an XML document using a path containing the context of the node(s). The path is constructed from node names and attribute names (prefixed by a ‘@’) and catenated with a '/' symbol.

**XML Document Example**

```
<author>
  <assignedAuthor>
    ...
    <code codeSystem='2.16.840.1.113883.6.96' codeSystemName='SNOMED CT' code='17561000' displayName='Cardiologist' />
    ...
  </assignedAuthor>
</author>
```

In the above example, the `code` attribute of the code could be selected with the XPath expression in the next figure.

**XPath Expression Example**

`author/assignedAuthor/code/@code`

[Next Page - References](references.html)

#### XML Examples and Sample Documents

Extensible Mark-up Language (XML) examples appear in figures in this document in
this monospace font. XML elements (code, assignedAuthor, etc.) and attribute
names (SNOMED CT, 17561000, etc.) also appear in this monospace font. Portions of
the XML content may be omitted from the content for brevity, marked by an ellipsis (...)
as shown in the example below.

**Figure 23: ClinicalDocument Example**

```
<ClinicalDocument xmls="urn:h17-org:v3">
 ...
</ClinicalDocument>
```