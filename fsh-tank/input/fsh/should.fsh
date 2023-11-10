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

Invariant: should-author
Description: "SHOULD contain author"
Severity: #warning
Expression: "author.exists()"

Invariant: should-birthTime
Description: "SHOULD contain birthTime"
Severity: #warning
Expression: "birthTime.exists()"

Invariant: should-code
Description: "SHOULD contain code"
Severity: #warning
Expression: "code.exists()"

Invariant: should-code-attr
Description: "SHOULD contain @code"
Severity: #warning
Expression: "code.exists()"

Invariant: should-componentOf
Description: "SHOULD contain componentOf"
Severity: #warning
Expression: "componentOf.exists()"

Invariant: should-country
Description: "SHOULD contain country"
Severity: #warning
Expression: "nullFlavor.exists() or item.country.exists()"

Invariant: should-criterion
Description: "SHOULD contain criterion"
Severity: #warning
Expression: "criterion.exists()"

Invariant: should-documentationOf
Description: "SHOULD contain documentationOf"
Severity: #warning
Expression: "documentationOf.exists()"

Invariant: should-doseQuantity
Description: "SHOULD contain doseQuantity"
Severity: #warning
Expression: "doseQuantity.exists()"

Invariant: should-effectiveTime
Description: "SHOULD contain effectiveTime"
Severity: #warning
Expression: "effectiveTime.exists()"

Invariant: should-entry
Description: "SHOULD contain entry"
Severity: #warning
Expression: "entry.exists()"

Invariant: should-extension
Description: "SHOULD contain extension"
Severity: #warning
Expression: "extension.exists()"

Invariant: should-given
Description: "SHOULD contain given"
Severity: #warning
Expression: "item.given.exists()"

Invariant: should-high
Description: "SHOULD contain high"
Severity: #warning
Expression: "high.exists()"

Invariant: should-id
Description: "SHOULD contain id"
Severity: #warning
Expression: "id.exists()"

Invariant: should-informant
Description: "SHOULD contain informant"
Severity: #warning
Expression: "informant.exists()"

Invariant: should-informationRecipient
Description: "SHOULD contain informationRecipient"
Severity: #warning
Expression: "informationRecipient.exists()"

Invariant: should-languageCommunication
Description: "SHOULD contain languageCommunication"
Severity: #warning
Expression: "languageCommunication.exists()"

Invariant: should-legalAuthenticator
Description: "SHOULD contain legalAuthenticator"
Severity: #warning
Expression: "legalAuthenticator.exists()"

Invariant: should-lotNumberText
Description: "SHOULD contain lotNumberText"
Severity: #warning
Expression: "lotNumberText.exists()"

Invariant: should-low
Description: "SHOULD contain low"
Severity: #warning
Expression: "low.exists()"

Invariant: should-manufacturerOrganization
Description: "SHOULD contain manufacturerOrganization"
Severity: #warning
Expression: "manufacturerOrganization.exists()"

Invariant: should-maritalStatusCode
Description: "SHOULD contain maritalStatusCode"
Severity: #warning
Expression: "maritalStatusCode.exists()"

Invariant: should-name
Description: "SHOULD contain name"
Severity: #warning
Expression: "name.exists()"

Invariant: should-originalText
Description: "SHOULD contain originalText"
Severity: #warning
Expression: "originalText.exists()"

Invariant: should-participant
Description: "SHOULD contain participant"
Severity: #warning
Expression: "participant.exists()"

Invariant: should-performer
Description: "SHOULD contain performer"
Severity: #warning
Expression: "performer.exists()"

Invariant: should-playingEntity
Description: "SHOULD contain playingEntity"
Severity: #warning
Expression: "playingEntity.exists()"

Invariant: should-priorityCode
Description: "SHOULD contain priorityCode"
Severity: #warning
Expression: "priorityCode.exists()"

Invariant: should-product
Description: "SHOULD contain product"
Severity: #warning
Expression: "product.exists()"

Invariant: should-proficiencyLevelCode
Description: "SHOULD contain proficiencyLevelCode"
Severity: #warning
Expression: "proficiencyLevelCode.exists()"

Invariant: should-preferenceInd
Description: "SHOULD contain preferenceInd"
Severity: #warning
Expression: "preferenceInd.exists()"

Invariant: should-quantity
Description: "SHOULD contain quantity"
Severity: #warning
Expression: "quantity.exists()"

Invariant: should-receivedOrganization
Description: "SHOULD contain receivedOrganization"
Severity: #warning
Expression: "receivedOrganization.exists()"

Invariant: should-reference
Description: "SHOULD contain reference"
Severity: #warning
Expression: "reference.exists()"

Invariant: should-referenceRange
Description: "SHOULD contain referenceRange"
Severity: #warning
Expression: "referenceRange.exists()"

Invariant: should-repeatNumber
Description: "SHOULD contain repeatNumber"
Severity: #warning
Expression: "repeatNumber.exists()"

Invariant: should-representedOrganization
Description: "SHOULD contain representedOrganization"
Severity: #warning
Expression: "representedOrganization.exists()"

Invariant: should-responsibleParty
Description: "SHOULD contain responsibleParty"
Severity: #warning
Expression: "responsibleParty.exists()"

Invariant: should-root
Description: "SHOULD contain @root"
Severity: #warning
Expression: "root.exists()"

Invariant: should-setId
Description: "SHOULD contain setId"
Severity: #warning
Expression: "setId.exists()"

Invariant: should-subject
Description: "SHOULD contain subject"
Severity: #warning
Expression: "subject.exists()"

Invariant: should-sdtcId
Description: "SHOULD contain sdtcId"
Severity: #warning
Expression: "sdtcId.exists()"

Invariant: should-sdtcPrecondition2
Description: "SHOULD contain sdtc:Precondition2"
Severity: #warning
Expression: "sdtcPrecondition2.exists()"

Invariant: should-standardIndustryClassCode
Description: "SHOULD contain standardIndustryClassCode"
Severity: #warning
Expression: "standardIndustryClassCode.exists()"

Invariant: should-targetSiteCode
Description: "SHOULD contain targetSiteCode"
Severity: #warning
Expression: "targetSiteCode.exists()"

Invariant: should-telecom
Description: "SHOULD contain telecom"
Severity: #warning
Expression: "telecom.exists()"

Invariant: should-text
Description: "SHOULD contain text"
Severity: #warning
Expression: "text.exists()"

Invariant: should-time
Description: "SHOULD contain time"
Severity: #warning
Expression: "time.exists()"

Invariant: should-use
Description: "SHOULD contain @use"
Severity: #warning
Expression: "nullFlavor.exists() or use.exists()"

Invariant: should-value
Description: "SHOULD contain value"
Severity: #warning
Expression: "value.exists()"

Invariant: should-value-att
Description: "SHOULD contain @value"
Severity: #warning
Expression: "value.exists()"

Invariant: should-versionNumber
Description: "SHOULD contain versionNumber"
Severity: #warning
Expression: "versionNumber.exists()"


////////////////////////////////////////////////////////////
//                                                        //
//                  Special "should's"                    //
//                                                        //
////////////////////////////////////////////////////////////

Invariant: should-npi
Description: "SHOULD be NPI"
Severity: #warning
Expression: "$this = '2.16.840.1.113883.4.6'"

Invariant: should-id-npi
Description: "SHOULD contain an id with root='2.16.840.1.113883.4.6' (NPI)"
Severity: #warning
Expression: "id.where(root = '2.16.840.1.113883.4.6')"
