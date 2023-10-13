Profile: AuthorizationActivity
Parent: $Act
Id: AuthorizationActivity
Title: "Authorization Activity"
Description: """An Authorization Activity represents authorizations or pre-authorizations currently active for the patient for the particular payer. 

Authorizations are represented using an act subordinate to the policy or program that provided it. The authorization refers to the policy or program. Authorized treatments can be grouped into an organizer class, where common properties, such as the reason for the authorization, can be expressed. Subordinate acts represent what was authorized."""

* insert LogicalModelTemplateRootOnly(authorization-activity, 2.16.840.1.113883.10.20.1.19)

* classCode 1..1
* classCode = #ACT (exactly)
  * ^comment = "SHALL contain exactly one [1..1] @classCode=\"ACT\" Act (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:81-8944)."
* moodCode 1..1
* moodCode = #EVN (exactly)
  * ^comment = "SHALL contain exactly one [1..1] @moodCode=\"EVN\" Event (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:81-8945)."
* id 1..1
  * ^comment = "SHALL contain exactly one [1..1] id (CONF:81-8947)."
* entryRelationship ^slicing.discriminator.type = #value
  * ^slicing.discriminator.path = "typeCode"
  * ^slicing.rules = #open
* entryRelationship contains target 1..*
* entryRelationship[target] obeys 81-8951 and 81-8952
  * ^comment = "SHALL contain at least one [1..*] entryRelationship (CONF:81-8948) such that it"
  * typeCode 1..1
  * typeCode = #SUBJ (exactly)
    * ^comment = "SHALL contain exactly one [1..1] @typeCode=\"SUBJ\" Has Subject (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002 STATIC) (CONF:81-8949)."

Invariant: 81-8951
Description: "The target of an authorization activity with act/entryRelationship/@typeCode=\"SUBJ\" SHALL be a clinical statement with moodCode=\"PRMS\" Promise (CONF:81-8951)."
Severity: #warning
Expression: "act or observation or procedure or substanceAdministration or supply"

Invariant: 81-8952
Description: "The target of an authorization activity MAY contain one or more performer, to indicate the providers that have been authorized to provide treatment (CONF:81-8952)."
Severity: #warning