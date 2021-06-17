mysql> SELECT open_emp_id
    -> FROM account;
+-------------+
| open_emp_id |
+-------------+
|           1 |
|           1 |
|           1 |
|           1 |
|           1 |
|           1 |
|           1 |
|           1 |
|          10 |
|          10 |
|          10 |
|          10 |
|          10 |
|          10 |
|          10 |
|          13 |
|          13 |
|          13 |
|          16 |
|          16 |
|          16 |
|          16 |
|          16 |
|          16 |
+-------------+
24 rows in set (0.00 sec)

mysql> SELECT open_emp_id
    -> FROM account
    -> GROUP BY open_emp_id;
+-------------+
| open_emp_id |
+-------------+
|           1 |
|          10 |
|          13 |
|          16 |
+-------------+
4 rows in set (0.00 sec)

mysql> SELECT open_emp_id, COUNT(*) how_many
    -> FROM account
    -> GROUP BY open_emp_id;
+-------------+----------+
| open_emp_id | how_many |
+-------------+----------+
|           1 |        8 |
|          10 |        7 |
|          13 |        3 |
|          16 |        6 |
+-------------+----------+
4 rows in set (0.00 sec)

mysql> SELECT open_emp_id, COUNT(*) how_many
    -> FROM account
    -> WHERE COUNT(*) > 4
    -> GROUP BY open_emp_id, product_cd;
ERROR 1111 (HY000): Invalid use of group function
mysql> SELECT open_emp_id, COUNT(*) how_many
    -> FROM account
    -> GROUP BY open_emp_id
    -> HAVING COUNT(*) > 4;
+-------------+----------+
| open_emp_id | how_many |
+-------------+----------+
|           1 |        8 |
|          10 |        7 |
|          16 |        6 |
+-------------+----------+
3 rows in set (0.00 sec)

mysql> SELECT MAX(avail_balance) max_balance,
    -> AVG(avail_balance) min_balance, 
    -> AVG(avail_balance) avg_balance,
    -> SUM(avail_balance) tot_balance,
    -> COUNT(*) num_accounts
    -> FROM account
    -> WHERE product_cd = 'CHK';
+-------------+-------------+-------------+-------------+--------------+
| max_balance | min_balance | avg_balance | tot_balance | num_accounts |
+-------------+-------------+-------------+-------------+--------------+
|    38552.05 | 7300.800985 | 7300.800985 |    73008.01 |           10 |
+-------------+-------------+-------------+-------------+--------------+
1 row in set (0.00 sec)

mysql> SELECT MAX(avail_balance) max_balance,
    -> MIN(avail_balance) min_balance, 
    -> AVG(avail_balance) avg_balance,
    -> SUM(avail_balance) tot_balance,
    -> COUNT(*) num_accounts
    -> FROM account
    -> WHERE product_cd = 'CHK';
+-------------+-------------+-------------+-------------+--------------+
| max_balance | min_balance | avg_balance | tot_balance | num_accounts |
+-------------+-------------+-------------+-------------+--------------+
|    38552.05 |      122.37 | 7300.800985 |    73008.01 |           10 |
+-------------+-------------+-------------+-------------+--------------+
1 row in set (0.00 sec)

mysql> SELECT product_cd,
    -> MAX(avail_balance) max_balance,
    -> MIN(avail_balance) min_balance, 
    -> AVG(avail_balance) avg_balance,
    -> SUM(avail_balance) tot_balance,
    -> COUNT(*) num_accounts
    -> FROM account;
+------------+-------------+-------------+-------------+-------------+--------------+
| product_cd | max_balance | min_balance | avg_balance | tot_balance | num_accounts |
+------------+-------------+-------------+-------------+-------------+--------------+
| CHK        |    50000.00 |        0.00 | 7114.769138 |   170754.46 |           24 |
+------------+-------------+-------------+-------------+-------------+--------------+
1 row in set (0.00 sec)

mysql> SELECT product_cd,
    -> MAX(avail_balance) max_balance,
    -> MIN(avail_balance) min_balance, 
    -> AVG(avail_balance) avg_balance,
    -> SUM(avail_balance) tot_balance,
    -> COUNT(*) num_accounts
    -> FROM account
    -> GROUP BY product_cd;
+------------+-------------+-------------+--------------+-------------+--------------+
| product_cd | max_balance | min_balance | avg_balance  | tot_balance | num_accounts |
+------------+-------------+-------------+--------------+-------------+--------------+
| BUS        |     9345.55 |        0.00 |  4672.774902 |     9345.55 |            2 |
| CD         |    10000.00 |     1500.00 |  4875.000000 |    19500.00 |            4 |
| CHK        |    38552.05 |      122.37 |  7300.800985 |    73008.01 |           10 |
| MM         |     9345.55 |     2212.50 |  5681.713216 |    17045.14 |            3 |
| SAV        |      767.77 |      200.00 |   463.940002 |     1855.76 |            4 |
| SBL        |    50000.00 |    50000.00 | 50000.000000 |    50000.00 |            1 |
+------------+-------------+-------------+--------------+-------------+--------------+
6 rows in set (0.00 sec)

mysql> SELECT account_id, open_emp_id
    -> FROM account
    -> ORDER BY open_emp_id;
+------------+-------------+
| account_id | open_emp_id |
+------------+-------------+
|         10 |           1 |
|         11 |           1 |
|         12 |           1 |
|         14 |           1 |
|         15 |           1 |
|         21 |           1 |
|         22 |           1 |
|         23 |           1 |
|          1 |          10 |
|          2 |          10 |
|          3 |          10 |
|          4 |          10 |
|          5 |          10 |
|         17 |          10 |
|         27 |          10 |
|          7 |          13 |
|          8 |          13 |
|         29 |          13 |
|         13 |          16 |
|         18 |          16 |
|         19 |          16 |
|         24 |          16 |
|         25 |          16 |
|         28 |          16 |
+------------+-------------+
24 rows in set (0.00 sec)

mysql> SELECT COUNT(open_emp_id)
    -> FROM account;
+--------------------+
| COUNT(open_emp_id) |
+--------------------+
|                 24 |
+--------------------+
1 row in set (0.00 sec)

mysql> SELECT COUNT(DISTINCT open_emp_id)
    -> FROM account;
+-----------------------------+
| COUNT(DISTINCT open_emp_id) |
+-----------------------------+
|                           4 |
+-----------------------------+
1 row in set (0.00 sec)

mysql> SELECT MAX(pending_balance - avail_balance) max_uncleared
    -> FROM account;
+---------------+
| max_uncleared |
+---------------+
|        660.00 |
+---------------+
1 row in set (0.00 sec)

mysql> CREATE TABLE number_tbl
    -> (val SMALLINT);
Query OK, 0 rows affected (0.04 sec)

mysql> INSERT INTO number_tbl VALUES (1);
Query OK, 1 row affected (0.01 sec)

mysql> INSERT INTO number_tbl VALUES (3);
Query OK, 1 row affected (0.00 sec)

mysql> INSERT INTO number_tbl VALUES (5);
Query OK, 1 row affected (0.00 sec)

mysql> SELECT COUNT(*) num_rows,
    -> COUNT(val) num_vals,
    -> SUM(val) total,
    -> MAX(val) max_val,
    -> AVG(val) avg_val
    -> FROM number_tbl;
+----------+----------+-------+---------+---------+
| num_rows | num_vals | total | max_val | avg_val |
+----------+----------+-------+---------+---------+
|        3 |        3 |     9 |       5 |  3.0000 |
+----------+----------+-------+---------+---------+
1 row in set (0.00 sec)

mysql> INSERT INTO number_tbl VALUES (NULL);
Query OK, 1 row affected (0.01 sec)

mysql> SELECT COUNT(*) num_rows,
    -> COUNT(val) num_vals,
    -> SUM(val) total,
    -> MAX(val) max_val,
    -> AVG(val) avg_val
    -> FROM number_tbl;
+----------+----------+-------+---------+---------+
| num_rows | num_vals | total | max_val | avg_val |
+----------+----------+-------+---------+---------+
|        4 |        3 |     9 |       5 |  3.0000 |
+----------+----------+-------+---------+---------+
1 row in set (0.00 sec)

mysql> SELECT product_cd, SUM(avail_balance) prod_balance
    -> FROM account
    -> GROUP BY product_cd;
+------------+--------------+
| product_cd | prod_balance |
+------------+--------------+
| BUS        |      9345.55 |
| CD         |     19500.00 |
| CHK        |     73008.01 |
| MM         |     17045.14 |
| SAV        |      1855.76 |
| SBL        |     50000.00 |
+------------+--------------+
6 rows in set (0.00 sec)

mysql> SELECT product_cd, open_branch_id,
    -> SUM(avail_balance) tot_balance
    -> FROM account
    -> ;
+------------+----------------+-------------+
| product_cd | open_branch_id | tot_balance |
+------------+----------------+-------------+
| CHK        |              2 |   170754.46 |
+------------+----------------+-------------+
1 row in set (0.00 sec)

mysql> SELECT product_cd, open_branch_id,
    -> SUM(avail_balance) tot_balance
    -> FROM account
    -> GROUP BY product_cd, open_branch_id;
+------------+----------------+-------------+
| product_cd | open_branch_id | tot_balance |
+------------+----------------+-------------+
| CHK        |              2 |     3315.77 |
| SAV        |              2 |      700.00 |
| CD         |              2 |     8000.00 |
| CHK        |              3 |     1057.75 |
| MM         |              3 |     2212.50 |
| CHK        |              1 |      782.16 |
| SAV        |              1 |      767.77 |
| MM         |              1 |    14832.64 |
| CHK        |              4 |    67852.33 |
| CD         |              1 |    11500.00 |
| SAV        |              4 |      387.99 |
| BUS        |              4 |        0.00 |
| BUS        |              2 |     9345.55 |
| SBL        |              3 |    50000.00 |
+------------+----------------+-------------+
14 rows in set (0.00 sec)

mysql> SELECT EXTRACT(YEAR FROM start_date) year,
    -> COUNT(*) how_many
    -> FROM employee
    -> GROUP BY EXTRACT(Year FROM start_date);
+------+----------+
| year | how_many |
+------+----------+
| 2001 |        2 |
| 2002 |        8 |
| 2000 |        3 |
| 2003 |        3 |
| 2004 |        2 |
+------+----------+
5 rows in set (0.00 sec)

mysql> SELECT product_cd, open_branch_id,
    -> SUM(avail_balance) tot_balance
    -> FROM account
    -> GROUP BY product_cd, open_branch_id WITH ROLLUP;
+------------+----------------+-------------+
| product_cd | open_branch_id | tot_balance |
+------------+----------------+-------------+
| BUS        |              2 |     9345.55 |
| BUS        |              4 |        0.00 |
| BUS        |           NULL |     9345.55 |
| CD         |              1 |    11500.00 |
| CD         |              2 |     8000.00 |
| CD         |           NULL |    19500.00 |
| CHK        |              1 |      782.16 |
| CHK        |              2 |     3315.77 |
| CHK        |              3 |     1057.75 |
| CHK        |              4 |    67852.33 |
| CHK        |           NULL |    73008.01 |
| MM         |              1 |    14832.64 |
| MM         |              3 |     2212.50 |
| MM         |           NULL |    17045.14 |
| SAV        |              1 |      767.77 |
| SAV        |              2 |      700.00 |
| SAV        |              4 |      387.99 |
| SAV        |           NULL |     1855.76 |
| SBL        |              3 |    50000.00 |
| SBL        |           NULL |    50000.00 |
| NULL       |           NULL |   170754.46 |
+------------+----------------+-------------+
21 rows in set (0.00 sec)

mysql> SELECT product_cd, SUM(avail_balance) prod_balance
    -> FROM account
    -> WHERE status = 'ACTIVE'
    -> GROUP BY product_cd
    -> HAVING SUM(avail_balance) >= 10000;
+------------+--------------+
| product_cd | prod_balance |
+------------+--------------+
| CD         |     19500.00 |
| CHK        |     73008.01 |
| MM         |     17045.14 |
| SBL        |     50000.00 |
+------------+--------------+
4 rows in set (0.00 sec)

mysql> SELECT product_cd, SUM(avail_balance) prod_balance
    -> FROM account
    -> WHERE status = 'ACTIVE'
    -> GROUP BY product_cd
    -> HAVING MIN(avail_balance) >= 1000
    -> AND MAX(avail_balance) <= 10000;
+------------+--------------+
| product_cd | prod_balance |
+------------+--------------+
| CD         |     19500.00 |
| MM         |     17045.14 |
+------------+--------------+
2 rows in set (0.00 sec)

