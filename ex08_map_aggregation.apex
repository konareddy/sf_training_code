// Exercise 08 — Multi-object query + Map aggregation
//
// 1. Query all Accounts (Id, Name)
// 2. Query all Contacts that belong to those Accounts (Id, AccountId)
// 3. Build a Map<Id, Integer> — AccountId → Contact count
// 4. Loop the Accounts and print:
//      Account Name = <name>, Contact Count = <count>
//    If an Account has no contacts, print count as 0
//
// Hints:
// - Use a Set<Id> of Account Ids as a bind variable in the Contact query
// - Use map.containsKey() to check before map.get()
// - Use map.put() to insert or update the count

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
