Profile: USRealmPatientNamePTNUSFIELDED
Parent: PN
Id: USRealmPatientNamePTNUSFIELDED
Title: "US Realm Patient Name (PTN.US.FIELDED)"
Description: """The US Realm Patient Name datatype flavor is a set of reusable constraints that can be used for the patient or any other person. It requires a first (given) and last (family) name. If a patient or person has only one name part (e.g., patient with first name only) place the name part in the field required by the organization. Use the appropriate nullFlavor, "Not Applicable" (NA), in the other field.

For information on mixed content see the Extensible Markup Language reference (http://www.w3c.org/TR/2008/REC-xml-20081126/)."""
* insert LogicalModelNA
* ^identifier.value = "urn:oid:2.16.840.1.113883.10.20.22.5.1"
* ^identifier.system = $RFC
* obeys shall-family and shall-given and shall-max-suffix and 81-7278
* use 0..1
  * ^short = "If name/@nullFlavor is present, the remaining conformance statements *SHALL NOT* be enforced"
  * ^comment = "MAY contain zero or one [0..1] @use, which SHALL be selected from ValueSet EntityNameUse urn:oid:2.16.840.1.113883.1.11.15913 STATIC 2005-05-01 (CONF:81-7154)."
* validTime
  * insert USCDI([[Previous Name - Available for use to identify the time period when name was/is in use.]])
* item.family
  * insert USCDI([[Last Name]])
  * qualifier 0..1
  * qualifier from EntityPersonNamePartQualifier (required)
    * ^comment = "This family MAY contain zero or one [0..1] @qualifier, which SHALL be selected from ValueSet EntityPersonNamePartQualifier urn:oid:2.16.840.1.113883.11.20.9.26 STATIC 2011-09-30 (CONF:81-7160)."
* item.given ^short = "The first given is the first name. The second occurrence of given, if provided, SHALL include middle name or middle initial."
  * insert USCDI([[First Name / Middle Name]])
  * ^comment = "SHALL contain at least one [1..*] given (CONF:81-7157)."
  * qualifier 0..1
  * qualifier from EntityPersonNamePartQualifier (required)
    * insert USCDI([[callMe meets the USCDI 'Name to use' requirement]])
    * ^comment = "Such givens MAY contain zero or one [0..1] @qualifier, which SHALL be selected from ValueSet EntityPersonNamePartQualifier urn:oid:2.16.840.1.113883.11.20.9.26 STATIC 2011-09-30 (CONF:81-7158)."
* item.prefix ^comment = "MAY contain zero or more [0..*] prefix (CONF:81-7155)."
  * qualifier 0..1
  * qualifier from EntityPersonNamePartQualifier (required)
    * ^comment = "The prefix, if present, MAY contain zero or one [0..1] @qualifier, which SHALL be selected from ValueSet EntityPersonNamePartQualifier urn:oid:2.16.840.1.113883.11.20.9.26 STATIC 2011-09-30 (CONF:81-7156)."
* item.suffix ^comment = "MAY contain zero or one [0..1] suffix (CONF:81-7161)."
  * insert USCDI([[Suffix]])
  * qualifier 0..1
  * qualifier from EntityPersonNamePartQualifier (required)
    * ^comment = "The suffix, if present, MAY contain zero or one [0..1] @qualifier, which SHALL be selected from ValueSet EntityPersonNamePartQualifier urn:oid:2.16.840.1.113883.11.20.9.26 STATIC 2011-09-30 (CONF:81-7162)."

Invariant: 81-7278
Description: "**SHALL NOT** have mixed content except for white space (CONF:81-7278)."
Severity: #error
Expression: "item.xmlText.empty()"

Invariant: shall-family
Description: "SHALL contain exactly one [1..1] family (CONF:81-7159)."
Severity: #error
Expression: "nullFlavor.exists() or item.family.count() = 1"

Invariant: shall-given
Description: "SHALL contain at least one [1..*] given (CONF:81-7157)."
Severity: #error
Expression: "nullFlavor.exists() or item.given.exists()"

Invariant: shall-max-suffix
Description: "There may be at most one suffix"
Severity: #error
Expression: "(item.suffix.empty() or item.suffix.count() = 1)"