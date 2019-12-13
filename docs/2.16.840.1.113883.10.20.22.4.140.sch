<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2">
  <sch:ns prefix="f" uri="http://hl7.org/fhir"/>
  <sch:ns prefix="h" uri="http://www.w3.org/1999/xhtml"/>
  <!-- 
    This file contains just the constraints for the profile CDAR2.Act
    It includes the base constraints for the resource as well.
    Because of the way that schematrons and containment work, 
    you may need to use this schematron fragment to build a, 
    single schematron that validates contained resources (if you have any) 
  -->
  <sch:pattern>
    <sch:title>f:Act</sch:title>
    <sch:rule context="f:Act">
      <sch:assert test="count(f:id) &gt;= 1">id: minimum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:statusCode) &gt;= 1">statusCode: minimum cardinality of 'statusCode' is 1</sch:assert>
      <sch:assert test="count(f:effectiveTime) &gt;= 1">effectiveTime: minimum cardinality of 'effectiveTime' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>Act</sch:title>
    <sch:rule context="f:Act">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children (inherited)</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>Act.extension</sch:title>
    <sch:rule context="f:Act/f:extension">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
      <sch:assert test="exists(f:extension)!=exists(f:*[starts-with(local-name(.), &quot;value&quot;)])">Must have either extensions or value[x], not both</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>Act.author</sch:title>
    <sch:rule context="f:Act/f:author">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children (inherited)</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:Act/f:entryRelationship</sch:title>
    <sch:rule context="f:Act/f:entryRelationship">
      <sch:assert test="count(f:observation) &gt;= 1">observation: minimum cardinality of 'observation' is 1</sch:assert>
      <sch:assert test="count(f:observation) &gt;= 1">observation: minimum cardinality of 'observation' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>Act.entryRelationship.observation</sch:title>
    <sch:rule context="f:Act/f:entryRelationship/f:observation">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children (inherited)</sch:assert>
    </sch:rule>
  </sch:pattern>
</sch:schema>
