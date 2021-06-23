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
    -> GROUP BY open_emp_id
    -> LIMIT 3;
+-------------+----------+
| open_emp_id | how_many |
+-------------+----------+
|           1 |        8 |
|          10 |        7 |
|          13 |        3 |
+-------------+----------+
3 rows in set (0.00 sec)

mysql> SELECT open_emp_id, COUNT(*) how_many
    -> FROM account
    -> GROUP BY open_emp_id
    -> ORDER BY how_many DESC
    -> LIMIT 3;
+-------------+----------+
| open_emp_id | how_many |
+-------------+----------+
|           1 |        8 |
|          10 |        7 |
|          16 |        6 |
+-------------+----------+
3 rows in set (0.00 sec)

mysql> SELECT open_emp_id, COUNT(*) how_many
    -> FROM account
    -> GROUP BY open_emp_id
    -> ORDER BY how_many DESC
    -> LIMIT 2, 1;
+-------------+----------+
| open_emp_id | how_many |
+-------------+----------+
|          16 |        6 |
+-------------+----------+
1 row in set (0.00 sec)

mysql> SELECT open_emp_id, COUNT(*) how_many
    -> FROM account
    -> GROUP BY open_emp_id
    -> ORDER BY how_many DESC
    -> LIMIT 2, 999999999;
+-------------+----------+
| open_emp_id | how_many |
+-------------+----------+
|          16 |        6 |
|          13 |        3 |
+-------------+----------+
2 rows in set (0.00 sec)

mysql> SELECT open_emp_id, COUNT(*) how_many
    -> FROM account
    -> GROUP BY open_emp_id
    -> ORDER BY how_many ASC
    -> LIMIT 2;
+-------------+----------+
| open_emp_id | how_many |
+-------------+----------+
|          13 |        3 |
|          16 |        6 |
+-------------+----------+
2 rows in set (0.00 sec)

mysql> SELECT emp_id, fname, lname, start_date
    -> INTO OUTFILE 'C:\\emo_list.txt'
    -> FROM employee;
mysql> SELECT emp_id, fname, lname, start_date
    -> INTO OUTFILE 'D:\\emo_list.txt'
    -> FROM employee;
mysql> SELECT data.num, data.str1, data.str2
    -> INTO OUTFILE 'C:\\comma1.txt'
    -> FIELDS TERMINATED BY ','
    -> FROM
    -> (SELECT 1 num, 'This string has no commas' str1,
    -> 'This string, however, has two commas' str2) data;
mysql> SELECT emp_id, fname, lname, start_date
    -> INTO OUTFILE 'C:\\TEMP\\emp_list_atsign.txt'
    -> FIELDS TERMINATED BY '|'
    -> LINES TERMINATED BY '@'
    -> FROM employee;
mysql> INSERT INTO branch_usage (branch_id, cust_id, last_visited_on)
    -> VALUES (1, 5, CURRENT_TIMESTAMP( ));
mysql> CREATE TABLE branch_usage
    -> (branch_id SMALLINT UNSIGNED NOT NULL,
    -> cust_id INTEGER UNSIGNED NOT NULL,
    -> last_visited_on DATETIME,
    -> CONSTRAINT pk_branch_usage PRIMARY KEY (branch_id, cust_id)
    -> );
Query OK, 0 rows affected (0.03 sec)

mysql> INSERT INTO branch_usage (branch_id, cust_id, last_visited_on)
    -> VALUES (1, 5, CURRENT_TIMESTAMP( ));
Query OK, 1 row affected (0.01 sec)

mysql> INSERT INTO branch_usage (branch_id, cust_id, last_visited_on)
    -> VALUES (1, 5, CURRENT_TIMESTAMP( ))
    -> ON DUPLICATE KEY UPDATE last_visited_on = CURRENT_TIMESTAMP( );
Query OK, 2 rows affected (0.00 sec)

mysql> CREATE TABLE login_history
    -> (cust_id INTEGER UNSIGNED NOT NULL,
    -> login_date DATETIME,
    -> CONSTRAINT pk_login_history PRIMARY KEY (cust_id, login_date)
    -> );
Query OK, 0 rows affected (0.02 sec)

mysql> INSERT INTO login_history (cust_id, login_date)
    -> SELECT c.cust_id,
    -> ADDDATE(a.open_date, INTERVAL a.account_id * c.cust_id HOUR)
    -> FROM customer c CROSS JOIN account a;
Query OK, 312 rows affected (0.01 sec)
Records: 312  Duplicates: 0  Warnings: 0

mysql> SELECT login_date
    -> FROM login_history
    -> ORDER BY login_date DESC
    -> LIMIT 49,1;
+---------------------+
| login_date          |
+---------------------+
| 2004-07-02 21:00:00 |
+---------------------+
1 row in set (0.00 sec)

mysql> DELETE FROM login_history
    -> WHERE login_date < '2004-07-02 09:00:00';
Query OK, 262 rows affected (0.01 sec)

mysql> DELETE FROM login_history
    -> ORDER BY login_date ASC
    -> LIMIT 262;
Query OK, 50 rows affected (0.01 sec)

mysql> UPDATE account
    -> SET avail_balance = avail_balance + 100
    -> WHERE product_cd IN ('CHK', 'SAV', 'MM')
    -> ORDER BY open_date ASC
    -> LIMIT 10;
Query OK, 10 rows affected (0.01 sec)
Rows matched: 10  Changed: 10  Warnings: 0

mysql> CREATE TABLE individual2 AS
    -> SELECT * FROM individual;
Query OK, 9 rows affected (0.02 sec)
Records: 9  Duplicates: 0  Warnings: 0

mysql> CREATE TABLE customer2 AS
    -> SELECT * FROM customer;
Query OK, 13 rows affected (0.02 sec)
Records: 13  Duplicates: 0  Warnings: 0

mysql> CREATE TABLE account2 AS
    -> SELECT * FROM account;
Query OK, 24 rows affected, 2 warnings (0.02 sec)
Records: 24  Duplicates: 0  Warnings: 2

mysql> DELETE FROM account2
    -> WHERE cust_id = 1;
Query OK, 3 rows affected (0.00 sec)

mysql> DELETE FROM customer2
    -> WHERE cust_id = 1;
Query OK, 1 row affected (0.00 sec)

mysql> DELETE FROM individual2
    -> WHERE cust_id = 1;
Query OK, 1 row affected (0.00 sec)

mysql> DELETE account2, customer2, individual2
    -> FROM account2 INNER JOIN customer2
    -> ON account2.cust_id = customer2.cust_id
    -> INNER JOIN individual2
    -> ON customer2.cust_id = individual2.cust_id
    -> WHERE individual2.cust_id = 1;
Query OK, 0 rows affected (0.00 sec)

mysql> SELECT account2.account_id
    -> FROM account2 INNER JOIN customer2
    -> ON account2.cust_id = customer2.cust_id
    -> INNER JOIN individual2
    -> ON individual2.cust_id = customer2.cust_id
    -> WHERE individual2.fname = 'John'
    -> AND individual2.lname = 'Hayward';
+------------+
| account_id |
+------------+
|         10 |
|         11 |
|         12 |
+------------+
3 rows in set (0.00 sec)

mysql> DELETE account2
    -> FROM account2 INNER JOIN customer2
    -> ON account2.cust_id = customer2.cust_id
    -> INNER JOIN individual2
    -> ON customer2.cust_id = individual2.cust_id
    -> WHERE individual2.fname = 'John'
    -> AND individual2.lname = 'Hayward';
Query OK, 3 rows affected (0.00 sec)

mysql> UPDATE individual2 INNER JOIN customer2
    -> ON individual2.cust_id = customer2.cust_id
    -> INNER JOIN account2
    -> ON customer2.cust_id = account2.cust_id
    -> SET individual2.cust_id = individual2.cust_id + 10000,
    -> customer2.cust_id = customer2.cust_id + 10000,
    -> account2.cust_id = account2.cust_id + 10000
    -> WHERE individual2.cust_id = 3;
Query OK, 4 rows affected (0.00 sec)
Rows matched: 4  Changed: 4  Warnings: 0

