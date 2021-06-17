mysql> SELECT e.emp_id, e.fname, e.lname,
    -> (SELECT d.name FROM department d
    -> WHERE d.dept_id = e.dept_id) dept_name,
    -> (SELECT b.name FROM branch b
    -> WHERE b.branch_id = e.assigned_branch_id) branch_name
    -> FROM employee e;
+--------+----------+-----------+----------------+---------------+
| emp_id | fname    | lname     | dept_name      | branch_name   |
+--------+----------+-----------+----------------+---------------+
|      1 | Michael  | Smith     | Administration | Headquarters  |
|      2 | Susan    | Barker    | Administration | Headquarters  |
|      3 | Robert   | Tyler     | Administration | Headquarters  |
|      4 | Susan    | Hawthorne | Operations     | Headquarters  |
|      5 | John     | Gooding   | Loans          | Headquarters  |
|      6 | Helen    | Fleming   | Operations     | Headquarters  |
|      7 | Chris    | Tucker    | Operations     | Headquarters  |
|      8 | Sarah    | Parker    | Operations     | Headquarters  |
|      9 | Jane     | Grossman  | Operations     | Headquarters  |
|     10 | Paula    | Roberts   | Operations     | Woburn Branch |
|     11 | Thomas   | Ziegler   | Operations     | Woburn Branch |
|     12 | Samantha | Jameson   | Operations     | Woburn Branch |
|     13 | John     | Blake     | Operations     | Quincy Branch |
|     14 | Cindy    | Mason     | Operations     | Quincy Branch |
|     15 | Frank    | Portman   | Operations     | Quincy Branch |
|     16 | Theresa  | Markham   | Operations     | So. NH Branch |
|     17 | Beth     | Fowler    | Operations     | So. NH Branch |
|     18 | Rick     | Tulman    | Operations     | So. NH Branch |
+--------+----------+-----------+----------------+---------------+
18 rows in set (0.00 sec)

