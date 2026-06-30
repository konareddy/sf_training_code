// Exercise 01 — List + Loop
//
// Purpose:
// Lists are the most common collection in Apex. Any time you process
// multiple records (Accounts, Contacts, Orders), they come back as a List.
// This exercise builds the muscle memory for creating a list, adding items,
// and looping — the foundation of almost every Apex program you will write.

List<String> names = new List<String>{'test1', 'test2', 'test3', 'test4'};

for (String name : names) {
    System.debug('Name: ' + name);
}

System.debug('Total Names: ' + names.size());
