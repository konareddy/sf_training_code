// Exercise 2 — Map + conditional logic
// Map of name → age. Loop and print adult (18+) vs minor. Print total entries.

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

// Notes:
// - Use >= 18 so 18-year-olds count as adults.
// - Iterate keySet() and call get(key) to read values while looping a map.
