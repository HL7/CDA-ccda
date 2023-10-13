### Version 

The changes in this version of Consolidated CDA have been made from STU comments and JIRA issues that were raised by the community and approved by the Structured Documents working group.

#### Major Changes

* Removed Diagnostic Imaging Report document template and relevant section and entry templates
* Removed any templates that are DEPRECATED
* Removed Entries Optional templates if an equivalent Entries Required template exists
* Combined Companion Guide and C-CDA narrative into one guide

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
