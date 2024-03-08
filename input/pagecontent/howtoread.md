### How To Read Consolidated CDA Implementation Guide
The following document provides guidance to readers of the Consolidated CDA Implementation Guide published using HL7 Structure Definition.  With the switch to representing C-CDA templates using Structure Definitions, the presentation of the templates is different.  Although all the same content is present, it can be found in different places and in different formats.  This guide highlights where all template content can be found.

The Artifact Index/Summary page presents the templates that had been previously located in Volume 2.  The Artifact Summary page lists the Document Templates, the Section Templates, the Entry Templates, and the Other Templates.  As well, there is a listing of all the Examples found in the guide.

C-CDA Templates are represented as Resource Profiles in the Implementation Guide.  For the rest of this document, we will use Templates to refer to what is published in the original specification and Profiles to refer to what is published in the new web publication.  There are several different ways of viewing a Resource Profile.  The most useful tab is the Differential Table, but the Text Summary does provide some information and the Snapshot Table presents all the elements present in the template/profile.

{::options parse_block_html="false" /}
<figure>
  <img style="padding-top:0;padding-bottom:0px" src="resource_profile_info_tabs.png"/>
  <figcaption>Figure 1 - Resource Profile Information Tabs</figcaption>
</figure>
{::options parse_block_html="true" /}
 
#### Template Differentials
All the Resource Profiles inherit from either a CDA Clinical Statement structure or from another Resource Profile.  The Differential Table shows the difference from what the Profile inherits from.  This will result in a few times where a Profile shows slightly different content from its corresponding Template.  For those instances, looking at the Snapshot Table will show all of the constraints including those inherited from the parent Profile.

#### Template Identifier
The Template Identifier is listed as another identifier of the template.

{::options parse_block_html="false" /}
<figure>
  <img style="padding-top:0;padding-bottom:0px" src="template_identifier.png"/>
  <figcaption>Figure 2 - Template Identifier</figcaption>
</figure>
{::options parse_block_html="true" /}
 
#### Template Contexts
The Context tables in the pdf publication that list the templates that contain a given template and the templates that are contained by the same template are represented in two different manners.  

The Contained By templates:
 
{::options parse_block_html="false" /}
<figure>
  <img style="padding-top:0;padding-bottom:0px" src="sample_template_contained_by.png"/>
  <figcaption>Figure 3 – Sample Template Contained By Table</figcaption>
</figure>
{::options parse_block_html="true" /}

are listed in the Usage section of the Profile:
 
{::options parse_block_html="false" /}
<figure>
  <img style="padding-top:0;padding-bottom:0px" src="sample_profile_usage.png"/>
  <figcaption>Figure 4 - Sample Profile Usage Section</figcaption>
</figure>
{::options parse_block_html="true" /}


The Contained templates: 
 
{::options parse_block_html="false" /}
<figure>
  <img style="padding-top:0;padding-bottom:0px" src="sample_template_contains.png"/>
  <figcaption>Figure 5 - Sample Template Contains Table</figcaption>
</figure>
{::options parse_block_html="true" /}

are listed in the Text Summary tab under the Structures heading:
 
{::options parse_block_html="false" /}
<figure>
  <img style="padding-top:0;padding-bottom:0px" src="sample_profile_structures.png"/>
  <figcaption>Figure 6 - Sample Profile Structures Summary</figcaption>
</figure>
{::options parse_block_html="true" /}

NOTE: The indication of optional or required for contained by and contains is not present in the corresponding profile.  This can be seen in Figure 7 where the three templates have “(optional)” while the profiles in Figure 8 do not.  This means that sometimes a template may be listed twice in the Contained By or Contains in the pdf publication, (once as required and once as optional) but will only be listed once in the corresponding profile documentation.

#### Template Constraints
All the template constraints can be found in two equivalent places in the profile listing.  The Differential Table tab presents constraints as they affect the underlying structure (Document, Section, Entry, or Other).  Cardinality constraints, fixed value constraints, template constraints, and terminology constraints will all be found in the Differential Table.  Some of the text constraints that affect a specific element can also be found in the Differential Table.
 
{::options parse_block_html="false" /}
<figure>
  <img style="padding-top:0;padding-bottom:0px" src="sample_template_constraint.png"/>
  <figcaption>Figure 7 - Sample Template Constraint Table</figcaption>
</figure>
{::options parse_block_html="true" /}

 
{::options parse_block_html="false" /}
<figure>
  <img style="padding-top:0;padding-bottom:0px" src="sample_profile_differential.png"/>
  <figcaption>Figure 8 - Sample Profile Differential Tab</figcaption>
</figure>
{::options parse_block_html="true" /}

NOTE: For elements that repeat but have been constrained, the Profile will be “sliced”, and the constraint will be found on one of the slices.  This applies to fixed value constraints as well as template constraints.

NOTE: If a template inherits constraints from a parent profile, e.g., Care Team Member Act inherits from Care Team Organizer, the full constraints will not be present in the Differential Tab of the child profile but will be found in in the Snapshot Tab of the child profile, or in the Differential Tab of the parent profile.

The Detailed Descriptions tab will have all the Template Constraints listed by the specific element being constrained. This is where constraint numbers as found in the pdf publication are asserted.
 
{::options parse_block_html="false" /}
<figure>
  <img style="padding-top:0;padding-bottom:0px" src="sample_template_constraint_doc.png"/>
  <figcaption>Figure 9 - Sample Template Constraint Documentation</figcaption>
</figure>
{::options parse_block_html="true" /}
 
{::options parse_block_html="false" /}
<figure>
  <img style="padding-top:0;padding-bottom:0px" src="sample_profile_detailed_desc.png"/>
  <figcaption>Figure 10 - Sample Profile Detailed Descriptions</figcaption>
</figure>
{::options parse_block_html="true" /}

#### Template Terminology Bindings
All terminology constraints are represented as value set bindings in the profile listing.  All bound value sets are represented by the name of the value set and this name is a hyperlink.  Many of the value sets can be found in National Library of Medicine’s Value Set Authority Center (VSAC) and will require a UMLS login to see the value set content.  SHALL constraints are represented as Required bindings while SHOULD and MAY are represented as Preferred bindings.

 
{::options parse_block_html="false" /}
<figure>
  <img style="padding-top:0;padding-bottom:0px" src="sample_template_vocabulary.png"/>
  <figcaption>Figure 11 - Sample Template Constraint Table showing Vocabulary Constraints</figcaption>
</figure>
{::options parse_block_html="true" /}
 
{::options parse_block_html="false" /}
<figure>
  <img style="padding-top:0;padding-bottom:0px" src="sample_profile_vocabulary.png"/>
  <figcaption>Figure 12 - Sample Profile Differential showing Terminology Bindings</figcaption>
</figure>
{::options parse_block_html="true" /}


#### Template References
All template constraints that refer to a separate template (e.g., document templates referencing section or entry templates) are represented as specific Types in the Profile.
 
{::options parse_block_html="false" /}
<figure>
  <img style="padding-top:0;padding-bottom:0px" src="profile_differential_element_types.png"/>
  <figcaption>Figure 13 - Profile Differential showing Element Types</figcaption>
</figure>
{::options parse_block_html="true" /}

In Figure 13, there are six entryRelationship slices that refer to other profiles and this is shown in the Element Type column.  The Type name is the Template Name with all spaces and punctuation removed, e.g., Medication Supply Order becomes MedicationSupplyOrder.  Each name is a hyperlink to the appropriate profile definition.

#### Template Examples
If a template has examples, those will be found listed on the Examples tab of the profile.  Each example will be listed with its name which is a hyperlink to the example XML instance.

 
{::options parse_block_html="false" /}
<figure>
  <img style="padding-top:0;padding-bottom:0px" src="sample_profile_example.png"/>
  <figcaption>Figure 14 -- Sample Profile Example</figcaption>
</figure>
{::options parse_block_html="true" /}

#### Providing Feedback
Feedback on the C-CDA Structured Definition web publication can be made by clicking the “Propose a change” at the bottom of every page.
 
{::options parse_block_html="false" /}
<figure>
  <img style="padding-top:0;padding-bottom:0px" src="propose_a_change.png"/>
  <figcaption>Figure 15 - Propose a Change link</figcaption>
</figure>
{::options parse_block_html="true" /}

Following that link will take the reader to the HL7 JIRA.  On the JIRA, clicking on the Create button will allow one to create an issue against the HL7 Software Change Request project.  The component should be set to “C-CDA Templates Clinical Notes”.  A clear summary and description of the issue should be submitted.

Feedback on this document can also be submitted by navigating to the HL7 JIRA and creating an issue.  Refer to the “How to Read” document in the issue description.