mysql> SELECT account_id, product_cd, avail_balance
    -> FROM account
    -> WHERE product_cd IN (SELECT product_cd
    -> FROM product
    -> WHERE product_type_cd = 'LOAN');
+------------+------------+---------------+
| account_id | product_cd | avail_balance |
+------------+------------+---------------+
|         25 | BUS        |          0.00 |
|         27 | BUS        |       9345.55 |
|         29 | SBL        |      50000.00 |
+------------+------------+---------------+
3 rows in set (0.00 sec)
