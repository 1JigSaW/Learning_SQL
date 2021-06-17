mysql> SELECT cust_id, COUNT(*) count
    -> FROM account
    -> GROUP BY cust_id
    -> HAVING SUM(count) >= 2;
+---------+-------+
| cust_id | count |
+---------+-------+
|       1 |     3 |
|       2 |     2 |
|       3 |     2 |
|       4 |     3 |
|       5 |     1 |
|       6 |     2 |
|       7 |     1 |
|       8 |     2 |
|       9 |     3 |
|      10 |     2 |
|      11 |     1 |
+---------+-------+
11 rows in set (0.00 sec)

