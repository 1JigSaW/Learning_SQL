mysql> SELECT e.emp_id, e.fname, e.lname, levels.name
    -> FROM employee e INNER JOIN
    -> (SELECT 'trainee' name, '2004-01-01' start_dt, '2005-12-31' end_dt
    -> UNION ALL
    -> SELECT 'worker' name, '2002-01-01' start_dt, '2003-12-31' end_dt
    -> UNION ALL
    -> SELECT 'mentor' name, '2000-01-01' start_dt, '2001-12-31' end_dt) levels
    -> ON e.start_date BETWEEN levels.start_dt AND levels.end_dt;
+--------+----------+-----------+---------+
| emp_id | fname    | lname     | name    |
+--------+----------+-----------+---------+
|      1 | Michael  | Smith     | mentor  |
|      2 | Susan    | Barker    | worker  |
|      3 | Robert   | Tyler     | mentor  |
|      4 | Susan    | Hawthorne | worker  |
|      5 | John     | Gooding   | worker  |
|      6 | Helen    | Fleming   | trainee |
|      7 | Chris    | Tucker    | trainee |
|      8 | Sarah    | Parker    | worker  |
|      9 | Jane     | Grossman  | worker  |
|     10 | Paula    | Roberts   | worker  |
|     11 | Thomas   | Ziegler   | mentor  |
|     12 | Samantha | Jameson   | worker  |
|     13 | John     | Blake     | mentor  |
|     14 | Cindy    | Mason     | worker  |
|     15 | Frank    | Portman   | worker  |
|     16 | Theresa  | Markham   | mentor  |
|     17 | Beth     | Fowler    | worker  |
|     18 | Rick     | Tulman    | worker  |
+--------+----------+-----------+---------+
18 rows in set (0.00 sec)
