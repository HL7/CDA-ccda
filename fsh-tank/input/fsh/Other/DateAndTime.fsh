Profile: USRealmDateandTimeDTUSFIELDED
Parent: IVL_TS
Id: USRealmDateandTimeDTUSFIELDED
Title: "US Realm Date and Time (DT.US.FIELDED)"
Description: "The US Realm Clinical Document Date and Time datatype flavor records date and time information. If no time zone offset is provided, you can make no assumption about time, unless you have made a local exchange agreement.

This data type uses the same rules as US Realm Date and Time (DTM.US.FIELDED),  but is used with elements having a datatype of IVL_TS."
* insert LogicalModelNA
* ^identifier.value = "urn:oid:2.16.840.1.113883.10.20.22.5.3"
* low obeys ts-shall-day and ts-should-minute and ts-shall-timezone
  * ^short = "**MAY** be precise to at least the second"
* high obeys ts-shall-day and ts-should-minute and ts-shall-timezone
  * ^short = "**MAY** be precise to at least the second"


Profile: USRealmDateandTimeDTMUSFIELDED
Parent: TS
Id: USRealmDateandTimeDTMUSFIELDED
Title: "US Realm Date and Time (DTM.US.FIELDED)"
Description: "The US Realm Clinical Document Date and Time datatype flavor records date and time information. If no time zone offset is provided, you can make no assumption about time, unless you have made a local exchange agreement.

This data type uses the same rules as US Realm Date and Time (DT.US.FIELDED), but is used with elements having a datatype of TS."
* insert LogicalModelNA
* ^identifier.value = "urn:oid:2.16.840.1.113883.10.20.22.5.4"
* obeys ts-shall-day and ts-should-minute and ts-shall-timezone



// Create a number of time-related Invaraints which are used both here and elsewhere in the document (when USRealmDateandTime cannot, for some reason)
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