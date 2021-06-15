mysql> SELECT account_id, cust_id, avail_balance
    -> FROM account
    -> WHERE status = 'ACTIVE' AND avail_balance > 2500;
+------------+---------+---------------+
| account_id | cust_id | avail_balance |
+------------+---------+---------------+
|          3 |       1 |       3000.00 |
|         12 |       4 |       5487.09 |
|         15 |       6 |      10000.00 |
|         17 |       7 |       5000.00 |
|         18 |       8 |       3487.19 |
|         22 |       9 |       9345.55 |
|         24 |      10 |      23575.12 |
|         27 |      11 |       9345.55 |
|         28 |      12 |      38552.05 |
|         29 |      13 |      50000.00 |
+------------+---------+---------------+
10 rows in set (0.00 sec)
