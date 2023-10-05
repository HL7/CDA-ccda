Profile: PastMedicalHistory
Parent: $Section
Id: PastMedicalHistory
Title: "Past Medical History"
Description: "This section contains a record of the patient's past complaints, problems, and diagnoses. It contains data from the patient's past up to the patient's current complaint or reason for seeking medical care."

* insert Section(#11348-0, History of Past Illness, 2.16.840.1.113883.10.20.22.2.20, 2015-08-01)
* entry ^slicing.discriminator[0].type = #value
  * ^slicing.discriminator[=].path = "observation"
  * ^slicing.rules = #open
* entry contains problem 0..*
* entry[problem] ^comment = "MAY contain zero or more [0..*] entry (CONF:1198-8791) such that it"
  * observation 1..1
  * observation only ProblemObservation
    * ^comment = "SHALL contain exactly one [1..1] Problem Observation (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.4.4:2015-08-01) (CONF:1198-15476)."