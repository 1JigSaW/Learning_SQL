mysql> SELECT a.account_id, a.product_cd, i.fname, i.lname, b.name
    -> FROM account a LEFT OUTER JOIN individual i
    -> ON a.cust_id = i.cust_id
    -> LEFT OUTER JOIN business b
    -> ON a.cust_id = b.cust_id;
+------------+------------+----------+---------+------------------------+
| account_id | product_cd | fname    | lname   | name                   |
+------------+------------+----------+---------+------------------------+
|          1 | CHK        | James    | Hadley  | NULL                   |
|          2 | SAV        | James    | Hadley  | NULL                   |
|          3 | CD         | James    | Hadley  | NULL                   |
|          4 | CHK        | Susan    | Tingley | NULL                   |
|          5 | SAV        | Susan    | Tingley | NULL                   |
|          7 | CHK        | Frank    | Tucker  | NULL                   |
|          8 | MM         | Frank    | Tucker  | NULL                   |
|         10 | CHK        | John     | Hayward | NULL                   |
|         11 | SAV        | John     | Hayward | NULL                   |
|         12 | MM         | John     | Hayward | NULL                   |
|         13 | CHK        | Charles  | Frasier | NULL                   |
|         14 | CHK        | John     | Spencer | NULL                   |
|         15 | CD         | John     | Spencer | NULL                   |
|         17 | CD         | Margaret | Young   | NULL                   |
|         18 | CHK        | Louis    | Blake   | NULL                   |
|         19 | SAV        | Louis    | Blake   | NULL                   |
|         21 | CHK        | Richard  | Farley  | NULL                   |
|         22 | MM         | Richard  | Farley  | NULL                   |
|         23 | CD         | Richard  | Farley  | NULL                   |
|         24 | CHK        | NULL     | NULL    | Chilton Engineering    |
|         25 | BUS        | NULL     | NULL    | Chilton Engineering    |
|         27 | BUS        | NULL     | NULL    | Northeast Cooling Inc. |
|         28 | CHK        | NULL     | NULL    | Superior Auto Body     |
|         29 | SBL        | NULL     | NULL    | AAA Insurance Inc.     |
+------------+------------+----------+---------+------------------------+
24 rows in set (0.00 sec)
