// Exercise 6 — Savepoint and rollback
// Insert an Account. Capture savepoint. Update name. Rollback. Confirm original name restored.

// YOUR ATTEMPT GOES HERE
// Starter skeleton:

// 1. Insert an Account named 'Original Name'
Account acc = new Account();
// acc.Name = ???
// insert ???

// 2. Capture a savepoint
// Database.Savepoint sp = ???

// 3. Update the name to 'Changed Name' and call update
// acc.Name = ???
// update ???

// 4. Query back and print (should show 'Changed Name')
// Account check1 = [SELECT Id, Name FROM Account WHERE Id = :acc.Id];
// System.debug(???);

// 5. Rollback
// Database.rollback(???);

// 6. Query again and print (should show 'Original Name')
// Account check2 = [SELECT Id, Name FROM Account WHERE Id = :acc.Id];
// System.debug(???);
