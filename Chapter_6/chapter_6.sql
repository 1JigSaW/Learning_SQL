mysql> DESC product;
+-----------------+-------------+------+-----+---------+-------+
| Field           | Type        | Null | Key | Default | Extra |
+-----------------+-------------+------+-----+---------+-------+
| product_cd      | varchar(10) | NO   | PRI | NULL    |       |
| name            | varchar(50) | NO   |     | NULL    |       |
| product_type_cd | varchar(10) | NO   | MUL | NULL    |       |
| date_offered    | date        | YES  |     | NULL    |       |
| date_retired    | date        | YES  |     | NULL    |       |
+-----------------+-------------+------+-----+---------+-------+
5 rows in set (0.00 sec)

mysql> DESC customer;
+--------------+---------------+------+-----+---------+----------------+
| Field        | Type          | Null | Key | Default | Extra          |
+--------------+---------------+------+-----+---------+----------------+
| cust_id      | int unsigned  | NO   | PRI | NULL    | auto_increment |
| fed_id       | varchar(12)   | NO   |     | NULL    |                |
| cust_type_cd | enum('I','B') | NO   |     | NULL    |                |
| address      | varchar(30)   | YES  |     | NULL    |                |
| city         | varchar(20)   | YES  |     | NULL    |                |
| state        | varchar(20)   | YES  |     | NULL    |                |
| postal_code  | varchar(10)   | YES  |     | NULL    |                |
+--------------+---------------+------+-----+---------+----------------+
7 rows in set (0.00 sec)

mysql> SELECT 1 num, 'abc' str
    -> UNION
    -> SELECT 9 num, 'xyz' str;
+-----+-----+
| num | str |
+-----+-----+
|   1 | abc |
|   9 | xyz |
+-----+-----+
2 rows in set (0.00 sec)

mysql> SELECT cust_id, lname name
    -> FROM individual
    -> UNION ALL
    -> SELECT cust_id, name
    -> FROM business;
+---------+------------------------+
| cust_id | name                   |
+---------+------------------------+
|       1 | Hadley                 |
|       2 | Tingley                |
|       3 | Tucker                 |
|       4 | Hayward                |
|       5 | Frasier                |
|       6 | Spencer                |
|       7 | Young                  |
|       8 | Blake                  |
|       9 | Farley                 |
|      10 | Chilton Engineering    |
|      11 | Northeast Cooling Inc. |
|      12 | Superior Auto Body     |
|      13 | AAA Insurance Inc.     |
+---------+------------------------+
13 rows in set (0.00 sec)

mysql> SELECT cust_id, lname name
    -> FROM individual
    -> UNION ALL
    -> SELECT cust_id, name
    -> FROM business
    -> UNION ALL
    -> SELECT cust_id, name
    -> FROM business;
+---------+------------------------+
| cust_id | name                   |
+---------+------------------------+
|       1 | Hadley                 |
|       2 | Tingley                |
|       3 | Tucker                 |
|       4 | Hayward                |
|       5 | Frasier                |
|       6 | Spencer                |
|       7 | Young                  |
|       8 | Blake                  |
|       9 | Farley                 |
|      10 | Chilton Engineering    |
|      11 | Northeast Cooling Inc. |
|      12 | Superior Auto Body     |
|      13 | AAA Insurance Inc.     |
|      10 | Chilton Engineering    |
|      11 | Northeast Cooling Inc. |
|      12 | Superior Auto Body     |
|      13 | AAA Insurance Inc.     |
+---------+------------------------+
17 rows in set (0.00 sec)

mysql> SELECT emp_id
    -> FROM employee
    -> WHERE assigned_branch_id = 2
    -> AND (title = 'Teller' OR title = 'Head Teller')
    -> UNION ALL
    -> SELECT DISTINCT open_emp_id
    -> FROM account
    -> WHERE open_branch_id = 2;
+--------+
| emp_id |
+--------+
|     10 |
|     11 |
|     12 |
|     10 |
+--------+
4 rows in set (0.00 sec)

mysql> SELECT emp_id
    -> FROM employee
    -> WHERE assigned_branch_id = 2
    -> AND (title = 'Teller' OR title = 'Head Teller')
    -> UNION 
    -> SELECT DISTINCT open_emp_id
    -> FROM account
    -> WHERE open_branch_id = 2;
+--------+
| emp_id |
+--------+
|     10 |
|     11 |
|     12 |
+--------+
3 rows in set (0.00 sec)

mysql> SELECT emp_id, assigned_branch_id
    -> FROM employee
    -> WHERE title = 'Teller'
    -> UNION
    -> SELECT open_emp_id, open_branch_id
    -> FROM account
    -> WHERE product_cd = 'SAV'
    -> Order By emp_id;
+--------+--------------------+
| emp_id | assigned_branch_id |
+--------+--------------------+
|      1 |                  1 |
|      7 |                  1 |
|      8 |                  1 |
|      9 |                  1 |
|     10 |                  2 |
|     11 |                  2 |
|     12 |                  2 |
|     14 |                  3 |
|     15 |                  3 |
|     16 |                  4 |
|     17 |                  4 |
|     18 |                  4 |
+--------+--------------------+
12 rows in set (0.00 sec)

mysql> SELECT cust_id
    -> FROM account
    -> WHERE product_cd IN ('SAV', 'MM')
    -> UNION ALL
    -> SELECT a.cust_id
    -> FROM account a INNER JOIN branch b
    -> ON a.open_branch_id = b.branch_id
    -> WHERE b.name = 'Woburn Branch'
    -> UNION SELECT cust_id
    -> FROM account
    -> WHERE avail_balance BETWEEN 500 AND 2500;
+---------+
| cust_id |
+---------+
|       3 |
|       4 |
|       9 |
|       1 |
|       2 |
|       8 |
|       7 |
|      11 |
|       5 |
+---------+
9 rows in set (0.00 sec)

mysql> SELECT cust_id
    -> FROM account
    -> WHERE product_cd IN ('SAV', 'MM')
    -> UNION 
    -> SELECT a.cust_id
    -> FROM account a INNER JOIN branch b
    -> ON a.open_branch_id = b.branch_id
    -> WHERE b.name = 'Woburn Branch'
    -> UNION ALL
    -> SELECT cust_id
    -> FROM account
    -> WHERE avail_balance BETWEEN 500 AND 2500;
+---------+
| cust_id |
+---------+
|       3 |
|       4 |
|       9 |
|       1 |
|       2 |
|       8 |
|       7 |
|      11 |
|       1 |
|       1 |
|       2 |
|       3 |
|       3 |
|       4 |
|       4 |
|       5 |
|       9 |
+---------+
17 rows in set (0.00 sec)

