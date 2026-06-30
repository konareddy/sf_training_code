// Exercise 5 — Update and delete
// Insert an Account. Update its Name, query back, print. Delete it, query into List, print count (0).

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

// Notes:
// - A single-row query throws if it finds 0 or 2+ rows.
// - After a delete, query into a List so an empty result is safe (no exception).
