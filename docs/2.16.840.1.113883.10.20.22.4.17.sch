<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2">
  <sch:ns prefix="f" uri="http://hl7.org/fhir"/>
  <sch:ns prefix="h" uri="http://www.w3.org/1999/xhtml"/>
  <!-- 
    This file contains just the constraints for the profile CDAR2Supply
    It includes the base constraints for the resource as well.
    Because of the way that schematrons and containment work, 
    you may need to use this schematron fragment to build a, 
    single schematron that validates contained resources (if you have any) 
  -->
  <sch:pattern>
    <sch:title>f:Supply</sch:title>
    <sch:rule context="f:Supply">
      <sch:assert test="count(f:id) &gt;= 1">id: minimum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:statusCode) &gt;= 1">statusCode: minimum cardinality of 'statusCode' is 1</sch:assert>
      <sch:assert test="count(f:author) &lt;= 1">author: maximum cardinality of 'author' is 1</sch:assert>
      <sch:assert test="count(f:entryRelationship) &lt;= 1">entryRelationship: maximum cardinality of 'entryRelationship' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>Supply</sch:title>
    <sch:rule context="f:Supply">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children (inherited)</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>Supply.extension</sch:title>
    <sch:rule context="f:Supply/f:extension">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
      <sch:assert test="exists(f:extension)!=exists(f:*[starts-with(local-name(.), &quot;value&quot;)])">Must have either extensions or value[x], not both</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:Supply/f:entryRelationship</sch:title>
    <sch:rule context="f:Supply/f:entryRelationship">
      <sch:assert test="count(f:inversionInd) &gt;= 1">inversionInd: minimum cardinality of 'inversionInd' is 1</sch:assert>
      <sch:assert test="count(f:act) &gt;= 1">act: minimum cardinality of 'act' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>Supply.entryRelationship.act</sch:title>
    <sch:rule context="f:Supply/f:entryRelationship/f:act">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children (inherited)</sch:assert>
    </sch:rule>
  </sch:pattern>
</sch:schema>
