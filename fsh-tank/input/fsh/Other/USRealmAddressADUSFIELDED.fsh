Profile: USRealmAddressADUSFIELDED
Parent: AD
Id: USRealmAddressADUSFIELDED
Title: "US Realm Address (AD.US.FIELDED)"
Description: "Reusable address template, for use in US Realm CDA Header."
* insert LogicalModelNA
* ^identifier.value = "urn:oid:2.16.840.1.113883.10.20.22.5.2"
* obeys us-addr-nullflavor and should-use and should-country and 81-10024 and 81-10025
* nullFlavor ^short = "If addr/@nullFlavor is not present, city, streetAddressLine, and state/postalCode (if country is US) are required."
* use 0..1
* use from PostalAddressUse (required)
  * ^comment = "SHOULD contain zero or one [0..1] @use, which SHALL be selected from ValueSet PostalAddressUse urn:oid:2.16.840.1.113883.1.11.10637 STATIC 2005-05-01 (CONF:81-7290)."
* country 0..1
* country from $2.16.840.1.113883.3.88.12.80.63 (required)
  * ^comment = "SHOULD contain zero or one [0..1] country, which SHALL be selected from ValueSet Country urn:oid:2.16.840.1.113883.3.88.12.80.63 DYNAMIC (CONF:81-7295)."
* state 0..1
* state from $2.16.840.1.113883.3.88.12.80.1 (preferred)
  * ^comment = "SHOULD contain zero or one [0..1] state, which SHOULD be selected from ValueSet StateValueSet urn:oid:2.16.840.1.113883.3.88.12.80.1 DYNAMIC) (CONF:81-7293)."
// Note 1..1 - enforced by us-addr-nullflavor invariant
* city 0..1
  * ^short = "city is required if nullFlavor is absent"
  * ^comment = "SHALL contain exactly one [1..1] city (CONF:81-7292)."
* postalCode 0..1
* postalCode from $2.16.840.1.113883.3.88.12.80.2 (preferred)
  * ^comment = "SHOULD contain zero or one [0..1] postalCode, which SHOULD be selected from ValueSet PostalCode urn:oid:2.16.840.1.113883.3.88.12.80.2 DYNAMIC (CONF:81-7294)."
// Note 1..4 - enforced by us-addr-nullflavor invariant
* streetAddressLine 0..4
  * ^short = "streetAddressLine is required if nullFlavor is absent"
  * ^comment = "SHALL contain at least one and not more than 4 streetAddressLine (CONF:81-7291)."
* xmlText 0..0 
  * ^comment = "**SHALL NOT** have mixed content except for white space (CONF:81-7296)."

Invariant: us-addr-nullflavor
Description: "If addr/@nullFlavor is not present, city and streetAddressLine are required"
Severity: #error
Expression: "nullFlavor.exists() or (city.exists() and streetAddressLine.exists())"

// Invariant: should-use
// Description: "SHOULD contain zero or one [0..1] @use"
// Severity: #warning
// Expression: "use.exists()"

// Invariant: should-country
// Description: "SHOULD contain zero or one [0..1] country"
// Severity: #warning
// Expression: "country.exists()"

Invariant: 81-10024
Description: "If the country is US, the state element is required and SHALL be selected from ValueSet StateValueSet but SHOULD have @nullFlavor if the state is unknown. If country is not specified, it's assumed to be US. If country is something other than US, the state MAY be present but MAY be bound to different vocabularies (CONF:81-10024)."
Severity: #error
Expression: "nullFlavor.exists() or (country.exists() and country.xmlText != 'US') or state.exists()"
// TODO - once .3.88.12.80.1 valueset from .country is correct update state.exists() to (state.exists() and state.xmlText.memberOf('http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.88.12.80.1'))
// OR - if value set is updated to http://hl7.org/fhir/us/core/ValueSet/us-core-usps-state, use that here instead

Invariant: 81-10025
Description: "If the country is US, the postalCode element is required but SHOULD have @nullFlavor if the postalCode is unknown. If country is not specified, it's assumed to be US. If country is something other than US, the postalCode MAY be present but MAY be bound to different vocabularies (CONF:81-10025)."
Severity: #error
Expression: "nullFlavor.exists() or (country.exists() and country.xmlText != 'US') or postalCode.exists()"