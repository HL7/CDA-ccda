Profile: USRealmAddress
Parent: AD
Id: USRealmAddress
Title: "US Realm Address"
Description: "Reusable address template, for use in US Realm documents"
* insert LogicalModelNA
* ^identifier.value = "urn:oid:2.16.840.1.113883.10.20.22.5.2"
* obeys shall-city and shall-streetAddressLine and should-use and should-country and 81-7296 and 81-10024 and 81-10025 and shall-max-ad-parts
* nullFlavor ^short = "If addr/@nullFlavor is present, none of the address parts are required."
* use from PostalAddressUse (required)
  * ^comment = "SHOULD contain zero or one [0..1] @use, which SHALL be selected from ValueSet PostalAddressUse urn:oid:2.16.840.1.113883.1.11.10637 STATIC 2005-05-01 (CONF:81-7290)."
* item.country from $2.16.840.1.113883.3.88.12.80.63 (required)
  * ^comment = "SHOULD contain zero or one [0..1] country, which SHALL be selected from ValueSet Country urn:oid:2.16.840.1.113883.3.88.12.80.63 DYNAMIC (CONF:81-7295)."
* item.state from $2.16.840.1.113883.3.88.12.80.1 (preferred)
  * ^comment = "SHOULD contain zero or one [0..1] state, which SHOULD be selected from ValueSet StateValueSet urn:oid:2.16.840.1.113883.3.88.12.80.1 DYNAMIC) (CONF:81-7293)."
* item.city ^short = "city is required if nullFlavor is absent"
  * ^comment = "SHALL contain exactly one [1..1] city (CONF:81-7292)."
* item.postalCode from $2.16.840.1.113883.3.88.12.80.2 (preferred)
  * ^comment = "SHOULD contain zero or one [0..1] postalCode, which SHOULD be selected from ValueSet PostalCode urn:oid:2.16.840.1.113883.3.88.12.80.2 DYNAMIC (CONF:81-7294)."
* item.streetAddressLine ^short = "Min: 1, Max: 4 streetAddressLine required if nullFlavor is absent"

Invariant: shall-city
Description: "SHALL contain exactly one [1..1] city (CONF:81-7292)."
Severity: #error
Expression: "nullFlavor.exists() or item.city.count() = 1"

Invariant: shall-streetAddressLine
Description: "SHALL contain at least one and not more than 4 streetAddressLine (CONF:81-7291)."
Severity: #error
Expression: "nullFlavor.exists() or (item.streetAddressLine.count() >= 1 and item.streetAddressLine.count() <= 4)"

Invariant: 81-7296
Description: "**SHALL NOT** have mixed content except for white space (CONF:81-7296)"
Severity: #error
Expression: "item.xmlText.empty()"

Invariant: shall-max-ad-parts
Description: "SHALL have at most one of each: state, city, postalCode, and country"
Severity: #error
Expression: "(item.state.empty() or item.state.count() = 1) and (item.city.empty() or item.city.count() = 1) and (item.postalCode.empty() or item.postalCode.count() = 1) and (item.country.empty() or item.country.count() = 1)"

Invariant: 81-10024
Description: "If the country is US, the state element is required and SHALL be selected from ValueSet StateValueSet but SHOULD have @nullFlavor if the state is unknown. If country is not specified, it's assumed to be US. If country is something other than US, the state MAY be present but MAY be bound to different vocabularies (CONF:81-10024)."
Severity: #error
Expression: "nullFlavor.exists() or (item.country.exists() and item.country.xmlText != 'US') or item.state.exists()"
// TODO - once .3.88.12.80.1 valueset from .country is correct update state.exists() to (state.exists() and state.xmlText.memberOf('http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.88.12.80.1'))
// OR - if value set is updated to http://hl7.org/fhir/us/core/ValueSet/us-core-usps-state, use that here instead

Invariant: 81-10025
Description: "If the country is US, the postalCode element is required but SHOULD have @nullFlavor if the postalCode is unknown. If country is not specified, it's assumed to be US. If country is something other than US, the postalCode MAY be present but MAY be bound to different vocabularies (CONF:81-10025)."
Severity: #error
Expression: "nullFlavor.exists() or (item.country.exists() and item.country.xmlText != 'US') or item.postalCode.exists()"