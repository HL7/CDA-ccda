Profile: CommentActivity
Parent: $Act
Id: CommentActivity
Title: "Comment Activity"
Description: "Comments are free text data that cannot otherwise be recorded using data elements already defined by this specification. They are not to be used to record information that can be recorded elsewhere. For example, a free text description of the severity of an allergic reaction would not be recorded in a comment."

* insert LogicalModelTemplateRootOnly(comment-activity, 2.16.840.1.113883.10.20.22.4.64)

* obeys 81-9429
* classCode 1..1
* classCode = #ACT (exactly)
  * ^comment = "SHALL contain exactly one [1..1] @classCode=\"ACT\" Act (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:81-9425)."
* moodCode 1..1
* moodCode = #EVN (exactly)
  * ^comment = "SHALL contain exactly one [1..1] @moodCode=\"EVN\" Event (CodeSystem: HL7ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:81-9426)."
* code 1..1
  * ^comment = "SHALL contain exactly one [1..1] code (CONF:81-9428)."
  * code 1..1
  * code = #48767-8
    * ^comment = "This code SHALL contain exactly one [1..1] @code=\"48767-8\" Annotation Comment (CONF:81-19159)."
  * codeSystem 1..1
  * codeSystem = "2.16.840.1.113883.6.1"
    * ^comment = "This code SHALL contain exactly one [1..1] @codeSystem=\"2.16.840.1.113883.6.1\" (CodeSystem: LOINC urn:oid:2.16.840.1.113883.6.1) (CONF:81-26501)."
* text 1..1
  * ^comment = "SHALL contain exactly one [1..1] text (CONF:81-9430)."
  * reference 1..1
    * ^comment = "This text SHALL contain exactly one [1..1] reference (CONF:81-15967)."
    * value 1..1
      * obeys 81-15969
      * ^comment = "This reference SHALL contain exactly one [1..1] @value (CONF:81-15968)."
* author 0..1
* author only AuthorParticipation
  * ^comment = "SHOULD contain zero or one [0..1] Author Participation (identifier: urn:oid:2.16.840.1.113883.10.20.22.4.119) (CONF:81-9433)."

Invariant: 81-9429
Description: "Data elements defined elsewhere in the specification SHALL NOT be recorded using the Comment Activity (CONF:81-9429)."
Severity: #warning

Invariant: 81-15969
Description: "This reference/@value SHALL begin with a '#' and SHALL point to its corresponding narrative (using the approach defined in CDA Release 2, section 4.3.5.1) (CONF:81-15969)."
Severity: #error