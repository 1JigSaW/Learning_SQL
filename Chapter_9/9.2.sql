mysql> SELECT a.account_id, a.product_cd, a.cust_id, a.avail_balance
    -> FROM account a
    -> WHERE EXISTS (SELECT 1
    -> FROM product p
    -> WHERE p.product_cd = a.product_cd
    -> AND p.product_type_cd = 'LOAN');
+------------+------------+---------+---------------+
| account_id | product_cd | cust_id | avail_balance |
+------------+------------+---------+---------------+
|         25 | BUS        |      10 |          0.00 |
|         27 | BUS        |      11 |       9345.55 |
|         29 | SBL        |      13 |      50000.00 |
+------------+------------+---------+---------------+
3 rows in set (0.00 sec)

