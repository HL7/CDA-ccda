### Purpose

This two-volume implementation guide (IG) contains an overview of Clinical Document Architecture (CDA) markup standards, design, and use (Volume 1) and a consolidated library of CDA templates for clinical notes applicable to the US Realm (Volume 2). These two volumes comprise a Draft Standard for Trial Use (DSTU).
It has been adapted from the Release 2.0 version of the Consolidated CDA Templates for Clinical Notes to support backward compatibility “on the wire” with the 1.1 Release of the templates described in this guide. This will enable implementers of systems conforming to this guide to produce documents that can be understood by systems which only support the C-CDA Release 1.1 specification.
The consolidated library incorporates previous efforts from Health Level Seven (HL7), Integrating the Healthcare Enterprise (IHE), the Health Information Technology Standards Panel (HITSP), the HL7 Health Story guides, HITSP C32, and related components of IHE Patient Care Coordination (IHE PCC). It has additional or enhanced document types for greater expressivity and decrease ambiguity (see Volume 2 Summary of Changes). Volume 1 adds new general guidance (see Summary of Changes).
This guide, in conjunction with the HL7 CDA Release 2 (CDA R2) standard, is to be used for implementing the following CDA documents and header constraints for clinical notes.

* <a href="StructureDefinition-2.16.840.1.113883.10.20.22.1.15.html">Care Plan including Home Health Plan of Care (HHPoC)</a>
* <a href="StructureDefinition-2.16.840.1.113883.10.20.22.1.4.html">Consultation Note</a>
* <a href="StructureDefinition-2.16.840.1.113883.10.20.22.1.2.html">Continuity of Care Document (CCD)</a>
* <a href="StructureDefinition-2.16.840.1.113883.10.20.22.1.5.html">Diagnostic Imaging Reports (DIR)</a>
* <a href="StructureDefinition-2.16.840.1.113883.10.20.22.1.8.html">Discharge Summary</a>
* <a href="StructureDefinition-2.16.840.1.113883.10.20.22.1.3.html">History and Physical (H&P)</a>
* <a href="StructureDefinition-2.16.840.1.113883.10.20.22.1.7.html">Operative Note</a>
* <a href="StructureDefinition-2.16.840.1.113883.10.20.22.1.6.html">Procedure Note</a>
* <a href="StructureDefinition-2.16.840.1.113883.10.20.22.1.9.html">Progress Note</a>
* <a href="StructureDefinition-2.16.840.1.113883.10.20.22.1.14.html">Referral Note</a>
* <a href="StructureDefinition-2.16.840.1.113883.10.20.22.1.13.html">Transfer Summary</a>
* <a href="StructureDefinition-2.16.840.1.113883.10.20.22.1.10.html">Unstructured Document</a>
* <a href="StructureDefinition-2.16.840.1.113883.10.20.22.1.1.html">Patient Generated Document (US Realm Header)</a>

### Audience

The audience for this implementation guide includes architects and developers of healthcare information technology (HIT) systems in the US Realm that exchange patient clinical data. Business analysts and policy managers can also benefit from a basic understanding of the use of CDA templates across multiple implementation use cases.

### Organization of the Guide

This implementation guide is organized into two volumes. Volume 1 contains primarily narrative text describing the Consolidated CDA Release 2 (C-CDA R2) guide, whereas Volume 2 contains normative CDA template definitions.

### Acknowledgments

This R2.1 guide was developed and produced through the efforts of Health Level Seven (HL7).

The editors appreciate the support and sponsorship of the HL7 Structured Documents Working Group (SDWG), the HL7 Patient Care Work Group, the HL7 Child Health Work Group, and all volunteers and staff associated with the creation of this document. This guide would not have been possible without the support of the Department of Defense/Department of Veterans Affairs Interagency Program Office (DoD/VA IPO).

This material contains content from SNOMED CT® (http://www.ihtsdo.org/snomed-ct/). SNOMED CT is a registered trademark of the International Health Terminology Standard Development Organisation (IHTSDO).

This material contains content from the Logical Observation Identifiers Names and Codes (LOINC) organization (http://loinc.org). The LOINC table, LOINC codes, and LOINC panels and forms file are copyright © 1995-2014, Regenstrief Institute, Inc. and LOINC Committee, and available at no cost under the license at http://loinc.org/terms-of-use.

### Authors

| Primary Editor / Co-Chair: | Rick Geimer<br/>[Lantana Consulting Group](http://www.lantanagroup.com)<br/>[rick.geimer@lantanagroup.com](mailto:rick.geimer@lantanagroup.com) | Co-Editor: | Benjamin Flessner<br/>[Epic](http://www.epic.com)<br />[Benjamin@epic.com](mailto:Benjamin@epic.com) |
| Primary Editor / Co-Chair: | Brett Marquard<br/>[River Rock Associates](http://www.riverrockassociates.com)<br/>[brett@riverrockassociates.com](mailto:brett@riverrockassociates.com) | Co-Editor: | Larry Garber, MD<br/>[Reliant Medical Group](http://www.reliantmedicalgroup.org)<br/>[Lawrence.Garber@ReliantMedicalGroup.org](mailto:Lawrence.Garber@ReliantMedicalGroup.org) |
| Co-Chair: | Calvin Beebe<br/>[Mayo Clinic](http://www.mayo.edu)<br/>[cbeebe@mayo.edu](mailto:cbeebe@mayo.edu) | Co-Editor: | Jennie Harvell, M.Ed US Health and Human Services<br/>[Jennie.harvell@hhs.gov](mailto:Jennie.harvell@hhs.gov) |
| Co-Chair: | Diana Behling<br/>[Iatric Systems](http://iatric.com)<br/>[Diana.Behling@iatric.com](mailto:Diana.Behling@iatric.com) | Co-Editor: | Laura Heermann Langford, RN, PhD<br/>Intermountain Healthcare<br/>[Laura.Heermann@imail.org](mailto:Laura.Heermann@imail.org) |
| Co-Chair: | Austin Kreisler<br/>SAIC Consultant to CDC/NHSN<br/>[duz1@cdc.gov](mailto:duz1@cdc.gov) | Co-Editor: | Emma Jones RN-BC, MSN<br/>Allscripts<br/>[emma.jones@allscripts.com](mailto:emma.jones@allscripts.com) |
| Co-Chair: | Patrick Lloyd<br/>Icode Solutions<br/>[patrick.e.loyd@gmail.com](mailto:patrick.e.loyd@gmail.com) | Co-Editor: | Josh Mandel, MD<br/>Harvard Medical School / Boston Children's Hospital<br/>[Joshua.Mandel@childrens.harvard.edu](mailto:Joshua.Mandel@childrens.harvard.edu) |
| Primary Editor / Co-Chair: | Gaye Dolin, MSN, RN<br/>[Intelligent Medical Objects, Inc.](http://www.imo-online.com)<br/>[gdolin@imo-online.com](mailto:gdolin@imo-online.com) | Co-Editor: | Susan Matney, MSN, RN 3M<br/>Health Information Systems<br/>[samatney@mmm.com](mailto:samatney@mmm.com) |
| Primary Editor: | Sarah Gaunt<br/>[Lantana Consulting Group](http://www.lantanagroup.com)<br/>[sarah.gaunt@lantanagroup.com](mailto:sarah.gaunt@lantanagroup.com) | Co-Editor: | Sean McIlvenna<br/>[Lantana Consulting Group](http://www.lantanagroup.com)<br/>[sean.mcilvenna@lantanagroup.com](mailto:sean.mcilvenna@lantanagroup.com) |
| Primary Editor: | Zabrina Gonzaga<br/>[Lantana Consulting Group](http://www.lantanagroup.com)<br/>[zabrina.gonzaga@lantanagroup.com](mailto:zabrina.gonzaga@lantanagroup.com) | Co-Editor: | Dale Nelson<br/>[Lantana Consulting Group](http://www.lantanagroup.com)<br/>[dale.nelson@lantanagroup.com](mailto:dale.nelson@lantanagroup.com) |
| Co-Editor: | Liora Alschuler<br/>[Lantana Consulting Group](http://www.lantanagroup.com)<br/>[liora.alschuler@lantanagroup.com](mailto:liora.alschuler@lantanagroup.com) | Co-Editor: | Lisa Nelson<br/>Life Over Time Solutions<br/>[LisaRNelson@cox.net](mailto:LisaRNelson@cox.net) |
| Co-Editor: | Virinder Batra<br/>Intuit Health<br/>[virinder.batra@gmail.com](mailto:virinder.batra@gmail.com) | Co-Editor: | Terrence A. O'Malley, MD<br/>Partners Healthcare<br/>[tomalley@partners.org](mailto:tomalley@partners.org) |
| Co-Editor: | Keith W. Boone<br/>GE Healthcare<br/>[keith.boone@ge.com](mailto:keith.boone@ge.com) | Co-Editor: | Eric Parapini<br/>[Lantana Consulting Group](http://www.lantanagroup.com)<br/>[eric.parapini@lantanagroup.com](mailto:eric.parapini@lantanagroup.com) |
| Co-Editor: | Stephen Chu, MD, PhD, FACS<br/>National E-Health Transition, Australia<br/>[stephen.chu@nehta.gov.au](mailto:stephen.chu@nehta.gov.au) | Co-Editor: | David Tao, D.Sc.<br/>ICSA Labs<br/>[dtao12@gmail.com](mailto:dtao12@gmail.com) |
| Co-Editor: | John D'Amore<br/>[Lantana Consulting Group](http://www.lantanagroup.com)<br/>[john.damore@lantanagroup.com](mailto:john.damore@lantanagroup.com) | Technical Editor: | Adrienne Giannone<br/>[Lantana Consulting Group](http://www.lantanagroup.com)<br/>[adrienne.giannone@lantanagroup.com](mailto:adrienne.giannone@lantanagroup.com) |
| Co-Editor: | Robert H. Dolin, MD<br/>[bobdolin@gmail.com](mailto:bobdolin@gmail.com) | Technical Editor: | Diana Wright<br/>[Lantana Consulting Group](http://www.lantanagroup.com)<br/>[diana.wright@lantanagroup.com](mailto:diana.wright@lantanagroup.com) |
| Co-Editor: | Susan Campbell, PhD, RN<br/>[bostoncampbell@mindspring.com](mailto:bostoncampbell@mindspring.com) | Technical Editor: | Veronica Kwok<br/>Deloitte<br/>[vkwok@deloitte.com](mailto:vkwok@deloitte.com) |

[Next Page - Background](background.html)