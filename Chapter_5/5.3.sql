mysql> SELECT e.emp_id, e.fname, e.lname
    -> FROM employee e INNER JOIN employee mgr
    -> ON e.superior_emp_id = mgr.emp_id
    -> WHERE e.dept_id != mgr.dept_id;
+--------+-------+-----------+
| emp_id | fname | lname     |
+--------+-------+-----------+
|      4 | Susan | Hawthorne |
|      5 | John  | Gooding   |
+--------+-------+-----------+
2 rows in set (0.00 sec)
