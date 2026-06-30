// Exercise 08 — Multi-Object Query + Map Aggregation
//
// Purpose:
// Real Salesforce apps constantly join parent and child data — Accounts with
// their Contacts, Opportunities with their Products, Cases with their Comments.
// This exercise teaches the standard pattern: query both objects, use a Map to
// correlate them by Id, then loop once to produce the combined output.
// AggregateResult with GROUP BY is the efficient way to count child records
// without hitting governor limits on large datasets.

Map<Id,Account> accountsMap = new Map<Id, Account>([SELECT Id, Name FROM Account]);

Set<Id> accountIds = accountsMap.keySet();

Map<Id, Integer> accountContactMap = new Map<Id, Integer>();

for (AggregateResult ar : [SELECT AccountId, Count(Id) totalContacts
                            FROM Contact
                            WHERE AccountId IN :accountIds
                            GROUP BY AccountId]) {
    Id acntId = (Id) ar.get('AccountId');
    Integer contactCount = (Integer) ar.get('totalContacts');
    accountContactMap.put(acntId, contactCount);
}

for (Id accountId : accountIds) {
    Integer contactCount = 0;
    if (accountContactMap.get(accountId) != null && accountContactMap.get(accountId) > 0) {
        contactCount = accountContactMap.get(accountId);
    }
    System.debug('Total Contact for ' + accountsMap.get(accountId).Name + ' = ' + contactCount);
}
