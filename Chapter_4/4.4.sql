mysql> SELECT cust_id, lname
    -> FROM individual
    -> WHERE lname LIKE '_a%e%';
+---------+--------+
| cust_id | lname  |
+---------+--------+
|       1 | Hadley |
|       9 | Farley |
+---------+--------+
2 rows in set (0.00 sec)
