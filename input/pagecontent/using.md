This chapter describes the rules and formalisms used to constrain the CDA R2 standard. It describes the formal representation of CDA templates, the mechanism by which templates are bound to vocabulary, and additional information necessary to understand and correctly implement the normative content found in Volume 2 of this guide.

### Levels of Constraint

The CDA standard describes conformance requirements in terms of three general levels corresponding to three different, incremental types of conformance statements:

* Level 1 requirements impose constraints upon the CDA Header. The body of a Level 1 document may be XML or an alternate allowed format. If XML, it must be CDA-conformant markup.
* Level 2 requirements specify constraints at the section level of a CDA XML document: most critically, the section code and the cardinality of the sections themselves, whether optional or required.
* Level 3 requirements specify constraints at the entry level within a section. A specification is considered “Level 3” if it requires any entry-level templates.

Note that these levels are rough indications of what a recipient can expect in terms of machine-processable coding and content reuse. They do not reflect the level or type of clinical content, and many additional levels of reusability could be defined.

The contexts table for each document type lists the sections defined in the document template.

### Optional and Required with Cardinality

The terms optional and required describe the lower bound of cardinality as follows:

Optional means that the number of allowable occurrences of an element may be 0; the cardinality will be expressed as [0..1] or [0..*] or similar. In these cases, the element may not be present in the instance. Conformances formulated with MAY or SHOULD are both considered "optional" conformances.

Required means that the number of allowable occurrences of an element must be at least 1; the cardinality will be expressed as [m..n], where m >=1 and n >=1 (for example, [1..1] or [1..*]). In these cases, the element must be present in the instance. Conformance statements formulated with SHALL are required conformances. If an element is required but it is not known, the @nullFlavor attribute must be used.

### Data Types

All data types used in a CDA document are described in the CDA R2 normative edition. All attributes of a data type are allowed unless explicitly prohibited by this specification.

### XML Conventions Used in This Guide

#### XPath Notation

Instead of the traditional dotted notation used by HL7 to represent RIM classes, this document uses XML Path Language (XPath) notation14 in conformance statements and elsewhere to identify the XML elements and attributes within the CDA document instance to which various constraints are applied. The implicit context of these expressions is the root of the document. This notation provides a mechanism that will be familiar to developers for identifying parts of an XML document.

XPath syntax selects nodes from an XML document using a path containing the context of the node(s). The path is constructed from node names and attribute names (prefixed by a ‘@’) and catenated with a ‘/’ symbol.

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