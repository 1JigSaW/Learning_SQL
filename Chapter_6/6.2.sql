mysql> SELECT fname, lname
    -> FROM individual
    -> UNION 
    -> SELECT fname, lname
    -> FROM employee;
+----------+-----------+
| fname    | lname     |
+----------+-----------+
| James    | Hadley    |
| Susan    | Tingley   |
| Frank    | Tucker    |
| John     | Hayward   |
| Charles  | Frasier   |
| John     | Spencer   |
| Margaret | Young     |
| Louis    | Blake     |
| Richard  | Farley    |
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
27 rows in set (0.00 sec)

