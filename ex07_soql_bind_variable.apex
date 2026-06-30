// Exercise 07 — SOQL WHERE Clause + Bind Variable
//
// Purpose:
// Most real queries filter data — you don't want all 50,000 Accounts, just
// the ones meeting a condition. Bind variables (:variable) let you pass Apex
// values directly into SOQL safely, without string concatenation (which would
// be a SOQL injection risk). This pattern appears in every trigger and service
// class: filter by Id, by status, by date range, etc.

Decimal threshold = 0;

List<Account> accounts = [SELECT Id, Name, AnnualRevenue
                           FROM Account
                           WHERE AnnualRevenue > :threshold];

for (Account a : accounts) {
    System.debug('AnnualRevenue for Account ' + a.Name + ' = ' + a.AnnualRevenue);
}
