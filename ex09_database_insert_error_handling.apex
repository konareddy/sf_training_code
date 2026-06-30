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
