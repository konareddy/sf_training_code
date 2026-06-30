// Exercise 09 — DML with error handling using Database.insert
//
// 1. Create a List of 3 Contacts — give two a LastName, leave one with LastName = null
// 2. Use Database.insert(contacts, false) — allOrNone = false
//    (this allows partial success instead of rolling everything back)
// 3. Loop through the Database.SaveResult list returned
// 4. For each result print:
//      Success: Contact Id = <id>          (if isSuccess())
//      Failed:  Error = <error message>    (if not isSuccess())
//
// Hints:
// - Database.insert() returns List<Database.SaveResult>
// - SaveResult has .isSuccess(), .getId(), .getErrors()
// - Each error has .getMessage()
// - No Savepoint needed — failed records are automatically skipped

List<Contact> contacts = new List<Contact>();

contacts.add(new Contact(FirstName = 'test1', LastName = 'test1'));
contacts.add(new Contact(FirstName = 'test2', LastName = 'test2'));
contacts.add(new Contact(FirstName = 'test3', LastName = null));

List<Database.SaveResult> saveResults = Database.insert(contacts, false);

for (Database.SaveResult sr : saveResults) {
    if (sr.isSuccess()) {
        System.debug('Success: Contact Id = ' + sr.getId());
    } else {
        for (Database.Error er : sr.getErrors()) {
            System.debug('Failed: Error = ' + er.getMessage());
        }
    }
}
