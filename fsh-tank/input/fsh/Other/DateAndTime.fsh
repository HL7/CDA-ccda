Profile: USRealmDateTimeInterval
Parent: IVL_TS
Id: USRealmDateTimeInterval
Title: "US Realm Date and Time (Interval)"
Description: "The US Realm Clinical Document Date and Time datatype flavor records date and time information. If time is provided, it must include a time zone offset.

This data type uses the same rules as US Realm Date and Time (Point in Time), but is used with elements having a datatype of IVL_TS."
* insert LogicalModelNA
* ^identifier.value = "urn:oid:2.16.840.1.113883.10.20.22.5.3"
* low obeys ts-shall-day and ts-should-minute and ts-shall-timezone
  * ^short = "**MAY** be precise to at least the second"
* high obeys ts-shall-day and ts-should-minute and ts-shall-timezone
  * ^short = "**MAY** be precise to at least the second"


Profile: USRealmDateTime
Parent: TS
Id: USRealmDateTime
Title: "US Realm Date and Time (Point in Time)"
Description: "The US Realm Clinical Document Date and Time datatype flavor records date and time information. If time is provided, it must include a time zone offset.

This data type uses the same rules as US Realm Date and Time (Interval), but is used with elements having a datatype of TS."
* insert LogicalModelNA
* ^identifier.value = "urn:oid:2.16.840.1.113883.10.20.22.5.4"
* obeys ts-shall-day and ts-should-minute and ts-shall-timezone


////////////////////////////////////////////////////////////
//                                                        //
//             Date/Time Related Invariants               //
//                                                        //
////////////////////////////////////////////////////////////

Invariant: ts-shall-year
Description: "**SHALL** be precise to at least the year"
Severity: #error
Expression: "nullFlavor.exists() or value.length() >= 4"

Invariant: ts-should-day
Description: "**SHOULD** be precise to at least the day"
Severity: #warning
Expression: "nullFlavor.exists() or value.length() >= 8"

Invariant: ts-shall-day
Description: "**SHALL** be precise to at least the day"
Severity: #error
Expression: "nullFlavor.exists() or value.length() >= 8"

Invariant: ts-should-minute
Description: "**SHOULD** be precise to at least the minute"
Severity: #warning
Expression: "nullFlavor.exists() or value.length() >= 12"

Invariant: ts-shall-timezone
Description: "If more precise than minute, **SHALL** include time-zone offset"
Severity: #error
// Faster than a regex; allows base type to validate format - just needs to include a - or +
Expression: "nullFlavor.exists() or value.length() &lt;= 8 or value.contains('-') or value.contains('+')"