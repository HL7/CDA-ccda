// Collection of "SHOULD" invariants which can be re-used wherever an element SHOUULD be present
// Keep alphabtetical

// Be sure to call from the PARENT element; cleanest is to place directly before the element definition
// See USRealmHeader.fsh for examples


Invariant: should-addr
Description: "SHOULD contain addr"
Severity: #warning
Expression: "addr.exists()"

Invariant: should-assignedAuthoringDevice
Description: "SHOULD contain assignedAuthoringDevice"
Severity: #warning
Expression: "assignedAuthoringDevice.exists()"

Invariant: should-assignedPerson
Description: "SHOULD contain assignedPerson"
Severity: #warning
Expression: "assignedPerson.exists()"

Invariant: should-code
Description: "SHOULD contain code"
Severity: #warning
Expression: "code.exists()"

Invariant: should-country
Description: "SHOULD contain country"
Severity: #warning
Expression: "country.exists()"

Invariant: should-extension
Description: "SHOULD contain extension"
Severity: #warning
Expression: "extension.exists()"

Invariant: should-languageCommunication
Description: "SHOULD contain languageCommunication"
Severity: #warning
Expression: "languageCommunication.exists()"

Invariant: should-legalAuthenticator
Description: "SHOULD contain legalAuthenticator"
Severity: #warning
Expression: "legalAuthenticator.exists()"

Invariant: should-maritalStatusCode
Description: "SHOULD contain maritalStatusCode"
Severity: #warning
Expression: "maritalStatusCode.exists()"

Invariant: should-performer
Description: "SHOULD contain performer"
Severity: #warning
Expression: "performer.exists()"

Invariant: should-proficiencyLevelCode
Description: "SHOULD contain proficiencyLevelCode"
Severity: #warning
Expression: "proficiencyLevelCode.exists()"

Invariant: should-preferenceInd
Description: "SHOULD contain preferenceInd"
Severity: #warning
Expression: "preferenceInd.exists()"

Invariant: should-responsibleParty
Description: "SHOULD contain responsibleParty"
Severity: #warning
Expression: "responsibleParty.exists()"

Invariant: should-telecom
Description: "SHOULD contain telecom"
Severity: #warning
Expression: "telecom.exists()"

Invariant: should-use
Description: "SHOULD contain @use"
Severity: #warning
Expression: "use.exists()"

Invariant: should-value-att
Description: "SHOULD contain @value"
Severity: #warning
Expression: "value.exists()"


////////////////////////////////////////////////////////////
//                                                        //
//                  Special "should's"                    //
//                                                        //
////////////////////////////////////////////////////////////

Invariant: should-npi
Description: "SHOULD be NPI"
Severity: #warning
Expression: "$this = '2.16.840.1.113883.4.6'"