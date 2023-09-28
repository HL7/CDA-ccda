Profile: USRealmPersonNamePNUSFIELDED
Parent: PN
Id: USRealmPersonNamePNUSFIELDED
Title: "US Realm Person Name (PN.US.FIELDED)"
Description: "The US Realm Clinical Document Person Name datatype flavor is a set of reusable constraints that can be used for Persons."
* insert LogicalModelNA
* ^identifier.value = "urn:oid:2.16.840.1.113883.10.20.22.5.1.1"
* obeys 81-9371 and 81-9372

Invariant: 81-9371
Description: "The content of name **SHALL** be either a conformant Patient Name (PTN.US.FIELDED), or a string (CONF:81-9371)."
Severity: #error

Invariant: 81-9372
Description: "The string **SHALL NOT** contain name parts (CONF:81-9372)."
Severity: #error