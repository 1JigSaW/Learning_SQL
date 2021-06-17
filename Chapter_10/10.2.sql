mysql> SELECT p.product_cd, a.account_id, a.cust_id, a.avail_balance
    -> FROM account a RIGHT OUTER JOIN product p
    -> ON p.product_cd = a.product_cd;
+------------+------------+---------+---------------+
| product_cd | account_id | cust_id | avail_balance |
+------------+------------+---------+---------------+
| CD         |          3 |       1 |       3000.00 |
| CD         |         15 |       6 |      10000.00 |
| CD         |         17 |       7 |       5000.00 |
| CD         |         23 |       9 |       1500.00 |
| CHK        |          1 |       1 |       1057.75 |
| CHK        |          4 |       2 |       2258.02 |
| CHK        |          7 |       3 |       1057.75 |
| CHK        |         10 |       4 |        534.12 |
| CHK        |         13 |       5 |       2237.97 |
| CHK        |         14 |       6 |        122.37 |
| CHK        |         18 |       8 |       3487.19 |
| CHK        |         21 |       9 |        125.67 |
| CHK        |         24 |      10 |      23575.12 |
| CHK        |         28 |      12 |      38552.05 |
| MM         |          8 |       3 |       2212.50 |
| MM         |         12 |       4 |       5487.09 |
| MM         |         22 |       9 |       9345.55 |
| SAV        |          2 |       1 |        500.00 |
| SAV        |          5 |       2 |        200.00 |
| SAV        |         11 |       4 |        767.77 |
| SAV        |         19 |       8 |        387.99 |
| AUT        |       NULL |    NULL |          NULL |
| BUS        |         25 |      10 |          0.00 |
| BUS        |         27 |      11 |       9345.55 |
| MRT        |       NULL |    NULL |          NULL |
| SBL        |         29 |      13 |      50000.00 |
+------------+------------+---------+---------------+
26 rows in set (0.00 sec)


