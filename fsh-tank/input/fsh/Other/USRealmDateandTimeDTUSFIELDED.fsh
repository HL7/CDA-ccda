Profile: USRealmDateandTimeDTUSFIELDED
Parent: IVL_TS
Id: USRealmDateandTimeDTUSFIELDED
Title: "US Realm Date and Time (DT.US.FIELDED)"
Description: """The US Realm Clinical Document Date and Time datatype flavor records date and time information. If no time zone offset is provided, you can make no assumption about time, unless you have made a local exchange agreement.

This data type uses the same rules as US Realm Date and Time (DTM.US.FIELDED),  but is used with elements having a datatype of IVL_TS."""
* insert LogicalModelNA
* ^identifier.value = "urn:oid:2.16.840.1.113883.10.20.22.5.3"
* obeys 81-10078 and 81-10079 and 81-10080 and 81-10081

Invariant: 81-10078
Description: "**SHALL** be precise to the day (CONF:81-10078)."
Severity: #error

Invariant: 81-10079
Description: "**SHOULD** be precise to the minute (CONF:81-10079)."
Severity: #warning

Invariant: 81-10080
Description: "**MAY** be precise to the second (CONF:81-10080)."
Severity: #warning

Invariant: 81-10081
Description: "If more precise than day, **SHOULD** include time-zone offset (CONF:81-10081)."
Severity: #warning