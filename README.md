# Salesforce Apex Training — Anonymous Apex Exercises

Run each file in **Developer Console → Debug → Open Execute Anonymous Window**
(or `sf apex run --file <filename>`). Set Apex log level to **DEBUG** and look for `USER_DEBUG` lines.

## Exercises

| File | Topic | Status |
|------|-------|--------|
| [ex01_list_loop.apex](ex01_list_loop.apex) | List + for-each loop | Done |
| [ex02_map_conditional.apex](ex02_map_conditional.apex) | Map + if/else logic | Done |
| [ex03_soql_query.apex](ex03_soql_query.apex) | First SOQL query | Done |
| [ex04_insert_query_back.apex](ex04_insert_query_back.apex) | Insert + bind variable query | Done |
| [ex05_update_delete.apex](ex05_update_delete.apex) | Update, delete, safe List query | Done |
| [ex06_savepoint_rollback.apex](ex06_savepoint_rollback.apex) | Savepoint & rollback | Done |
| [ex07_soql_bind_variable.apex](ex07_soql_bind_variable.apex) | SOQL WHERE + bind variable | Done |
| [ex08_map_aggregation.apex](ex08_map_aggregation.apex) | Multi-object query + Map aggregation | Done |
| [ex09_database_insert_error_handling.apex](ex09_database_insert_error_handling.apex) | DML with partial success + error handling | Done |
| [ex10_apex_class_static_method.apxc](ex10_apex_class_static_method.apxc) | Apex Class + static method | Done |

## Key Gotchas

- `System.debug(...)` → output in debug log, look for `USER_DEBUG`
- Inline SOQL in `[ ]` — no quotes, needs `FROM`, only reference selected fields
- Single-row query throws on 0 or 2+ rows — use `List<SObject>` after deletes
- `:variable` is a bind variable inside SOQL
- `Id` is `null` before insert, populated after
- DML in anonymous Apex persists **real data** — use `Database.setSavepoint()` + `Database.rollback(sp)` to undo
