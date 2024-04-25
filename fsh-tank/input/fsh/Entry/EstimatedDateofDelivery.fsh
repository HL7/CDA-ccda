Profile: EstimatedDateofDelivery
Parent: $Observation
Id: EstimatedDateofDelivery
Title: "Estimated Date of Delivery"
Description: "This clinical statement represents the anticipated date when a woman will give birth.  NOTE: This is a Closed template so only the elements needed for the template are allowed.  All other elements are not allowed."

* insert LogicalModelTemplateRootOnly(est-date-delivery, 2.16.840.1.113883.10.20.15.3.1)
* insert NarrativeLink

* classCode 1..1
* classCode = #OBS (exactly)
  * ^comment = "SHALL contain exactly one [1..1] @classCode=\"OBS\" Observation (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:81-444)."
* moodCode 1..1
* moodCode = #EVN (exactly)
  * ^comment = "SHALL contain exactly one [1..1] @moodCode=\"EVN\" Event (CodeSystem: HL7ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:81-445)."
* code 1..1
  * ^comment = "SHALL contain exactly one [1..1] code (CONF:81-19139)."
  * code 1..1
  * code = #11778-8
    * ^comment = "This code SHALL contain exactly one [1..1] @code=\"11778-8\" Estimated date of delivery (CONF:81-19140)."
  * codeSystem 1..1
  * codeSystem = "2.16.840.1.113883.6.1"
    * ^comment = "This code SHALL contain exactly one [1..1] @codeSystem=\"2.16.840.1.113883.6.1\" (CodeSystem: LOINC urn:oid:2.16.840.1.113883.6.1) (CONF:81-26503)."
* statusCode 1..1
  * ^comment = "SHALL contain exactly one [1..1] statusCode (CONF:81-448)."
  * code 1..1
  * code = #completed (exactly)
    * ^comment = "This statusCode SHALL contain exactly one [1..1] @code=\"completed\" Completed (CodeSystem: HL7ActStatus urn:oid:2.16.840.1.113883.5.14 STATIC) (CONF:81-19096)."
* value 1..1
* value only $TS
  * ^comment = "SHALL contain exactly one [1..1] value with @xsi:type=\"TS\" (CONF:81-450)."

// Closed Template Rules
* derivationExpr ..0
* typeId ..0
// * id ..0 // Keeping id as it's universally recommended for entries
// * text ..0  // Keeping text per V1's recommendation to include text everywhere
* effectiveTime ..0
* priorityCode ..0
* repeatNumber ..0
* languageCode ..0
* interpretationCode ..0
* methodCode ..0
* targetSiteCode ..0
* subject ..0
* specimen ..0
* performer ..0
// * author ..0 // Keeping author since C-CDA has a general author participation that can be applied anywhere
* informant ..0
* participant ..0
* entryRelationship ..0
* reference ..0
* precondition ..0
* referenceRange ..0