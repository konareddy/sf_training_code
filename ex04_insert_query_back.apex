// Exercise 4 — Insert, then query back
// Create and insert one Account. Print Id after insert. Query back by Id to confirm.

Account account = new Account();
account.Name = 'Testing';
insert account;
System.debug('Account Id: ' + account.Id);

Account saved = [SELECT Id, Name FROM Account WHERE Id = :account.Id];
System.debug('Queried back: ' + saved.Name);

// Notes:
// - Id is null before insert, populated after.
// - :account.Id is a bind variable — drops an Apex variable into SOQL.
