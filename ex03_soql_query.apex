// Exercise 03 — First SOQL Query
//
// Purpose:
// SOQL (Salesforce Object Query Language) is how Apex reads data from the database.
// Unlike SQL, SOQL runs inside Apex with governor limits (max 100 queries per transaction).
// This exercise introduces the basic SELECT/FROM/ORDER BY/LIMIT syntax and how
// query results land directly in a List<SObject> — the starting point for all
// data-driven Apex code.

List<Account> accounts = [
    SELECT Id, Name, CreatedDate
    FROM Account
    ORDER BY CreatedDate DESC
    LIMIT 5
];

for (Account account : accounts) {
    System.debug('Account Name: ' + account.Name);
    System.debug('Account CreatedDate: ' + account.CreatedDate);
}

System.debug('Records returned: ' + accounts.size());
