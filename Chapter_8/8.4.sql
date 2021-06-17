mysql> SELECT product_cd, open_branch_id, SUM(avail_balance)
    -> FROM account
    -> GROUP BY product_cd, open_branch_id
    -> Having COUNT(*) > 1
    -> ORDER BY 3 DESC;
+------------+----------------+--------------------+
| product_cd | open_branch_id | SUM(avail_balance) |
+------------+----------------+--------------------+
| CHK        |              4 |           67852.33 |
| MM         |              1 |           14832.64 |
| CD         |              1 |           11500.00 |
| CD         |              2 |            8000.00 |
| CHK        |              2 |            3315.77 |
| CHK        |              1 |             782.16 |
| SAV        |              2 |             700.00 |
+------------+----------------+--------------------+
7 rows in set (0.00 sec)
