Profile: AllergyIntoleranceObservation
Parent: SubstanceOrDeviceAllergyIntoleranceObservation
Id: AllergyIntoleranceObservation
Title: "Allergy - Intolerance Observation"
Description: """This template reflects a discrete observation about a patient's allergy or intolerance. Because it is a discrete observation, it will have a statusCode of "completed". The effectiveTime, also referred to as the "biologically relevant time" is the time at which the observation holds for the patient. For a provider seeing a patient in the clinic today, observing a history of penicillin allergy that developed five years ago, the effectiveTime is five years ago. 

The effectiveTime of the Allergy - Intolerance Observation is the definitive indication of whether or not the underlying allergy/intolerance is resolved. If known to be resolved, then an effectiveTime/high would be present. If the date of resolution is not known, then effectiveTime/high will be present with a nullFlavor of "UNK".

The agent responsible for an allergy or adverse reaction is not always a manufactured material (for example, food allergies), nor is it necessarily consumed. The following constraints reflect limitations in the base CDA R2 specification, and should be used to represent any type of responsible agent, i.e., use playingEntity classCode = "MMAT" for all agents, manufactured or not."""

* insert LogicalModelTemplate(allergy, 2.16.840.1.113883.10.20.22.4.7, 2014-06-09)

* negationInd 0..1
  * ^short = "Use negationInd=\"true\" to indicate that the allergy was not observed."
  * ^comment = "MAY contain zero or one [0..1] @negationInd (CONF:1098-31526)."
* effectiveTime ^short = "If the allergy/intolerance is known to be resolved, but the date of resolution is not known, then the high element SHALL be present, and the nullFlavor attribute SHALL be set to 'UNK'."

* participant[consumable].participantRole.playingEntity
  * code from $2.16.840.1.113762.1.4.1186.8 (preferred)
    * insert USCDI([[Substance]])
