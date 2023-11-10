<!-- {% raw %} to make the USCDI table

need 

source CSV file = `input/data/uscdi-table.csv`
markdown page file = `input/pagecontent/uscdi.md`
liquid template files = `input/includes/uscdi-ccda-map.html`,`input/includes/sd_link.html`
icons (png files) = `input/images/<"kebab case" USCDI class names>.png`

1. create the source CSV file with all the same column names
    - FHIRPath column is not used for rendering so can replace with template name or whatever
    - this file lives in the `input/data` folder
    - It is copied to the `input/images` folder as both a csv and convert to excel file using a bash/python script.
2. The pagecontent/uscdi.md page is where the table is rendered
3. the liquid template tag "{% include uscdi-ccda-map.html %}" references `includes/uscdi-ccda-map.html` which does the rendering
   - this file depends on another liquid template {% include sd_link.html title = title  %} which refererence `includes/sd_link.html` to get the profile page link.
   1. icons (png images) are in the `input/images` are named using the "kebab case" USCDI class names.{% endraw %} -->

The C-CDA templates were designed to meet the 2015 Edition certification criterion for Consolidated CDA Creation 170.315(g)(6). They were created for each item in the [2015 Edition Common Clinical Data Set (CCDS)](https://www.healthit.gov/sites/default/files/ccds_reference_document_v1_1.pdf). The C-CDA templates on this page include requirements upto and including [U.S. Core Data for Interoperability (USCDI) v4](https://www.healthit.gov/isa/united-states-core-data-interoperability-uscdi).

Note that:
-  USCDI Data Classes and Element names may not be the same as the C-CDA template names and element names.
-  Not every USCDI Data Class and Element is mapped to a single template.
-  Many C-CDA elements do not map to a USCDI Data Classes and Element because C-CDA usage is broader than certification and because additional C-CDA elements are required to make CDA implementable.

Updates to C-CDA depend upon community input and we encourage our audience to submit questions and feedback to C-CDA specifications by clicking on the *Propose a change* link in the footer of every page.  In addition, we encourage our audience to request any necessary clarifications to USCDI through the [USCDI ONDEC process](https://www.healthit.gov/isa/ONDEC) that helps inform future updates to C-CDA.

The table below lists the C-CDA tempaltes used for the corresponding USCDI Data elements.:

<!-- Do we add this later: This information is also available as a [csv](uscdi-table.csv) or [excel](uscdi-table.xlsx) file -->

{% include uscdi-ccda-map.html %}








   
