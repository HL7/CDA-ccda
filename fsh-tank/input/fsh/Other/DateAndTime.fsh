Profile: USRealmDateTimeInterval
Parent: IVL_TS
Id: USRealmDateTimeInterval
Title: "US Realm Date and Time (Interval)"
Description: "The US Realm Clinical Document Date and Time datatype flavor records date and time information. If time is provided, it must include a time zone offset.

This data type uses the same rules as US Realm Date and Time (Point in Time), but is used with elements having a datatype of IVL_TS."
* insert LogicalModelNA
* ^identifier.value = "urn:oid:2.16.840.1.113883.10.20.22.5.3"
* obeys ivl-value-shall and ivl-value-should
* insert RequireTimezone
* value ^short = "Either @value or low/high should be present, but not both"
* low obeys ts-shall-day and ts-should-minute and ts-shall-timezone
  * ^short = "**MAY** be precise to at least the second"
  * insert RequireTimezone
* high obeys ts-shall-day and ts-should-minute and ts-shall-timezone
  * ^short = "**MAY** be precise to at least the second"
  * insert RequireTimezone

Invariant: ivl-value-shall
Severity: #error
Description: "If a time interval contains @value, then it shall be precise to at least the day. If it is more precise than to the day, it SHALL have a timezone offset."
Expression: "value.exists() implies (value.toString().length() = 10 or value.toString().length() >= 25)"
// See ts-shall-timezone for explanation of lengths
Invariant: ivl-value-should
Severity: #warning
Description: "If a time interval contains @value, then it SHOULD contain a time component."
Expression: "value.exists() implies value.toString().length() > 10"

Profile: USRealmDateTime
Parent: TS
Id: USRealmDateTime
Title: "US Realm Date and Time (Point in Time)"
Description: "The US Realm Clinical Document Date and Time datatype flavor records date and time information. If time is provided, it must include a time zone offset.

This data type uses the same rules as US Realm Date and Time (Interval), but is used with elements having a datatype of TS."
* insert LogicalModelNA
* insert RequireTimezone
* ^identifier.value = "urn:oid:2.16.840.1.113883.10.20.22.5.4"
* obeys ts-shall-day and ts-should-minute and ts-shall-timezone


// Flag a time element as reqiring timezone (if it contains time)
// The year-valid check is default in CDA - requires year to be between 1800 and now+80 years
RuleSet: RequireTimezone
* value 0..1
  // * ^extension.url = "http://hl7.org/fhir/tools/StructureDefinition/elementdefinition-date-rules"
  * ^extension[1].valueString = "year-valid:tz-for-time"


////////////////////////////////////////////////////////////
//                                                        //
//             Date/Time Related Invariants               //
//                                                        //
////////////////////////////////////////////////////////////

Invariant: ts-shall-year
Description: "**SHALL** be precise to at least the year"
Severity: #error
Expression: "nullFlavor.exists() or value.toString().length() >= 4"

Invariant: ts-should-day
Description: "**SHOULD** be precise to at least the day"
Severity: #warning
Expression: "nullFlavor.exists() or value.toString().length() >= 10"
// (While TS is a FHIR dateTime, this is an ISO string, so YYYY-MM-DD, not YYYYMMDD)

Invariant: ts-shall-day
Description: "**SHALL** be precise to at least the day"
Severity: #error
Expression: "nullFlavor.exists() or value.toString().length() >= 10"

Invariant: ts-should-minute
Description: "**SHOULD** be precise to at least the minute"
Severity: #warning
Expression: "nullFlavor.exists() or value.toString().length() > 10"
// TODO - Can't distinguish between times; as long as an hour is there, this is met

// Temp until date-rules extension works
Invariant: ts-shall-timezone
Description: "When time is present, there **SHALL** be a time-zone offset"
Severity: #error
// Combines above rules - if there's a time, it's automatically 19 characters long. If it has an offset, it's 25
Expression: "nullFlavor.exists() or value.toString().length() <= 10 or value.toString().length() >= 25"

Invariant: ts-value-before-document
Severity: #error
Description: "Time value must be equal to or before ClinicalDocument/effectiveTime"
Expression: "value.exists() implies value <= %resource.effectiveTime.value"