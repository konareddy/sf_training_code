// Exercise 05 — Update and Delete
//
// Purpose:
// Real Salesforce code constantly updates and deletes records — syncing data,
// archiving records, processing bulk operations. This exercise shows the full
// DML lifecycle: insert → update → delete, and introduces a critical safety rule:
// after a delete, always query into a List (not a single variable) so an empty
// result doesn't throw a runtime exception.

Account account = new Account();
account.Name = 'Testing';
insert account;

Account saved = [SELECT Id, Name FROM Account WHERE Id = :account.Id];
saved.Name = 'Testing2';
update saved;

Account updated = [SELECT Id, Name FROM Account WHERE Id = :account.Id];
System.debug('After update: ' + updated.Name);

delete updated;

List<Account> remaining = [SELECT Id, Name FROM Account WHERE Id = :account.Id];
System.debug('Rows after delete: ' + remaining.size());
