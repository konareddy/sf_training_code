// Exercise 02 — Map + Conditional Logic
//
// Purpose:
// Maps let you look up a value by key in O(1) time — critical when you need
// to match related records without nested loops (which hit governor limits fast).
// In real Salesforce code, Maps are used constantly: AccountId → Account,
// ContactId → list of cases, etc. This exercise practices key/value storage
// and if/else branching, both essential building blocks.

Map<String, Integer> nameAgeMap = new Map<String, Integer>();
nameAgeMap.put('Varun', 18);
nameAgeMap.put('Siddarth', 32);
nameAgeMap.put('Alexander', 17);
nameAgeMap.put('Nand', 40);

for (String name : nameAgeMap.keySet()) {
    if (nameAgeMap.get(name) >= 18) {
        System.debug(name + ' is an adult');
    } else {
        System.debug(name + ' is a minor');
    }
}

System.debug('Total entries: ' + nameAgeMap.size());
