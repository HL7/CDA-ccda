This chapter describes the rules and formalisms used to constrain the CDA R2 standard. It describes the formal representation of CDA templates, the mechanism by which templates are bound to vocabulary, and additional information necessary to understand and correctly implement the normative content found in Volume 2 of this guide.

### Levels of Constraint

The CDA standard describes conformance requirements in terms of three general levels corresponding to three different, incremental types of conformance statements:

* Level 1 requirements impose constraints upon the CDA Header. The body of a Level 1 document may be XML or an alternate allowed format. If XML, it must be CDA-conformant markup.
* Level 2 requirements specify constraints at the section level of a CDA XML document: most critically, the section code and the cardinality of the sections themselves, whether optional or required.
* Level 3 requirements specify constraints at the entry level within a section. A specification is considered “Level 3” if it requires any entry-level templates.

Note that these levels are rough indications of what a recipient can expect in terms of machine-processable coding and content reuse. They do not reflect the level or type of clinical content, and many additional levels of reusability could be defined.

The contexts table for each document type lists the sections defined in the document template.