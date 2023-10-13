Profile: CompanyNameObservation
Parent: $Observation
Id: CompanyNameObservation
Title: "Company Name Observation"
Description: "This template is intended to be used in addition to the **Product Instance** template urn:oid:2.16.840.1.113883.10.20.22.4.37 to exchange the **Company Name**.  The UDI-DI of the medical device may be used to retrieve the **Company Name** in accessGUDID, which should be considered the source of truth."

* insert LogicalModelTemplate(company-name-obs, 2.16.840.1.113883.10.20.22.4.303, 2019-06-21)

* code 1..1
  * ^short = "Code for \"Company Name\""
  * ^comment = "SHALL contain exactly one [1..1] code (CONF:4437-3442)."
  * code 1..1
  * code = #C54131
    * ^comment = "This code SHALL contain exactly one [1..1] @code=\"C54131\" Company Name  (CodeSystem: NCI Thesaurus (NCIt) urn:oid:2.16.840.1.113883.3.26.1.1 STATIC) (CONF:4437-3445)."
  * codeSystem 1..1
  * codeSystem = "2.16.840.1.113883.3.26.1.1"
    * ^comment = "This code SHALL contain exactly one [1..1] @codeSystem=\"2.16.840.1.113883.3.26.1.1\" (CONF:4437-3446)."
  * codeSystemName ^short = "MAY be set to 'NCI Thesaurus'"
    * ^comment = "This code MAY contain zero or one [0..1] @codeSystemName=\"NCI Thesaurus\" (CONF:4437-3447)."
  * displayName ^short = "MAY be set to 'Company Name'"
    * ^comment = "This code MAY contain zero or one [0..1] @displayName=\"Company Name\" (CONF:4437-3448)."
* value 1..1
* value only $ED
  * ^comment = "SHALL contain exactly one [1..1] value with @xsi:type=\"ED\" (CONF:4437-3449)."