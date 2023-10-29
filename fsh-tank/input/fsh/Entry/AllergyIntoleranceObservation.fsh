Profile: AllergyIntoleranceObservation
Parent: SubstanceOrDeviceAllergyIntoleranceObservation
Id: AllergyIntoleranceObservation
Title: "Allergy - Intolerance Observation"
Description: """This template reflects a discrete observation about a patient's allergy or intolerance. Because it is a discrete observation, it will have a statusCode of "completed". The effectiveTime, also referred to as the "biologically relevant time" is the time at which the observation holds for the patient. For a provider seeing a patient in the clinic today, observing a history of penicillin allergy that developed five years ago, the effectiveTime is five years ago. 

The effectiveTime of the Allergy - Intolerance Observation is the definitive indication of whether or not the underlying allergy/intolerance is resolved. If known to be resolved, then an effectiveTime/high would be present. If the date of resolution is not known, then effectiveTime/high will be present with a nullFlavor of "UNK".

The agent responsible for an allergy or adverse reaction is not always a manufactured material (for example, food allergies), nor is it necessarily consumed. The following constraints reflect limitations in the base CDA R2 specification, and should be used to represent any type of responsible agent, i.e., use playingEntity classCode = "MMAT" for all agents, manufactured or not."""

* insert LogicalModelTemplate(allergy, 2.16.840.1.113883.10.20.22.4.7, 2014-06-09)

* classCode 1..1
* classCode = #OBS (exactly)
  * ^comment = "SHALL contain exactly one [1..1] @classCode=\"OBS\" Observation (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:1098-7379)."
* moodCode 1..1
* moodCode = #EVN (exactly)
  * ^comment = "SHALL contain exactly one [1..1] @moodCode=\"EVN\" Event (CodeSystem: HL7ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:1098-7380)."
* negationInd 0..1
  * ^short = "Use negationInd=\"true\" to indicate that the allergy was not observed."
  * ^comment = "MAY contain zero or one [0..1] @negationInd (CONF:1098-31526)."
* id 1..*
  * ^comment = "SHALL contain at least one [1..*] id (CONF:1098-7382)."
* code 1..1
  * ^comment = "SHALL contain exactly one [1..1] code (CONF:1098-15947)."
  * code 1..1
  * code = #ASSERTION
    * ^comment = "This code SHALL contain exactly one [1..1] @code=\"ASSERTION\" Assertion (CONF:1098-15948)."
  * codeSystem 1..1
  * codeSystem = "2.16.840.1.113883.5.4"
    * ^comment = "This code SHALL contain exactly one [1..1] @codeSystem=\"2.16.840.1.113883.5.4\" (CodeSystem: HL7ActCode urn:oid:2.16.840.1.113883.5.4) (CONF:1098-32153)."
* statusCode 1..1
  * ^comment = "SHALL contain exactly one [1..1] statusCode (CONF:1098-19084)."
  * code 1..1
  * code from $2.16.840.1.113762.1.4.1240.6 (required)
  * ^comment = "This statusCode SHALL contain exactly one [1..1] @code, which SHALL be selected from ValueSet Completed or Nullified Act Status urn:oid:2.16.840.1.113762.1.4.1240.6."
* effectiveTime 1..1
  * ^short = "If the allergy/intolerance is known to be resolved, but the date of resolution is not known, then the high element SHALL be present, and the nullFlavor attribute SHALL be set to 'UNK'."
  * ^comment = "SHALL contain exactly one [1..1] effectiveTime (CONF:1098-7387)."
  * low 1..1
    * ^short = "The effectiveTime/low (a.k.a. \"onset date\") asserts when the allergy/intolerance became biologically active."
    * ^comment = "This effectiveTime SHALL contain exactly one [1..1] low (CONF:1098-31538)."
  * high 0..1
    * ^short = "The effectiveTime/high (a.k.a. \"resolution date\") asserts when the allergy/intolerance became biologically resolved."
    * ^comment = "This effectiveTime MAY contain zero or one [0..1] high (CONF:1098-31539)."
* value 0..1
* value only $CD
* value from $2.16.840.1.113883.3.88.12.3221.6.2 (preferred)
  * ^short = "The consumable participant points to the precise allergen or substance of intolerance. Because the consumable and the reaction are more clinically relevant than a categorization of the allergy/adverse event type, many systems will simply assign a fixed value here (e.g., \"allergy to substance\")."
* author 0..*
* author only AuthorParticipation
  * ^comment = "SHOULD contain zero or more [0..*] Author Participation (identifier: urn:oid:2.16.840.1.113883.10.20.22.4.119) (CONF:1098-31143)."
* participant[participant1].participantRole.playingEntity
  * code from $2.16.840.1.113762.1.4.1186.8 (preferred)
    * insert USCDI([[Substance]])
* entryRelationship ^slicing.discriminator[0].type = #profile
  * ^slicing.discriminator[=].path = "observation"
  * ^slicing.rules = #open
* entryRelationship contains criticality 0..1
* entryRelationship[criticality] ^comment = "SHOULD contain zero or one [0..1] entryRelationship (CONF:1098-32910) such that it"
  * typeCode 1..1
  * typeCode = #SUBJ (exactly)
    * ^comment = "SHALL contain exactly one [1..1] @typeCode=\"SUBJ\" Has Subject (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:1098-32911)."
  * inversionInd 1..1
  * inversionInd = true (exactly)
    * ^comment = "SHALL contain exactly one [1..1] @inversionInd=\"true\" True (CONF:1098-32912)."
  * observation 1..1
  * observation only CriticalityObservation
    * ^comment = "SHALL contain exactly one [1..1] Criticality Observation  (identifier: urn:oid:2.16.840.1.113883.10.20.22.4.145) (CONF:1098-32913)."