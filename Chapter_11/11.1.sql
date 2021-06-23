mysql> SELECT emp_id,
    -> CASE
    -> WHEN title LIKE '%President' OR title = 'Loan Manager'
    -> OR title = 'Treasurer'
    -> THEN 'Management'
    -> WHEN title LIKE '%Teller' OR title = 'Operations Manager'
    -> THEN 'Operations'
    -> ELSE 'Unknown'
    -> END
    -> FROM employee;
+--------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| emp_id | CASE
WHEN title LIKE '%President' OR title = 'Loan Manager'
OR title = 'Treasurer'
THEN 'Management'
WHEN title LIKE '%Teller' OR title = 'Operations Manager'
THEN 'Operations'
ELSE 'Unknown'
END |
+--------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
|      1 | Management                                                                                                                                                                                          |
|      2 | Management                                                                                                                                                                                          |
|      3 | Management                                                                                                                                                                                          |
|      4 | Operations                                                                                                                                                                                          |
|      5 | Management                                                                                                                                                                                          |
|      6 | Operations                                                                                                                                                                                          |
|      7 | Operations                                                                                                                                                                                          |
|      8 | Operations                                                                                                                                                                                          |
|      9 | Operations                                                                                                                                                                                          |
|     10 | Operations                                                                                                                                                                                          |
|     11 | Operations                                                                                                                                                                                          |
|     12 | Operations                                                                                                                                                                                          |
|     13 | Operations                                                                                                                                                                                          |
|     14 | Operations                                                                                                                                                                                          |
|     15 | Operations                                                                                                                                                                                          |
|     16 | Operations                                                                                                                                                                                          |
|     17 | Operations                                                                                                                                                                                          |
|     18 | Operations                                                                                                                                                                                          |
+--------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
18 rows in set (0.00 sec)

