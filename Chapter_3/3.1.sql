mysql> SELECT emp_id, fname, lname
    -> FROM employee
    -> ORDER BY lname;
+--------+----------+-----------+
| emp_id | fname    | lname     |
+--------+----------+-----------+
|      2 | Susan    | Barker    |
|     13 | John     | Blake     |
|      6 | Helen    | Fleming   |
|     17 | Beth     | Fowler    |
|      5 | John     | Gooding   |
|      9 | Jane     | Grossman  |
|      4 | Susan    | Hawthorne |
|     12 | Samantha | Jameson   |
|     16 | Theresa  | Markham   |
|     14 | Cindy    | Mason     |
|      8 | Sarah    | Parker    |
|     15 | Frank    | Portman   |
|     10 | Paula    | Roberts   |
|      1 | Michael  | Smith     |
|      7 | Chris    | Tucker    |
|     18 | Rick     | Tulman    |
|      3 | Robert   | Tyler     |
|     11 | Thomas   | Ziegler   |
+--------+----------+-----------+
18 rows in set (0.00 sec)

mysql> SELECT emp_id, fname, lname
    -> FROM employee
    -> ORDER BY fname;
+--------+----------+-----------+
| emp_id | fname    | lname     |
+--------+----------+-----------+
|     17 | Beth     | Fowler    |
|      7 | Chris    | Tucker    |
|     14 | Cindy    | Mason     |
|     15 | Frank    | Portman   |
|      6 | Helen    | Fleming   |
|      9 | Jane     | Grossman  |
|      5 | John     | Gooding   |
|     13 | John     | Blake     |
|      1 | Michael  | Smith     |
|     10 | Paula    | Roberts   |
|     18 | Rick     | Tulman    |
|      3 | Robert   | Tyler     |
|     12 | Samantha | Jameson   |
|      8 | Sarah    | Parker    |
|      2 | Susan    | Barker    |
|      4 | Susan    | Hawthorne |
|     16 | Theresa  | Markham   |
|     11 | Thomas   | Ziegler   |
+--------+----------+-----------+
18 rows in set (0.00 sec)

