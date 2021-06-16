mysql> DESC employee;
+--------------------+-------------------+------+-----+---------+----------------+
| Field              | Type              | Null | Key | Default | Extra          |
+--------------------+-------------------+------+-----+---------+----------------+
| emp_id             | smallint unsigned | NO   | PRI | NULL    | auto_increment |
| fname              | varchar(20)       | NO   |     | NULL    |                |
| lname              | varchar(20)       | NO   |     | NULL    |                |
| start_date         | date              | NO   |     | NULL    |                |
| end_date           | date              | YES  |     | NULL    |                |
| superior_emp_id    | smallint unsigned | YES  | MUL | NULL    |                |
| dept_id            | smallint unsigned | YES  | MUL | NULL    |                |
| title              | varchar(20)       | YES  |     | NULL    |                |
| assigned_branch_id | smallint unsigned | YES  | MUL | NULL    |                |
+--------------------+-------------------+------+-----+---------+----------------+
9 rows in set (0.00 sec)

mysql> DESC department;
+---------+-------------------+------+-----+---------+----------------+
| Field   | Type              | Null | Key | Default | Extra          |
+---------+-------------------+------+-----+---------+----------------+
| dept_id | smallint unsigned | NO   | PRI | NULL    | auto_increment |
| name    | varchar(20)       | NO   |     | NULL    |                |
+---------+-------------------+------+-----+---------+----------------+
2 rows in set (0.00 sec)

mysql> SELECT e.fname, e.lname, d.name
    -> FROM employee e JOIN department d;
+----------+-----------+----------------+
| fname    | lname     | name           |
+----------+-----------+----------------+
| Michael  | Smith     | Administration |
| Michael  | Smith     | Loans          |
| Michael  | Smith     | Operations     |
| Susan    | Barker    | Administration |
| Susan    | Barker    | Loans          |
| Susan    | Barker    | Operations     |
| Robert   | Tyler     | Administration |
| Robert   | Tyler     | Loans          |
| Robert   | Tyler     | Operations     |
| Susan    | Hawthorne | Administration |
| Susan    | Hawthorne | Loans          |
| Susan    | Hawthorne | Operations     |
| John     | Gooding   | Administration |
| John     | Gooding   | Loans          |
| John     | Gooding   | Operations     |
| Helen    | Fleming   | Administration |
| Helen    | Fleming   | Loans          |
| Helen    | Fleming   | Operations     |
| Chris    | Tucker    | Administration |
| Chris    | Tucker    | Loans          |
| Chris    | Tucker    | Operations     |
| Sarah    | Parker    | Administration |
| Sarah    | Parker    | Loans          |
| Sarah    | Parker    | Operations     |
| Jane     | Grossman  | Administration |
| Jane     | Grossman  | Loans          |
| Jane     | Grossman  | Operations     |
| Paula    | Roberts   | Administration |
| Paula    | Roberts   | Loans          |
| Paula    | Roberts   | Operations     |
| Thomas   | Ziegler   | Administration |
| Thomas   | Ziegler   | Loans          |
| Thomas   | Ziegler   | Operations     |
| Samantha | Jameson   | Administration |
| Samantha | Jameson   | Loans          |
| Samantha | Jameson   | Operations     |
| John     | Blake     | Administration |
| John     | Blake     | Loans          |
| John     | Blake     | Operations     |
| Cindy    | Mason     | Administration |
| Cindy    | Mason     | Loans          |
| Cindy    | Mason     | Operations     |
| Frank    | Portman   | Administration |
| Frank    | Portman   | Loans          |
| Frank    | Portman   | Operations     |
| Theresa  | Markham   | Administration |
| Theresa  | Markham   | Loans          |
| Theresa  | Markham   | Operations     |
| Beth     | Fowler    | Administration |
| Beth     | Fowler    | Loans          |
| Beth     | Fowler    | Operations     |
| Rick     | Tulman    | Administration |
| Rick     | Tulman    | Loans          |
| Rick     | Tulman    | Operations     |
+----------+-----------+----------------+
54 rows in set (0.00 sec)

mysql> SELECT e.fname, e.lname, d.name
    -> FROM employee e JOIN department d
    -> ON e.dept_id = d.dept_id;
+----------+-----------+----------------+
| fname    | lname     | name           |
+----------+-----------+----------------+
| Susan    | Hawthorne | Operations     |
| Helen    | Fleming   | Operations     |
| Chris    | Tucker    | Operations     |
| Sarah    | Parker    | Operations     |
| Jane     | Grossman  | Operations     |
| Paula    | Roberts   | Operations     |
| Thomas   | Ziegler   | Operations     |
| Samantha | Jameson   | Operations     |
| John     | Blake     | Operations     |
| Cindy    | Mason     | Operations     |
| Frank    | Portman   | Operations     |
| Theresa  | Markham   | Operations     |
| Beth     | Fowler    | Operations     |
| Rick     | Tulman    | Operations     |
| John     | Gooding   | Loans          |
| Michael  | Smith     | Administration |
| Susan    | Barker    | Administration |
| Robert   | Tyler     | Administration |
+----------+-----------+----------------+
18 rows in set (0.00 sec)

mysql> SELECT e.fname, e.lname, d.name
    -> FROM employee e INNER JOIN department d
    -> ON e.dept_id = d.dept_id;
+----------+-----------+----------------+
| fname    | lname     | name           |
+----------+-----------+----------------+
| Susan    | Hawthorne | Operations     |
| Helen    | Fleming   | Operations     |
| Chris    | Tucker    | Operations     |
| Sarah    | Parker    | Operations     |
| Jane     | Grossman  | Operations     |
| Paula    | Roberts   | Operations     |
| Thomas   | Ziegler   | Operations     |
| Samantha | Jameson   | Operations     |
| John     | Blake     | Operations     |
| Cindy    | Mason     | Operations     |
| Frank    | Portman   | Operations     |
| Theresa  | Markham   | Operations     |
| Beth     | Fowler    | Operations     |
| Rick     | Tulman    | Operations     |
| John     | Gooding   | Loans          |
| Michael  | Smith     | Administration |
| Susan    | Barker    | Administration |
| Robert   | Tyler     | Administration |
+----------+-----------+----------------+
18 rows in set (0.00 sec)

mysql> SELECT e.fname, e.lname, d.name
    -> FROM employee e JOIN department d
    -> USING (dept_id);
+----------+-----------+----------------+
| fname    | lname     | name           |
+----------+-----------+----------------+
| Susan    | Hawthorne | Operations     |
| Helen    | Fleming   | Operations     |
| Chris    | Tucker    | Operations     |
| Sarah    | Parker    | Operations     |
| Jane     | Grossman  | Operations     |
| Paula    | Roberts   | Operations     |
| Thomas   | Ziegler   | Operations     |
| Samantha | Jameson   | Operations     |
| John     | Blake     | Operations     |
| Cindy    | Mason     | Operations     |
| Frank    | Portman   | Operations     |
| Theresa  | Markham   | Operations     |
| Beth     | Fowler    | Operations     |
| Rick     | Tulman    | Operations     |
| John     | Gooding   | Loans          |
| Michael  | Smith     | Administration |
| Susan    | Barker    | Administration |
| Robert   | Tyler     | Administration |
+----------+-----------+----------------+
18 rows in set (0.00 sec)

mysql> SELECT e.fname, e.lname, d.name
    -> FROM employee e, department d
    -> WHERE e.dept_id = d.dept_id;
+----------+-----------+----------------+
| fname    | lname     | name           |
+----------+-----------+----------------+
| Susan    | Hawthorne | Operations     |
| Helen    | Fleming   | Operations     |
| Chris    | Tucker    | Operations     |
| Sarah    | Parker    | Operations     |
| Jane     | Grossman  | Operations     |
| Paula    | Roberts   | Operations     |
| Thomas   | Ziegler   | Operations     |
| Samantha | Jameson   | Operations     |
| John     | Blake     | Operations     |
| Cindy    | Mason     | Operations     |
| Frank    | Portman   | Operations     |
| Theresa  | Markham   | Operations     |
| Beth     | Fowler    | Operations     |
| Rick     | Tulman    | Operations     |
| John     | Gooding   | Loans          |
| Michael  | Smith     | Administration |
| Susan    | Barker    | Administration |
| Robert   | Tyler     | Administration |
+----------+-----------+----------------+
18 rows in set (0.00 sec)

mysql> SELECT a.account_id, a.cust_id, a.open_date, a.product_cd
    -> FROM account a, branch b, employee e
    -> WHERE a.open_emp_id = e.emp_id
    -> AND e.start_date <= '2003-01-01'
    -> AND e.assigned_branch_id = b.branch_id
    -> AND (e.title = 'Teller' OR e.title = 'Head Teller')
    -> AND b.name = 'Woburn Branch';
+------------+---------+------------+------------+
| account_id | cust_id | open_date  | product_cd |
+------------+---------+------------+------------+
|          1 |       1 | 2000-01-15 | CHK        |
|          2 |       1 | 2000-01-15 | SAV        |
|          3 |       1 | 2004-06-30 | CD         |
|          4 |       2 | 2001-03-12 | CHK        |
|          5 |       2 | 2001-03-12 | SAV        |
|         17 |       7 | 2004-01-12 | CD         |
|         27 |      11 | 2004-03-22 | BUS        |
+------------+---------+------------+------------+
7 rows in set (0.00 sec)

mysql> SELECT a.account_id, a.cust_id, a.open_date, a.product_cd
    -> FROM account a INNER JOIN employee e
    -> ON a.open_emp_id = e.emp_id
    -> INNER JOIN branch b
    -> ON e.assigned_branch_id = b.branch_id
    -> WHERE e.start_date <= '2003-01-01'
    -> AND (e.title = 'Teller' OR e.title = 'Head Teller')
    -> AND b.name = 'Woburn Branch';
+------------+---------+------------+------------+
| account_id | cust_id | open_date  | product_cd |
+------------+---------+------------+------------+
|          1 |       1 | 2000-01-15 | CHK        |
|          2 |       1 | 2000-01-15 | SAV        |
|          3 |       1 | 2004-06-30 | CD         |
|          4 |       2 | 2001-03-12 | CHK        |
|          5 |       2 | 2001-03-12 | SAV        |
|         17 |       7 | 2004-01-12 | CD         |
|         27 |      11 | 2004-03-22 | BUS        |
+------------+---------+------------+------------+
7 rows in set (0.00 sec)

mysql> SELECT a.account_id, c.fed_id
    -> FROM account a INNER JOIN customer c
    -> ON a.cust_id = c.cust_id
    -> WHERE c.cust_type_cd = 'B';
+------------+------------+
| account_id | fed_id     |
+------------+------------+
|         24 | 04-1111111 |
|         25 | 04-1111111 |
|         27 | 04-2222222 |
|         28 | 04-3333333 |
|         29 | 04-4444444 |
+------------+------------+
5 rows in set (0.00 sec)

mysql> SELECT a.account_id, c.fed_id, e.fname, e.lname
    -> FROM account a INNER JOIN customer c
    -> ON a.cust_id = c.cust_id
    -> INNER JOIN employee e
    -> ON a.open_emp_id = e.emp_id
    -> WHERE c.cust_type_cd = 'B';
+------------+------------+---------+---------+
| account_id | fed_id     | fname   | lname   |
+------------+------------+---------+---------+
|         24 | 04-1111111 | Theresa | Markham |
|         25 | 04-1111111 | Theresa | Markham |
|         27 | 04-2222222 | Paula   | Roberts |
|         28 | 04-3333333 | Theresa | Markham |
|         29 | 04-4444444 | John    | Blake   |
+------------+------------+---------+---------+
5 rows in set (0.00 sec)

mysql> SELECT a.account_id, c.fed_id, e.fname, e.lname
    -> FROM customer c INNER JOIN account a
    -> ON a.cust_id = c.cust_id
    -> INNER JOIN employee e
    -> ON a.open_emp_id = e.emp_id
    -> WHERE c.cust_type_cd = 'B';
+------------+------------+---------+---------+
| account_id | fed_id     | fname   | lname   |
+------------+------------+---------+---------+
|         24 | 04-1111111 | Theresa | Markham |
|         25 | 04-1111111 | Theresa | Markham |
|         27 | 04-2222222 | Paula   | Roberts |
|         28 | 04-3333333 | Theresa | Markham |
|         29 | 04-4444444 | John    | Blake   |
+------------+------------+---------+---------+
5 rows in set (0.00 sec)

mysql> SELECT emp_id, assigned_branch_id
    -> FROM employee
    -> WHERE start_date <= '2003-01-01'
    -> AND (title = 'Teller' OR title = 'Head Teller');
+--------+--------------------+
| emp_id | assigned_branch_id |
+--------+--------------------+
|      8 |                  1 |
|      9 |                  1 |
|     10 |                  2 |
|     11 |                  2 |
|     13 |                  3 |
|     14 |                  3 |
|     16 |                  4 |
|     17 |                  4 |
|     18 |                  4 |
+--------+--------------------+
9 rows in set (0.00 sec)

mysql> SELECT branch_id
    -> FROM branch
    -> WHERE name = 'Woburn Branch';
+-----------+
| branch_id |
+-----------+
|         2 |
+-----------+
1 row in set (0.00 sec)

mysql> SELECT a.account_id, e.emp_id,
    -> b_a.name open_branch, b_e.name emp_branch
    -> FROM account a INNER JOIN branch b_a
    -> ON a.open_branch_id = b_a.branch_id
    -> INNER JOIN employee e
    -> ON a.open_emp_id = e.emp_id
    -> INNER JOIN branch b_e
    -> ON e.assigned_branch_id = b_e.branch_id
    -> WHERE a.product_cd = 'CHK';
+------------+--------+---------------+---------------+
| account_id | emp_id | open_branch   | emp_branch    |
+------------+--------+---------------+---------------+
|          1 |     10 | Woburn Branch | Woburn Branch |
|          4 |     10 | Woburn Branch | Woburn Branch |
|          7 |     13 | Quincy Branch | Quincy Branch |
|         10 |      1 | Headquarters  | Headquarters  |
|         13 |     16 | So. NH Branch | So. NH Branch |
|         14 |      1 | Headquarters  | Headquarters  |
|         18 |     16 | So. NH Branch | So. NH Branch |
|         21 |      1 | Headquarters  | Headquarters  |
|         24 |     16 | So. NH Branch | So. NH Branch |
|         28 |     16 | So. NH Branch | So. NH Branch |
+------------+--------+---------------+---------------+
10 rows in set (0.00 sec)

mysql> SELECT e.fname, e.lname,
    -> e_mgr.fname mgr_fname, e_mgr.lname mgr_lname
    -> FROM employee e INNER JOIN employee e_mgr
    -> ON e.superior_emp_id = e_mgr.emp_id;
+----------+-----------+-----------+-----------+
| fname    | lname     | mgr_fname | mgr_lname |
+----------+-----------+-----------+-----------+
| Susan    | Barker    | Michael   | Smith     |
| Robert   | Tyler     | Michael   | Smith     |
| Susan    | Hawthorne | Robert    | Tyler     |
| John     | Gooding   | Susan     | Hawthorne |
| Helen    | Fleming   | Susan     | Hawthorne |
| Chris    | Tucker    | Helen     | Fleming   |
| Sarah    | Parker    | Helen     | Fleming   |
| Jane     | Grossman  | Helen     | Fleming   |
| Paula    | Roberts   | Susan     | Hawthorne |
| Thomas   | Ziegler   | Paula     | Roberts   |
| Samantha | Jameson   | Paula     | Roberts   |
| John     | Blake     | Susan     | Hawthorne |
| Cindy    | Mason     | John      | Blake     |
| Frank    | Portman   | John      | Blake     |
| Theresa  | Markham   | Susan     | Hawthorne |
| Beth     | Fowler    | Theresa   | Markham   |
| Rick     | Tulman    | Theresa   | Markham   |
+----------+-----------+-----------+-----------+
17 rows in set (0.00 sec)

mysql> SELECT e1.fname, e1.lname, 'VS' vs, e2.fname, e2.lname
    -> FROM employee e1 INNER JOIN employee e2
    -> ON e1.emp_id != e2.emp_id
    -> WHERE e1.title = 'Teller' AND e2.title = 'Teller';
+----------+----------+----+----------+----------+
| fname    | lname    | vs | fname    | lname    |
+----------+----------+----+----------+----------+
| Rick     | Tulman   | VS | Chris    | Tucker   |
| Beth     | Fowler   | VS | Chris    | Tucker   |
| Frank    | Portman  | VS | Chris    | Tucker   |
| Cindy    | Mason    | VS | Chris    | Tucker   |
| Samantha | Jameson  | VS | Chris    | Tucker   |
| Thomas   | Ziegler  | VS | Chris    | Tucker   |
| Jane     | Grossman | VS | Chris    | Tucker   |
| Sarah    | Parker   | VS | Chris    | Tucker   |
| Rick     | Tulman   | VS | Sarah    | Parker   |
| Beth     | Fowler   | VS | Sarah    | Parker   |
| Frank    | Portman  | VS | Sarah    | Parker   |
| Cindy    | Mason    | VS | Sarah    | Parker   |
| Samantha | Jameson  | VS | Sarah    | Parker   |
| Thomas   | Ziegler  | VS | Sarah    | Parker   |
| Jane     | Grossman | VS | Sarah    | Parker   |
| Chris    | Tucker   | VS | Sarah    | Parker   |
| Rick     | Tulman   | VS | Jane     | Grossman |
| Beth     | Fowler   | VS | Jane     | Grossman |
| Frank    | Portman  | VS | Jane     | Grossman |
| Cindy    | Mason    | VS | Jane     | Grossman |
| Samantha | Jameson  | VS | Jane     | Grossman |
| Thomas   | Ziegler  | VS | Jane     | Grossman |
| Sarah    | Parker   | VS | Jane     | Grossman |
| Chris    | Tucker   | VS | Jane     | Grossman |
| Rick     | Tulman   | VS | Thomas   | Ziegler  |
| Beth     | Fowler   | VS | Thomas   | Ziegler  |
| Frank    | Portman  | VS | Thomas   | Ziegler  |
| Cindy    | Mason    | VS | Thomas   | Ziegler  |
| Samantha | Jameson  | VS | Thomas   | Ziegler  |
| Jane     | Grossman | VS | Thomas   | Ziegler  |
| Sarah    | Parker   | VS | Thomas   | Ziegler  |
| Chris    | Tucker   | VS | Thomas   | Ziegler  |
| Rick     | Tulman   | VS | Samantha | Jameson  |
| Beth     | Fowler   | VS | Samantha | Jameson  |
| Frank    | Portman  | VS | Samantha | Jameson  |
| Cindy    | Mason    | VS | Samantha | Jameson  |
| Thomas   | Ziegler  | VS | Samantha | Jameson  |
| Jane     | Grossman | VS | Samantha | Jameson  |
| Sarah    | Parker   | VS | Samantha | Jameson  |
| Chris    | Tucker   | VS | Samantha | Jameson  |
| Rick     | Tulman   | VS | Cindy    | Mason    |
| Beth     | Fowler   | VS | Cindy    | Mason    |
| Frank    | Portman  | VS | Cindy    | Mason    |
| Samantha | Jameson  | VS | Cindy    | Mason    |
| Thomas   | Ziegler  | VS | Cindy    | Mason    |
| Jane     | Grossman | VS | Cindy    | Mason    |
| Sarah    | Parker   | VS | Cindy    | Mason    |
| Chris    | Tucker   | VS | Cindy    | Mason    |
| Rick     | Tulman   | VS | Frank    | Portman  |
| Beth     | Fowler   | VS | Frank    | Portman  |
| Cindy    | Mason    | VS | Frank    | Portman  |
| Samantha | Jameson  | VS | Frank    | Portman  |
| Thomas   | Ziegler  | VS | Frank    | Portman  |
| Jane     | Grossman | VS | Frank    | Portman  |
| Sarah    | Parker   | VS | Frank    | Portman  |
| Chris    | Tucker   | VS | Frank    | Portman  |
| Rick     | Tulman   | VS | Beth     | Fowler   |
| Frank    | Portman  | VS | Beth     | Fowler   |
| Cindy    | Mason    | VS | Beth     | Fowler   |
| Samantha | Jameson  | VS | Beth     | Fowler   |
| Thomas   | Ziegler  | VS | Beth     | Fowler   |
| Jane     | Grossman | VS | Beth     | Fowler   |
| Sarah    | Parker   | VS | Beth     | Fowler   |
| Chris    | Tucker   | VS | Beth     | Fowler   |
| Beth     | Fowler   | VS | Rick     | Tulman   |
| Frank    | Portman  | VS | Rick     | Tulman   |
| Cindy    | Mason    | VS | Rick     | Tulman   |
| Samantha | Jameson  | VS | Rick     | Tulman   |
| Thomas   | Ziegler  | VS | Rick     | Tulman   |
| Jane     | Grossman | VS | Rick     | Tulman   |
| Sarah    | Parker   | VS | Rick     | Tulman   |
| Chris    | Tucker   | VS | Rick     | Tulman   |
+----------+----------+----+----------+----------+
72 rows in set (0.00 sec)

mysql> SELECT e1.fname, e1.lname, 'VS' vs, e2.fname, e2.lname
    -> FROM employee e1 INNER JOIN employee e2
    -> ON e1.emp_id < e2.emp_id
    -> WHERE e1.title = 'Teller' AND e2.title = 'Teller';
+----------+----------+----+----------+----------+
| fname    | lname    | vs | fname    | lname    |
+----------+----------+----+----------+----------+
| Chris    | Tucker   | VS | Sarah    | Parker   |
| Chris    | Tucker   | VS | Jane     | Grossman |
| Chris    | Tucker   | VS | Thomas   | Ziegler  |
| Chris    | Tucker   | VS | Samantha | Jameson  |
| Chris    | Tucker   | VS | Cindy    | Mason    |
| Chris    | Tucker   | VS | Frank    | Portman  |
| Chris    | Tucker   | VS | Beth     | Fowler   |
| Chris    | Tucker   | VS | Rick     | Tulman   |
| Sarah    | Parker   | VS | Jane     | Grossman |
| Sarah    | Parker   | VS | Thomas   | Ziegler  |
| Sarah    | Parker   | VS | Samantha | Jameson  |
| Sarah    | Parker   | VS | Cindy    | Mason    |
| Sarah    | Parker   | VS | Frank    | Portman  |
| Sarah    | Parker   | VS | Beth     | Fowler   |
| Sarah    | Parker   | VS | Rick     | Tulman   |
| Jane     | Grossman | VS | Thomas   | Ziegler  |
| Jane     | Grossman | VS | Samantha | Jameson  |
| Jane     | Grossman | VS | Cindy    | Mason    |
| Jane     | Grossman | VS | Frank    | Portman  |
| Jane     | Grossman | VS | Beth     | Fowler   |
| Jane     | Grossman | VS | Rick     | Tulman   |
| Thomas   | Ziegler  | VS | Samantha | Jameson  |
| Thomas   | Ziegler  | VS | Cindy    | Mason    |
| Thomas   | Ziegler  | VS | Frank    | Portman  |
| Thomas   | Ziegler  | VS | Beth     | Fowler   |
| Thomas   | Ziegler  | VS | Rick     | Tulman   |
| Samantha | Jameson  | VS | Cindy    | Mason    |
| Samantha | Jameson  | VS | Frank    | Portman  |
| Samantha | Jameson  | VS | Beth     | Fowler   |
| Samantha | Jameson  | VS | Rick     | Tulman   |
| Cindy    | Mason    | VS | Frank    | Portman  |
| Cindy    | Mason    | VS | Beth     | Fowler   |
| Cindy    | Mason    | VS | Rick     | Tulman   |
| Frank    | Portman  | VS | Beth     | Fowler   |
| Frank    | Portman  | VS | Rick     | Tulman   |
| Beth     | Fowler   | VS | Rick     | Tulman   |
+----------+----------+----+----------+----------+
36 rows in set (0.00 sec)

mysql> SELECT a.account_id, a.product_cd, c.fed_id
    -> FROM account a INNER JOIN customer c
    -> ON a.cust_id = c.cust_id
    -> WHERE c.cust_type_cd = 'B';
+------------+------------+------------+
| account_id | product_cd | fed_id     |
+------------+------------+------------+
|         24 | CHK        | 04-1111111 |
|         25 | BUS        | 04-1111111 |
|         27 | BUS        | 04-2222222 |
|         28 | CHK        | 04-3333333 |
|         29 | SBL        | 04-4444444 |
+------------+------------+------------+
5 rows in set (0.00 sec)

mysql> SELECT a.account_id, a.product_cd, c.fed_id
    -> FROM account a INNER JOIN customer c
    -> ON a.cust_id = c.cust_id
    -> AND c.cust_type_cd = 'B';
+------------+------------+------------+
| account_id | product_cd | fed_id     |
+------------+------------+------------+
|         24 | CHK        | 04-1111111 |
|         25 | BUS        | 04-1111111 |
|         27 | BUS        | 04-2222222 |
|         28 | CHK        | 04-3333333 |
|         29 | SBL        | 04-4444444 |
+------------+------------+------------+
5 rows in set (0.00 sec)

mysql> SELECT a.account_id, a.product_cd, c.fed_id
    -> FROM account a INNER JOIN customer c
    -> WHERE a.cust_id = c.cust_id
    -> AND c.cust_type_cd = 'B';
+------------+------------+------------+
| account_id | product_cd | fed_id     |
+------------+------------+------------+
|         24 | CHK        | 04-1111111 |
|         25 | BUS        | 04-1111111 |
|         27 | BUS        | 04-2222222 |
|         28 | CHK        | 04-3333333 |
|         29 | SBL        | 04-4444444 |
+------------+------------+------------+
5 rows in set (0.00 sec)

