// Exercise 04 — Insert + Query Back
//
// Purpose:
// DML (Data Manipulation Language) is how Apex writes data to Salesforce.
// A key concept: the record Id is null before insert and gets populated after.
// Querying back immediately after insert confirms the record was saved and
// teaches you the bind variable syntax (:variable) — used in every real trigger
// and service class to scope queries to specific records.

Account account = new Account();
account.Name = 'Testing';
insert account;
System.debug('Account Id: ' + account.Id);

Account saved = [SELECT Id, Name FROM Account WHERE Id = :account.Id];
System.debug('Queried back: ' + saved.Name);
