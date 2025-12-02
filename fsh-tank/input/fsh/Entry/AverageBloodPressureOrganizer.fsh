Profile: AverageBloodPressureOrganizer
Parent: $Organizer
Id: AverageBloodPressureOrganizer
Title: "Average Blood Pressure Organizer"
Description: """This template represents a single instance of an Average Blood Pressure reading. Average (mean) Blood Pressure (systolic and diastolic) is the average of two or more blood pressure (BP) readings in a specified time period or according to a specified algorithm or protocol determined by the organization collecting the data. This template contains two Vital Sign Observation components for the two parts of the reading."""

* insert LogicalModelTemplate(avg-bp-org, 2.16.840.1.113883.10.20.22.4.512, 2024-05-01)
* insert NarrativeLinkOrganizer
* insert ShouldElement(author)

* classCode = #BATTERY

* code 1..1
  * insert CodedLoinc(96607-7, Blood pressure panel mean systolic and mean diastolic)

* statusCode 1..1
  * code 1..1
  * code = #completed
* effectiveTime ^short = "Shall match the time of the individual components"
* author 0..*
* author only AuthorParticipation
* author ^comment = "SHOULD contain zero or many [0..*] Author Participation."

* component ^slicing.discriminator[0].type = #value
  * ^slicing.discriminator[=].path = "observation.code.code"
  * ^slicing.rules = #open
* component contains systolic 1..1 and diastolic 1..1
* component[systolic]
  * observation 1..1
    * code 1..1
      * insert CodedLoinc(96608-5, Systolic blood pressure mean)
    * value only $PQ
    * value.unit = #mm[Hg]
* component[diastolic]
  * observation 1..1
    * code 1..1
      * insert CodedLoinc(96609-3, Diastolic blood pressure mean)
    * value only $PQ
    * value.unit = #mm[Hg]
