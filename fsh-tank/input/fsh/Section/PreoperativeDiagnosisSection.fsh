Profile: PreoperativeDiagnosisSection
Parent: $Section
Id: PreoperativeDiagnosisSection
Title: "Preoperative Diagnosis Section"
Description: "The Preoperative Diagnosis Section records the surgical diagnoses assigned to the patient before the surgical procedure which are the reason for the surgery. The preoperative diagnosis is, in the surgeon's opinion, the diagnosis that will be confirmed during surgery."

* insert Section(#10219-4, Preoperative Diagnosis, 2.16.840.1.113883.10.20.22.2.34, 2015-08-01)
* entry ^slicing.discriminator[0].type = #value
  * ^slicing.discriminator[=].path = "act"
  * ^slicing.rules = #open
* entry contains preopDiagnosis 0..1
* entry[preopDiagnosis] ^comment = "SHOULD contain zero or one [0..1] entry (CONF:1198-10096) such that it"
  * act 1..1
  * act only PreoperativeDiagnosis
    * ^comment = "SHALL contain exactly one [1..1] Preoperative Diagnosis (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.4.65:2015-08-01) (CONF:1198-15504)."