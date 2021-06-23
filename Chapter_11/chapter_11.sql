mysql> SELECT c.cust_id, c.fed_id, c.cust_type_cd,
    -> CONCAT(i.fname, ' ', i.lname) indiv_name,
    -> b.name business_name
    -> FROM customer c LEFT OUTER JOIN individual i
    -> On c.cust_id = i.cust_id
    -> LEFT OUTER JOIN business b
    -> ON c.cust_id = b.cust_id;
+---------+-------------+--------------+-----------------+------------------------+
| cust_id | fed_id      | cust_type_cd | indiv_name      | business_name          |
+---------+-------------+--------------+-----------------+------------------------+
|       1 | 111-11-1111 | I            | James Hadley    | NULL                   |
|       2 | 222-22-2222 | I            | Susan Tingley   | NULL                   |
|       3 | 333-33-3333 | I            | Frank Tucker    | NULL                   |
|       4 | 444-44-4444 | I            | John Hayward    | NULL                   |
|       5 | 555-55-5555 | I            | Charles Frasier | NULL                   |
|       6 | 666-66-6666 | I            | John Spencer    | NULL                   |
|       7 | 777-77-7777 | I            | Margaret Young  | NULL                   |
|       8 | 888-88-8888 | I            | Louis Blake     | NULL                   |
|       9 | 999-99-9999 | I            | Richard Farley  | NULL                   |
|      10 | 04-1111111  | B            | NULL            | Chilton Engineering    |
|      11 | 04-2222222  | B            | NULL            | Northeast Cooling Inc. |
|      12 | 04-3333333  | B            | NULL            | Superior Auto Body     |
|      13 | 04-4444444  | B            | NULL            | AAA Insurance Inc.     |
+---------+-------------+--------------+-----------------+------------------------+
13 rows in set (0.04 sec)

mysql> SELECT c.cust_id, c.fed_id, 
    -> CASE
    -> WHEN c.cust_type_cd = 'I'
    -> THEN CONCAT(i.fname, ' ', i.lname)
    -> WHEN c.cust_type_cd = 'B'
    -> THEN b.name
    -> ELSE 'Unknown'
    -> END name
    -> FROM customer c LEFT OUTER JOIN individual i
    -> ON c.cust_id = i.cust_id
    -> LEFT OUTER JOIN business b
    -> ON c.cust_id = b.cust_id;
+---------+-------------+------------------------+
| cust_id | fed_id      | name                   |
+---------+-------------+------------------------+
|       1 | 111-11-1111 | James Hadley           |
|       2 | 222-22-2222 | Susan Tingley          |
|       3 | 333-33-3333 | Frank Tucker           |
|       4 | 444-44-4444 | John Hayward           |
|       5 | 555-55-5555 | Charles Frasier        |
|       6 | 666-66-6666 | John Spencer           |
|       7 | 777-77-7777 | Margaret Young         |
|       8 | 888-88-8888 | Louis Blake            |
|       9 | 999-99-9999 | Richard Farley         |
|      10 | 04-1111111  | Chilton Engineering    |
|      11 | 04-2222222  | Northeast Cooling Inc. |
|      12 | 04-3333333  | Superior Auto Body     |
|      13 | 04-4444444  | AAA Insurance Inc.     |
+---------+-------------+------------------------+
13 rows in set (0.00 sec)

mysql> SELECT c.cust_id, c.fed_id,
    -> CASE
    -> WHEN c.cust_type_cd = 'I' THEN
    -> (SELECT CONCAT(i.fname, ' ', i.lname)
    -> FROM individual i
    -> WHERE i.cust_id = c.cust_id)
    -> WHEN c.cust_type_cd = 'B' THEN
    -> (SELECT b.name
    -> FROM business b
    -> WHERE b.cust_id = c.cust_id)
    -> ELSE 'Unknown'
    -> END name
    -> FROM customer c;
+---------+-------------+------------------------+
| cust_id | fed_id      | name                   |
+---------+-------------+------------------------+
|       1 | 111-11-1111 | James Hadley           |
|       2 | 222-22-2222 | Susan Tingley          |
|       3 | 333-33-3333 | Frank Tucker           |
|       4 | 444-44-4444 | John Hayward           |
|       5 | 555-55-5555 | Charles Frasier        |
|       6 | 666-66-6666 | John Spencer           |
|       7 | 777-77-7777 | Margaret Young         |
|       8 | 888-88-8888 | Louis Blake            |
|       9 | 999-99-9999 | Richard Farley         |
|      10 | 04-1111111  | Chilton Engineering    |
|      11 | 04-2222222  | Northeast Cooling Inc. |
|      12 | 04-3333333  | Superior Auto Body     |
|      13 | 04-4444444  | AAA Insurance Inc.     |
+---------+-------------+------------------------+
13 rows in set (0.00 sec)

mysql> SELECT YEAR(open_date) year, COUNT(*) how_many
    -> FROM account
    -> WHERE open_date > '1999-12-31'
    -> GROUP BY YEAR(open_date);
+------+----------+
| year | how_many |
+------+----------+
| 2000 |        3 |
| 2004 |        9 |
| 2001 |        4 |
| 2002 |        5 |
| 2003 |        3 |
+------+----------+
5 rows in set (0.00 sec)

mysql> SELECT c.cust_id, c.fed_id, c.cust_type_cd,
    -> CASE
    -> WHEN EXISTS (SELECT 1 FROM account a
    -> WHERE a.cust_id = c.cust_id
    -> AND a.product_cd = 'CHK') THEN 'Y'
    -> ELSE 'N'
    -> END has_checking,
    -> CASE
    -> WHEN EXISTS (SELECT 1 FROM account a
    -> WHERE a.cust_id = c.cust_id
    -> AND a.product_cd = 'SAV') THEN 'Y'
    -> ELSE 'N'
    -> END has_savings
    -> FROM customer c;
+---------+-------------+--------------+--------------+-------------+
| cust_id | fed_id      | cust_type_cd | has_checking | has_savings |
+---------+-------------+--------------+--------------+-------------+
|       1 | 111-11-1111 | I            | Y            | Y           |
|       2 | 222-22-2222 | I            | Y            | Y           |
|       3 | 333-33-3333 | I            | Y            | N           |
|       4 | 444-44-4444 | I            | Y            | Y           |
|       5 | 555-55-5555 | I            | Y            | N           |
|       6 | 666-66-6666 | I            | Y            | N           |
|       7 | 777-77-7777 | I            | N            | N           |
|       8 | 888-88-8888 | I            | Y            | Y           |
|       9 | 999-99-9999 | I            | Y            | N           |
|      10 | 04-1111111  | B            | Y            | N           |
|      11 | 04-2222222  | B            | N            | N           |
|      12 | 04-3333333  | B            | Y            | N           |
|      13 | 04-4444444  | B            | N            | N           |
+---------+-------------+--------------+--------------+-------------+
13 rows in set (0.01 sec)

mysql> SELECT c.cust_id, c.fed_id, c.cust_type_cd,
    -> CASE (SELECT COUNT(*) FROM account a
    -> WHERE a.cust_id = c.cust_id)
    -> WHEN 0 THEN 'None'
    -> WHEN 1 THEN '1'
    -> WHEN 2 THEN '2'
    -> ELSE '3+'
    -> END num_accounts
    -> FROM customer c;
+---------+-------------+--------------+--------------+
| cust_id | fed_id      | cust_type_cd | num_accounts |
+---------+-------------+--------------+--------------+
|       1 | 111-11-1111 | I            | 3+           |
|       2 | 222-22-2222 | I            | 2            |
|       3 | 333-33-3333 | I            | 2            |
|       4 | 444-44-4444 | I            | 3+           |
|       5 | 555-55-5555 | I            | 1            |
|       6 | 666-66-6666 | I            | 2            |
|       7 | 777-77-7777 | I            | 1            |
|       8 | 888-88-8888 | I            | 2            |
|       9 | 999-99-9999 | I            | 3+           |
|      10 | 04-1111111  | B            | 2            |
|      11 | 04-2222222  | B            | 1            |
|      12 | 04-3333333  | B            | 1            |
|      13 | 04-4444444  | B            | 1            |
+---------+-------------+--------------+--------------+
13 rows in set (0.00 sec)

mysql> SELECT 100 / 0;
+---------+
| 100 / 0 |
+---------+
|    NULL |
+---------+
1 row in set (0.00 sec)

mysql> SELECT a.cust_id, a.product_cd, a.avail_balance /
    -> CASE
    -> WHEN prod_tots.tot_balance = 0 THEN 1
    -> ELSE prod_tots.tot_balance
    -> END percent_of_total
    -> FROM account a INNER JOIN
    -> (SELECT a.product_cd, SUM(a.avail_balance) tot_balance
    -> FROM account a 
    -> GROUP BY a.product_cd) prod_tots
    -> ON a.product_cd = prod_tots.product_cd;
+---------+------------+------------------+
| cust_id | product_cd | percent_of_total |
+---------+------------+------------------+
|       1 | CHK        |         0.014488 |
|       1 | SAV        |         0.269431 |
|       1 | CD         |         0.153846 |
|       2 | CHK        |         0.030928 |
|       2 | SAV        |         0.107773 |
|       3 | CHK        |         0.014488 |
|       3 | MM         |         0.129802 |
|       4 | CHK        |         0.007316 |
|       4 | SAV        |         0.413723 |
|       4 | MM         |         0.321915 |
|       5 | CHK        |         0.030654 |
|       6 | CHK        |         0.001676 |
|       6 | CD         |         0.512821 |
|       7 | CD         |         0.256410 |
|       8 | CHK        |         0.047764 |
|       8 | SAV        |         0.209073 |
|       9 | CHK        |         0.001721 |
|       9 | MM         |         0.548282 |
|       9 | CD         |         0.076923 |
|      10 | CHK        |         0.322911 |
|      10 | BUS        |         0.000000 |
|      11 | BUS        |         1.000000 |
|      12 | CHK        |         0.528052 |
|      13 | SBL        |         1.000000 |
+---------+------------+------------------+
24 rows in set (0.00 sec)

mysql> SELECT (7 * 5) / ((3 + 14) * null);
+-----------------------------+
| (7 * 5) / ((3 + 14) * null) |
+-----------------------------+
|                        NULL |
+-----------------------------+
1 row in set (0.00 sec)
