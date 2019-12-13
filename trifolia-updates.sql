

/**
* Constraint 32472 is a code, and is marked as a branch, when it does not need to be (should not need be).
*/
select * from template_constraint tc
  join template t on t.id = tc.templateId
where tc.number = '30889' and
  t.oid = 'urn:oid:2.16.840.1.113883.10.20.22.4.140'
update template_constraint set isBranch = 0 where id = 32472