Profile: SubstanceOrDeviceAllergyIntoleranceObservation
Parent: $Observation
Id: SubstanceOrDeviceAllergyIntoleranceObservation
Title: "Substance or Device Allergy - Intolerance Observation"
Description: """This template reflects a discrete observation about a patient's allergy or intolerance to a substance or device. Because it is a discrete observation, it will have a statusCode of "completed". The effectiveTime, also referred to as the 'clinically relevant time' is the time at which the observation holds for the patient. For a provider seeing a patient in the clinic today, observing a history of penicillin allergy that developed five years ago, the effectiveTime is five years ago. 

The effectiveTime of the Substance or Device Allergy - Intolerance Observation is the definitive indication of whether or not the underlying allergy/intolerance is resolved. If known to be resolved, then an effectiveTime/high would be present. If the date of resolution is not known, then effectiveTime/high will be present with a nullFlavor of "UNK"."""

* insert LogicalModelTemplate(substance-device-allergy-intolerance-obs, 2.16.840.1.113883.10.20.24.3.90, 2014-06-09)
* insert NarrativeLink

* classCode 1..1
* classCode = #OBS (exactly)
  * ^comment = "SHALL contain exactly one [1..1] @classCode=\"OBS\" Observation (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:1098-16303)."
* moodCode 1..1
* moodCode = #EVN (exactly)
  * ^comment = "SHALL contain exactly one [1..1] @moodCode=\"EVN\" Event (CodeSystem: HL7ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:1098-16304)."
* id 1..*
  * ^comment = "SHALL contain at least one [1..*] id (CONF:1098-16307)."
* code 1..1
  * ^comment = "SHALL contain exactly one [1..1] code (CONF:1098-16345)."
  * code 1..1
  * code = #ASSERTION
    * ^comment = "This code SHALL contain exactly one [1..1] @code=\"ASSERTION\" Assertion (CONF:1098-16346)."
  * codeSystem 1..1
  * codeSystem = "2.16.840.1.113883.5.4"
    * ^comment = "This code SHALL contain exactly one [1..1] @codeSystem=\"2.16.840.1.113883.5.4\" (CodeSystem: HL7ActCode urn:oid:2.16.840.1.113883.5.4) (CONF:1098-32171)."
* statusCode 1..1
  * ^comment = "SHALL contain exactly one [1..1] statusCode (CONF:1098-16308)."
  * code 1..1
  * code = #completed (exactly)
    * ^comment = "This statusCode SHALL contain exactly one [1..1] @code=\"completed\" Completed (CodeSystem: HL7ActStatus urn:oid:2.16.840.1.113883.5.14) (CONF:1098-26354)."
* effectiveTime 1..1
  * ^short = "The effectiveTime/low (a.k.a. \"onset date\") asserts when the allergy/intolerance became clinically active. The effectiveTime/high (a.k.a. \"resolution date\") asserts when the allergy/intolerance became clinically resolved. If the allergy/intolerance is known to be resolved, but the date of resolution is not known, then the high element SHALL be present, and the nullFlavor attribute SHALL be set to 'UNK'."
  * ^comment = "SHALL contain exactly one [1..1] effectiveTime (CONF:1098-16309)."
  * low 1..1
    * ^comment = "This effectiveTime SHALL contain exactly one [1..1] low (CONF:1098-31536)."
  * high 0..1
    * ^comment = "This effectiveTime MAY contain zero or one [0..1] high (CONF:1098-31537)."
* value 1..1
* value only $CD
  * ^comment = "SHALL contain exactly one [1..1] value with @xsi:type=\"CD\" (CONF:1098-16312)."
  * insert BindAtCode($2.16.840.1.113883.3.88.12.3221.6.2, required)
* obeys should-author
* author 0..*
* author only AuthorParticipation
  * ^comment = "SHOULD contain zero or more [0..*] Author Participation (identifier: urn:oid:2.16.840.1.113883.10.20.22.4.119) (CONF:1098-31144)." // man-should
* participant ^slicing.discriminator[0].type = #value
  * ^slicing.discriminator[=].path = "typeCode"
  * ^slicing.rules = #open
  * ^comment = "SHOULD contain zero or more [0..*] participant (CONF:1098-16318) such that it"
* participant contains participant1 0..*
* participant[participant1] ^short = "participant"
  * ^comment = "SHOULD contain zero or more [0..*] participant (CONF:1098-16318) such that it"
  * typeCode 1..1
  * typeCode = #CSM (exactly)
    * ^comment = "SHALL contain exactly one [1..1] @typeCode=\"CSM\" Consumable (CodeSystem: HL7ParticipationType urn:oid:2.16.840.1.113883.5.90 STATIC) (CONF:1098-16319)."
  * participantRole 1..1
    * ^comment = "SHALL contain exactly one [1..1] participantRole (CONF:1098-16320)."
    * classCode 1..1
    * classCode = #MANU (exactly)
      * ^comment = "This participantRole SHALL contain exactly one [1..1] @classCode=\"MANU\" Manufactured Product (CodeSystem: HL7RoleClass urn:oid:2.16.840.1.113883.5.110 STATIC) (CONF:1098-16321)."
    * playingEntity 1..1
      * ^comment = "This participantRole SHALL contain exactly one [1..1] playingEntity (CONF:1098-16322)."
      * classCode 1..1
      * classCode = #MMAT (exactly)
        * ^comment = "This playingEntity SHALL contain exactly one [1..1] @classCode=\"MMAT\" Manufactured Material (CodeSystem: HL7EntityClass urn:oid:2.16.840.1.113883.5.41 STATIC) (CONF:1098-16323)."
      * code 1..1
      * code from $2.16.840.1.113762.1.4.1010.1 (preferred)
        * ^comment = "This playingEntity SHALL contain exactly one [1..1] code, which MAY be selected from ValueSet Substance Reactant for Intolerance urn:oid:2.16.840.1.113762.1.4.1010.1 DYNAMIC (CONF:1098-16324)."
* entryRelationship ^slicing.discriminator[0].type = #profile
  * ^slicing.discriminator[=].path = "observation"
  * ^slicing.rules = #open
  * ^comment = "SHOULD contain zero or one [0..1] entryRelationship (CONF:1098-32935) such that it"
* entryRelationship contains
    entryRelationship1 0..1 and
    entryRelationship2 0..* and
    entryRelationship3 0..1 and
    entryRelationship4 0..1
* entryRelationship[entryRelationship1] ^short = "entryRelationship"
  * ^comment = "MAY contain zero or one [0..1] entryRelationship (CONF:1098-16333) such that it"
  * typeCode 1..1
  * typeCode = #SUBJ (exactly)
    * ^comment = "SHALL contain exactly one [1..1] @typeCode=\"SUBJ\" Has subject (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002 STATIC) (CONF:1098-16335)."
  * inversionInd 1..1
  * inversionInd = true (exactly)
    * ^comment = "SHALL contain exactly one [1..1] @inversionInd=\"true\" True (CONF:1098-16334)."
  * observation 1..1
  * observation only AllergyStatusObservation
    * ^comment = "SHALL contain exactly one [1..1] Allergy Status Observation (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.4.28:2019-06-20) (CONF:1098-16336)."
* entryRelationship[entryRelationship2] ^short = "entryRelationship"
  * ^comment = "SHOULD contain zero or more [0..*] entryRelationship (CONF:1098-16337) such that it"
  * typeCode 1..1
  * typeCode = #MFST (exactly)
    * ^comment = "SHALL contain exactly one [1..1] @typeCode=\"MFST\" Is Manifestation of (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002 STATIC) (CONF:1098-16339)."
  * inversionInd 1..1
  * inversionInd = true (exactly)
    * ^comment = "SHALL contain exactly one [1..1] @inversionInd=\"true\" True (CONF:1098-16338)."
  * observation 1..1
  * observation only ReactionObservation
    * ^comment = "SHALL contain exactly one [1..1] Reaction Observation (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.4.9:2014-06-09) (CONF:1098-16340)."
* entryRelationship[entryRelationship3] ^short = "entryRelationship"
  * ^comment = "SHOULD NOT contain zero or one [0..1] entryRelationship (CONF:1098-16341) such that it"
  * typeCode 1..1
  * typeCode = #SUBJ (exactly)
    * ^comment = "SHALL contain exactly one [1..1] @typeCode=\"SUBJ\" Has Subject (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002 STATIC) (CONF:1098-16342)."
  * inversionInd 1..1
  * inversionInd = true (exactly)
    * ^comment = "SHALL contain exactly one [1..1] @inversionInd=\"true\" True (CONF:1098-16343)."
  * observation 1..1
  * observation only SeverityObservation
    * ^comment = "SHALL contain exactly one [1..1] Severity Observation (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.4.8:2014-06-09) (CONF:1098-16344)."
* entryRelationship[entryRelationship4] ^short = "entryRelationship"
  * ^comment = "SHOULD contain zero or one [0..1] entryRelationship (CONF:1098-32935) such that it"
  * typeCode 1..1
  * typeCode = #SUBJ (exactly)
    * ^comment = "SHALL contain exactly one [1..1] @typeCode=\"SUBJ\" Has Subject (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:1098-32936)."
  * inversionInd 1..1
  * inversionInd = true (exactly)
    * ^comment = "SHALL contain exactly one [1..1] @inversionInd=\"true\" True (CONF:1098-32937)."
  * observation 1..1
  * observation only CriticalityObservation
    * ^comment = "SHALL contain exactly one [1..1] Criticality Observation  (identifier: urn:oid:2.16.840.1.113883.10.20.22.4.145) (CONF:1098-32938)."