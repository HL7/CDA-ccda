Profile: PregnancyStatusObservation
Parent: $Observation
Id: PregnancyStatusObservation
Title: "Pregnancy Status Observation"
Description: "This clinical statement meets the requirements of the U.S. Core Data for Interoperability (USCDI) Pregnancy Status Data Element. It represents the State or condition of being pregnant at a point in time. To represent the patient's intent to become pregnant, use the Pregnancy Intention in Next Year template."

* insert LogicalModelTemplateRootOnly(pregnancy-obs, 2.16.840.1.113883.10.20.15.3.8)
* insert NarrativeLink

* classCode 1..1
* classCode = #OBS (exactly)
  * ^comment = "SHALL contain exactly one [1..1] @classCode=\"OBS\" Observation (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:81-451)."
* moodCode 1..1
* moodCode = #EVN (exactly)
  * ^comment = "SHALL contain exactly one [1..1] @moodCode=\"EVN\" Event (CodeSystem: HL7ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:81-452)."
* code 1..1
  * ^comment = "SHALL contain exactly one [1..1] code (CONF:81-19153)."
  * code 1..1
  * code = #82810-3
    * ^comment = "This code SHALL contain exactly one [1..1] @code=\"82810-3\" Pregnancy Status."
  * codeSystem 1..1
  * codeSystem = "2.16.840.1.113883.5.4"
    * ^comment = "This code SHALL contain exactly one [1..1] @codeSystem=\"2.16.840.1.113883.5.4\" (CodeSystem: HL7ActCode urn:oid:2.16.840.1.113883.5.4) (CONF:81-26505)."
* statusCode 1..1
  * ^comment = "SHALL contain exactly one [1..1] statusCode (CONF:81-455)."
  * code 1..1
  * code = #completed (exactly)
    * ^comment = "This statusCode SHALL contain exactly one [1..1] @code=\"completed\" Completed (CodeSystem: HL7ActStatus urn:oid:2.16.840.1.113883.5.14 STATIC) (CONF:81-19110)."
* obeys should-effectiveTime
* effectiveTime 1..1
  * ^comment = "SHALL contain exactly one [1..1] effectiveTime." // auto-should
  * insert IntervalValueOnly
* value 1..1
* value only $CD
  * ^comment = "SHALL contain exactly one [1..1] value with @xsi:type=\"CD\"."
  /*" 201707 Errata Comment 1599: Added value set \"Pregnancy Status\" urn:oid:2.16.840.1.113883.11.20.9.85 to Trifolia. Contains values (all from SNOMED): Pregnant (finding), Possible Pregnancy (finding), Not Pregnant (finding).
  
  Updated Pregnancy Status Observation template - removed binding to single code (Pregnant) and added SHALL DYNAMIC binding to above value set.\" " */
  * insert BindAtCode($2.16.840.1.113762.1.4.1099.24, required)
* entryRelationship ^slicing.discriminator.type = #profile
  * ^slicing.discriminator.path = "observation"
  * ^slicing.rules = #open
* entryRelationship contains estimatedDateofDelivery 0..1
* entryRelationship[estimatedDateofDelivery] ^comment = "MAY contain zero or one [0..1] entryRelationship (CONF:81-458) such that it"
  * typeCode 1..1
  * typeCode = #REFR (exactly)
    * ^comment = "SHALL contain exactly one [1..1] @typeCode=\"REFR\" Refers to (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002 STATIC) (CONF:81-459)."
  * observation 1..1
  * observation only EstimatedDateofDelivery
    * ^comment = "SHALL contain exactly one [1..1] observationEstimated Date of Delivery (identifier: urn:oid:2.16.840.1.113883.10.20.15.3.1) (CONF:81-15584)."