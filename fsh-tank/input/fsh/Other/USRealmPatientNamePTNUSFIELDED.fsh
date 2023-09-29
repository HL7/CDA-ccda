Profile: USRealmPatientNamePTNUSFIELDED
Parent: PN
Id: USRealmPatientNamePTNUSFIELDED
Title: "US Realm Patient Name (PTN.US.FIELDED)"
Description: """The US Realm Patient Name datatype flavor is a set of reusable constraints that can be used for the patient or any other person. It requires a first (given) and last (family) name. If a patient or person has only one name part (e.g., patient with first name only) place the name part in the field required by the organization. Use the appropriate nullFlavor, "Not Applicable" (NA), in the other field.

For information on mixed content see the Extensible Markup Language reference (http://www.w3c.org/TR/2008/REC-xml-20081126/)."""
* insert LogicalModelNA
* ^identifier.value = "urn:oid:2.16.840.1.113883.10.20.22.5.1"
* obeys 81-7278
* use 0..1
  * ^short = "If name/@nullFlavor is present, the remaining conformance statements *SHALL NOT* be enforced"
  * ^comment = "MAY contain zero or one [0..1] @use, which SHALL be selected from ValueSet EntityNameUse urn:oid:2.16.840.1.113883.1.11.15913 STATIC 2005-05-01 (CONF:81-7154)."
* family 1..1
  * ^comment = "SHALL contain exactly one [1..1] family (CONF:81-7159)."
  * qualifier 0..1
  * qualifier from EntityPersonNamePartQualifier (required)
    * ^comment = "This family MAY contain zero or one [0..1] @qualifier, which SHALL be selected from ValueSet EntityPersonNamePartQualifier urn:oid:2.16.840.1.113883.11.20.9.26 STATIC 2011-09-30 (CONF:81-7160)."
* given 1..*
  * obeys 81-7163
  * ^comment = "SHALL contain at least one [1..*] given (CONF:81-7157)."
  * qualifier 0..1
  * qualifier from EntityPersonNamePartQualifier (required)
    * ^comment = "Such givens MAY contain zero or one [0..1] @qualifier, which SHALL be selected from ValueSet EntityPersonNamePartQualifier urn:oid:2.16.840.1.113883.11.20.9.26 STATIC 2011-09-30 (CONF:81-7158)."
* prefix 0..*
  * ^comment = "MAY contain zero or more [0..*] prefix (CONF:81-7155)."
  * qualifier 0..1
  * qualifier from EntityPersonNamePartQualifier (required)
    * ^comment = "The prefix, if present, MAY contain zero or one [0..1] @qualifier, which SHALL be selected from ValueSet EntityPersonNamePartQualifier urn:oid:2.16.840.1.113883.11.20.9.26 STATIC 2011-09-30 (CONF:81-7156)."
* suffix 0..1
  * ^comment = "MAY contain zero or one [0..1] suffix (CONF:81-7161)."
  * qualifier 0..1
  * qualifier from EntityPersonNamePartQualifier (required)
    * ^comment = "The suffix, if present, MAY contain zero or one [0..1] @qualifier, which SHALL be selected from ValueSet EntityPersonNamePartQualifier urn:oid:2.16.840.1.113883.11.20.9.26 STATIC 2011-09-30 (CONF:81-7162)."

Invariant: 81-7278
Description: "**SHALL NOT** have mixed content except for white space (CONF:81-7278)."
Severity: #error

Invariant: 81-7163
Description: "The second occurrence of given (given[2]) if provided, SHALL include middle name or middle initial (CONF:81-7163)."
Severity: #warning