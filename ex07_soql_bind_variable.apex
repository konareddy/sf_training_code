// Exercise 07 — SOQL with WHERE clause and bind variable
// Query all Accounts with AnnualRevenue > 0, loop and print Name + AnnualRevenue

Decimal threshold = 0;

List<Account> accounts = [SELECT Id, Name, AnnualRevenue
                           FROM Account
                           WHERE AnnualRevenue > :threshold];

for (Account a : accounts) {
    System.debug('AnnualRevenue for Account ' + a.Name + ' = ' + a.AnnualRevenue);
}
