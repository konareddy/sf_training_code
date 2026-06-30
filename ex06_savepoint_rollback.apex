// Exercise 06 — Savepoint and Rollback
//
// Purpose:
// In Salesforce, DML is transactional — but only if you manage it.
// Savepoints let you mark a point in time and roll back to it if something
// goes wrong, similar to database transactions. This is essential when your
// code does multi-step DML and a later step fails — without rollback, you get
// partial data corruption. Real use cases: multi-object inserts, payment processing,
// data migration scripts.

Account acc = new Account();
acc.Name = 'Original Name';
insert acc;

Database.Savepoint sp = Database.setSavepoint();

acc.Name = 'Changed Name';
update acc;

Account check1 = [SELECT Id, Name FROM Account WHERE Id = :acc.Id];
System.debug('After update: ' + check1.Name);

Database.rollback(sp);

Account check2 = [SELECT Id, Name FROM Account WHERE Id = :acc.Id];
System.debug('After rollback: ' + check2.Name);
