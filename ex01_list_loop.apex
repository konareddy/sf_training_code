// Exercise 1 — List + loop
// Create a List<String> of four names, loop and print each, then print total count.

List<String> names = new List<String>{'test1', 'test2', 'test3', 'test4'};

for (String name : names) {
    System.debug('Name: ' + name);
}

System.debug('Total Names: ' + names.size());
