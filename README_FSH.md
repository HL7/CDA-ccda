# Notes for FSH / Sushi Profiles
This guide is moving towards FSH-based development. This will help track changes more easily as well as help verify valid profile modeling more quickly, since FSH can catch errors like invalid types / bad bindings more quickly than a full IG compile.

## Developing using FSH
In the current state, the IG is still built from StructureDefinition XML files. These should not be manually modified, but rather compiled from FSH source using sushi. Currently this is a manual process while some bugs with Sushi are worked out.

The FSH files in `/fsh-tank` are the primary source of truth and are all that should be edited (for StructureDefinition changes). This directory should not be picked up by the publisher for automatic sushi compiling.

### Getting Started
- Install node using guidance from [npmjs.com](https://docs.npmjs.com/downloading-and-installing-node-js-and-npm)
- From the IG folder's root, execute the following to install sushi and related tools. It will also modify the sushi installation with fixes to properly handle CDA logical models.
  >`npm i`
- Make changes to FSH files
- Compile the changes by executing the following. This both runs sushi and converts the sushi-generated json files into xml.
  >`npm run sushi`
- (optionally) Run the "genOnce" script to run the IG publisher
- Commit changes to both .fsh files and the modified .xml files
  
After the first round of setup, you only need to run `npm run sushi` to re-compile the XML files.

### New / Deleted Profiles
Sushi currently only generates the StructureDefinition resources. The ImplementationGuide resource is still built manually. This means if you add or remove (or rename) profiles, you still need to modify the corresponding `<resource>` element in `hl7.cda.us.ccda.xml`.

### Examples
Likewise, examples are not (yet) built in FSH. They must be listed in the IG resource as an example (isExample: true & profile: url from StructureDefinition).

<br/><br/><br/><br/>
## Creation Notes
The original FSH definitions were created using gofsh on the XML StructureDefinitions in the IG as exported by Trifolia / modified manually over the Summer of 2023. At the time, GoFSH could not handle the logical-model model extension, so that was manually removed and re-added to each definition. The general process was:

- Remove the logical-model extension from all StructureDefinition XML's
- Run gofsh on the input folder
- Add the `* insert LogicalModelNA` ruleset to each profile which re-adds that logical-model extension
- Execute `npm run sushi` - updates all StructureDefinition XML's to FHIR 5 & removes superfluous elements (like unchanged min/max values)
- Re-run gofsh on the updated input folder - this now cleaned up the *FSH* definitions with the removal of those superfluous elements
- Finally re-execute `npm run sushi` to verify that the resultant XML files were the same as the middle-tier XML files. 
- Spot-check / review the changes to all XML files to ensure only superfluous fields were removed 
- Commit all the things!