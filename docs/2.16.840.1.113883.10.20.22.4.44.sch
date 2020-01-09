<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2">
  <sch:ns prefix="f" uri="http://hl7.org/fhir"/>
  <sch:ns prefix="h" uri="http://www.w3.org/1999/xhtml"/>
  <!-- 
    This file contains just the constraints for the profile CDAR2.Observation
    It includes the base constraints for the resource as well.
    Because of the way that schematrons and containment work, 
    you may need to use this schematron fragment to build a, 
    single schematron that validates contained resources (if you have any) 
  -->
  <sch:pattern>
    <sch:title>f:Observation</sch:title>
    <sch:rule context="f:Observation">
      <sch:assert test="count(f:id) &gt;= 1">id: minimum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:statusCode) &gt;= 1">statusCode: minimum cardinality of 'statusCode' is 1</sch:assert>
      <sch:assert test="count(f:value) &lt;= 1">value: maximum cardinality of 'value' is 1</sch:assert>
      <sch:assert test="count(f:methodCode) &lt;= 1">methodCode: maximum cardinality of 'methodCode' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:Observation/f:entryRelationship</sch:title>
    <sch:rule context="f:Observation/f:entryRelationship">
      <sch:assert test="count(f:observation) &gt;= 1">observation: minimum cardinality of 'observation' is 1</sch:assert>
      <sch:assert test="count(f:observation) &gt;= 1">observation: minimum cardinality of 'observation' is 1</sch:assert>
      <sch:assert test="count(f:act) &gt;= 1">act: minimum cardinality of 'act' is 1</sch:assert>
      <sch:assert test="count(f:act) &gt;= 1">act: minimum cardinality of 'act' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
</sch:schema>
