// Exercise 09 — DML with Partial Success + Error Handling
//
// Purpose:
// In bulk operations, one bad record shouldn't fail the entire batch.
// Database.insert(records, false) — allOrNone = false — lets valid records
// succeed while bad ones are skipped, returning a SaveResult per record so
// you can log or handle each failure individually. This is the pattern used
// in real integrations, data loads, and batch jobs where partial success
// is better than an all-or-nothing rollback.

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
