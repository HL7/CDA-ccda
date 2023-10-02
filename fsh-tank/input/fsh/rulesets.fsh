Alias: $LogicalTarget = http://hl7.org/fhir/tools/StructureDefinition/logical-target
Alias: $DAR = http://hl7.org/fhir/StructureDefinition/data-absent-reason

// Insert the logical-target extension with DAR = NA to hide the "This logical model cannot be the target of a reference"
RuleSet: LogicalModelNA
* ^extension[$LogicalTarget].valueBoolean.extension[$DAR].valueCode = #not-applicable
