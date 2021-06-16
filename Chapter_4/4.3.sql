mysql> SELECT account_id, open_date
    -> FROM account
    -> WHERE open_date BETWEEN '2002-01-01' AND '2002-12-31';
+------------+------------+
| account_id | open_date  |
+------------+------------+
|          7 | 2002-11-23 |
|          8 | 2002-12-15 |
|         14 | 2002-08-24 |
|         24 | 2002-09-30 |
|         25 | 2002-10-01 |
+------------+------------+
5 rows in set (0.00 sec)

