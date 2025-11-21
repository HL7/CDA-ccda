////////////////////////////////////////////////////////////
//                                                        //
//        Helpers to support new sdtc:Category            //
//                                                        //
////////////////////////////////////////////////////////////

RuleSet: DocumentCategoryV(title, loinc, loincName)
* insert FixedCategory({loinc}, 2.16.840.1.113883.6.1, {loincName}, documentType)
* sdtcCategory ^short = "Used to categorize the document as an {title}. If present, there SHALL be a category of {loinc} ({loincName})."

RuleSet: DocumentCategory(title, loinc, loincName)
* insert FixedCategory({loinc}, 2.16.840.1.113883.6.1, {loincName}, documentType)
* sdtcCategory ^short = "Used to categorize the document as a {title}. If present, there SHALL be a category of {loinc} ({loincName})."

// Create a fixed-but-optional category
// When using, MUST ALSO create an invariant named "category-{code}" (see rest of this file)
RuleSet: FixedCategory(code, codeSystem, display, sliceName)
* obeys should-sdtcCategory
* obeys category-{code}
* sdtcCategory 0..*
  * ^short = "Category is optional, but if present it SHALL contain a category with code={code}."
  * ^condition[+] = "should-sdtcCategory"
  * ^condition[+] = "category-{code}"
  * ^slicing.discriminator[0].type = #value
  * ^slicing.discriminator[=].path = "code"
  * ^slicing.discriminator[+].type = #value
  * ^slicing.discriminator[=].path = "codeSystem"
  * ^slicing.rules = #open
* sdtcCategory contains {sliceName} 0..1
* sdtcCategory[{sliceName}]
  * code 1..1
  * code = #{code}
  * codeSystem 1..1
  * codeSystem = "{codeSystem}"
  * ^short = "{display}"


////////////////////////////////////////////////////////////
//                                                        //
//    Various invariants (because these can't be          //
//      build consistently via rulesets...yet)            //
//                                                        //
////////////////////////////////////////////////////////////

Invariant: category-11488-4
Description: "If category is present, then there shall be a category with LOINC code '11488-4'."
Severity: #error
Expression: "sdtcCategory.empty() or sdtcCategory.exists(code = '11488-4' and codeSystem = '2.16.840.1.113883.6.1')"

Invariant: category-11504-8
Description: "If category is present, then there shall be a category with LOINC code '11504-8'."
Severity: #error
Expression: "sdtcCategory.empty() or sdtcCategory.exists(code = '11504-8' and codeSystem = '2.16.840.1.113883.6.1')"

Invariant: category-11506-3
Description: "If category is present, then there shall be a category with LOINC code '11506-3'."
Severity: #error
Expression: "sdtcCategory.empty() or sdtcCategory.exists(code = '11506-3' and codeSystem = '2.16.840.1.113883.6.1')"

Invariant: category-18842-5
Description: "If category is present, then there shall be a category with LOINC code '18842-5'."
Severity: #error
Expression: "sdtcCategory.empty() or sdtcCategory.exists(code = '18842-5' and codeSystem = '2.16.840.1.113883.6.1')"

Invariant: category-18761-7
Description: "If category is present, then there shall be a category with LOINC code '18761-7'."
Severity: #error
Expression: "sdtcCategory.empty() or sdtcCategory.exists(code = '18761-7' and codeSystem = '2.16.840.1.113883.6.1')"

Invariant: category-18776-5
Description: "If category is present, then there shall be a category with LOINC code '18776-5'."
Severity: #error
Expression: "sdtcCategory.empty() or sdtcCategory.exists(code = '18776-5' and codeSystem = '2.16.840.1.113883.6.1')"

Invariant: category-28570-0
Description: "If category is present, then there shall be a category with LOINC code '28570-0'."
Severity: #error
Expression: "sdtcCategory.empty() or sdtcCategory.exists(code = '28570-0' and codeSystem = '2.16.840.1.113883.6.1')"

Invariant: category-34117-2
Description: "If category is present, then there shall be a category with LOINC code '34117-2'."
Severity: #error
Expression: "sdtcCategory.empty() or sdtcCategory.exists(code = '34117-2' and codeSystem = '2.16.840.1.113883.6.1')"

Invariant: category-57133-1
Description: "If category is present, then there shall be a category with LOINC code '57133-1'."
Severity: #error
Expression: "sdtcCategory.empty() or sdtcCategory.exists(code = '57133-1' and codeSystem = '2.16.840.1.113883.6.1')"

Invariant: category-survey
Description: "If category is present, then there shall be a category with code 'survey'."
Severity: #error
Expression: "sdtcCategory.empty() or sdtcCategory.exists(code = 'survey' and codeSystem = '2.16.840.1.113883.4.642.1.1125')"

Invariant: category-social-history
Description: "If category is present, then there shall be a category with code 'social-history'."
Severity: #error
Expression: "sdtcCategory.empty() or sdtcCategory.exists(code = 'social-history' and codeSystem = 'http://terminology.hl7.org/CodeSystem/observation-category')"