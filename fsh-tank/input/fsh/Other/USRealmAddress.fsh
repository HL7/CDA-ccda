Profile: USRealmAddress
Parent: AD
Id: USRealmAddress
Title: "US Realm Address"
Description: """Reusable address template, for use in US Realm documents. 

Certifying systems SHALL and non-certifying systems SHOULD follow the Project US@ Technical Specification for Patient Addresses Final Version 1.0 as the standard style guide for Street Address Line and  City for new and updated records.

For certifying systems, this requirement does not apply to historical records/documents that are exposed through C-CDA documents."""
* insert LogicalModelNA
* ^identifier.value = "urn:oid:2.16.840.1.113883.10.20.22.5.2"
* ^identifier.system = $RFC
* obeys shall-city and shall-streetAddressLine and should-use and should-country and 81-7296 and 81-10024 and 81-10025 and shall-max-ad-parts
* nullFlavor ^short = "If addr/@nullFlavor is present, none of the address parts are required."
* use ^short = "Identifies which address to use for a given purpose."
  * ^comment = "Historically this was bound to ValueSet PostalAddressUse urn:oid:2.16.840.1.113883.1.11.10637 STATIC 2005-05-01, but this contained 'CONF' which is not allowed by CDA. So the binding has been removed in the current version of C-CDA."
* useablePeriod
  * insert USCDI([[Previous Address - Current or prior place where a person may have been located or could have been contacted.]])
* item.country from http://terminology.hl7.org/ValueSet/v3-Country2 (required)
* item.state ^binding.description = "If country is something other than US, the state MAY be present but MAY be bound to different vocabularies"
  * ^binding.strength = #example
  * insert AdditionalBinding(required, http://terminology.hl7.org/ValueSet/USPS-State, For US Addresses, [[If the country is US, the state element is required and SHALL be selected from ValueSet StateValueSet but SHOULD have @nullFlavor if the state is unknown. If country is not specified, it's assumed to be US. (CONF:81-10024).]])
* item.city ^short = "city is required if nullFlavor is absent"
  * ^comment = "SHALL contain exactly one [1..1] city (CONF:81-7292)."
* item.postalCode ^short = "If country is US, shall be a 5-digit or 9-digit zip code (##### or #####-####)"
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
Expression: "nullFlavor.exists() or (item.country.exists() and item.country.xmlText != 'US' and item.country.xmlText != 'USA') or item.state.exists(nullFlavor.exists() or xmlText.memberOf('http://terminology.hl7.org/ValueSet/USPS-State'))"

Invariant: 81-10025
Description: "If the country is US, the postalCode element is required but SHOULD have @nullFlavor if the postalCode is unknown. If country is not specified, it's assumed to be US. If country is something other than US, the postalCode MAY be present but MAY be bound to different vocabularies (CONF:81-10025)."
Severity: #error
Expression: "nullFlavor.exists() or (item.country.exists() and item.country.xmlText != 'US' and item.country.xmlText != 'USA') or item.postalCode.exists(nullFlavor.exists() or xmlText.matches('[0-9]{5}(-[0-9]{4})?'))"
// FHIRPath really doesn't like \d as an escape character...