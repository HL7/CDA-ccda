Profile: MedicationFreeTextSig
Parent: $SubstanceAdministration
Id: MedicationFreeTextSig
Title: "Medication Free Text Sig"
Description: """The template is available to explicitly identify the free text Sig within each medication. 

An example free text sig: Thyroxin 150 ug, take one tab by mouth every morning."""

* insert LogicalModelTemplateRootOnly(med-freeTextSig, 2.16.840.1.113883.10.20.22.4.147)
* insert NarrativeLink

* obeys sig-closed

* classCode 1..1
  * ^comment = "SHALL contain exactly one [1..1] @classCode=\"SBADM\" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:81-32770)."
* moodCode 1..1
* moodCode from MoodCodeEvnInt (required)
  * ^short = "moodCode must match the parent substanceAdministration EVN or INT"
  * ^comment = "SHALL contain exactly one [1..1] @moodCode, which SHALL be selected from ValueSet MoodCodeEvnInt urn:oid:2.16.840.1.113883.11.20.9.18 STATIC 2011-04-03 (CONF:81-32771)."
* code 1..1
  * ^comment = "SHALL contain exactly one [1..1] code (CodeSystem: LOINC urn:oid:2.16.840.1.113883.6.1) (CONF:81-32775)."
  * insert CodedLoinc(76662-6, [[Instructions Medication Narrative]])
* text 1..1
  * ^comment = "SHALL contain exactly one [1..1] text (CONF:81-32754)."
  * reference 1..1
    * ^short = "Reference into the section/text to a tag that only contains free text sig."
    * ^comment = "This text SHALL contain exactly one [1..1] reference (CONF:81-32755)."
    * value 0..1
      * ^comment = "This reference SHOULD contain zero or one [0..1] @value (CONF:81-32756)." // man-should
* consumable 1..1
  * ^comment = "SHALL contain exactly one [1..1] consumable (CONF:81-32776)."
  * manufacturedProduct 1..1
    * ^comment = "This consumable SHALL contain exactly one [1..1] manufacturedProduct (CONF:81-32777)."
    * manufacturedLabeledDrug 1..1
      * ^comment = "This manufacturedProduct SHALL contain exactly one [1..1] manufacturedLabeledDrug (CONF:81-32778)."
      * nullFlavor 1..1
      * nullFlavor = #NA (exactly)
        * ^comment = "This manufacturedLabeledDrug SHALL contain exactly one [1..1] @nullFlavor=\"NA\" Not Applicable (CONF:81-32779)."

Invariant: sig-closed
Description: "This is a closed template and shall not contain any elements besides code, text, and consumable"
Severity: #error
Expression: "(typeId | statusCode | effectiveTime | priorityCode | repeatNumber | routeCode | approachSiteCode | doseQuantity | rateQuantity | maxDoseQuantity | administrationUnitCode | subject | specimen | performer | informant | participant | entryRelationship | precondition).empty()"
// (omitting id and author since id is generally recommended, and author pariticpations are allowed anywhere)