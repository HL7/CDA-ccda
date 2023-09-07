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
3. CDA-1513 - Change the Health Insurance Type binding to be the X12N Insurance Type code system
4. CDA-1526 - Add guidance on @unit in Vital Sign Observation
5. CDA-1793 - Remove Vaccine Clinical Drug value set from Immunization Medication Information template
6. CDA-1797 - Add optional Payers Section to Referral Note
7. CDA-1802 - Change Smoking Status binding from SHALL to MAY
8. CDA-2007 - Change Authorization Activity entryRelationship from SHALL to MAY
9. CDA-20004 - Remove binding to HL7 Discharge Disposition code system
10. CDA-20047 - Remove Diagnostic Imaging Report document template and child section and entry templates.  Remove templates with DEPRECATED in title
11. CDA-20451 - Allow HCPCS to Procedure Note serviceEvent code
12. CDA-20462 - Allow multiple performers in Operative Note
13. CDA-20463 - Allow HCPCS to Planned Procedure code
14. CDA-20543 - Change guidance on Supply repeatNumber
15. CDA-20565 - Remove requirement to send R1.1 template IDs
16. CDA-20664 - Remove Entries Optional section templates
17. CDA-1240 - Added assignedPerson with US Realm Person Name to Procedure Activity Procedure template.
18. CDA-1273 - Changed Problem Observation in Problem Concern Act from 1..* to 1..1.
19. CDA-1274 - Changed Allergy Intolerance Observation in Allergy Concern Act from 1..* to 1..1.
20. CDA-1277 - Added a Progress Towards Goal Observation to the Goal Observation template.
21. CDA-1367 - Use proper LOINC code (8693-4) with no translations on Mental Status Observation template.
22.	CDA-1693 - Change the name of the Interventions Section to Activities Section.
