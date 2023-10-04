Alias: $LogicalTarget = http://hl7.org/fhir/tools/StructureDefinition/logical-target
Alias: $DAR = http://hl7.org/fhir/StructureDefinition/data-absent-reason

// Insert the logical-target extension with DAR = NA to hide the "This logical model cannot be the target of a reference"
RuleSet: LogicalModelNA
* ^extension[$LogicalTarget].valueBoolean.extension[$DAR].valueCode = #not-applicable


// Creates an error-level constraint. Pass strings unquoted. If they contain , or ) surround the string with [[ ]] 
RuleSet: ConstraintError(key, human, expression)
* insert ConstraintErrorEmpty({key}, [[{human}]])
* ^constraint[=].expression = "{expression}"

// Creates an error-level constraint with no expression
RuleSet: ConstraintErrorEmpty(key, human)
* ^constraint[+].key = "{key}"
* ^constraint[=].severity = #error
* ^constraint[=].human = "{human}"

// Creates a warning-level constraint. Pass strings unquoted. If they contain , or ) surround the string with [[ ]] 
RuleSet: ConstraintWarning(key, human, expression)
* insert ConstraintWarningEmpty({key}, [[{human}]])
* ^constraint[=].expression = "{expression}"

// Creates an error-level constraint with no expression
RuleSet: ConstraintWarningEmpty(key, human)
* ^constraint[+].key = "{key}"
* ^constraint[=].severity = #warning
* ^constraint[=].human = "{human}"