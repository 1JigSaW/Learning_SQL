mysql> SELECT emp_id, fname, lname
    -> FROM employee
    -> WHERE lname = 'Bkadfl';
Empty set (0.00 sec)

mysql> SELECT fname, lname
    -> FROM employee;
+----------+-----------+
| fname    | lname     |
+----------+-----------+
| Michael  | Smith     |
| Susan    | Barker    |
| Robert   | Tyler     |
| Susan    | Hawthorne |
| John     | Gooding   |
| Helen    | Fleming   |
| Chris    | Tucker    |
| Sarah    | Parker    |
| Jane     | Grossman  |
| Paula    | Roberts   |
| Thomas   | Ziegler   |
| Samantha | Jameson   |
| John     | Blake     |
| Cindy    | Mason     |
| Frank    | Portman   |
| Theresa  | Markham   |
| Beth     | Fowler    |
| Rick     | Tulman    |
+----------+-----------+
18 rows in set (0.00 sec)

mysql> SELECT * 
    -> FROM department;
+---------+----------------+
| dept_id | name           |
+---------+----------------+
|       1 | Operations     |
|       2 | Loans          |
|       3 | Administration |
+---------+----------------+
3 rows in set (0.00 sec)

mysql> SELECT dept_id, name
    -> FROM department;
+---------+----------------+
| dept_id | name           |
+---------+----------------+
|       1 | Operations     |
|       2 | Loans          |
|       3 | Administration |
+---------+----------------+
3 rows in set (0.00 sec)

mysql> SELECT name
    -> FROM department;
+----------------+
| name           |
+----------------+
| Operations     |
| Loans          |
| Administration |
+----------------+
3 rows in set (0.00 sec)

mysql> SELECT emp_id,
    -> 'ACTIVE',
    -> emp_id * 3.14159,
    -> UPPER(lname)
    -> FROM employee;
+--------+--------+------------------+--------------+
| emp_id | ACTIVE | emp_id * 3.14159 | UPPER(lname) |
+--------+--------+------------------+--------------+
|      1 | ACTIVE |          3.14159 | SMITH        |
|      2 | ACTIVE |          6.28318 | BARKER       |
|      3 | ACTIVE |          9.42477 | TYLER        |
|      4 | ACTIVE |         12.56636 | HAWTHORNE    |
|      5 | ACTIVE |         15.70795 | GOODING      |
|      6 | ACTIVE |         18.84954 | FLEMING      |
|      7 | ACTIVE |         21.99113 | TUCKER       |
|      8 | ACTIVE |         25.13272 | PARKER       |
|      9 | ACTIVE |         28.27431 | GROSSMAN     |
|     10 | ACTIVE |         31.41590 | ROBERTS      |
|     11 | ACTIVE |         34.55749 | ZIEGLER      |
|     12 | ACTIVE |         37.69908 | JAMESON      |
|     13 | ACTIVE |         40.84067 | BLAKE        |
|     14 | ACTIVE |         43.98226 | MASON        |
|     15 | ACTIVE |         47.12385 | PORTMAN      |
|     16 | ACTIVE |         50.26544 | MARKHAM      |
|     17 | ACTIVE |         53.40703 | FOWLER       |
|     18 | ACTIVE |         56.54862 | TULMAN       |
+--------+--------+------------------+--------------+
18 rows in set (0.00 sec)

mysql> SELECT VERSION( ),
    -> USER( ),
    -> DATABASE( );
+------------+----------------+-------------+
| VERSION( ) | USER( )        | DATABASE( ) |
+------------+----------------+-------------+
| 8.0.25     | root@localhost | bank        |
+------------+----------------+-------------+
1 row in set (0.00 sec)

mysql> SELECT emp_id,
    -> 'ACTIVE' status,
    -> emp_id * 3.14159 empid_x_pi,
    -> UPPER(lname) last_name_upper
    -> FROM employee;
+--------+--------+------------+-----------------+
| emp_id | status | empid_x_pi | last_name_upper |
+--------+--------+------------+-----------------+
|      1 | ACTIVE |    3.14159 | SMITH           |
|      2 | ACTIVE |    6.28318 | BARKER          |
|      3 | ACTIVE |    9.42477 | TYLER           |
|      4 | ACTIVE |   12.56636 | HAWTHORNE       |
|      5 | ACTIVE |   15.70795 | GOODING         |
|      6 | ACTIVE |   18.84954 | FLEMING         |
|      7 | ACTIVE |   21.99113 | TUCKER          |
|      8 | ACTIVE |   25.13272 | PARKER          |
|      9 | ACTIVE |   28.27431 | GROSSMAN        |
|     10 | ACTIVE |   31.41590 | ROBERTS         |
|     11 | ACTIVE |   34.55749 | ZIEGLER         |
|     12 | ACTIVE |   37.69908 | JAMESON         |
|     13 | ACTIVE |   40.84067 | BLAKE           |
|     14 | ACTIVE |   43.98226 | MASON           |
|     15 | ACTIVE |   47.12385 | PORTMAN         |
|     16 | ACTIVE |   50.26544 | MARKHAM         |
|     17 | ACTIVE |   53.40703 | FOWLER          |
|     18 | ACTIVE |   56.54862 | TULMAN          |
+--------+--------+------------+-----------------+
18 rows in set (0.00 sec)

mysql> SELECT cust_id
    -> FROM account;
+---------+
| cust_id |
+---------+
|       1 |
|       1 |
|       1 |
|       2 |
|       2 |
|       3 |
|       3 |
|       4 |
|       4 |
|       4 |
|       5 |
|       6 |
|       6 |
|       7 |
|       8 |
|       8 |
|       9 |
|       9 |
|       9 |
|      10 |
|      10 |
|      11 |
|      12 |
|      13 |
+---------+
24 rows in set (0.00 sec)

mysql> SELECT DISTINCT cust_id
    -> FROM account;
+---------+
| cust_id |
+---------+
|       1 |
|       2 |
|       3 |
|       4 |
|       5 |
|       6 |
|       7 |
|       8 |
|       9 |
|      10 |
|      11 |
|      12 |
|      13 |
+---------+
13 rows in set (0.00 sec)

mysql> SELECT e.emp_id, e.fname, e.lname
    -> FROM (SELECT emp_id, fname, lname, start_date, title
    -> FROM employee) e;
+--------+----------+-----------+
| emp_id | fname    | lname     |
+--------+----------+-----------+
|      1 | Michael  | Smith     |
|      2 | Susan    | Barker    |
|      3 | Robert   | Tyler     |
|      4 | Susan    | Hawthorne |
|      5 | John     | Gooding   |
|      6 | Helen    | Fleming   |
|      7 | Chris    | Tucker    |
|      8 | Sarah    | Parker    |
|      9 | Jane     | Grossman  |
|     10 | Paula    | Roberts   |
|     11 | Thomas   | Ziegler   |
|     12 | Samantha | Jameson   |
|     13 | John     | Blake     |
|     14 | Cindy    | Mason     |
|     15 | Frank    | Portman   |
|     16 | Theresa  | Markham   |
|     17 | Beth     | Fowler    |
|     18 | Rick     | Tulman    |
+--------+----------+-----------+
18 rows in set (0.00 sec)

mysql> CREATE VIEW emplyee_cw AS
    -> SELECT emp_id, fname, lname,
    -> YEAR(start_date) start_year
    -> FROM employee;
Query OK, 0 rows affected (0.01 sec)

mysql> SELECT employee.emp_id, employee.fname,
    -> employee.lname, department.name dept_name
    -> FROM employee INNER JOIN department
    -> ON employee.dept_id = department.dept_id;
+--------+----------+-----------+----------------+
| emp_id | fname    | lname     | dept_name      |
+--------+----------+-----------+----------------+
|      4 | Susan    | Hawthorne | Operations     |
|      6 | Helen    | Fleming   | Operations     |
|      7 | Chris    | Tucker    | Operations     |
|      8 | Sarah    | Parker    | Operations     |
|      9 | Jane     | Grossman  | Operations     |
|     10 | Paula    | Roberts   | Operations     |
|     11 | Thomas   | Ziegler   | Operations     |
|     12 | Samantha | Jameson   | Operations     |
|     13 | John     | Blake     | Operations     |
|     14 | Cindy    | Mason     | Operations     |
|     15 | Frank    | Portman   | Operations     |
|     16 | Theresa  | Markham   | Operations     |
|     17 | Beth     | Fowler    | Operations     |
|     18 | Rick     | Tulman    | Operations     |
|      5 | John     | Gooding   | Loans          |
|      1 | Michael  | Smith     | Administration |
|      2 | Susan    | Barker    | Administration |
|      3 | Robert   | Tyler     | Administration |
+--------+----------+-----------+----------------+
18 rows in set (0.00 sec)

mysql> SELECT emp_id, fname, lname, start_date, title
    -> FROM employee
    -> WHERE title = 'Head Teller';
+--------+---------+---------+------------+-------------+
| emp_id | fname   | lname   | start_date | title       |
+--------+---------+---------+------------+-------------+
|      6 | Helen   | Fleming | 2004-03-17 | Head Teller |
|     10 | Paula   | Roberts | 2002-07-27 | Head Teller |
|     13 | John    | Blake   | 2000-05-11 | Head Teller |
|     16 | Theresa | Markham | 2001-03-15 | Head Teller |
+--------+---------+---------+------------+-------------+
4 rows in set (0.00 sec)

mysql> SELECT emp_id, fname, lname, start_date, title
    -> FROM employee
    -> WHERE title = 'Head Teller'
    -> AND start_date > '2002-01-01';
+--------+-------+---------+------------+-------------+
| emp_id | fname | lname   | start_date | title       |
+--------+-------+---------+------------+-------------+
|      6 | Helen | Fleming | 2004-03-17 | Head Teller |
|     10 | Paula | Roberts | 2002-07-27 | Head Teller |
+--------+-------+---------+------------+-------------+
2 rows in set (0.00 sec)

mysql> SELECT emp_id, fname, lname, start_date, title
    -> FROM employee
    -> WHERE title = 'Head Teller'
    -> OR start_date > '2002-01-01';
+--------+----------+-----------+------------+--------------------+
| emp_id | fname    | lname     | start_date | title              |
+--------+----------+-----------+------------+--------------------+
|      2 | Susan    | Barker    | 2002-09-12 | Vice President     |
|      4 | Susan    | Hawthorne | 2002-04-24 | Operations Manager |
|      5 | John     | Gooding   | 2003-11-14 | Loan Manager       |
|      6 | Helen    | Fleming   | 2004-03-17 | Head Teller        |
|      7 | Chris    | Tucker    | 2004-09-15 | Teller             |
|      8 | Sarah    | Parker    | 2002-12-02 | Teller             |
|      9 | Jane     | Grossman  | 2002-05-03 | Teller             |
|     10 | Paula    | Roberts   | 2002-07-27 | Head Teller        |
|     12 | Samantha | Jameson   | 2003-01-08 | Teller             |
|     13 | John     | Blake     | 2000-05-11 | Head Teller        |
|     14 | Cindy    | Mason     | 2002-08-09 | Teller             |
|     15 | Frank    | Portman   | 2003-04-01 | Teller             |
|     16 | Theresa  | Markham   | 2001-03-15 | Head Teller        |
|     17 | Beth     | Fowler    | 2002-06-29 | Teller             |
|     18 | Rick     | Tulman    | 2002-12-12 | Teller             |
+--------+----------+-----------+------------+--------------------+
15 rows in set (0.00 sec)

mysql> SELECT emp_id, fname, lname, start_date, title
    -> FROM employee
    -> WHERE (title = 'Head Teller' AND start_date > '2002-01-01')
    -> OR (title = 'Teller' AND start_date > '2003-01-01');
+--------+----------+---------+------------+-------------+
| emp_id | fname    | lname   | start_date | title       |
+--------+----------+---------+------------+-------------+
|      6 | Helen    | Fleming | 2004-03-17 | Head Teller |
|      7 | Chris    | Tucker  | 2004-09-15 | Teller      |
|     10 | Paula    | Roberts | 2002-07-27 | Head Teller |
|     12 | Samantha | Jameson | 2003-01-08 | Teller      |
|     15 | Frank    | Portman | 2003-04-01 | Teller      |
+--------+----------+---------+------------+-------------+
5 rows in set (0.00 sec)

mysql> SELECT open_emp_id, product_cd
    -> FROM account;
+-------------+------------+
| open_emp_id | product_cd |
+-------------+------------+
|          10 | CHK        |
|          10 | SAV        |
|          10 | CD         |
|          10 | CHK        |
|          10 | SAV        |
|          13 | CHK        |
|          13 | MM         |
|           1 | CHK        |
|           1 | SAV        |
|           1 | MM         |
|          16 | CHK        |
|           1 | CHK        |
|           1 | CD         |
|          10 | CD         |
|          16 | CHK        |
|          16 | SAV        |
|           1 | CHK        |
|           1 | MM         |
|           1 | CD         |
|          16 | CHK        |
|          16 | BUS        |
|          10 | BUS        |
|          16 | CHK        |
|          13 | SBL        |
+-------------+------------+
24 rows in set (0.00 sec)

mysql> SELECT open_emp_id, product_cd
    -> FROM account
    -> Order BY open_emp_id;
+-------------+------------+
| open_emp_id | product_cd |
+-------------+------------+
|           1 | CHK        |
|           1 | SAV        |
|           1 | MM         |
|           1 | CHK        |
|           1 | CD         |
|           1 | CHK        |
|           1 | MM         |
|           1 | CD         |
|          10 | CHK        |
|          10 | SAV        |
|          10 | CD         |
|          10 | CHK        |
|          10 | SAV        |
|          10 | CD         |
|          10 | BUS        |
|          13 | CHK        |
|          13 | MM         |
|          13 | SBL        |
|          16 | CHK        |
|          16 | CHK        |
|          16 | SAV        |
|          16 | CHK        |
|          16 | BUS        |
|          16 | CHK        |
+-------------+------------+
24 rows in set (0.00 sec)

mysql> SELECT open_emp_id, product_cd
    -> FROM account
    -> ORDER BY open_emp_id, product_cd;
+-------------+------------+
| open_emp_id | product_cd |
+-------------+------------+
|           1 | CD         |
|           1 | CD         |
|           1 | CHK        |
|           1 | CHK        |
|           1 | CHK        |
|           1 | MM         |
|           1 | MM         |
|           1 | SAV        |
|          10 | BUS        |
|          10 | CD         |
|          10 | CD         |
|          10 | CHK        |
|          10 | CHK        |
|          10 | SAV        |
|          10 | SAV        |
|          13 | CHK        |
|          13 | MM         |
|          13 | SBL        |
|          16 | BUS        |
|          16 | CHK        |
|          16 | CHK        |
|          16 | CHK        |
|          16 | CHK        |
|          16 | SAV        |
+-------------+------------+
24 rows in set (0.00 sec)

mysql> SELECT account_id, product_cd, open_date, avail_balance
    -> FROM account
    -> ORDER BY avail_balance DESC;
+------------+------------+------------+---------------+
| account_id | product_cd | open_date  | avail_balance |
+------------+------------+------------+---------------+
|         29 | SBL        | 2004-02-22 |      50000.00 |
|         28 | CHK        | 2003-07-30 |      38552.05 |
|         24 | CHK        | 2002-09-30 |      23575.12 |
|         15 | CD         | 2004-12-28 |      10000.00 |
|         22 | MM         | 2004-10-28 |       9345.55 |
|         27 | BUS        | 2004-03-22 |       9345.55 |
|         12 | MM         | 2004-09-30 |       5487.09 |
|         17 | CD         | 2004-01-12 |       5000.00 |
|         18 | CHK        | 2001-05-23 |       3487.19 |
|          3 | CD         | 2004-06-30 |       3000.00 |
|          4 | CHK        | 2001-03-12 |       2258.02 |
|         13 | CHK        | 2004-01-27 |       2237.97 |
|          8 | MM         | 2002-12-15 |       2212.50 |
|         23 | CD         | 2004-06-30 |       1500.00 |
|          1 | CHK        | 2000-01-15 |       1057.75 |
|          7 | CHK        | 2002-11-23 |       1057.75 |
|         11 | SAV        | 2000-01-15 |        767.77 |
|         10 | CHK        | 2003-09-12 |        534.12 |
|          2 | SAV        | 2000-01-15 |        500.00 |
|         19 | SAV        | 2001-05-23 |        387.99 |
|          5 | SAV        | 2001-03-12 |        200.00 |
|         21 | CHK        | 2003-07-30 |        125.67 |
|         14 | CHK        | 2002-08-24 |        122.37 |
|         25 | BUS        | 2002-10-01 |          0.00 |
+------------+------------+------------+---------------+
24 rows in set (0.00 sec)

mysql> SELECT cust_id, cust_type_cd, city, state, fed_id
    -> FROM customer
    -> ORDER BY RIGHT(fed_id, 3);
+---------+--------------+------------+-------+-------------+
| cust_id | cust_type_cd | city       | state | fed_id      |
+---------+--------------+------------+-------+-------------+
|       1 | I            | Lynnfield  | MA    | 111-11-1111 |
|      10 | B            | Salem      | NH    | 04-1111111  |
|       2 | I            | Woburn     | MA    | 222-22-2222 |
|      11 | B            | Wilmington | MA    | 04-2222222  |
|       3 | I            | Quincy     | MA    | 333-33-3333 |
|      12 | B            | Salem      | NH    | 04-3333333  |
|       4 | I            | Waltham    | MA    | 444-44-4444 |
|      13 | B            | Quincy     | MA    | 04-4444444  |
|       5 | I            | Salem      | NH    | 555-55-5555 |
|       6 | I            | Waltham    | MA    | 666-66-6666 |
|       7 | I            | Wilmington | MA    | 777-77-7777 |
|       8 | I            | Salem      | NH    | 888-88-8888 |
|       9 | I            | Newton     | MA    | 999-99-9999 |
+---------+--------------+------------+-------+-------------+
13 rows in set (0.00 sec)

mysql> SELECT emp_id, title, start_date, fname, lname
    -> FROM employee
    -> ORDER BY 2, 5;
+--------+--------------------+------------+----------+-----------+
| emp_id | title              | start_date | fname    | lname     |
+--------+--------------------+------------+----------+-----------+
|     13 | Head Teller        | 2000-05-11 | John     | Blake     |
|      6 | Head Teller        | 2004-03-17 | Helen    | Fleming   |
|     16 | Head Teller        | 2001-03-15 | Theresa  | Markham   |
|     10 | Head Teller        | 2002-07-27 | Paula    | Roberts   |
|      5 | Loan Manager       | 2003-11-14 | John     | Gooding   |
|      4 | Operations Manager | 2002-04-24 | Susan    | Hawthorne |
|      1 | President          | 2001-06-22 | Michael  | Smith     |
|     17 | Teller             | 2002-06-29 | Beth     | Fowler    |
|      9 | Teller             | 2002-05-03 | Jane     | Grossman  |
|     12 | Teller             | 2003-01-08 | Samantha | Jameson   |
|     14 | Teller             | 2002-08-09 | Cindy    | Mason     |
|      8 | Teller             | 2002-12-02 | Sarah    | Parker    |
|     15 | Teller             | 2003-04-01 | Frank    | Portman   |
|      7 | Teller             | 2004-09-15 | Chris    | Tucker    |
|     18 | Teller             | 2002-12-12 | Rick     | Tulman    |
|     11 | Teller             | 2000-10-23 | Thomas   | Ziegler   |
|      3 | Treasurer          | 2000-02-09 | Robert   | Tyler     |
|      2 | Vice President     | 2002-09-12 | Susan    | Barker    |
+--------+--------------------+------------+----------+-----------+
18 rows in set (0.00 sec)

