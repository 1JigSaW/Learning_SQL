mysql> SELECT account_id, product_cd, cust_id, avail_balance
    -> FROM account
    -> WHERE account_id = (SELECT MAX(account_id) FROM account);
+------------+------------+---------+---------------+
| account_id | product_cd | cust_id | avail_balance |
+------------+------------+---------+---------------+
|         29 | SBL        |      13 |      50000.00 |
+------------+------------+---------+---------------+
1 row in set (0.00 sec)

mysql> SELECT MAX(account_id) FROM account;
+-----------------+
| MAX(account_id) |
+-----------------+
|              29 |
+-----------------+
1 row in set (0.00 sec)

mysql> SELECT account_id, product_cd, cust_id, avail_balance
    -> FROM account a
    -> WHERE account_id = 24;
+------------+------------+---------+---------------+
| account_id | product_cd | cust_id | avail_balance |
+------------+------------+---------+---------------+
|         24 | CHK        |      10 |      23575.12 |
+------------+------------+---------+---------------+
1 row in set (0.00 sec)

mysql> SELECT account_id, product_cd, cust_id, avail_balance
    -> FROM account 
    -> WHERE open_emp_id <> (SELECT e.emp_id
    -> FROM employee e INNER JOIN branch b
    -> ON e.assigned_branch_id = b.branch_id
    -> WHERE e.title = 'Head Teller' AND b.city = 'Woburn');
+------------+------------+---------+---------------+
| account_id | product_cd | cust_id | avail_balance |
+------------+------------+---------+---------------+
|          7 | CHK        |       3 |       1057.75 |
|          8 | MM         |       3 |       2212.50 |
|         10 | CHK        |       4 |        534.12 |
|         11 | SAV        |       4 |        767.77 |
|         12 | MM         |       4 |       5487.09 |
|         13 | CHK        |       5 |       2237.97 |
|         14 | CHK        |       6 |        122.37 |
|         15 | CD         |       6 |      10000.00 |
|         18 | CHK        |       8 |       3487.19 |
|         19 | SAV        |       8 |        387.99 |
|         21 | CHK        |       9 |        125.67 |
|         22 | MM         |       9 |       9345.55 |
|         23 | CD         |       9 |       1500.00 |
|         24 | CHK        |      10 |      23575.12 |
|         25 | BUS        |      10 |          0.00 |
|         28 | CHK        |      12 |      38552.05 |
|         29 | SBL        |      13 |      50000.00 |
+------------+------------+---------+---------------+
17 rows in set (0.00 sec)

mysql> SELECT e.emp_id
    -> FROM employee e INNER JOIN branch b
    -> ON e.assigned_branch_id = b.branch_id
    -> WHERE e.title = 'Teller' AND b.city = 'Woburn';
+--------+
| emp_id |
+--------+
|     11 |
|     12 |
+--------+
2 rows in set (0.00 sec)

mysql> SELECT branch_id, name, city
    -> FROM branch
    -> WHERE name IN ('Headquarters', 'Quincy Branch');
+-----------+---------------+---------+
| branch_id | name          | city    |
+-----------+---------------+---------+
|         1 | Headquarters  | Waltham |
|         3 | Quincy Branch | Quincy  |
+-----------+---------------+---------+
2 rows in set (0.00 sec)

mysql> SELECT branch_id, name, city
    -> FROM branch
    -> WHERE name = 'Headquarters' OR name = 'Quincy Branch';
+-----------+---------------+---------+
| branch_id | name          | city    |
+-----------+---------------+---------+
|         1 | Headquarters  | Waltham |
|         3 | Quincy Branch | Quincy  |
+-----------+---------------+---------+
2 rows in set (0.00 sec)

mysql> SELECT emp_id, fname, lname, title
    -> FROM employee
    -> WHERE emp_id IN (SELECT superior_emp_id
    -> FROM employee);
+--------+---------+-----------+--------------------+
| emp_id | fname   | lname     | title              |
+--------+---------+-----------+--------------------+
|      1 | Michael | Smith     | President          |
|      3 | Robert  | Tyler     | Treasurer          |
|      4 | Susan   | Hawthorne | Operations Manager |
|      6 | Helen   | Fleming   | Head Teller        |
|     10 | Paula   | Roberts   | Head Teller        |
|     13 | John    | Blake     | Head Teller        |
|     16 | Theresa | Markham   | Head Teller        |
+--------+---------+-----------+--------------------+
7 rows in set (0.00 sec)

mysql> SELECT superior_emp_id
    -> FROM employee;
+-----------------+
| superior_emp_id |
+-----------------+
|            NULL |
|               1 |
|               1 |
|               3 |
|               4 |
|               4 |
|               4 |
|               4 |
|               4 |
|               6 |
|               6 |
|               6 |
|              10 |
|              10 |
|              13 |
|              13 |
|              16 |
|              16 |
+-----------------+
18 rows in set (0.00 sec)

mysql> SELECT emp_id, fname, lname, title
    -> FROM employee
    -> WHERE emp_id NOT IN (SELECT superior_emp_id
    -> FROM employee
    -> WHERE superior_emp_id IS NOT NULL);
+--------+----------+----------+----------------+
| emp_id | fname    | lname    | title          |
+--------+----------+----------+----------------+
|      2 | Susan    | Barker   | Vice President |
|      5 | John     | Gooding  | Loan Manager   |
|      7 | Chris    | Tucker   | Teller         |
|      8 | Sarah    | Parker   | Teller         |
|      9 | Jane     | Grossman | Teller         |
|     11 | Thomas   | Ziegler  | Teller         |
|     12 | Samantha | Jameson  | Teller         |
|     14 | Cindy    | Mason    | Teller         |
|     15 | Frank    | Portman  | Teller         |
|     17 | Beth     | Fowler   | Teller         |
|     18 | Rick     | Tulman   | Teller         |
+--------+----------+----------+----------------+
11 rows in set (0.00 sec)

mysql> SELECT emp_id, fname, lname, title
    -> FROM employee
    -> WHERE emp_id <> ALL (SELECT superior_emp_id
    -> FROM employee
    -> WHERE superior_emp_id IS NOT NULL);
+--------+----------+----------+----------------+
| emp_id | fname    | lname    | title          |
+--------+----------+----------+----------------+
|      2 | Susan    | Barker   | Vice President |
|      5 | John     | Gooding  | Loan Manager   |
|      7 | Chris    | Tucker   | Teller         |
|      8 | Sarah    | Parker   | Teller         |
|      9 | Jane     | Grossman | Teller         |
|     11 | Thomas   | Ziegler  | Teller         |
|     12 | Samantha | Jameson  | Teller         |
|     14 | Cindy    | Mason    | Teller         |
|     15 | Frank    | Portman  | Teller         |
|     17 | Beth     | Fowler   | Teller         |
|     18 | Rick     | Tulman   | Teller         |
+--------+----------+----------+----------------+
11 rows in set (0.00 sec)

mysql> SELECT account_id, cust_id, product_cd, avail_balance
    -> FROM account
    -> WHERE avail_balance < ALL (SELECT a.avail_balance
    -> FROm account a INNER JOIN individual i
    -> ON a.cust_id = i.cust_id
    -> WHERE i.fname = 'Frank' AND i.lname = 'Tucker');
+------------+---------+------------+---------------+
| account_id | cust_id | product_cd | avail_balance |
+------------+---------+------------+---------------+
|          2 |       1 | SAV        |        500.00 |
|          5 |       2 | SAV        |        200.00 |
|         10 |       4 | CHK        |        534.12 |
|         11 |       4 | SAV        |        767.77 |
|         14 |       6 | CHK        |        122.37 |
|         19 |       8 | SAV        |        387.99 |
|         21 |       9 | CHK        |        125.67 |
|         25 |      10 | BUS        |          0.00 |
+------------+---------+------------+---------------+
8 rows in set (0.00 sec)

mysql> SELECT a.avail_balance
    -> FROM account a INNER JOIN individual i
    -> ON a.cust_id = i.cust_id
    -> WHERE i.fname = 'Frank' AND i.lname = 'Tucker';
+---------------+
| avail_balance |
+---------------+
|       1057.75 |
|       2212.50 |
+---------------+
2 rows in set (0.00 sec)

mysql> SELECT account_id, cust_id, product_cd, avail_balance
    -> FROM account
    -> WHERE avail_balance > ANY (SELECT a.avail_balance
    -> FROM account a INNER JOIN individual i
    -> ON a.cust_id = i.cust_id
    -> WHERE i.fname = 'Frank' AND i.lname = 'Tucker');
+------------+---------+------------+---------------+
| account_id | cust_id | product_cd | avail_balance |
+------------+---------+------------+---------------+
|          3 |       1 | CD         |       3000.00 |
|          4 |       2 | CHK        |       2258.02 |
|          8 |       3 | MM         |       2212.50 |
|         12 |       4 | MM         |       5487.09 |
|         13 |       5 | CHK        |       2237.97 |
|         15 |       6 | CD         |      10000.00 |
|         17 |       7 | CD         |       5000.00 |
|         18 |       8 | CHK        |       3487.19 |
|         22 |       9 | MM         |       9345.55 |
|         23 |       9 | CD         |       1500.00 |
|         24 |      10 | CHK        |      23575.12 |
|         27 |      11 | BUS        |       9345.55 |
|         28 |      12 | CHK        |      38552.05 |
|         29 |      13 | SBL        |      50000.00 |
+------------+---------+------------+---------------+
14 rows in set (0.00 sec)

mysql> SELECT account_id, product_cd, cust_id
    -> FROM account
    -> WHERE open_branch_id = (SELECT branch_id
    -> FROM branch
    -> WHERE name = 'Woburn Branch')
    -> AND open_emp_id IN (SELECT emp_id
    -> FROM employee
    -> WHERE title = 'Teller' OR title = 'HEad Teller');
+------------+------------+---------+
| account_id | product_cd | cust_id |
+------------+------------+---------+
|          1 | CHK        |       1 |
|          2 | SAV        |       1 |
|          3 | CD         |       1 |
|          4 | CHK        |       2 |
|          5 | SAV        |       2 |
|         17 | CD         |       7 |
|         27 | BUS        |      11 |
+------------+------------+---------+
7 rows in set (0.00 sec)

mysql> SELECT account_id, product_cd, cust_id
    -> FROM account
    -> WHERE (open_branch_id, open_emp_id) IN
    -> (SELECT b.branch_id, e.emp_id
    -> FROM branch b INNER JOIN employee e
    -> ON b.branch_id = e.assigned_branch_id
    -> WHERE b.name = 'Woburn Branch'
    -> AND (e.title = 'Teller' OR e.title = 'Head Teller'));
+------------+------------+---------+
| account_id | product_cd | cust_id |
+------------+------------+---------+
|          1 | CHK        |       1 |
|          2 | SAV        |       1 |
|          3 | CD         |       1 |
|          4 | CHK        |       2 |
|          5 | SAV        |       2 |
|         17 | CD         |       7 |
|         27 | BUS        |      11 |
+------------+------------+---------+
7 rows in set (0.00 sec)

mysql> SELECT c.cust_id, c.cust_type_cd, c.city
    -> FROM customer c
    -> WHERE 2 = (SELECT COUNT(*)
    -> FROM account a
    -> WHERE a.cust_id = c.cust_id);
+---------+--------------+---------+
| cust_id | cust_type_cd | city    |
+---------+--------------+---------+
|       2 | I            | Woburn  |
|       3 | I            | Quincy  |
|       6 | I            | Waltham |
|       8 | I            | Salem   |
|      10 | B            | Salem   |
+---------+--------------+---------+
5 rows in set (0.00 sec)

mysql> SELECT c.cust_id, c.cust_type_cd, c.city
    -> FROM customer c
    -> WHERE 2 = (SELECT SUM(a.avail_balance)
    -> FROM account a
    -> WHERE a.cust_id = c.cust_id)
    -> BETWEEN 5000 AND 10000;
Empty set (0.00 sec)

mysql> SELECT c.cust_id, c.cust_type_cd, c.city
    -> FROM customer c
    -> WHERE (SELECT SUM(a.avail_balance)
    -> FROM account a
    -> WHERE a.cust_id = c.cust_id)
    -> BETWEEN 5000 AND 10000;
+---------+--------------+------------+
| cust_id | cust_type_cd | city       |
+---------+--------------+------------+
|       4 | I            | Waltham    |
|       7 | I            | Wilmington |
|      11 | B            | Wilmington |
+---------+--------------+------------+
3 rows in set (0.00 sec)

mysql> SELECT a.account_id, a.product_cd, a.cust_id
    -> FROM account a
    -> WHERE NOT EXISTS (SELECT 1
    -> FROM business b
    -> WHERE b.cust_id = a.cust_id);
+------------+------------+---------+
| account_id | product_cd | cust_id |
+------------+------------+---------+
|          1 | CHK        |       1 |
|          2 | SAV        |       1 |
|          3 | CD         |       1 |
|          4 | CHK        |       2 |
|          5 | SAV        |       2 |
|          7 | CHK        |       3 |
|          8 | MM         |       3 |
|         10 | CHK        |       4 |
|         11 | SAV        |       4 |
|         12 | MM         |       4 |
|         13 | CHK        |       5 |
|         14 | CHK        |       6 |
|         15 | CD         |       6 |
|         17 | CD         |       7 |
|         18 | CHK        |       8 |
|         19 | SAV        |       8 |
|         21 | CHK        |       9 |
|         22 | MM         |       9 |
|         23 | CD         |       9 |
+------------+------------+---------+
19 rows in set (0.00 sec)

mysql> SELECT d.dept_id, d.name, e_cnt.how_many num_employees
    -> FROM department d INNER JOIN
    -> (SELECT dept_id, COUNT(*) how_many
    -> FROM employee
    -> GROUP BY dept_id) e_cnt
    -> ON d.dept_id = e_cnt.dept_id;
+---------+----------------+---------------+
| dept_id | name           | num_employees |
+---------+----------------+---------------+
|       1 | Operations     |            14 |
|       2 | Loans          |             1 |
|       3 | Administration |             3 |
+---------+----------------+---------------+
3 rows in set (0.00 sec)

mysql> SELECT dept_id, COUNT(*) how_many
    -> FROM employee
    -> GROUP BY dept_id;
+---------+----------+
| dept_id | how_many |
+---------+----------+
|       1 |       14 |
|       2 |        1 |
|       3 |        3 |
+---------+----------+
3 rows in set (0.00 sec)

mysql> SELECT 'Small Fry' name, 1 low_limit, 4999.99 high_limit
    -> UNION ALL
    -> SELECT 'Average Joes' name, 5000 low_limit, 9999.99 high_limit
    -> UNION ALL
    -> SELECT 'Heavy Hitters' name, 10000 low_limit, 9999999.99 high_limit;
+---------------+-----------+------------+
| name          | low_limit | high_limit |
+---------------+-----------+------------+
| Small Fry     |         1 |    4999.99 |
| Average Joes  |      5000 |    9999.99 |
| Heavy Hitters |     10000 | 9999999.99 |
+---------------+-----------+------------+
3 rows in set (0.00 sec)

mysql> SELECT SUM(a.avail_balance) cust_balance
    -> FROM account a INNER JOIN product p
    -> ON a.product_cd = p.product_cd
    -> WHERE p.product_type_cd = 'ACCOUNT'
    -> GROUP BY a.cust_id;
+--------------+
| cust_balance |
+--------------+
|      4557.75 |
|     10122.37 |
|      5000.00 |
|     10971.22 |
|      2458.02 |
|      3270.25 |
|      6788.98 |
|      2237.97 |
|      3875.18 |
|     23575.12 |
|     38552.05 |
+--------------+
11 rows in set (0.00 sec)

mysql> SELECT p.name product, b.name branch,
    -> CONCAT(e.fname, ' ', e.lname) name,
    -> SUM(a.avail_balance) tot_deposits
    -> FROM account a INNER JOIN employee e
    -> ON a.open_emp_id = e.emp_id
    -> INNER JOIN branch b
    -> ON a.open_branch_id = b.branch_id
    -> INNER JOIN product p
    -> ON a.product_cd = p.product_cd
    -> WHERE p.product_type_cd = 'ACCOUNT'
    -> GROUP BY p.name, b.name, e.fname, e.lname;
+------------------------+---------------+-----------------+--------------+
| product                | branch        | name            | tot_deposits |
+------------------------+---------------+-----------------+--------------+
| certificate of deposit | Woburn Branch | Paula Roberts   |      8000.00 |
| certificate of deposit | Headquarters  | Michael Smith   |     11500.00 |
| checking account       | Woburn Branch | Paula Roberts   |      3315.77 |
| checking account       | Quincy Branch | John Blake      |      1057.75 |
| checking account       | Headquarters  | Michael Smith   |       782.16 |
| checking account       | So. NH Branch | Theresa Markham |     67852.33 |
| money market account   | Quincy Branch | John Blake      |      2212.50 |
| money market account   | Headquarters  | Michael Smith   |     14832.64 |
| savings account        | Woburn Branch | Paula Roberts   |       700.00 |
| savings account        | Headquarters  | Michael Smith   |       767.77 |
| savings account        | So. NH Branch | Theresa Markham |       387.99 |
+------------------------+---------------+-----------------+--------------+
11 rows in set (0.00 sec)

mysql> SELECT product_cd, open_branch_id branch_id, open_emp_id emp_id,
    -> SUM(avail_balance) tot_deposits
    -> FROM account
    -> GROUP BY product_cd, open_branch_id, open_emp_id;
+------------+-----------+--------+--------------+
| product_cd | branch_id | emp_id | tot_deposits |
+------------+-----------+--------+--------------+
| CHK        |         2 |     10 |      3315.77 |
| SAV        |         2 |     10 |       700.00 |
| CD         |         2 |     10 |      8000.00 |
| CHK        |         3 |     13 |      1057.75 |
| MM         |         3 |     13 |      2212.50 |
| CHK        |         1 |      1 |       782.16 |
| SAV        |         1 |      1 |       767.77 |
| MM         |         1 |      1 |     14832.64 |
| CHK        |         4 |     16 |     67852.33 |
| CD         |         1 |      1 |     11500.00 |
| SAV        |         4 |     16 |       387.99 |
| BUS        |         4 |     16 |         0.00 |
| BUS        |         2 |     10 |      9345.55 |
| SBL        |         3 |     13 |     50000.00 |
+------------+-----------+--------+--------------+
14 rows in set (0.00 sec)

mysql> SELECT p.name product, b.name branch,
    -> CONCAT(e.fname, ' ', e.lname) name,
    -> account_groups.tot_deposits
    -> FROM
    -> (SELECT product_cd, open_branch_id branch_id,
    -> open_emp_id emp_id,
    -> SUM(avail_balance) tot_deposits
    -> FROM account
    -> GROUP BY product_cd, open_branch_id, open_emp_id) account_groups
    -> INNER JOIN employee e ON e.emp_id = account_groups.emp_id
    -> INNER JOIN branch b ON b.branch_id = account_groups.branch_id
    -> INNER JOIN product p ON p.product_cd = account_groups.product_cd
    -> WHERE p.product_type_cd = 'ACCOUNT';
+------------------------+---------------+-----------------+--------------+
| product                | branch        | name            | tot_deposits |
+------------------------+---------------+-----------------+--------------+
| certificate of deposit | Woburn Branch | Paula Roberts   |      8000.00 |
| certificate of deposit | Headquarters  | Michael Smith   |     11500.00 |
| checking account       | Woburn Branch | Paula Roberts   |      3315.77 |
| checking account       | Quincy Branch | John Blake      |      1057.75 |
| checking account       | Headquarters  | Michael Smith   |       782.16 |
| checking account       | So. NH Branch | Theresa Markham |     67852.33 |
| money market account   | Quincy Branch | John Blake      |      2212.50 |
| money market account   | Headquarters  | Michael Smith   |     14832.64 |
| savings account        | Woburn Branch | Paula Roberts   |       700.00 |
| savings account        | Headquarters  | Michael Smith   |       767.77 |
| savings account        | So. NH Branch | Theresa Markham |       387.99 |
+------------------------+---------------+-----------------+--------------+
11 rows in set (0.00 sec)

mysql> SELECT open_emp_id, COUNT(*) how_many
    -> FROM account
    -> GROUP BY open_emp_id
    -> HAVING COUNT(*) = (SELECT MAX(emp_cnt.how_many)
    -> FROM (SELECT COUNT(*) how_many
    -> FROM account
    -> GROUP BY open_emp_id) emp_cnt);
+-------------+----------+
| open_emp_id | how_many |
+-------------+----------+
|           1 |        8 |
+-------------+----------+
1 row in set (0.00 sec)

mysql> SELECT
    -> (SELECT p.name FROM product p
    -> WHERE p.product_cd = a.product_cd
    -> AND p.product_type_cd = 'ACCOUNT') product,
    -> (SELECT b.name FROM branch b
    -> WHERE b.branch_id = a.open_branch_id) branch,
    -> (SELECT CONCAT(e.fname, ' ', e.lname) FROM employee e
    -> WHERE e.emp_id = a.open_emp_id) name,
    -> SUM(a.avail_balance) tot_deposits
    -> FROM account a
    -> GROUP BY a.product_cd, a.open_branch_id, a.open_emp_id;
+------------------------+---------------+-----------------+--------------+
| product                | branch        | name            | tot_deposits |
+------------------------+---------------+-----------------+--------------+
| checking account       | Woburn Branch | Paula Roberts   |      3315.77 |
| savings account        | Woburn Branch | Paula Roberts   |       700.00 |
| certificate of deposit | Woburn Branch | Paula Roberts   |      8000.00 |
| checking account       | Quincy Branch | John Blake      |      1057.75 |
| money market account   | Quincy Branch | John Blake      |      2212.50 |
| checking account       | Headquarters  | Michael Smith   |       782.16 |
| savings account        | Headquarters  | Michael Smith   |       767.77 |
| money market account   | Headquarters  | Michael Smith   |     14832.64 |
| checking account       | So. NH Branch | Theresa Markham |     67852.33 |
| certificate of deposit | Headquarters  | Michael Smith   |     11500.00 |
| savings account        | So. NH Branch | Theresa Markham |       387.99 |
| NULL                   | So. NH Branch | Theresa Markham |         0.00 |
| NULL                   | Woburn Branch | Paula Roberts   |      9345.55 |
| NULL                   | Quincy Branch | John Blake      |     50000.00 |
+------------------------+---------------+-----------------+--------------+
14 rows in set (0.00 sec)

mysql> SELECT all_prods.product, all_prods.branch,
    -> all_prods.name, all_prods.tot_deposits
    -> FROM
    -> (SELECT
    -> (SELECT p.name FROM product p
    -> WHERE p.product_cd = a.product_cd
    -> AND p.product_type_cd = 'ACCOUNT') product,
    -> (SELECT b.name FROM branch b
    -> WHERE b.branch_id = a.open_branch_id) branch,
    -> (SELECT CONCAT(e.fname, ' ', e.lname) FROM employee e
    -> WHERE e.emp_id = a.open_emp_id) name,
    -> SUM(a.avail_balance) tot_deposits
    -> FROM account a
    -> GROUP BY a.product_cd, a.open_branch_id, a.open_emp_id) all_prods
    -> WHERE all_prods.product IS NOT NULL;
+------------------------+---------------+-----------------+--------------+
| product                | branch        | name            | tot_deposits |
+------------------------+---------------+-----------------+--------------+
| checking account       | Woburn Branch | Paula Roberts   |      3315.77 |
| savings account        | Woburn Branch | Paula Roberts   |       700.00 |
| certificate of deposit | Woburn Branch | Paula Roberts   |      8000.00 |
| checking account       | Quincy Branch | John Blake      |      1057.75 |
| money market account   | Quincy Branch | John Blake      |      2212.50 |
| checking account       | Headquarters  | Michael Smith   |       782.16 |
| savings account        | Headquarters  | Michael Smith   |       767.77 |
| money market account   | Headquarters  | Michael Smith   |     14832.64 |
| checking account       | So. NH Branch | Theresa Markham |     67852.33 |
| certificate of deposit | Headquarters  | Michael Smith   |     11500.00 |
| savings account        | So. NH Branch | Theresa Markham |       387.99 |
+------------------------+---------------+-----------------+--------------+
11 rows in set (0.00 sec)

mysql> SELECT emp.emp_id, CONCAT(emp.fname, ' ', emp.lname) emp_name,
    -> (SELECT CONCAT(boss.fname, ' ', boss.lname)
    -> FROM employee boss
    -> WHERE boss.emp_id = emp.superior_emp_id) boss_name
    -> FROM employee emp
    -> WHERE emp.superior_emp_id IS NOT NULL
    -> ORDER BY (SELECT boss.lname FROM employee boss
    -> WHERE boss.emp_id = emp.superior_emp_id), emp.lname;
+--------+------------------+-----------------+
| emp_id | emp_name         | boss_name       |
+--------+------------------+-----------------+
|     14 | Cindy Mason      | John Blake      |
|     15 | Frank Portman    | John Blake      |
|      9 | Jane Grossman    | Helen Fleming   |
|      8 | Sarah Parker     | Helen Fleming   |
|      7 | Chris Tucker     | Helen Fleming   |
|     13 | John Blake       | Susan Hawthorne |
|      6 | Helen Fleming    | Susan Hawthorne |
|      5 | John Gooding     | Susan Hawthorne |
|     16 | Theresa Markham  | Susan Hawthorne |
|     10 | Paula Roberts    | Susan Hawthorne |
|     17 | Beth Fowler      | Theresa Markham |
|     18 | Rick Tulman      | Theresa Markham |
|     12 | Samantha Jameson | Paula Roberts   |
|     11 | Thomas Ziegler   | Paula Roberts   |
|      2 | Susan Barker     | Michael Smith   |
|      3 | Robert Tyler     | Michael Smith   |
|      4 | Susan Hawthorne  | Robert Tyler    |
+--------+------------------+-----------------+
17 rows in set (0.00 sec)

