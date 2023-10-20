### Version 

The changes in this version of Consolidated CDA have been made from STU comments and JIRA issues that were raised by the community and approved by the Structured Documents working group.

#### Major Changes

* Removed Diagnostic Imaging Report document template and relevant section and entry templates
* Removed any templates that are DEPRECATED
* Removed Entries Optional templates if an equivalent Entries Required template exists
* Combined Companion Guide and C-CDA narrative into one guide
* Added Treatment Intervention Preference and Care Experience Preference USCDI Entry templates
* Added USCDI tag and extensions to USCDI elements

#### Tracker Issues Applied

1. CDA-814 - Change assorted vocabulary bindings
2. CDA-939 - Make Interventions section mandatory in Care Plan
3. CDA-1381 - Prevent doseQuantity/@unit and administrationUnitCode/@code from both being present where both are on a profile
4. CDA-1513 - Change the Health Insurance Type binding to be the X12N Insurance Type code system
5. CDA-1526 - Add guidance on @unit in Vital Sign Observation
6. CDA-1793 - Remove Vaccine Clinical Drug value set from Immunization Medication Information template
7. CDA-1797 - Add optional Payers Section to Referral Note
8. CDA-1802 - Change Smoking Status binding from SHALL to MAY
9. CDA-1806 - Updated wording of documentationOf.serviceEvent.code in Operative Note
10. CDA-1922 - Added @code and disallowed @nullFlavor from confidentialityCode in US Realm Header
11. CDA-2007 - Change Authorization Activity entryRelationship from SHALL to MAY
12. CDA-2108 - Prevent both @code and @nullFlavor from being present on Result Observation
13. CDA-20004 - Remove binding to HL7 Discharge Disposition code system
14. CDA-20005 - Added LOINC Scale chart to description in Result Observation
15. CDA-20047 - Remove Diagnostic Imaging Report document template and child section and entry templates.  Remove templates with DEPRECATED in title
16. CDA-20053 - Updated languageCode to use valueset AllLanguages in US Realm Header and US Realm Header for Patient Generated Document
17. CDA-20076 - Changed value on Severity Observation from SHALL to SHOULD and modified description to match
18. CDA-20085 - Updated Observation/value to include LOINC codes in Result Observation
19. CDA-20449 - Added Mental Status Section to Progress Note
20. CDA-20451 - Allow HCPCS to Procedure Note serviceEvent code
21. CDA-20462 - Allow multiple performers in Operative Note
22. CDA-20463 - Allow HCPCS to Planned Procedure code
23. CDA-20478 - Added @code under dosumentationOf.serviceEvent in Operative Note and moved constraint there
24. CDA-20516 - Added specific wording to code defining nullFlavor in designconsiderations.md
25. CDA-20543 - Change guidance on Supply repeatNumber
26. CDA-20565 - Remove requirement to send R1.1 template IDs
27. CDA-20664 - Remove Entries Optional section templates
28. CDA-1240 - Added assignedPerson with US Realm Person Name to Procedure Activity Procedure template.
29. CDA-1273 - Changed Problem Observation in Problem Concern Act from 1..* to 1..1.
30. CDA-1274 - Changed Allergy Intolerance Observation in Allergy Concern Act from 1..* to 1..1.
31. CDA-1277 - Added a Progress Towards Goal Observation to the Goal Observation template.
32. CDA-1367 - Use proper LOINC code (8693-4) with no translations on Mental Status Observation template.
33.	CDA-1693 - Change the name of the Interventions Section to Activities Section.
34. CDA-20693 - typo correction to USCDI guidance
35. CDA-20711 - update Gender Harmony guidance
36. CDA-20546 - PQ values require a @unit
37. CDA-20681 - Templates no longer contain a version label in their name (such as V2, V3, etc.)
38. CDA-20482 - Extensionless templates are not allowed to have an extension.
39. CDA-20786 - Set some bound observations to have a type
40. CDA-20767 - Remove CarePlan intendedRecipient/receivedOrganization/name rule
41. CDA-1789 - Provided guidance on using PlannedEncounter template for future encounters.
42. CDA-1873 - Changed Encounter Diagnosis statusCode to be 'completed'.
43. CDA-20814 - Updated all UDI templates to allow additional templateIds.
44. CDA-1469 - Updated MentalStatusObservation.value to be from new SNOMED cognitive function value set.
45. CDA-20324 - Moved binding to ObservationInterpretation from interpretationCode/@code to interpretationCode.
46. CDA-20568 - Add the word DYNAMIC to Encounter Activity binding.
47. CDA-20673 - Update Policy Activity to be "SHOULD contain 0..1 address".
48. CDA-20687 - Update MedicationActivity doseQuantity guidance.
49. CDA-20698, CDA-20697 - Add sections to Discharge Summary document.
50. CDA-20737 - Remove Procedure Activity Act and Procedure Activity Observation templates.
51. CDA-1429 - Remove Goal Observation value constraint
52. CDA-1430 - Added code constraints to Findings Section
53. CDA-1505 - Patient Generated Document header has the same bindings as US Realm Header for performer functionCode.
54. CDA-1757 - Updated BirthSex template to align with Gender Harmony.
55. CDA-1637/CDA-1638 - Update Discharge Disposition code binding.
56. CDA-1762 - Update the encompassingEncounter responsibleParty to be SHOULD.
57. CDA-20713 - Care Team Member Function value set updated.
58. CDA-1381 - Constraint that doseQuantity/@unit and administrationUnitCode SHALL NOT both be present.
59. CDA-20053 - Updated value set binding for languageCode to be AllLanguages.
60. CDA-20085 - Allow Result Observation value to be from SNOMED or LOING.
61. CDA-20449 - Allow Mental Status section in Progress Note document.
62. CDA-20478/CDA-1806 - Update OperativeNote/ProcedureNote binding on serviceEvent.
63. CDA-20516 - Updated guidance on how to specify when NullFlavors are allowed.
64. CDA-1922 - NullFlavor is not allowed on confidentialityCode.
65. CDA-1278 - Changed the GoalObservation statusCode to be bound to a value set.
66. CDA-1760 - Changed any statusCode that were set to 'completed' to be bound to a value set.
67. CDA-20736 - Relaxed AllergyIntolerance value and updated the Allergy and Intolerance type value set.
68. CDA-1627 - Bind Procedure Act Procedure code to US Core Procedure value set.
69. CDA-20444 - Bind Problem Observation code to US Core Condition value set.
70. CDA-20022 - Added a page that lists all of the used value sets and used code systems.
71. CDA-20822 - Updated CareTeamMemberAct to clean up untestable constraints and unnecessary "such that it".
72. CDA-20803 - Updated description in ResultOrganizer to include specimin clarification
73. CDA-20772 - Updated RelatedPersonRelationshipandNameParticipant associatedEntity.code to new valueset