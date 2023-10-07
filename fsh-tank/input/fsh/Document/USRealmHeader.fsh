Profile: USRealmHeader
Parent: $ClinicalDocument
Id: USRealmHeader
Title: "US Realm Header"
Description: "This template defines constraints that represent common administrative and demographic concepts for US Realm CDA documents. Further specification, such as ClinicalDocument/code, are provided in document templates that conform to this template."

* insert LogicalModelTemplate(us-realm, 2.16.840.1.113883.10.20.22.1.1, 2023-05-01)

* ^status = #draft
* realmCode 1..1
  * ^comment = "SHALL contain exactly one [1..1] realmCode=\"US\" (CONF:4537-16791)."
  * code 1..
  * code = #US
* typeId 1..1
  * ^comment = "SHALL contain exactly one [1..1] typeId (CONF:4537-5361)."
  * root 1..1
  * root = "2.16.840.1.113883.1.3" (exactly)
    * ^comment = "This typeId SHALL contain exactly one [1..1] @root=\"2.16.840.1.113883.1.3\" (CONF:4537-5250)."
  * extension 1..1
  * extension = "POCD_HD000040" (exactly)
    * ^comment = "This typeId SHALL contain exactly one [1..1] @extension=\"POCD_HD000040\" (CONF:4537-5251)."
* id 1..1
  * obeys 4537-9991
  * ^comment = "SHALL contain exactly one [1..1] id (CONF:4537-5363)."
* code 1..1
  * obeys 4537-9992 and 4537-32948
  * ^comment = "SHALL contain exactly one [1..1] code (CONF:4537-5253)."
* title 1..1
  * ^short = "The title can either be a locally defined name or the displayName corresponding to clinicalDocument/code"
  * ^comment = "SHALL contain exactly one [1..1] title (CONF:4537-5254)."
* effectiveTime 1..1
* effectiveTime only USRealmDateandTimeDTMUSFIELDED
  * ^comment = "SHALL contain exactly one [1..1] US Realm Date and Time (DTM.US.FIELDED) (identifier: urn:oid:2.16.840.1.113883.10.20.22.5.4) (CONF:4537-5256)."
* confidentialityCode 1..1
* confidentialityCode from $2.16.840.1.113883.1.11.16926 (preferred)
  * ^comment = "SHALL contain exactly one [1..1] confidentialityCode, which SHOULD be selected from ValueSet HL7 BasicConfidentialityKind urn:oid:2.16.840.1.113883.1.11.16926 DYNAMIC (CONF:4537-5259)."
  * nullFlavor 0..0
    * ^comment = "SHALL NOT contain [0..0] @nullFlavor."
  * code 1..1
* languageCode 1..1
* languageCode from $2.16.840.1.113883.1.11.11526 (required)
  * ^comment = "SHALL contain exactly one [1..1] languageCode, which SHALL be selected from ValueSet AllLanguages https://www.hl7.org/fhir/valueset-all-languages.html (OID 2.16.840.1.113883.4.642.3.21) DYNAMIC."
* obeys 4537-6380
* setId 0..1
  * ^comment = "MAY contain zero or one [0..1] setId (CONF:4537-5261)."
* obeys 4537-6387
* versionNumber 0..1
  * ^comment = "MAY contain zero or one [0..1] versionNumber (CONF:4537-5264)."
* recordTarget 1..*
  * ^comment = "SHALL contain at least one [1..*] recordTarget (CONF:4537-5266)."
  * patientRole 1..1
    * ^comment = "Such recordTargets SHALL contain exactly one [1..1] patientRole (CONF:4537-5267)."
    * id 1..*
      * ^comment = "This patientRole SHALL contain at least one [1..*] id (CONF:4537-5268)."
    * addr 1..*
    * addr only USRealmAddressADUSFIELDED
      * ^comment = "This patientRole SHALL contain at least one [1..*] US Realm Address (AD.US.FIELDED) (identifier: urn:oid:2.16.840.1.113883.10.20.22.5.2) (CONF:4537-5271)."
    * telecom 1..*
      * obeys should-use
      * use 0..1
      * use from $2.16.840.1.113883.11.20.9.20 (required)
        * ^comment = "Such telecoms SHOULD contain zero or one [0..1] @use, which SHALL be selected from ValueSet Telecom Use (US Realm Header) urn:oid:2.16.840.1.113883.11.20.9.20 DYNAMIC (CONF:4537-5375)."
    * patient 1..1
      * ^comment = "This patientRole SHALL contain exactly one [1..1] patient (CONF:4537-5283)."
      * name 1..*
      * name only USRealmPatientNamePTNUSFIELDED
        * ^comment = "This patient SHALL contain at least one [1..*] US Realm Patient Name (PTN.US.FIELDED) (identifier: urn:oid:2.16.840.1.113883.10.20.22.5.1) (CONF:4537-5284)."
      * administrativeGenderCode 1..1
      * administrativeGenderCode from $2.16.840.1.113883.1.11.1 (required)
        * ^comment = "This patient SHALL contain exactly one [1..1] administrativeGenderCode, which SHALL be selected from ValueSet Administrative Gender (HL7 V3) urn:oid:2.16.840.1.113883.1.11.1 DYNAMIC (CONF:4537-6394)."
      * birthTime 1..1
        * obeys 4537-5299 and 4537-5300
        * ^short = "**MAY** be precise to the minute (CONF:4537-32418) (For cases where information about newborn's time of birth needs to be captured)"
        * ^comment = "This patient SHALL contain exactly one [1..1] birthTime (CONF:4537-5298)."
      * sdtcDeceasedInd 0..1
        * obeys 4537-32993
        * ^short = "sdtc:deceasedInd"
        * ^comment = "This patient MAY contain zero or one [0..1] sdtc:deceasedInd (CONF:4537-32990)."
      * sdtcDeceasedTime 0..1
        * ^short = "sdtc:deceasedTime"
        * ^comment = "This patient MAY contain zero or one [0..1] sdtc:deceasedTime (CONF:4537-32988)."
        * obeys should-value-att and 4537-32991 and 4537-32992
      * obeys should-maritalStatusCode
      * maritalStatusCode 0..1
      * maritalStatusCode from $2.16.840.1.113883.1.11.12212 (required)
        * ^comment = "This patient SHOULD contain zero or one [0..1] maritalStatusCode, which SHALL be selected from ValueSet Marital Status urn:oid:2.16.840.1.113883.1.11.12212 DYNAMIC (CONF:4537-5303)."
      * religiousAffiliationCode 0..1
      * religiousAffiliationCode from $2.16.840.1.113883.1.11.19185 (required)
        * ^comment = "This patient MAY contain zero or one [0..1] religiousAffiliationCode, which SHALL be selected from ValueSet Religious Affiliation urn:oid:2.16.840.1.113883.1.11.19185 DYNAMIC (CONF:4537-5317)."
      * raceCode 1..1
      * raceCode from $2.16.840.1.113883.3.2074.1.1.3 (required)
        * ^comment = "This patient SHALL contain exactly one [1..1] raceCode, which SHALL be selected from ValueSet Race Category Excluding Nulls urn:oid:2.16.840.1.113883.3.2074.1.1.3 DYNAMIC (CONF:4537-5322)."
      * sdtcRaceCode 0..*
      * sdtcRaceCode from $2.16.840.1.113883.1.11.14914 (required)
        * obeys 4537-31347
        * ^short = "The sdtc:raceCode is only used to record additional values when the patient has indicated multiple races or additional race detail beyond the five categories required for Meaningful Use Stage 2. The prefix sdtc: SHALL be bound to the namespace “urn:hl7-org:sdtc”. The use of the namespace provides a necessary extension to CDA R2 for the use of the additional raceCode elements."
        * ^comment = "This patient MAY contain zero or more [0..*] sdtc:raceCode, which SHALL be selected from ValueSet Race Value Set urn:oid:2.16.840.1.113883.1.11.14914 DYNAMIC (CONF:4537-7263)."
      * ethnicGroupCode 1..1
      * ethnicGroupCode from Ethnicity (required)
        * ^comment = "This patient SHALL contain exactly one [1..1] ethnicGroupCode, which SHALL be selected from ValueSet Ethnicity urn:oid:2.16.840.1.114222.4.11.837 DYNAMIC (CONF:4537-5323)."
      * sdtcEthnicGroupCode 0..*
      * sdtcEthnicGroupCode from $2.16.840.1.114222.4.11.877 (required)
        * ^short = "ethnicGroupCode"
        * ^comment = "This patient MAY contain zero or more [0..*] ethnicGroupCode, which SHALL be selected from ValueSet Detailed Ethnicity urn:oid:2.16.840.1.114222.4.11.877 DYNAMIC (CONF:4537-32901)."
      * guardian 0..*
        * ^comment = "This patient MAY contain zero or more [0..*] guardian (CONF:4537-5325)."
        * obeys should-code
        * code 0..1
        * code from $2.16.840.1.113883.11.20.12.1 (required)
          * ^comment = "The guardian, if present, SHOULD contain zero or one [0..1] code, which SHALL be selected from ValueSet Personal And Legal Relationship Role Type urn:oid:2.16.840.1.113883.11.20.12.1 DYNAMIC (CONF:4537-5326)."
        * obeys should-addr
        * addr 0..*
        * addr only USRealmAddressADUSFIELDED
          * ^comment = "The guardian, if present, SHOULD contain zero or more [0..*] US Realm Address (AD.US.FIELDED) (identifier: urn:oid:2.16.840.1.113883.10.20.22.5.2) (CONF:4537-5359)."
        * obeys should-telecom
        * telecom 0..*
          * ^comment = "The guardian, if present, SHOULD contain zero or more [0..*] telecom (CONF:4537-5382)." // auto-should
          * obeys should-use
          * use 0..1
          * use from $2.16.840.1.113883.11.20.9.20 (required)
            * ^comment = "The telecom, if present, SHOULD contain zero or one [0..1] @use, which SHALL be selected from ValueSet Telecom Use (US Realm Header) urn:oid:2.16.840.1.113883.11.20.9.20 DYNAMIC (CONF:4537-7993)."
        * guardianPerson 1..1
          * ^comment = "The guardian, if present, SHALL contain exactly one [1..1] guardianPerson (CONF:4537-5385)."
          * name 1..*
          * name only USRealmPersonNamePNUSFIELDED
            * ^comment = "This guardianPerson SHALL contain at least one [1..*] US Realm Person Name (PN.US.FIELDED) (identifier: urn:oid:2.16.840.1.113883.10.20.22.5.1.1) (CONF:4537-5386)."
      * birthplace 0..1
        * ^comment = "This patient MAY contain zero or one [0..1] birthplace (CONF:4537-5395)."
        * place 1..1
          * ^comment = "The birthplace, if present, SHALL contain exactly one [1..1] place (CONF:4537-5396)."
          * addr 1..1
            * obeys 4537-5402 and 4537-5403 and should-country
            * ^comment = "This place SHALL contain exactly one [1..1] addr (CONF:4537-5397)."
            * country 0..1
            * country from $2.16.840.1.113883.3.88.12.80.63 (required)
              * ^comment = "This addr SHOULD contain zero or one [0..1] country, which SHALL be selected from ValueSet Country urn:oid:2.16.840.1.113883.3.88.12.80.63 DYNAMIC (CONF:4537-5404)."
      * obeys should-languageCommunication
      * languageCommunication 0..*
        * ^comment = "This patient SHOULD contain zero or more [0..*] languageCommunication which SHALL be selected from ValueSet AllLanguages https://www.hl7.org/fhir/valueset-all-languages.html (OID 2.16.840.1.113883.4.642.3.21) DYNAMIC (CONF:XXX)."
        * languageCode 1..1
        * languageCode from $2.16.840.1.113883.1.11.11526 (required)
          * ^comment = "The languageCommunication, if present, SHALL contain exactly one [1..1] languageCode, which SHALL be selected from ValueSet Language urn:oid:2.16.840.1.113883.1.11.11526 DYNAMIC (CONF:4537-5407)."
        * modeCode 0..1
        * modeCode from LanguageAbilityMode (required)
          * ^comment = "The languageCommunication, if present, MAY contain zero or one [0..1] modeCode, which SHALL be selected from ValueSet LanguageAbilityMode urn:oid:2.16.840.1.113883.1.11.12249 DYNAMIC (CONF:4537-5409)."
        * obeys should-proficiencyLevelCode
        * proficiencyLevelCode 0..1
        * proficiencyLevelCode from LanguageAbilityProficiency (required)
          * ^comment = "The languageCommunication, if present, SHOULD contain zero or one [0..1] proficiencyLevelCode, which SHALL be selected from ValueSet LanguageAbilityProficiency urn:oid:2.16.840.1.113883.1.11.12199 DYNAMIC (CONF:4537-9965)."
        * obeys should-preferenceInd
        * preferenceInd 0..1
          * ^comment = "The languageCommunication, if present, SHOULD contain zero or one [0..1] preferenceInd (CONF:4537-5414)." // auto-should
    * providerOrganization 0..1
      * ^comment = "This patientRole MAY contain zero or one [0..1] providerOrganization (CONF:4537-5416)."
      * id 1..*
        * ^comment = "The providerOrganization, if present, SHALL contain at least one [1..*] id (CONF:4537-5417)."
        * root 0..1
          * obeys should-npi
          * ^comment = "Such ids SHOULD contain zero or one [0..1] @root=\"2.16.840.1.113883.4.6\" National Provider Identifier (CONF:4537-16820)."
      * name 1..*
        * ^comment = "The providerOrganization, if present, SHALL contain at least one [1..*] name (CONF:4537-5419)."
      * telecom 1..*
        * ^comment = "The providerOrganization, if present, SHALL contain at least one [1..*] telecom (CONF:4537-5420)."
        * obeys should-use
        * use 0..1
        * use from $2.16.840.1.113883.11.20.9.20 (required)
          * ^comment = "Such telecoms SHOULD contain zero or one [0..1] @use, which SHALL be selected from ValueSet Telecom Use (US Realm Header) urn:oid:2.16.840.1.113883.11.20.9.20 DYNAMIC (CONF:4537-7994)."
      * addr 1..*
      * addr only USRealmAddressADUSFIELDED
        * ^comment = "The providerOrganization, if present, SHALL contain at least one [1..*] US Realm Address (AD.US.FIELDED) (identifier: urn:oid:2.16.840.1.113883.10.20.22.5.2) (CONF:4537-5422)."
* author 1..*
  * ^comment = "SHALL contain at least one [1..*] author (CONF:4537-5444)."
  * time 1..1
  * time only USRealmDateandTimeDTMUSFIELDED
    * ^comment = "Such authors SHALL contain exactly one [1..1] US Realm Date and Time (DTM.US.FIELDED) (identifier: urn:oid:2.16.840.1.113883.10.20.22.5.4) (CONF:4537-5445)."
  * assignedAuthor 1..1
    * obeys 4537-16790
    * ^comment = "Such authors SHALL contain exactly one [1..1] assignedAuthor (CONF:4537-5448)."
    * id 1..
      * ^slicing.discriminator[0].type = #value
      * ^slicing.discriminator[=].path = "root"
      * ^slicing.rules = #open
      * ^comment = "This assignedAuthor SHOULD contain zero or one [0..1] id (CONF:4537-32882) such that it, This assignedAuthor SHALL contain at least one [1..*] id (CONF:4537-5449)."
    // This seems easier than using slice() which requires a structure parameter that isn't quite present in FSH
    * insert ConstraintWarning(4537-32882, [[SHOULD contain an id with root='2.16.840.1.113883.4.6' (NPI)]], [[id.where(root = '2.16.840.1.113883.4.6')]])
    * id contains npi 0..1
    * id[npi]
      * nullFlavor ^short = "If NPI is unknown, set @nullFlavor to UNK"
      * root 1..1
      * root = "2.16.840.1.113883.4.6"
        * ^comment = "SHALL contain exactly one [1..1] @root=\"2.16.840.1.113883.4.6\" National Provider Identifier (CONF:4537-32884)."
      * obeys should-extension
      * extension 0..1
        * ^comment = "SHOULD contain zero or one [0..1] @extension (CONF:4537-32885)."
    * obeys should-code
    * code 0..1
      * ^comment = "This assignedAuthor SHOULD contain zero or one [0..1] code (CONF:4537-16787)." // auto-should
      * code 1..1
      * code from $2.16.840.1.114222.4.11.1066 (preferred)
        * ^comment = "The code, if present, SHALL contain exactly one [1..1] @code, which SHOULD be selected from ValueSet Healthcare Provider Taxonomy urn:oid:2.16.840.1.114222.4.11.1066 DYNAMIC (CONF:4537-16788)."
    * addr 1..*
    * addr only USRealmAddressADUSFIELDED
      * ^comment = "This assignedAuthor SHALL contain at least one [1..*] US Realm Address (AD.US.FIELDED) (identifier: urn:oid:2.16.840.1.113883.10.20.22.5.2) (CONF:4537-5452)."
    * telecom 1..*
      * ^comment = "This assignedAuthor SHALL contain at least one [1..*] telecom (CONF:4537-5428)."
      * obeys should-use
      * use 0..1
      * use from $2.16.840.1.113883.11.20.9.20 (required)
        * ^comment = "Such telecoms SHOULD contain zero or one [0..1] @use, which SHALL be selected from ValueSet Telecom Use (US Realm Header) urn:oid:2.16.840.1.113883.11.20.9.20 DYNAMIC (CONF:4537-7995)."
    * obeys should-assignedPerson
    * assignedPerson 0..1
      * ^comment = "This assignedAuthor SHOULD contain zero or one [0..1] assignedPerson (CONF:4537-5430)." // auto-should
      * name 1..*
      * name only USRealmPersonNamePNUSFIELDED
        * ^comment = "The assignedPerson, if present, SHALL contain at least one [1..*] US Realm Person Name (PN.US.FIELDED) (identifier: urn:oid:2.16.840.1.113883.10.20.22.5.1.1) (CONF:4537-16789)."
    * obeys should-assignedAuthoringDevice
    * assignedAuthoringDevice 0..1
      * ^comment = "This assignedAuthor SHOULD contain zero or one [0..1] assignedAuthoringDevice (CONF:4537-16783)." // auto-should
      * manufacturerModelName 1..1
        * ^comment = "The assignedAuthoringDevice, if present, SHALL contain exactly one [1..1] manufacturerModelName (CONF:4537-16784)."
      * softwareName 1..1
        * ^comment = "The assignedAuthoringDevice, if present, SHALL contain exactly one [1..1] softwareName (CONF:4537-16785)."
* dataEnterer 0..1
  * ^comment = "MAY contain zero or one [0..1] dataEnterer (CONF:4537-5441)."
  * assignedEntity 1..1
    * ^comment = "The dataEnterer, if present, SHALL contain exactly one [1..1] assignedEntity (CONF:4537-5442)."
    * id 1..*
      * ^comment = "This assignedEntity SHALL contain at least one [1..*] id (CONF:4537-5443)."
      * root 0..1
        * obeys should-npi
        * ^comment = "Such ids SHOULD contain zero or one [0..1] @root=\"2.16.840.1.113883.4.6\" National Provider Identifier (CONF:4537-16821)."
    * code 0..1
    * code from $2.16.840.1.114222.4.11.1066 (preferred)
      * ^comment = "This assignedEntity MAY contain zero or one [0..1] code, which SHOULD be selected from ValueSet Healthcare Provider Taxonomy urn:oid:2.16.840.1.114222.4.11.1066 DYNAMIC (CONF:4537-32173)."
    * addr 1..*
    * addr only USRealmAddressADUSFIELDED
      * ^comment = "This assignedEntity SHALL contain at least one [1..*] US Realm Address (AD.US.FIELDED) (identifier: urn:oid:2.16.840.1.113883.10.20.22.5.2) (CONF:4537-5460)."
    * telecom 1..*
      * ^comment = "This assignedEntity SHALL contain at least one [1..*] telecom (CONF:4537-5466)."
      * obeys should-use
      * use 0..1
      * use from $2.16.840.1.113883.11.20.9.20 (required)
        * ^comment = "Such telecoms SHOULD contain zero or one [0..1] @use, which SHALL be selected from ValueSet Telecom Use (US Realm Header) urn:oid:2.16.840.1.113883.11.20.9.20 DYNAMIC (CONF:4537-7996)."
    * assignedPerson 1..1
      * ^comment = "This assignedEntity SHALL contain exactly one [1..1] assignedPerson (CONF:4537-5469)."
      * name 1..*
      * name only USRealmPersonNamePNUSFIELDED
        * ^comment = "This assignedPerson SHALL contain at least one [1..*] US Realm Person Name (PN.US.FIELDED) (identifier: urn:oid:2.16.840.1.113883.10.20.22.5.1.1) (CONF:4537-5470)."
* informant ^slicing.discriminator[0].type = #value
  * ^slicing.discriminator[=].path = "relatedEntity"
  * ^slicing.rules = #open
  * ^comment = "MAY contain zero or more [0..*] informant (CONF:4537-31355) such that it"
* informant contains
    informant1 0..* and
    informant2 0..*
* informant[informant1] ^short = "informant"
  * ^comment = "MAY contain zero or more [0..*] informant (CONF:4537-8001) such that it"
  * assignedEntity 1..1
    * ^comment = "SHALL contain exactly one [1..1] assignedEntity (CONF:4537-8002)."
    * id 1..*
      * obeys 4537-9946
      * ^comment = "This assignedEntity SHALL contain at least one [1..*] id (CONF:4537-9945)."
    * code 0..1
    * code from $2.16.840.1.114222.4.11.1066 (preferred)
      * ^comment = "This assignedEntity MAY contain zero or one [0..1] code, which SHOULD be selected from ValueSet Healthcare Provider Taxonomy urn:oid:2.16.840.1.114222.4.11.1066 DYNAMIC (CONF:4537-32174)."
    * addr 1..*
    * addr only USRealmAddressADUSFIELDED
      * ^comment = "This assignedEntity SHALL contain at least one [1..*] US Realm Address (AD.US.FIELDED) (identifier: urn:oid:2.16.840.1.113883.10.20.22.5.2) (CONF:4537-8220)."
    * assignedPerson 1..1
      * ^comment = "This assignedEntity SHALL contain exactly one [1..1] assignedPerson (CONF:4537-8221)."
      * name 1..*
      * name only USRealmPersonNamePNUSFIELDED
        * ^comment = "This assignedPerson SHALL contain at least one [1..*] US Realm Person Name (PN.US.FIELDED) (identifier: urn:oid:2.16.840.1.113883.10.20.22.5.1.1) (CONF:4537-8222)."
* informant[informant2] ^short = "informant"
  * ^comment = "MAY contain zero or more [0..*] informant (CONF:4537-31355) such that it"
  * relatedEntity 1..1
    * ^comment = "SHALL contain exactly one [1..1] relatedEntity (CONF:4537-31356)."
* custodian 1..1
  * ^comment = "SHALL contain exactly one [1..1] custodian (CONF:4537-5519)."
  * assignedCustodian 1..1
    * ^comment = "This custodian SHALL contain exactly one [1..1] assignedCustodian (CONF:4537-5520)."
    * representedCustodianOrganization 1..1
      * ^comment = "This assignedCustodian SHALL contain exactly one [1..1] representedCustodianOrganization (CONF:4537-5521)."
      * id 1..*
        * ^comment = "This representedCustodianOrganization SHALL contain at least one [1..*] id (CONF:4537-5522)."
        * root 0..1
          * obeys should-npi
          * ^comment = "Such ids SHOULD contain zero or one [0..1] @root=\"2.16.840.1.113883.4.6\" National Provider Identifier (CONF:4537-16822)."
      * name 1..1
        * ^comment = "This representedCustodianOrganization SHALL contain exactly one [1..1] name (CONF:4537-5524)."
      * telecom 1..1
        * ^comment = "This representedCustodianOrganization SHALL contain exactly one [1..1] telecom (CONF:4537-5525)."
        * obeys should-use
        * use 0..1
        * use from $2.16.840.1.113883.11.20.9.20 (required)
          * ^comment = "This telecom SHOULD contain zero or one [0..1] @use, which SHALL be selected from ValueSet Telecom Use (US Realm Header) urn:oid:2.16.840.1.113883.11.20.9.20 DYNAMIC (CONF:4537-7998)."
      * addr 1..1
      * addr only USRealmAddressADUSFIELDED
        * ^comment = "This representedCustodianOrganization SHALL contain exactly one [1..1] US Realm Address (AD.US.FIELDED) (identifier: urn:oid:2.16.840.1.113883.10.20.22.5.2) (CONF:4537-5559)."
* informationRecipient 0..*
  * ^comment = "MAY contain zero or more [0..*] informationRecipient (CONF:4537-5565)."
  * intendedRecipient 1..1
    * ^comment = "The informationRecipient, if present, SHALL contain exactly one [1..1] intendedRecipient (CONF:4537-5566)."
    * id 0..*
      * ^comment = "This intendedRecipient MAY contain zero or more [0..*] id (CONF:4537-32399)."
    * informationRecipient 0..1
      * ^comment = "This intendedRecipient MAY contain zero or one [0..1] informationRecipient (CONF:4537-5567)."
      * name 1..*
      * name only USRealmPersonNamePNUSFIELDED
        * ^comment = "The informationRecipient, if present, SHALL contain at least one [1..*] US Realm Person Name (PN.US.FIELDED) (identifier: urn:oid:2.16.840.1.113883.10.20.22.5.1.1) (CONF:4537-5568)."
    * receivedOrganization 0..1
      * ^comment = "This intendedRecipient MAY contain zero or one [0..1] receivedOrganization (CONF:4537-5577)."
      * name 1..1
        * ^comment = "The receivedOrganization, if present, SHALL contain exactly one [1..1] name (CONF:4537-5578)."
* obeys should-legalAuthenticator
* legalAuthenticator 0..1
  * ^comment = "SHOULD contain zero or one [0..1] legalAuthenticator (CONF:4537-5579)." // auto-should
  * time 1..1
  * time only USRealmDateandTimeDTMUSFIELDED
    * ^comment = "The legalAuthenticator, if present, SHALL contain exactly one [1..1] US Realm Date and Time (DTM.US.FIELDED) (identifier: urn:oid:2.16.840.1.113883.10.20.22.5.4) (CONF:4537-5580)."
  * signatureCode 1..1
    * ^comment = "The legalAuthenticator, if present, SHALL contain exactly one [1..1] signatureCode (CONF:4537-5583)."
    * code 1..1
    * code = #S
      * ^comment = "This signatureCode SHALL contain exactly one [1..1] @code=\"S\" (CodeSystem: HL7ParticipationSignature urn:oid:2.16.840.1.113883.5.89 STATIC) (CONF:4537-5584)."
  * sdtcSignatureText 0..1
    * ^short = "The signature can be represented either inline or by reference according to the ED data type. Typical cases for CDA are:\n1) Electronic signature: this attribute can represent virtually any electronic signature scheme.\n2) Digital signature: this attribute can represent digital signatures by reference to a signature data block that is constructed in accordance to a digital signature standard, such as XML-DSIG, PKCS#7, PGP, etc.\n"
    * ^comment = "The legalAuthenticator, if present, MAY contain zero or one [0..1] sdtc:signatureText (CONF:4537-30810)."
  * assignedEntity 1..1
    * ^comment = "The legalAuthenticator, if present, SHALL contain exactly one [1..1] assignedEntity (CONF:4537-5585)."
    * id 1..*
      * ^comment = "This assignedEntity SHALL contain at least one [1..*] id (CONF:4537-5586)."
      * root 0..1
        * ^short = "MAY contain '2.16.840.1.113883.4.6' (NPI)"
        * ^comment = "Such ids MAY contain zero or one [0..1] @root=\"2.16.840.1.113883.4.6\" National Provider Identifier (CONF:4537-16823)."
    * code 0..1
    * code from $2.16.840.1.114222.4.11.1066 (preferred)
      * ^comment = "This assignedEntity MAY contain zero or one [0..1] code, which SHOULD be selected from ValueSet Healthcare Provider Taxonomy urn:oid:2.16.840.1.114222.4.11.1066 DYNAMIC (CONF:4537-17000)."
    * addr 1..*
    * addr only USRealmAddressADUSFIELDED
      * ^comment = "This assignedEntity SHALL contain at least one [1..*] US Realm Address (AD.US.FIELDED) (identifier: urn:oid:2.16.840.1.113883.10.20.22.5.2) (CONF:4537-5589)."
    * telecom 1..*
      * ^comment = "This assignedEntity SHALL contain at least one [1..*] telecom (CONF:4537-5595)."
      * obeys should-use
      * use 0..1
      * use from $2.16.840.1.113883.11.20.9.20 (required)
        * ^comment = "Such telecoms SHOULD contain zero or one [0..1] @use, which SHALL be selected from ValueSet Telecom Use (US Realm Header) urn:oid:2.16.840.1.113883.11.20.9.20 DYNAMIC (CONF:4537-7999)."
    * assignedPerson 1..1
      * ^comment = "This assignedEntity SHALL contain exactly one [1..1] assignedPerson (CONF:4537-5597)."
      * name 1..*
      * name only USRealmPersonNamePNUSFIELDED
        * ^comment = "This assignedPerson SHALL contain at least one [1..*] US Realm Person Name (PN.US.FIELDED) (identifier: urn:oid:2.16.840.1.113883.10.20.22.5.1.1) (CONF:4537-5598)."
* authenticator ^slicing.discriminator[0].type = #value
  * ^slicing.discriminator[=].path = "ClinicalDocument.signatureCode"
  * ^slicing.discriminator[+].type = #value
  * ^slicing.discriminator[=].path = "ClinicalDocument.assignedEntity"
  * ^slicing.discriminator[+].type = #value
  * ^slicing.discriminator[=].path = "ClinicalDocument.time"
  * ^slicing.rules = #open
  * ^comment = "MAY contain zero or more [0..*] authenticator (CONF:4537-5607) such that it"
* authenticator contains authenticator1 0..*
* authenticator[authenticator1] ^short = "authenticator"
  * ^comment = "MAY contain zero or more [0..*] authenticator (CONF:4537-5607) such that it"
  * time 1..1
  * time only USRealmDateandTimeDTMUSFIELDED
    * ^comment = "SHALL contain exactly one [1..1] US Realm Date and Time (DTM.US.FIELDED) (identifier: urn:oid:2.16.840.1.113883.10.20.22.5.4) (CONF:4537-5608)."
  * signatureCode 1..1
    * ^comment = "SHALL contain exactly one [1..1] signatureCode (CONF:4537-5610)."
    * code 1..1
    * code = #S
      * ^comment = "This signatureCode SHALL contain exactly one [1..1] @code=\"S\" (CodeSystem: HL7ParticipationSignature urn:oid:2.16.840.1.113883.5.89 STATIC) (CONF:4537-5611)."
  * sdtcSignatureText 0..1
    * ^short = "The signature can be represented either inline or by reference according to the ED data type. Typical cases for CDA are:\n1) Electronic signature: this attribute can represent virtually any electronic signature scheme.\n2) Digital signature: this attribute can represent digital signatures by reference to a signature data block that is constructed in accordance to a digital signature standard, such as XML-DSIG, PKCS#7, PGP, etc.\n"
    * ^comment = "MAY contain zero or one [0..1] sdtc:signatureText (CONF:4537-30811)."
  * assignedEntity 1..1
    * ^comment = "SHALL contain exactly one [1..1] assignedEntity (CONF:4537-5612)."
    * id 1..*
      * ^comment = "This assignedEntity SHALL contain at least one [1..*] id (CONF:4537-5613)."
      * root 0..1
        * obeys should-npi
        * ^comment = "Such ids SHOULD contain zero or one [0..1] @root=\"2.16.840.1.113883.4.6\" National Provider Identifier  (CONF:4537-16824)."
    * code 0..1
      * ^comment = "This assignedEntity MAY contain zero or one [0..1] code (CONF:4537-16825)."
      * code 0..1
      * code from $2.16.840.1.114222.4.11.1066 (preferred)
        * ^comment = "The code, if present, MAY contain zero or one [0..1] @code, which SHOULD be selected from ValueSet Healthcare Provider Taxonomy urn:oid:2.16.840.1.114222.4.11.1066 DYNAMIC (CONF:4537-16826)."
    * addr 1..*
    * addr only USRealmAddressADUSFIELDED
      * ^comment = "This assignedEntity SHALL contain at least one [1..*] US Realm Address (AD.US.FIELDED) (identifier: urn:oid:2.16.840.1.113883.10.20.22.5.2) (CONF:4537-5616)."
    * telecom 1..*
      * ^comment = "This assignedEntity SHALL contain at least one [1..*] telecom (CONF:4537-5622)."
      * obeys should-use
      * use 0..1
      * use from $2.16.840.1.113883.11.20.9.20 (required)
        * ^comment = "Such telecoms SHOULD contain zero or one [0..1] @use, which SHALL be selected from ValueSet Telecom Use (US Realm Header) urn:oid:2.16.840.1.113883.11.20.9.20 DYNAMIC (CONF:4537-8000)."
    * assignedPerson 1..1
      * ^comment = "This assignedEntity SHALL contain exactly one [1..1] assignedPerson (CONF:4537-5624)."
      * name 1..*
      * name only USRealmPersonNamePNUSFIELDED
        * ^comment = "This assignedPerson SHALL contain at least one [1..*] US Realm Person Name (PN.US.FIELDED) (identifier: urn:oid:2.16.840.1.113883.10.20.22.5.1.1) (CONF:4537-5625)."
* participant 0..*
  * obeys 4537-10006 and 4537-10007
  //"<slicing><rules value=\"open\" /></slicing>"
  //"<comment value=\"MAY contain zero or more [0..*] participant (CONF:4537-10003) such that it\" /></element><element id=\"ClinicalDocument.participant:participant1\"><path value=\"ClinicalDocument.participant\" /><sliceName value=\"participant1\" /><short value=\"participant\" /><definition value=\"MAY contain zero or more [0..*] participant (CONF:4537-10003) such that it\" />"
  * time 0..1
    * ^comment = "MAY contain zero or one [0..1] time (CONF:4537-10004)."
* inFulfillmentOf 0..*
  * ^comment = "MAY contain zero or more [0..*] inFulfillmentOf (CONF:4537-9952)."
  * order 1..1
    * ^comment = "The inFulfillmentOf, if present, SHALL contain exactly one [1..1] order (CONF:4537-9953)."
    * id 1..*
      * ^comment = "This order SHALL contain at least one [1..*] id (CONF:4537-9954)."
* documentationOf 0..*
  * ^comment = "MAY contain zero or more [0..*] documentationOf (CONF:4537-14835)."
  * serviceEvent 1..1
    * ^comment = "The documentationOf, if present, SHALL contain exactly one [1..1] serviceEvent (CONF:4537-14836)."
    * effectiveTime 1..1
      * ^comment = "This serviceEvent SHALL contain exactly one [1..1] effectiveTime (CONF:4537-14837)."
      * low 1..1
        * ^comment = "This effectiveTime SHALL contain exactly one [1..1] low (CONF:4537-14838)."
    * obeys should-performer
    * performer 0..*
      * ^comment = "This serviceEvent SHOULD contain zero or more [0..*] performer (CONF:4537-14839)." // auto-should
      * typeCode 1..1
      * typeCode from $2.16.840.1.113883.1.11.19601 (required)
        * ^comment = "The performer, if present, SHALL contain exactly one [1..1] @typeCode, which SHALL be selected from ValueSet x_ServiceEventPerformer urn:oid:2.16.840.1.113883.1.11.19601 STATIC (CONF:4537-14840)."
      * functionCode 0..1
        * ^comment = "The performer, if present, MAY contain zero or one [0..1] functionCode (CONF:4537-16818)."
        * obeys should-code
        * code 0..1
        * code from $2.16.840.1.113762.1.4.1099.30 (preferred)
          * ^comment = "The functionCode, if present, SHOULD contain zero or one [0..1] @code, which SHOULD be selected from ValueSet Care Team Member Function urn:oid:2.16.840.1.113762.1.4.1099.30 DYNAMIC (CONF:4537-32889)."
      * assignedEntity 1..1
        * ^comment = "The performer, if present, SHALL contain exactly one [1..1] assignedEntity (CONF:4537-14841)."
        * id 1..*
          * ^comment = "This assignedEntity SHALL contain at least one [1..*] id (CONF:4537-14846)."
          * root 0..1
            * obeys should-npi
            * ^comment = "Such ids SHOULD contain zero or one [0..1] @root=\"2.16.840.1.113883.4.6\" National Provider Identifier (CONF:4537-14847)."
        * obeys should-code
        * code 0..1
        * code from $2.16.840.1.114222.4.11.1066 (preferred)
          * ^comment = "This assignedEntity SHOULD contain zero or one [0..1] code, which SHOULD be selected from ValueSet Healthcare Provider Taxonomy urn:oid:2.16.840.1.114222.4.11.1066 DYNAMIC (CONF:4537-14842)."
* authorization 0..*
  * ^comment = "MAY contain zero or more [0..*] authorization (CONF:4537-16792) such that it"
  * consent 1..1
    * ^comment = "SHALL contain exactly one [1..1] consent (CONF:4537-16793)."
    * id 0..*
      * ^comment = "This consent MAY contain zero or more [0..*] id (CONF:4537-16794)."
    * code 0..1
      * ^short = "The type of consent (e.g., a consent to perform the related serviceEvent) is conveyed in consent/code."
      * ^comment = "This consent MAY contain zero or one [0..1] code (CONF:4537-16795)."
    * statusCode 1..1
      * ^comment = "This consent SHALL contain exactly one [1..1] statusCode (CONF:4537-16797)."
      * code 1..1
      * code = #completed (exactly)
        * ^comment = "This statusCode SHALL contain exactly one [1..1] @code=\"completed\" Completed (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:4537-16798)."
* componentOf 0..1
  * ^comment = "MAY contain zero or one [0..1] componentOf (CONF:4537-9955)."
  * encompassingEncounter 1..1
    * ^comment = "The componentOf, if present, SHALL contain exactly one [1..1] encompassingEncounter (CONF:4537-9956)."
    * id 1..*
      * ^comment = "This encompassingEncounter SHALL contain at least one [1..*] id (CONF:4537-9959)."
    * effectiveTime 1..1
      * ^comment = "This encompassingEncounter SHALL contain exactly one [1..1] effectiveTime (CONF:4537-9958)."
    * obeys should-responsibleParty
    * responsibleParty 0..1
      * ^comment = "This encompassingEncounter SHOULD contain zero or one [0..1] responsibleParty (CONF:1198-8391)." // auto-should
      * assignedEntity 1..1
        * obeys 1198-32905
        * ^comment = "The responsibleParty, if present, SHALL contain exactly one [1..1] assignedEntity (CONF:1198-32904)."

Invariant: 4537-9991
Description: "This id **SHALL** be a globally unique identifier for the document (CONF:4537-9991)."
Severity: #warning

Invariant: 4537-9992
Description: "This code **SHALL** specify the particular kind of document (e.g., History and Physical, Discharge Summary, Progress Note) (CONF:4537-9992)."
Severity: #error

Invariant: 4537-32948
Description: "This code **SHALL** be drawn from the LOINC document type ontology (LOINC codes where SCALE = DOC) (CONF:4537-32948)."
Severity: #error

Invariant: 4537-6380
Description: "If setId is present versionNumber **SHALL** be present (CONF:4537-6380)."
Severity: #error
Expression: "setId.exists() implies versionNumber.exists()"

Invariant: 4537-6387
Description: "If versionNumber is present setId **SHALL** be present (CONF:4537-6387)."
Severity: #error
Expression: "versionNumber.exists() implies setId.exists()"

Invariant: 4537-5299
Description: "**SHALL** be precise to year (CONF:4537-5299)."
Severity: #error
Expression: "nullFlavor.exists() or value.length() >= 4"

Invariant: 4537-5300
Description: "**SHOULD** be precise to day (CONF:4537-5300)."
Severity: #warning
Expression: "nullFlavor.exists() or value.length() >= 8"

Invariant: 4537-32993
Description: "If sdtc:deceasedInd=\"true\", then sdtc:deceasedTime **SHALL** be present (CONF:4537-32993)."
Severity: #error

Invariant: 4537-32991
Description: "**SHALL**  be precise to to the year (CONF:4537-32991)."
Severity: #error
Expression: "nullFlavor.exists() or value.length() >= 4"

Invariant: 4537-32992
Description: "**SHOULD** be precise to the day (CONF:4537-32992)."
Severity: #warning
Expression: "nullFlavor.exists() or value.length() >= 8"

Invariant: 4537-31347
Description: "If sdtc:raceCode is present, then the patient **SHALL** contain [1..1] raceCode (CONF:4537-31347)."
Severity: #error

Invariant: 4537-5402
Description: "If country is US, this addr **SHALL** contain exactly one [1..1] state, which **SHALL** be selected from ValueSet StateValueSet 2.16.840.1.113883.3.88.12.80.1 *DYNAMIC* (CONF:4537-5402)."
Severity: #warning

Invariant: 4537-5403
Description: "If country is US, this addr **MAY** contain zero or one [0..1] postalCode, which **SHALL** be selected from ValueSet PostalCode urn:oid:2.16.840.1.113883.3.88.12.80.2 *DYNAMIC* (CONF:4537-5403)."
Severity: #warning

Invariant: 4537-16790
Description: "There **SHALL** be exactly one assignedAuthor/assignedPerson or exactly one assignedAuthor/assignedAuthoringDevice (CONF:4537-16790)."
Severity: #error

Invariant: 4537-9946
Description: "If assignedEntity/id is a provider then this id, **SHOULD** include zero or one [0..1] id where id/@root =\"2.16.840.1.113883.4.6\" National Provider Identifier (CONF:4537-9946)."
Severity: #warning

Invariant: 4537-10006
Description: "**SHALL** contain associatedEntity/associatedPerson *AND/OR* associatedEntity/scopingOrganization (CONF:4537-10006)."
Severity: #error

Invariant: 4537-10007
Description: "When participant/@typeCode is *IND*, associatedEntity/@classCode **SHOULD** be selected from ValueSet 2.16.840.1.113883.11.20.9.33 INDRoleclassCodes *DYNAMIC* (CONF:4537-10007)."
Severity: #warning

Invariant: 1198-32905
Description: "This assignedEntity SHALL contain an assignedPerson or a representedOrganization or both (CONF:1198-32905)."
Severity: #error

