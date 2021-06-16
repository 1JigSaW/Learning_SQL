mysql> SELECT fname, lname
    -> FROM individual
    -> UNION 
    -> SELECT fname, lname
    -> FROM employee
    -> ORDER BY lname;
+----------+-----------+
| fname    | lname     |
+----------+-----------+
| Susan    | Barker    |
| Louis    | Blake     |
| John     | Blake     |
| Richard  | Farley    |
| Helen    | Fleming   |
| Beth     | Fowler    |
| Charles  | Frasier   |
| John     | Gooding   |
| Jane     | Grossman  |
| James    | Hadley    |
| Susan    | Hawthorne |
| John     | Hayward   |
| Samantha | Jameson   |
| Theresa  | Markham   |
| Cindy    | Mason     |
| Sarah    | Parker    |
| Frank    | Portman   |
| Paula    | Roberts   |
| Michael  | Smith     |
| John     | Spencer   |
| Susan    | Tingley   |
| Frank    | Tucker    |
| Chris    | Tucker    |
| Rick     | Tulman    |
| Robert   | Tyler     |
| Margaret | Young     |
| Thomas   | Ziegler   |
+----------+-----------+
27 rows in set (0.00 sec)

