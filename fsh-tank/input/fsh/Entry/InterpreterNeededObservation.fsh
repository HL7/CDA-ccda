Profile: InterpreterNeededObservation
Parent: $Observation
Id: InterpreterNeededObservation
Title: "Interpreter Needed Observation"
Description: "The interpreter needed observation represents an indication of whether a person needs language interpretation services."

* insert LogicalModelTemplate(interpreter-needed-obs, 2.16.840.1.113883.10.20.22.4.515, 2025-05-01)
* insert NarrativeLink

* code 1..1
  * insert CodedLoinc(54588-9, [[Interpreter needed]])
* effectiveTime 1..1
  * ^comment = "This observation SHALL contain exactly one [1..1] effectiveTime (CONF:1198-31904)."
  * obeys should-high
  * low 1..1
  * ^comment = "This effectiveTime SHALL contain exactly one [1..1] low (CONF:1198-32330)."
  * ^short = "The effectiveTime/@low represents when an interpreter is needed"
  * high 0..1
  * ^comment = "This effectiveTime SHOULD contain zero or one [0..1] high (CONF:1198-32331)."
  * ^short = "SHOULD contain high"
* value 1..1
* value only $CD
* value from $2.16.840.1.113762.1.4.1267.16 (required)