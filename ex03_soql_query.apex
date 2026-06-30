// Exercise 3 — First SOQL query
// Query the 5 most recently created Accounts. Loop and print Name + CreatedDate. Print count.

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

// Notes:
// - Inline SOQL goes in [ ] with no quotes.
// - Every query needs FROM; you can only reference fields you selected.
