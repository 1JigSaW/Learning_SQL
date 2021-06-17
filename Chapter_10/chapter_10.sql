mysql> SELECT account_id, cust_id
    -> FROM account;
+------------+---------+
| account_id | cust_id |
+------------+---------+
|          1 |       1 |
|          2 |       1 |
|          3 |       1 |
|          4 |       2 |
|          5 |       2 |
|          7 |       3 |
|          8 |       3 |
|         10 |       4 |
|         11 |       4 |
|         12 |       4 |
|         13 |       5 |
|         14 |       6 |
|         15 |       6 |
|         17 |       7 |
|         18 |       8 |
|         19 |       8 |
|         21 |       9 |
|         22 |       9 |
|         23 |       9 |
|         24 |      10 |
|         25 |      10 |
|         27 |      11 |
|         28 |      12 |
|         29 |      13 |
+------------+---------+
24 rows in set (0.00 sec)

mysql> SELECT cust_id
    -> FROM customer;
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

mysql> SELECT a.account_id, c.cust_id
    -> FROM account a INNER JOIN customer c
    -> ON a.cust_id = c.cust_id;
+------------+---------+
| account_id | cust_id |
+------------+---------+
|          1 |       1 |
|          2 |       1 |
|          3 |       1 |
|          4 |       2 |
|          5 |       2 |
|          7 |       3 |
|          8 |       3 |
|         10 |       4 |
|         11 |       4 |
|         12 |       4 |
|         13 |       5 |
|         14 |       6 |
|         15 |       6 |
|         17 |       7 |
|         18 |       8 |
|         19 |       8 |
|         21 |       9 |
|         22 |       9 |
|         23 |       9 |
|         24 |      10 |
|         25 |      10 |
|         27 |      11 |
|         28 |      12 |
|         29 |      13 |
+------------+---------+
24 rows in set (0.00 sec)

mysql> SELECT a.account_id, b.cust_id, b.name
    -> FROM account a INNER JOIN business b
    -> ON a.cust_id = b.cust_id;
+------------+---------+------------------------+
| account_id | cust_id | name                   |
+------------+---------+------------------------+
|         24 |      10 | Chilton Engineering    |
|         25 |      10 | Chilton Engineering    |
|         27 |      11 | Northeast Cooling Inc. |
|         28 |      12 | Superior Auto Body     |
|         29 |      13 | AAA Insurance Inc.     |
+------------+---------+------------------------+
5 rows in set (0.00 sec)

mysql> SELECT cust_id, name
    -> FROM business;
+---------+------------------------+
| cust_id | name                   |
+---------+------------------------+
|      10 | Chilton Engineering    |
|      11 | Northeast Cooling Inc. |
|      12 | Superior Auto Body     |
|      13 | AAA Insurance Inc.     |
+---------+------------------------+
4 rows in set (0.00 sec)

mysql> SELECT a.account_id, b.cust_id, b.name
    -> FROM account a LEFT OUTER JOIN business b
    -> ON a.cust_id = b.cust_id;
+------------+---------+------------------------+
| account_id | cust_id | name                   |
+------------+---------+------------------------+
|          1 |    NULL | NULL                   |
|          2 |    NULL | NULL                   |
|          3 |    NULL | NULL                   |
|          4 |    NULL | NULL                   |
|          5 |    NULL | NULL                   |
|          7 |    NULL | NULL                   |
|          8 |    NULL | NULL                   |
|         10 |    NULL | NULL                   |
|         11 |    NULL | NULL                   |
|         12 |    NULL | NULL                   |
|         13 |    NULL | NULL                   |
|         14 |    NULL | NULL                   |
|         15 |    NULL | NULL                   |
|         17 |    NULL | NULL                   |
|         18 |    NULL | NULL                   |
|         19 |    NULL | NULL                   |
|         21 |    NULL | NULL                   |
|         22 |    NULL | NULL                   |
|         23 |    NULL | NULL                   |
|         24 |      10 | Chilton Engineering    |
|         25 |      10 | Chilton Engineering    |
|         27 |      11 | Northeast Cooling Inc. |
|         28 |      12 | Superior Auto Body     |
|         29 |      13 | AAA Insurance Inc.     |
+------------+---------+------------------------+
24 rows in set (0.00 sec)

mysql> SELECT a.account_id, a.cust_id, b.name
    -> FROM account a LEFT OUTER JOIN business b
    -> ON a.cust_id = b.cust_id;
+------------+---------+------------------------+
| account_id | cust_id | name                   |
+------------+---------+------------------------+
|          1 |       1 | NULL                   |
|          2 |       1 | NULL                   |
|          3 |       1 | NULL                   |
|          4 |       2 | NULL                   |
|          5 |       2 | NULL                   |
|          7 |       3 | NULL                   |
|          8 |       3 | NULL                   |
|         10 |       4 | NULL                   |
|         11 |       4 | NULL                   |
|         12 |       4 | NULL                   |
|         13 |       5 | NULL                   |
|         14 |       6 | NULL                   |
|         15 |       6 | NULL                   |
|         17 |       7 | NULL                   |
|         18 |       8 | NULL                   |
|         19 |       8 | NULL                   |
|         21 |       9 | NULL                   |
|         22 |       9 | NULL                   |
|         23 |       9 | NULL                   |
|         24 |      10 | Chilton Engineering    |
|         25 |      10 | Chilton Engineering    |
|         27 |      11 | Northeast Cooling Inc. |
|         28 |      12 | Superior Auto Body     |
|         29 |      13 | AAA Insurance Inc.     |
+------------+---------+------------------------+
24 rows in set (0.00 sec)

mysql> SELECT a.account_id, a.cust_id, i.fname, i.lname
    -> FROM account a LEFT OUTER JOIN individual i
    -> ON a.cust_id = i.cust_id;
+------------+---------+----------+---------+
| account_id | cust_id | fname    | lname   |
+------------+---------+----------+---------+
|          1 |       1 | James    | Hadley  |
|          2 |       1 | James    | Hadley  |
|          3 |       1 | James    | Hadley  |
|          4 |       2 | Susan    | Tingley |
|          5 |       2 | Susan    | Tingley |
|          7 |       3 | Frank    | Tucker  |
|          8 |       3 | Frank    | Tucker  |
|         10 |       4 | John     | Hayward |
|         11 |       4 | John     | Hayward |
|         12 |       4 | John     | Hayward |
|         13 |       5 | Charles  | Frasier |
|         14 |       6 | John     | Spencer |
|         15 |       6 | John     | Spencer |
|         17 |       7 | Margaret | Young   |
|         18 |       8 | Louis    | Blake   |
|         19 |       8 | Louis    | Blake   |
|         21 |       9 | Richard  | Farley  |
|         22 |       9 | Richard  | Farley  |
|         23 |       9 | Richard  | Farley  |
|         24 |      10 | NULL     | NULL    |
|         25 |      10 | NULL     | NULL    |
|         27 |      11 | NULL     | NULL    |
|         28 |      12 | NULL     | NULL    |
|         29 |      13 | NULL     | NULL    |
+------------+---------+----------+---------+
24 rows in set (0.00 sec)

mysql> SELECT c.cust_id, b.name
    -> FROM customer c LEFT OUTER JOIN business b
    -> ON c.cust_id = b.cust_id;
+---------+------------------------+
| cust_id | name                   |
+---------+------------------------+
|       1 | NULL                   |
|       2 | NULL                   |
|       3 | NULL                   |
|       4 | NULL                   |
|       5 | NULL                   |
|       6 | NULL                   |
|       7 | NULL                   |
|       8 | NULL                   |
|       9 | NULL                   |
|      10 | Chilton Engineering    |
|      11 | Northeast Cooling Inc. |
|      12 | Superior Auto Body     |
|      13 | AAA Insurance Inc.     |
+---------+------------------------+
13 rows in set (0.00 sec)

mysql> SELECT c.cust_id, b.name
    -> FROM customer c RIGHT OUTER JOIN business b
    -> ON c.cust_id = b.cust_id;
+---------+------------------------+
| cust_id | name                   |
+---------+------------------------+
|      10 | Chilton Engineering    |
|      11 | Northeast Cooling Inc. |
|      12 | Superior Auto Body     |
|      13 | AAA Insurance Inc.     |
+---------+------------------------+
4 rows in set (0.00 sec)

mysql> SELECT a.account_id, a.product_cd,
    -> CONCAT(i.fname, ' ', i.lname) person_name,
    -> b.name business_name
    -> FROM account a LEFT OUTER JOIN individual i
    -> ON a.cust_id = i.cust_id
    -> LEFT OUTER JOIN business b
    -> ON a.cust_id = b.cust_id;
+------------+------------+-----------------+------------------------+
| account_id | product_cd | person_name     | business_name          |
+------------+------------+-----------------+------------------------+
|          1 | CHK        | James Hadley    | NULL                   |
|          2 | SAV        | James Hadley    | NULL                   |
|          3 | CD         | James Hadley    | NULL                   |
|          4 | CHK        | Susan Tingley   | NULL                   |
|          5 | SAV        | Susan Tingley   | NULL                   |
|          7 | CHK        | Frank Tucker    | NULL                   |
|          8 | MM         | Frank Tucker    | NULL                   |
|         10 | CHK        | John Hayward    | NULL                   |
|         11 | SAV        | John Hayward    | NULL                   |
|         12 | MM         | John Hayward    | NULL                   |
|         13 | CHK        | Charles Frasier | NULL                   |
|         14 | CHK        | John Spencer    | NULL                   |
|         15 | CD         | John Spencer    | NULL                   |
|         17 | CD         | Margaret Young  | NULL                   |
|         18 | CHK        | Louis Blake     | NULL                   |
|         19 | SAV        | Louis Blake     | NULL                   |
|         21 | CHK        | Richard Farley  | NULL                   |
|         22 | MM         | Richard Farley  | NULL                   |
|         23 | CD         | Richard Farley  | NULL                   |
|         24 | CHK        | NULL            | Chilton Engineering    |
|         25 | BUS        | NULL            | Chilton Engineering    |
|         27 | BUS        | NULL            | Northeast Cooling Inc. |
|         28 | CHK        | NULL            | Superior Auto Body     |
|         29 | SBL        | NULL            | AAA Insurance Inc.     |
+------------+------------+-----------------+------------------------+
24 rows in set (0.00 sec)

mysql> SELECT account_ind.account_id, account_ind.product_cd,
    -> account_ind.person_name,
    -> b.name business_name
    -> FROM
    -> (SELECT a.account_id, a.product_cd, a.cust_id,
    -> CONCAT(i.fname, ' ', i.lname) person_name
    -> FROM account a LEFT OUTER JOIN individual i
    -> ON a.cust_id = i.cust_id) account_ind
    -> LEFT OUTER JOIN business b
    -> ON account_ind.cust_id = b.cust_id;
+------------+------------+-----------------+------------------------+
| account_id | product_cd | person_name     | business_name          |
+------------+------------+-----------------+------------------------+
|          1 | CHK        | James Hadley    | NULL                   |
|          2 | SAV        | James Hadley    | NULL                   |
|          3 | CD         | James Hadley    | NULL                   |
|          4 | CHK        | Susan Tingley   | NULL                   |
|          5 | SAV        | Susan Tingley   | NULL                   |
|          7 | CHK        | Frank Tucker    | NULL                   |
|          8 | MM         | Frank Tucker    | NULL                   |
|         10 | CHK        | John Hayward    | NULL                   |
|         11 | SAV        | John Hayward    | NULL                   |
|         12 | MM         | John Hayward    | NULL                   |
|         13 | CHK        | Charles Frasier | NULL                   |
|         14 | CHK        | John Spencer    | NULL                   |
|         15 | CD         | John Spencer    | NULL                   |
|         17 | CD         | Margaret Young  | NULL                   |
|         18 | CHK        | Louis Blake     | NULL                   |
|         19 | SAV        | Louis Blake     | NULL                   |
|         21 | CHK        | Richard Farley  | NULL                   |
|         22 | MM         | Richard Farley  | NULL                   |
|         23 | CD         | Richard Farley  | NULL                   |
|         24 | CHK        | NULL            | Chilton Engineering    |
|         25 | BUS        | NULL            | Chilton Engineering    |
|         27 | BUS        | NULL            | Northeast Cooling Inc. |
|         28 | CHK        | NULL            | Superior Auto Body     |
|         29 | SBL        | NULL            | AAA Insurance Inc.     |
+------------+------------+-----------------+------------------------+
24 rows in set (0.00 sec)

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

mysql> SELECT e.fname, e.lname,
    -> e_mgr.fname mgr_fname, e_mgr.lname mgr_lname
    -> FROM employee e LEFT OUTER JOIN employee e_mgr
    -> ON e.superior_emp_id = e_mgr.emp_id;
+----------+-----------+-----------+-----------+
| fname    | lname     | mgr_fname | mgr_lname |
+----------+-----------+-----------+-----------+
| Michael  | Smith     | NULL      | NULL      |
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
18 rows in set (0.00 sec)

mysql> SELECT e.fname, e.lname,
    -> e_mgr.fname mgr_fname, e_mgr.lname mgr_lname
    -> FROM employee e RIGHT OUTER JOIN employee e_mgr
    -> ON e.superior_emp_id = e_mgr.emp_id;
+----------+-----------+-----------+-----------+
| fname    | lname     | mgr_fname | mgr_lname |
+----------+-----------+-----------+-----------+
| Susan    | Barker    | Michael   | Smith     |
| Robert   | Tyler     | Michael   | Smith     |
| NULL     | NULL      | Susan     | Barker    |
| Susan    | Hawthorne | Robert    | Tyler     |
| John     | Gooding   | Susan     | Hawthorne |
| Helen    | Fleming   | Susan     | Hawthorne |
| Paula    | Roberts   | Susan     | Hawthorne |
| John     | Blake     | Susan     | Hawthorne |
| Theresa  | Markham   | Susan     | Hawthorne |
| NULL     | NULL      | John      | Gooding   |
| Chris    | Tucker    | Helen     | Fleming   |
| Sarah    | Parker    | Helen     | Fleming   |
| Jane     | Grossman  | Helen     | Fleming   |
| NULL     | NULL      | Chris     | Tucker    |
| NULL     | NULL      | Sarah     | Parker    |
| NULL     | NULL      | Jane      | Grossman  |
| Thomas   | Ziegler   | Paula     | Roberts   |
| Samantha | Jameson   | Paula     | Roberts   |
| NULL     | NULL      | Thomas    | Ziegler   |
| NULL     | NULL      | Samantha  | Jameson   |
| Cindy    | Mason     | John      | Blake     |
| Frank    | Portman   | John      | Blake     |
| NULL     | NULL      | Cindy     | Mason     |
| NULL     | NULL      | Frank     | Portman   |
| Beth     | Fowler    | Theresa   | Markham   |
| Rick     | Tulman    | Theresa   | Markham   |
| NULL     | NULL      | Beth      | Fowler    |
| NULL     | NULL      | Rick      | Tulman    |
+----------+-----------+-----------+-----------+
28 rows in set (0.00 sec)

mysql> SELECT pt.name, p.product_cd, p.name
    -> FROM product p CROSS JOIN product_type pt;
+-------------------------------+------------+-------------------------+
| name                          | product_cd | name                    |
+-------------------------------+------------+-------------------------+
| Individual and Business Loans | AUT        | auto loan               |
| Insurance Offerings           | AUT        | auto loan               |
| Customer Accounts             | AUT        | auto loan               |
| Individual and Business Loans | BUS        | business line of credit |
| Insurance Offerings           | BUS        | business line of credit |
| Customer Accounts             | BUS        | business line of credit |
| Individual and Business Loans | CD         | certificate of deposit  |
| Insurance Offerings           | CD         | certificate of deposit  |
| Customer Accounts             | CD         | certificate of deposit  |
| Individual and Business Loans | CHK        | checking account        |
| Insurance Offerings           | CHK        | checking account        |
| Customer Accounts             | CHK        | checking account        |
| Individual and Business Loans | MM         | money market account    |
| Insurance Offerings           | MM         | money market account    |
| Customer Accounts             | MM         | money market account    |
| Individual and Business Loans | MRT        | home mortgage           |
| Insurance Offerings           | MRT        | home mortgage           |
| Customer Accounts             | MRT        | home mortgage           |
| Individual and Business Loans | SAV        | savings account         |
| Insurance Offerings           | SAV        | savings account         |
| Customer Accounts             | SAV        | savings account         |
| Individual and Business Loans | SBL        | small business loan     |
| Insurance Offerings           | SBL        | small business loan     |
| Customer Accounts             | SBL        | small business loan     |
+-------------------------------+------------+-------------------------+
24 rows in set (0.00 sec)

mysql> SELECT 'Small Fry' name, 0 low_limit, 4999.99 high_limit
    -> UNION ALL
    -> SELECT 'Average Joes' name, 5000 low_limit, 9999.99 high_limit
    -> UNION ALL
    -> SELECT 'Heavy Hitters' name, 10000 low_limit, 9999999.99 high_limit;
+---------------+-----------+------------+
| name          | low_limit | high_limit |
+---------------+-----------+------------+
| Small Fry     |         0 |    4999.99 |
| Average Joes  |      5000 |    9999.99 |
| Heavy Hitters |     10000 | 9999999.99 |
+---------------+-----------+------------+
3 rows in set (0.00 sec)

mysql> SELECT ones.num + tens.num + hundreds.num
    -> FROM
    -> (SELECT 0 num UNION ALL
    -> SELECT 1 num UNION ALL
    -> SELECT 2 num UNION ALL
    -> SELECT 3 num UNION ALL
    -> SELECT 4 num UNION ALL
    -> SELECT 5 num UNION ALL
    -> SELECT 6 num UNION ALL
    -> SELECT 7 num UNION ALL
    -> SELECT 8 num UNION ALL
    -> SELECT 9 num) ones
    -> CROSS JOIN
    -> (SELECT 0 num UNION ALL
    -> SELECT 10 num UNION ALL
    -> SELECT 20 num UNION ALL
    -> SELECT 30 num UNION ALL
    -> SELECT 40 num UNION ALL
    -> SELECT 50 num UNION ALL
    -> SELECT 60 num UNION ALL
    -> SELECT 70 num UNION ALL
    -> SELECT 80 num UNION ALL
    -> SELECT 90 num) tens
    -> CROSS JOIN
    -> (SELECT 0 num UNION ALL
    -> SELECT 100 num UNION ALL
    -> SELECT 200 num UNION ALL
    -> SELECT 300 num) hundreds;
+------------------------------------+
| ones.num + tens.num + hundreds.num |
+------------------------------------+
|                                  9 |
|                                109 |
|                                209 |
|                                309 |
|                                  8 |
|                                108 |
|                                208 |
|                                308 |
|                                  7 |
|                                107 |
|                                207 |
|                                307 |
|                                  6 |
|                                106 |
|                                206 |
|                                306 |
|                                  5 |
|                                105 |
|                                205 |
|                                305 |
|                                  4 |
|                                104 |
|                                204 |
|                                304 |
|                                  3 |
|                                103 |
|                                203 |
|                                303 |
|                                  2 |
|                                102 |
|                                202 |
|                                302 |
|                                  1 |
|                                101 |
|                                201 |
|                                301 |
|                                  0 |
|                                100 |
|                                200 |
|                                300 |
|                                 19 |
|                                119 |
|                                219 |
|                                319 |
|                                 18 |
|                                118 |
|                                218 |
|                                318 |
|                                 17 |
|                                117 |
|                                217 |
|                                317 |
|                                 16 |
|                                116 |
|                                216 |
|                                316 |
|                                 15 |
|                                115 |
|                                215 |
|                                315 |
|                                 14 |
|                                114 |
|                                214 |
|                                314 |
|                                 13 |
|                                113 |
|                                213 |
|                                313 |
|                                 12 |
|                                112 |
|                                212 |
|                                312 |
|                                 11 |
|                                111 |
|                                211 |
|                                311 |
|                                 10 |
|                                110 |
|                                210 |
|                                310 |
|                                 29 |
|                                129 |
|                                229 |
|                                329 |
|                                 28 |
|                                128 |
|                                228 |
|                                328 |
|                                 27 |
|                                127 |
|                                227 |
|                                327 |
|                                 26 |
|                                126 |
|                                226 |
|                                326 |
|                                 25 |
|                                125 |
|                                225 |
|                                325 |
|                                 24 |
|                                124 |
|                                224 |
|                                324 |
|                                 23 |
|                                123 |
|                                223 |
|                                323 |
|                                 22 |
|                                122 |
|                                222 |
|                                322 |
|                                 21 |
|                                121 |
|                                221 |
|                                321 |
|                                 20 |
|                                120 |
|                                220 |
|                                320 |
|                                 39 |
|                                139 |
|                                239 |
|                                339 |
|                                 38 |
|                                138 |
|                                238 |
|                                338 |
|                                 37 |
|                                137 |
|                                237 |
|                                337 |
|                                 36 |
|                                136 |
|                                236 |
|                                336 |
|                                 35 |
|                                135 |
|                                235 |
|                                335 |
|                                 34 |
|                                134 |
|                                234 |
|                                334 |
|                                 33 |
|                                133 |
|                                233 |
|                                333 |
|                                 32 |
|                                132 |
|                                232 |
|                                332 |
|                                 31 |
|                                131 |
|                                231 |
|                                331 |
|                                 30 |
|                                130 |
|                                230 |
|                                330 |
|                                 49 |
|                                149 |
|                                249 |
|                                349 |
|                                 48 |
|                                148 |
|                                248 |
|                                348 |
|                                 47 |
|                                147 |
|                                247 |
|                                347 |
|                                 46 |
|                                146 |
|                                246 |
|                                346 |
|                                 45 |
|                                145 |
|                                245 |
|                                345 |
|                                 44 |
|                                144 |
|                                244 |
|                                344 |
|                                 43 |
|                                143 |
|                                243 |
|                                343 |
|                                 42 |
|                                142 |
|                                242 |
|                                342 |
|                                 41 |
|                                141 |
|                                241 |
|                                341 |
|                                 40 |
|                                140 |
|                                240 |
|                                340 |
|                                 59 |
|                                159 |
|                                259 |
|                                359 |
|                                 58 |
|                                158 |
|                                258 |
|                                358 |
|                                 57 |
|                                157 |
|                                257 |
|                                357 |
|                                 56 |
|                                156 |
|                                256 |
|                                356 |
|                                 55 |
|                                155 |
|                                255 |
|                                355 |
|                                 54 |
|                                154 |
|                                254 |
|                                354 |
|                                 53 |
|                                153 |
|                                253 |
|                                353 |
|                                 52 |
|                                152 |
|                                252 |
|                                352 |
|                                 51 |
|                                151 |
|                                251 |
|                                351 |
|                                 50 |
|                                150 |
|                                250 |
|                                350 |
|                                 69 |
|                                169 |
|                                269 |
|                                369 |
|                                 68 |
|                                168 |
|                                268 |
|                                368 |
|                                 67 |
|                                167 |
|                                267 |
|                                367 |
|                                 66 |
|                                166 |
|                                266 |
|                                366 |
|                                 65 |
|                                165 |
|                                265 |
|                                365 |
|                                 64 |
|                                164 |
|                                264 |
|                                364 |
|                                 63 |
|                                163 |
|                                263 |
|                                363 |
|                                 62 |
|                                162 |
|                                262 |
|                                362 |
|                                 61 |
|                                161 |
|                                261 |
|                                361 |
|                                 60 |
|                                160 |
|                                260 |
|                                360 |
|                                 79 |
|                                179 |
|                                279 |
|                                379 |
|                                 78 |
|                                178 |
|                                278 |
|                                378 |
|                                 77 |
|                                177 |
|                                277 |
|                                377 |
|                                 76 |
|                                176 |
|                                276 |
|                                376 |
|                                 75 |
|                                175 |
|                                275 |
|                                375 |
|                                 74 |
|                                174 |
|                                274 |
|                                374 |
|                                 73 |
|                                173 |
|                                273 |
|                                373 |
|                                 72 |
|                                172 |
|                                272 |
|                                372 |
|                                 71 |
|                                171 |
|                                271 |
|                                371 |
|                                 70 |
|                                170 |
|                                270 |
|                                370 |
|                                 89 |
|                                189 |
|                                289 |
|                                389 |
|                                 88 |
|                                188 |
|                                288 |
|                                388 |
|                                 87 |
|                                187 |
|                                287 |
|                                387 |
|                                 86 |
|                                186 |
|                                286 |
|                                386 |
|                                 85 |
|                                185 |
|                                285 |
|                                385 |
|                                 84 |
|                                184 |
|                                284 |
|                                384 |
|                                 83 |
|                                183 |
|                                283 |
|                                383 |
|                                 82 |
|                                182 |
|                                282 |
|                                382 |
|                                 81 |
|                                181 |
|                                281 |
|                                381 |
|                                 80 |
|                                180 |
|                                280 |
|                                380 |
|                                 99 |
|                                199 |
|                                299 |
|                                399 |
|                                 98 |
|                                198 |
|                                298 |
|                                398 |
|                                 97 |
|                                197 |
|                                297 |
|                                397 |
|                                 96 |
|                                196 |
|                                296 |
|                                396 |
|                                 95 |
|                                195 |
|                                295 |
|                                395 |
|                                 94 |
|                                194 |
|                                294 |
|                                394 |
|                                 93 |
|                                193 |
|                                293 |
|                                393 |
|                                 92 |
|                                192 |
|                                292 |
|                                392 |
|                                 91 |
|                                191 |
|                                291 |
|                                391 |
|                                 90 |
|                                190 |
|                                290 |
|                                390 |
+------------------------------------+
400 rows in set (0.00 sec)

mysql> SELECT DATE_ADD('2004-01-01',
    -> INTERVAL (ones.num + tens.num + hundreds.num) DAY) dt
    -> FROM
    -> (SELECT 0 num UNION ALL
    -> SELECT 1 num UNION ALL
    -> SELECT 2 num UNION ALL
    -> SELECT 3 num UNION ALL
    -> SELECT 4 num UNION ALL
    -> SELECT 5 num UNION ALL
    -> SELECT 6 num UNION ALL
    -> SELECT 7 num UNION ALL
    -> SELECT 8 num UNION ALL
    -> SELECT 9 num) ones
    -> CROSS JOIN
    -> (SELECT 0 num UNION ALL
    -> SELECT 10 num UNION ALL
    -> SELECT 20 num UNION ALL
    -> SELECT 30 num UNION ALL
    -> SELECT 40 num UNION ALL
    -> SELECT 50 num UNION ALL
    -> SELECT 60 num UNION ALL
    -> SELECT 70 num UNION ALL
    -> SELECT 80 num UNION ALL
    -> SELECT 90 num) tens
    -> CROSS JOIN
    -> (SELECT 0 num UNION ALL
    -> SELECT 100 num UNION ALL
    -> SELECT 200 num UNION ALL
    -> SELECT 300 num) hundreds;
+------------+
| dt         |
+------------+
| 2004-01-10 |
| 2004-04-19 |
| 2004-07-28 |
| 2004-11-05 |
| 2004-01-09 |
| 2004-04-18 |
| 2004-07-27 |
| 2004-11-04 |
| 2004-01-08 |
| 2004-04-17 |
| 2004-07-26 |
| 2004-11-03 |
| 2004-01-07 |
| 2004-04-16 |
| 2004-07-25 |
| 2004-11-02 |
| 2004-01-06 |
| 2004-04-15 |
| 2004-07-24 |
| 2004-11-01 |
| 2004-01-05 |
| 2004-04-14 |
| 2004-07-23 |
| 2004-10-31 |
| 2004-01-04 |
| 2004-04-13 |
| 2004-07-22 |
| 2004-10-30 |
| 2004-01-03 |
| 2004-04-12 |
| 2004-07-21 |
| 2004-10-29 |
| 2004-01-02 |
| 2004-04-11 |
| 2004-07-20 |
| 2004-10-28 |
| 2004-01-01 |
| 2004-04-10 |
| 2004-07-19 |
| 2004-10-27 |
| 2004-01-20 |
| 2004-04-29 |
| 2004-08-07 |
| 2004-11-15 |
| 2004-01-19 |
| 2004-04-28 |
| 2004-08-06 |
| 2004-11-14 |
| 2004-01-18 |
| 2004-04-27 |
| 2004-08-05 |
| 2004-11-13 |
| 2004-01-17 |
| 2004-04-26 |
| 2004-08-04 |
| 2004-11-12 |
| 2004-01-16 |
| 2004-04-25 |
| 2004-08-03 |
| 2004-11-11 |
| 2004-01-15 |
| 2004-04-24 |
| 2004-08-02 |
| 2004-11-10 |
| 2004-01-14 |
| 2004-04-23 |
| 2004-08-01 |
| 2004-11-09 |
| 2004-01-13 |
| 2004-04-22 |
| 2004-07-31 |
| 2004-11-08 |
| 2004-01-12 |
| 2004-04-21 |
| 2004-07-30 |
| 2004-11-07 |
| 2004-01-11 |
| 2004-04-20 |
| 2004-07-29 |
| 2004-11-06 |
| 2004-01-30 |
| 2004-05-09 |
| 2004-08-17 |
| 2004-11-25 |
| 2004-01-29 |
| 2004-05-08 |
| 2004-08-16 |
| 2004-11-24 |
| 2004-01-28 |
| 2004-05-07 |
| 2004-08-15 |
| 2004-11-23 |
| 2004-01-27 |
| 2004-05-06 |
| 2004-08-14 |
| 2004-11-22 |
| 2004-01-26 |
| 2004-05-05 |
| 2004-08-13 |
| 2004-11-21 |
| 2004-01-25 |
| 2004-05-04 |
| 2004-08-12 |
| 2004-11-20 |
| 2004-01-24 |
| 2004-05-03 |
| 2004-08-11 |
| 2004-11-19 |
| 2004-01-23 |
| 2004-05-02 |
| 2004-08-10 |
| 2004-11-18 |
| 2004-01-22 |
| 2004-05-01 |
| 2004-08-09 |
| 2004-11-17 |
| 2004-01-21 |
| 2004-04-30 |
| 2004-08-08 |
| 2004-11-16 |
| 2004-02-09 |
| 2004-05-19 |
| 2004-08-27 |
| 2004-12-05 |
| 2004-02-08 |
| 2004-05-18 |
| 2004-08-26 |
| 2004-12-04 |
| 2004-02-07 |
| 2004-05-17 |
| 2004-08-25 |
| 2004-12-03 |
| 2004-02-06 |
| 2004-05-16 |
| 2004-08-24 |
| 2004-12-02 |
| 2004-02-05 |
| 2004-05-15 |
| 2004-08-23 |
| 2004-12-01 |
| 2004-02-04 |
| 2004-05-14 |
| 2004-08-22 |
| 2004-11-30 |
| 2004-02-03 |
| 2004-05-13 |
| 2004-08-21 |
| 2004-11-29 |
| 2004-02-02 |
| 2004-05-12 |
| 2004-08-20 |
| 2004-11-28 |
| 2004-02-01 |
| 2004-05-11 |
| 2004-08-19 |
| 2004-11-27 |
| 2004-01-31 |
| 2004-05-10 |
| 2004-08-18 |
| 2004-11-26 |
| 2004-02-19 |
| 2004-05-29 |
| 2004-09-06 |
| 2004-12-15 |
| 2004-02-18 |
| 2004-05-28 |
| 2004-09-05 |
| 2004-12-14 |
| 2004-02-17 |
| 2004-05-27 |
| 2004-09-04 |
| 2004-12-13 |
| 2004-02-16 |
| 2004-05-26 |
| 2004-09-03 |
| 2004-12-12 |
| 2004-02-15 |
| 2004-05-25 |
| 2004-09-02 |
| 2004-12-11 |
| 2004-02-14 |
| 2004-05-24 |
| 2004-09-01 |
| 2004-12-10 |
| 2004-02-13 |
| 2004-05-23 |
| 2004-08-31 |
| 2004-12-09 |
| 2004-02-12 |
| 2004-05-22 |
| 2004-08-30 |
| 2004-12-08 |
| 2004-02-11 |
| 2004-05-21 |
| 2004-08-29 |
| 2004-12-07 |
| 2004-02-10 |
| 2004-05-20 |
| 2004-08-28 |
| 2004-12-06 |
| 2004-02-29 |
| 2004-06-08 |
| 2004-09-16 |
| 2004-12-25 |
| 2004-02-28 |
| 2004-06-07 |
| 2004-09-15 |
| 2004-12-24 |
| 2004-02-27 |
| 2004-06-06 |
| 2004-09-14 |
| 2004-12-23 |
| 2004-02-26 |
| 2004-06-05 |
| 2004-09-13 |
| 2004-12-22 |
| 2004-02-25 |
| 2004-06-04 |
| 2004-09-12 |
| 2004-12-21 |
| 2004-02-24 |
| 2004-06-03 |
| 2004-09-11 |
| 2004-12-20 |
| 2004-02-23 |
| 2004-06-02 |
| 2004-09-10 |
| 2004-12-19 |
| 2004-02-22 |
| 2004-06-01 |
| 2004-09-09 |
| 2004-12-18 |
| 2004-02-21 |
| 2004-05-31 |
| 2004-09-08 |
| 2004-12-17 |
| 2004-02-20 |
| 2004-05-30 |
| 2004-09-07 |
| 2004-12-16 |
| 2004-03-10 |
| 2004-06-18 |
| 2004-09-26 |
| 2005-01-04 |
| 2004-03-09 |
| 2004-06-17 |
| 2004-09-25 |
| 2005-01-03 |
| 2004-03-08 |
| 2004-06-16 |
| 2004-09-24 |
| 2005-01-02 |
| 2004-03-07 |
| 2004-06-15 |
| 2004-09-23 |
| 2005-01-01 |
| 2004-03-06 |
| 2004-06-14 |
| 2004-09-22 |
| 2004-12-31 |
| 2004-03-05 |
| 2004-06-13 |
| 2004-09-21 |
| 2004-12-30 |
| 2004-03-04 |
| 2004-06-12 |
| 2004-09-20 |
| 2004-12-29 |
| 2004-03-03 |
| 2004-06-11 |
| 2004-09-19 |
| 2004-12-28 |
| 2004-03-02 |
| 2004-06-10 |
| 2004-09-18 |
| 2004-12-27 |
| 2004-03-01 |
| 2004-06-09 |
| 2004-09-17 |
| 2004-12-26 |
| 2004-03-20 |
| 2004-06-28 |
| 2004-10-06 |
| 2005-01-14 |
| 2004-03-19 |
| 2004-06-27 |
| 2004-10-05 |
| 2005-01-13 |
| 2004-03-18 |
| 2004-06-26 |
| 2004-10-04 |
| 2005-01-12 |
| 2004-03-17 |
| 2004-06-25 |
| 2004-10-03 |
| 2005-01-11 |
| 2004-03-16 |
| 2004-06-24 |
| 2004-10-02 |
| 2005-01-10 |
| 2004-03-15 |
| 2004-06-23 |
| 2004-10-01 |
| 2005-01-09 |
| 2004-03-14 |
| 2004-06-22 |
| 2004-09-30 |
| 2005-01-08 |
| 2004-03-13 |
| 2004-06-21 |
| 2004-09-29 |
| 2005-01-07 |
| 2004-03-12 |
| 2004-06-20 |
| 2004-09-28 |
| 2005-01-06 |
| 2004-03-11 |
| 2004-06-19 |
| 2004-09-27 |
| 2005-01-05 |
| 2004-03-30 |
| 2004-07-08 |
| 2004-10-16 |
| 2005-01-24 |
| 2004-03-29 |
| 2004-07-07 |
| 2004-10-15 |
| 2005-01-23 |
| 2004-03-28 |
| 2004-07-06 |
| 2004-10-14 |
| 2005-01-22 |
| 2004-03-27 |
| 2004-07-05 |
| 2004-10-13 |
| 2005-01-21 |
| 2004-03-26 |
| 2004-07-04 |
| 2004-10-12 |
| 2005-01-20 |
| 2004-03-25 |
| 2004-07-03 |
| 2004-10-11 |
| 2005-01-19 |
| 2004-03-24 |
| 2004-07-02 |
| 2004-10-10 |
| 2005-01-18 |
| 2004-03-23 |
| 2004-07-01 |
| 2004-10-09 |
| 2005-01-17 |
| 2004-03-22 |
| 2004-06-30 |
| 2004-10-08 |
| 2005-01-16 |
| 2004-03-21 |
| 2004-06-29 |
| 2004-10-07 |
| 2005-01-15 |
| 2004-04-09 |
| 2004-07-18 |
| 2004-10-26 |
| 2005-02-03 |
| 2004-04-08 |
| 2004-07-17 |
| 2004-10-25 |
| 2005-02-02 |
| 2004-04-07 |
| 2004-07-16 |
| 2004-10-24 |
| 2005-02-01 |
| 2004-04-06 |
| 2004-07-15 |
| 2004-10-23 |
| 2005-01-31 |
| 2004-04-05 |
| 2004-07-14 |
| 2004-10-22 |
| 2005-01-30 |
| 2004-04-04 |
| 2004-07-13 |
| 2004-10-21 |
| 2005-01-29 |
| 2004-04-03 |
| 2004-07-12 |
| 2004-10-20 |
| 2005-01-28 |
| 2004-04-02 |
| 2004-07-11 |
| 2004-10-19 |
| 2005-01-27 |
| 2004-04-01 |
| 2004-07-10 |
| 2004-10-18 |
| 2005-01-26 |
| 2004-03-31 |
| 2004-07-09 |
| 2004-10-17 |
| 2005-01-25 |
+------------+
400 rows in set (0.00 sec)

mysql> SELECT days.dt, COUNT(a.account_id)
    -> FROM account a RIGHT OUTER JOIN
    -> (SELECT DATE_ADD('2004-01-01',
    -> INTERVAL (ones.num + tens.num + hundreds.num) DAY) dt
    -> FROM
    -> (SELECT 0 num UNION ALL
    -> SELECT 1 num UNION ALL
    -> SELECT 2 num UNION ALL
    -> SELECT 3 num UNION ALL
    -> SELECT 4 num UNION ALL
    -> SELECT 5 num UNION ALL
    -> SELECT 6 num UNION ALL
    -> SELECT 7 num UNION ALL
    -> SELECT 8 num UNION ALL
    -> SELECT 9 num) ones
    -> CROSS JOIN
    -> (SELECT 0 num UNION ALL
    -> SELECT 10 num UNION ALL
    -> SELECT 20 num UNION ALL
    -> SELECT 30 num UNION ALL
    -> SELECT 40 num UNION ALL
    -> SELECT 50 num UNION ALL
    -> SELECT 60 num UNION ALL
    -> SELECT 70 num UNION ALL
    -> SELECT 80 num UNION ALL
    -> SELECT 90 num) tens
    -> CROSS JOIN
    -> (SELECT 0 num UNION ALL
    -> SELECT 100 num UNION ALL
    -> SELECT 200 num UNION ALL
    -> SELECT 300 num) hundreds
    -> WHERE DATE_ADD('2004-01-01',
    -> INTERVAL (ones.num + tens.num + hundreds.num) DAY) <
    -> '2005-01-01') days
    -> ON days.dt = a.open_date
    -> GROUP BY days.dt;
+------------+---------------------+
| dt         | COUNT(a.account_id) |
+------------+---------------------+
| 2004-01-10 |                   0 |
| 2004-04-19 |                   0 |
| 2004-07-28 |                   0 |
| 2004-11-05 |                   0 |
| 2004-01-09 |                   0 |
| 2004-04-18 |                   0 |
| 2004-07-27 |                   0 |
| 2004-11-04 |                   0 |
| 2004-01-08 |                   0 |
| 2004-04-17 |                   0 |
| 2004-07-26 |                   0 |
| 2004-11-03 |                   0 |
| 2004-01-07 |                   0 |
| 2004-04-16 |                   0 |
| 2004-07-25 |                   0 |
| 2004-11-02 |                   0 |
| 2004-01-06 |                   0 |
| 2004-04-15 |                   0 |
| 2004-07-24 |                   0 |
| 2004-11-01 |                   0 |
| 2004-01-05 |                   0 |
| 2004-04-14 |                   0 |
| 2004-07-23 |                   0 |
| 2004-10-31 |                   0 |
| 2004-01-04 |                   0 |
| 2004-04-13 |                   0 |
| 2004-07-22 |                   0 |
| 2004-10-30 |                   0 |
| 2004-01-03 |                   0 |
| 2004-04-12 |                   0 |
| 2004-07-21 |                   0 |
| 2004-10-29 |                   0 |
| 2004-01-02 |                   0 |
| 2004-04-11 |                   0 |
| 2004-07-20 |                   0 |
| 2004-10-28 |                   1 |
| 2004-01-01 |                   0 |
| 2004-04-10 |                   0 |
| 2004-07-19 |                   0 |
| 2004-10-27 |                   0 |
| 2004-01-20 |                   0 |
| 2004-04-29 |                   0 |
| 2004-08-07 |                   0 |
| 2004-11-15 |                   0 |
| 2004-01-19 |                   0 |
| 2004-04-28 |                   0 |
| 2004-08-06 |                   0 |
| 2004-11-14 |                   0 |
| 2004-01-18 |                   0 |
| 2004-04-27 |                   0 |
| 2004-08-05 |                   0 |
| 2004-11-13 |                   0 |
| 2004-01-17 |                   0 |
| 2004-04-26 |                   0 |
| 2004-08-04 |                   0 |
| 2004-11-12 |                   0 |
| 2004-01-16 |                   0 |
| 2004-04-25 |                   0 |
| 2004-08-03 |                   0 |
| 2004-11-11 |                   0 |
| 2004-01-15 |                   0 |
| 2004-04-24 |                   0 |
| 2004-08-02 |                   0 |
| 2004-11-10 |                   0 |
| 2004-01-14 |                   0 |
| 2004-04-23 |                   0 |
| 2004-08-01 |                   0 |
| 2004-11-09 |                   0 |
| 2004-01-13 |                   0 |
| 2004-04-22 |                   0 |
| 2004-07-31 |                   0 |
| 2004-11-08 |                   0 |
| 2004-01-12 |                   1 |
| 2004-04-21 |                   0 |
| 2004-07-30 |                   0 |
| 2004-11-07 |                   0 |
| 2004-01-11 |                   0 |
| 2004-04-20 |                   0 |
| 2004-07-29 |                   0 |
| 2004-11-06 |                   0 |
| 2004-01-30 |                   0 |
| 2004-05-09 |                   0 |
| 2004-08-17 |                   0 |
| 2004-11-25 |                   0 |
| 2004-01-29 |                   0 |
| 2004-05-08 |                   0 |
| 2004-08-16 |                   0 |
| 2004-11-24 |                   0 |
| 2004-01-28 |                   0 |
| 2004-05-07 |                   0 |
| 2004-08-15 |                   0 |
| 2004-11-23 |                   0 |
| 2004-01-27 |                   1 |
| 2004-05-06 |                   0 |
| 2004-08-14 |                   0 |
| 2004-11-22 |                   0 |
| 2004-01-26 |                   0 |
| 2004-05-05 |                   0 |
| 2004-08-13 |                   0 |
| 2004-11-21 |                   0 |
| 2004-01-25 |                   0 |
| 2004-05-04 |                   0 |
| 2004-08-12 |                   0 |
| 2004-11-20 |                   0 |
| 2004-01-24 |                   0 |
| 2004-05-03 |                   0 |
| 2004-08-11 |                   0 |
| 2004-11-19 |                   0 |
| 2004-01-23 |                   0 |
| 2004-05-02 |                   0 |
| 2004-08-10 |                   0 |
| 2004-11-18 |                   0 |
| 2004-01-22 |                   0 |
| 2004-05-01 |                   0 |
| 2004-08-09 |                   0 |
| 2004-11-17 |                   0 |
| 2004-01-21 |                   0 |
| 2004-04-30 |                   0 |
| 2004-08-08 |                   0 |
| 2004-11-16 |                   0 |
| 2004-02-09 |                   0 |
| 2004-05-19 |                   0 |
| 2004-08-27 |                   0 |
| 2004-12-05 |                   0 |
| 2004-02-08 |                   0 |
| 2004-05-18 |                   0 |
| 2004-08-26 |                   0 |
| 2004-12-04 |                   0 |
| 2004-02-07 |                   0 |
| 2004-05-17 |                   0 |
| 2004-08-25 |                   0 |
| 2004-12-03 |                   0 |
| 2004-02-06 |                   0 |
| 2004-05-16 |                   0 |
| 2004-08-24 |                   0 |
| 2004-12-02 |                   0 |
| 2004-02-05 |                   0 |
| 2004-05-15 |                   0 |
| 2004-08-23 |                   0 |
| 2004-12-01 |                   0 |
| 2004-02-04 |                   0 |
| 2004-05-14 |                   0 |
| 2004-08-22 |                   0 |
| 2004-11-30 |                   0 |
| 2004-02-03 |                   0 |
| 2004-05-13 |                   0 |
| 2004-08-21 |                   0 |
| 2004-11-29 |                   0 |
| 2004-02-02 |                   0 |
| 2004-05-12 |                   0 |
| 2004-08-20 |                   0 |
| 2004-11-28 |                   0 |
| 2004-02-01 |                   0 |
| 2004-05-11 |                   0 |
| 2004-08-19 |                   0 |
| 2004-11-27 |                   0 |
| 2004-01-31 |                   0 |
| 2004-05-10 |                   0 |
| 2004-08-18 |                   0 |
| 2004-11-26 |                   0 |
| 2004-02-19 |                   0 |
| 2004-05-29 |                   0 |
| 2004-09-06 |                   0 |
| 2004-12-15 |                   0 |
| 2004-02-18 |                   0 |
| 2004-05-28 |                   0 |
| 2004-09-05 |                   0 |
| 2004-12-14 |                   0 |
| 2004-02-17 |                   0 |
| 2004-05-27 |                   0 |
| 2004-09-04 |                   0 |
| 2004-12-13 |                   0 |
| 2004-02-16 |                   0 |
| 2004-05-26 |                   0 |
| 2004-09-03 |                   0 |
| 2004-12-12 |                   0 |
| 2004-02-15 |                   0 |
| 2004-05-25 |                   0 |
| 2004-09-02 |                   0 |
| 2004-12-11 |                   0 |
| 2004-02-14 |                   0 |
| 2004-05-24 |                   0 |
| 2004-09-01 |                   0 |
| 2004-12-10 |                   0 |
| 2004-02-13 |                   0 |
| 2004-05-23 |                   0 |
| 2004-08-31 |                   0 |
| 2004-12-09 |                   0 |
| 2004-02-12 |                   0 |
| 2004-05-22 |                   0 |
| 2004-08-30 |                   0 |
| 2004-12-08 |                   0 |
| 2004-02-11 |                   0 |
| 2004-05-21 |                   0 |
| 2004-08-29 |                   0 |
| 2004-12-07 |                   0 |
| 2004-02-10 |                   0 |
| 2004-05-20 |                   0 |
| 2004-08-28 |                   0 |
| 2004-12-06 |                   0 |
| 2004-02-29 |                   0 |
| 2004-06-08 |                   0 |
| 2004-09-16 |                   0 |
| 2004-12-25 |                   0 |
| 2004-02-28 |                   0 |
| 2004-06-07 |                   0 |
| 2004-09-15 |                   0 |
| 2004-12-24 |                   0 |
| 2004-02-27 |                   0 |
| 2004-06-06 |                   0 |
| 2004-09-14 |                   0 |
| 2004-12-23 |                   0 |
| 2004-02-26 |                   0 |
| 2004-06-05 |                   0 |
| 2004-09-13 |                   0 |
| 2004-12-22 |                   0 |
| 2004-02-25 |                   0 |
| 2004-06-04 |                   0 |
| 2004-09-12 |                   0 |
| 2004-12-21 |                   0 |
| 2004-02-24 |                   0 |
| 2004-06-03 |                   0 |
| 2004-09-11 |                   0 |
| 2004-12-20 |                   0 |
| 2004-02-23 |                   0 |
| 2004-06-02 |                   0 |
| 2004-09-10 |                   0 |
| 2004-12-19 |                   0 |
| 2004-02-22 |                   1 |
| 2004-06-01 |                   0 |
| 2004-09-09 |                   0 |
| 2004-12-18 |                   0 |
| 2004-02-21 |                   0 |
| 2004-05-31 |                   0 |
| 2004-09-08 |                   0 |
| 2004-12-17 |                   0 |
| 2004-02-20 |                   0 |
| 2004-05-30 |                   0 |
| 2004-09-07 |                   0 |
| 2004-12-16 |                   0 |
| 2004-03-10 |                   0 |
| 2004-06-18 |                   0 |
| 2004-09-26 |                   0 |
| 2004-03-09 |                   0 |
| 2004-06-17 |                   0 |
| 2004-09-25 |                   0 |
| 2004-03-08 |                   0 |
| 2004-06-16 |                   0 |
| 2004-09-24 |                   0 |
| 2004-03-07 |                   0 |
| 2004-06-15 |                   0 |
| 2004-09-23 |                   0 |
| 2004-03-06 |                   0 |
| 2004-06-14 |                   0 |
| 2004-09-22 |                   0 |
| 2004-12-31 |                   0 |
| 2004-03-05 |                   0 |
| 2004-06-13 |                   0 |
| 2004-09-21 |                   0 |
| 2004-12-30 |                   0 |
| 2004-03-04 |                   0 |
| 2004-06-12 |                   0 |
| 2004-09-20 |                   0 |
| 2004-12-29 |                   0 |
| 2004-03-03 |                   0 |
| 2004-06-11 |                   0 |
| 2004-09-19 |                   0 |
| 2004-12-28 |                   1 |
| 2004-03-02 |                   0 |
| 2004-06-10 |                   0 |
| 2004-09-18 |                   0 |
| 2004-12-27 |                   0 |
| 2004-03-01 |                   0 |
| 2004-06-09 |                   0 |
| 2004-09-17 |                   0 |
| 2004-12-26 |                   0 |
| 2004-03-20 |                   0 |
| 2004-06-28 |                   0 |
| 2004-10-06 |                   0 |
| 2004-03-19 |                   0 |
| 2004-06-27 |                   0 |
| 2004-10-05 |                   0 |
| 2004-03-18 |                   0 |
| 2004-06-26 |                   0 |
| 2004-10-04 |                   0 |
| 2004-03-17 |                   0 |
| 2004-06-25 |                   0 |
| 2004-10-03 |                   0 |
| 2004-03-16 |                   0 |
| 2004-06-24 |                   0 |
| 2004-10-02 |                   0 |
| 2004-03-15 |                   0 |
| 2004-06-23 |                   0 |
| 2004-10-01 |                   0 |
| 2004-03-14 |                   0 |
| 2004-06-22 |                   0 |
| 2004-09-30 |                   1 |
| 2004-03-13 |                   0 |
| 2004-06-21 |                   0 |
| 2004-09-29 |                   0 |
| 2004-03-12 |                   0 |
| 2004-06-20 |                   0 |
| 2004-09-28 |                   0 |
| 2004-03-11 |                   0 |
| 2004-06-19 |                   0 |
| 2004-09-27 |                   0 |
| 2004-03-30 |                   0 |
| 2004-07-08 |                   0 |
| 2004-10-16 |                   0 |
| 2004-03-29 |                   0 |
| 2004-07-07 |                   0 |
| 2004-10-15 |                   0 |
| 2004-03-28 |                   0 |
| 2004-07-06 |                   0 |
| 2004-10-14 |                   0 |
| 2004-03-27 |                   0 |
| 2004-07-05 |                   0 |
| 2004-10-13 |                   0 |
| 2004-03-26 |                   0 |
| 2004-07-04 |                   0 |
| 2004-10-12 |                   0 |
| 2004-03-25 |                   0 |
| 2004-07-03 |                   0 |
| 2004-10-11 |                   0 |
| 2004-03-24 |                   0 |
| 2004-07-02 |                   0 |
| 2004-10-10 |                   0 |
| 2004-03-23 |                   0 |
| 2004-07-01 |                   0 |
| 2004-10-09 |                   0 |
| 2004-03-22 |                   1 |
| 2004-06-30 |                   2 |
| 2004-10-08 |                   0 |
| 2004-03-21 |                   0 |
| 2004-06-29 |                   0 |
| 2004-10-07 |                   0 |
| 2004-04-09 |                   0 |
| 2004-07-18 |                   0 |
| 2004-10-26 |                   0 |
| 2004-04-08 |                   0 |
| 2004-07-17 |                   0 |
| 2004-10-25 |                   0 |
| 2004-04-07 |                   0 |
| 2004-07-16 |                   0 |
| 2004-10-24 |                   0 |
| 2004-04-06 |                   0 |
| 2004-07-15 |                   0 |
| 2004-10-23 |                   0 |
| 2004-04-05 |                   0 |
| 2004-07-14 |                   0 |
| 2004-10-22 |                   0 |
| 2004-04-04 |                   0 |
| 2004-07-13 |                   0 |
| 2004-10-21 |                   0 |
| 2004-04-03 |                   0 |
| 2004-07-12 |                   0 |
| 2004-10-20 |                   0 |
| 2004-04-02 |                   0 |
| 2004-07-11 |                   0 |
| 2004-10-19 |                   0 |
| 2004-04-01 |                   0 |
| 2004-07-10 |                   0 |
| 2004-10-18 |                   0 |
| 2004-03-31 |                   0 |
| 2004-07-09 |                   0 |
| 2004-10-17 |                   0 |
+------------+---------------------+
366 rows in set (0.00 sec)

mysql> SELECT a.account_id, a.cust_id, c.cust_type_cd, c.fed_id
    -> FROM account a NATURAL JOIN customer c;
+------------+---------+--------------+-------------+
| account_id | cust_id | cust_type_cd | fed_id      |
+------------+---------+--------------+-------------+
|          1 |       1 | I            | 111-11-1111 |
|          2 |       1 | I            | 111-11-1111 |
|          3 |       1 | I            | 111-11-1111 |
|          4 |       2 | I            | 222-22-2222 |
|          5 |       2 | I            | 222-22-2222 |
|          7 |       3 | I            | 333-33-3333 |
|          8 |       3 | I            | 333-33-3333 |
|         10 |       4 | I            | 444-44-4444 |
|         11 |       4 | I            | 444-44-4444 |
|         12 |       4 | I            | 444-44-4444 |
|         13 |       5 | I            | 555-55-5555 |
|         14 |       6 | I            | 666-66-6666 |
|         15 |       6 | I            | 666-66-6666 |
|         17 |       7 | I            | 777-77-7777 |
|         18 |       8 | I            | 888-88-8888 |
|         19 |       8 | I            | 888-88-8888 |
|         21 |       9 | I            | 999-99-9999 |
|         22 |       9 | I            | 999-99-9999 |
|         23 |       9 | I            | 999-99-9999 |
|         24 |      10 | B            | 04-1111111  |
|         25 |      10 | B            | 04-1111111  |
|         27 |      11 | B            | 04-2222222  |
|         28 |      12 | B            | 04-3333333  |
|         29 |      13 | B            | 04-4444444  |
+------------+---------+--------------+-------------+
24 rows in set (0.01 sec)
