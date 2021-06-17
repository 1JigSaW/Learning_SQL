mysql> CREATE TABLE string_tbl
    -> (char_fld CHAR(30),
    -> vchar_fld VARCHAR(30),
    -> text_fld TEXT
    -> );
Query OK, 0 rows affected (0.03 sec)

mysql> INSERT INTO string_tbl (char_fld, vchar_fld, text_fld)
    -> VALUES ('This is char data',
    -> 'This is varchar data',
    -> 'This is text data');
Query OK, 1 row affected (0.01 sec)

mysql> UPDATE string_tbl
    -> SET vchar_fld = 'This is a piece of extremely long varchar data';
ERROR 1406 (22001): Data too long for column 'vchar_fld' at row 1
mysql> SELECT vchar_fld
    -> FROM string_tbl;
+----------------------+
| vchar_fld            |
+----------------------+
| This is varchar data |
+----------------------+
1 row in set (0.00 sec)

mysql> UPDATE string_tbl
    -> SET text_fld = 'This string didnt''t work, but it does now';
Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> SELECT text_fld
    -> FROM string_tbl;
+-------------------------------------------+
| text_fld                                  |
+-------------------------------------------+
| This string didnt't work, but it does now |
+-------------------------------------------+
1 row in set (0.00 sec)

mysql> SELECT QUOTE(text_fld)
    -> FROM string_tbl;
+----------------------------------------------+
| QUOTE(text_fld)                              |
+----------------------------------------------+
| 'This string didnt\'t work, but it does now' |
+----------------------------------------------+
1 row in set (0.00 sec)

mysql> SELECT 'abcdefg', CHAR(97, 98, 99, 100, 101, 102, 103);
+---------+----------------------------------------------------------------------------+
| abcdefg | CHAR(97, 98, 99, 100, 101, 102, 103)                                       |
+---------+----------------------------------------------------------------------------+
| abcdefg |                                                            |
+---------+----------------------------------------------------------------------------+
1 row in set (0.00 sec)

mysql> SELECT CHAR(128, 129, 130, 131, 132, 133, 134, 135, 136, 137);
+----------------------------------------------------------------------------------------------------------------+
| CHAR(128, 129, 130, 131, 132, 133, 134, 135, 136, 137)                                                         |
+----------------------------------------------------------------------------------------------------------------+
|                                                                                          |
+----------------------------------------------------------------------------------------------------------------+
1 row in set (0.00 sec)

mysql> SELECT CHAR(138, 139, 140, 141, 142, 143, 144, 145, 146, 147);
+----------------------------------------------------------------------------------------------------------------+
| CHAR(138, 139, 140, 141, 142, 143, 144, 145, 146, 147)                                                         |
+----------------------------------------------------------------------------------------------------------------+
|                                                                                          |
+----------------------------------------------------------------------------------------------------------------+
1 row in set (0.00 sec)

mysql> SELECT CHAR(148, 149, 150, 151, 152, 153, 154, 155, 156, 157);
+----------------------------------------------------------------------------------------------------------------+
| CHAR(148, 149, 150, 151, 152, 153, 154, 155, 156, 157)                                                         |
+----------------------------------------------------------------------------------------------------------------+
|                                                                                          |
+----------------------------------------------------------------------------------------------------------------+
1 row in set (0.00 sec)

mysql> SELECT CHAR(158, 159, 160, 161, 162, 163, 164, 165);
+--------------------------------------------------------------------------------------------+
| CHAR(158, 159, 160, 161, 162, 163, 164, 165)                                               |
+--------------------------------------------------------------------------------------------+
|                                                                          |
+--------------------------------------------------------------------------------------------+
1 row in set (0.00 sec)

mysql> SELECT CONCAT('danke sch', CHAR(148), 'n');
+--------------------------------------------------------------------------+
| CONCAT('danke sch', CHAR(148), 'n')                                      |
+--------------------------------------------------------------------------+
|                                                  |
+--------------------------------------------------------------------------+
1 row in set (0.00 sec)

mysql> SELECT ASCII('j');
+------------+
| ASCII('j') |
+------------+
|        106 |
+------------+
1 row in set (0.00 sec)

mysql> DELETE FROM string_tbl;
Query OK, 1 row affected (0.01 sec)

mysql> INSERT INTO string_tbl (char_fld, vchar_fld, text_fld)
    -> VALUES ('This string is 28 characters', 
    -> 'This string is 28 characters',
    -> 'This string is 28 characters');
Query OK, 1 row affected (0.00 sec)

mysql> SELECT LENGTH(char_fld) char_length,
    -> LENGTH(vchar_fld) varchar_length,
    -> LENGTH(text_fld) text_length
    -> FROM string_tbl;
+-------------+----------------+-------------+
| char_length | varchar_length | text_length |
+-------------+----------------+-------------+
|          28 |             28 |          28 |
+-------------+----------------+-------------+
1 row in set (0.00 sec)

mysql> SELECT POSITION('characters' IN vchar_fld)
    -> FROM string_tbl;
+-------------------------------------+
| POSITION('characters' IN vchar_fld) |
+-------------------------------------+
|                                  19 |
+-------------------------------------+
1 row in set (0.00 sec)

mysql> SELECT LOCATE('is', vchar_fld, 5)
    -> FROM string_tbl;
+----------------------------+
| LOCATE('is', vchar_fld, 5) |
+----------------------------+
|                         13 |
+----------------------------+
1 row in set (0.00 sec)

mysql> DELETE FROM string_tbl;
Query OK, 1 row affected (0.00 sec)

mysql> INSERT INTO string_tbl(vchar_fld) VALUES ('abcd');
Query OK, 1 row affected (0.00 sec)

mysql> INSERT INTO string_tbl(vchar_fld) VALUES ('xyz');
Query OK, 1 row affected (0.01 sec)

mysql> INSERT INTO string_tbl(vchar_fld) VALUES ('QRSTUV');
Query OK, 1 row affected (0.00 sec)

mysql> INSERT INTO string_tbl(vchar_fld) VALUES ('qrstuv');
Query OK, 1 row affected (0.00 sec)

mysql> INSERT INTO string_tbl(vchar_fld) VALUES ('12345');
Query OK, 1 row affected (0.00 sec)

mysql> SELECT vchar_fld
    -> FROM string_tbl
    -> ORDER BY vchar_fld;
+-----------+
| vchar_fld |
+-----------+
| 12345     |
| abcd      |
| QRSTUV    |
| qrstuv    |
| xyz       |
+-----------+
5 rows in set (0.00 sec)

mysql> SELECT STRCMP('12345', '12345') 12345_12345,
    -> STRCMP('abcd', 'xyz') abcd_xyz,
    -> STRCMP('abcd', 'QRSTUV') abcd_QRSTUV,
    -> STRCMP('qrstuv', 'QRSTUV') qrstuv_QRSTUV,
    -> STRCMP('12345', 'xyz') 12345_xyz,
    -> STRCMP('xyz', 'qrstuv') xyz_qrstuv;
+-------------+----------+-------------+---------------+-----------+------------+
| 12345_12345 | abcd_xyz | abcd_QRSTUV | qrstuv_QRSTUV | 12345_xyz | xyz_qrstuv |
+-------------+----------+-------------+---------------+-----------+------------+
|           0 |       -1 |          -1 |             0 |        -1 |          1 |
+-------------+----------+-------------+---------------+-----------+------------+
1 row in set (0.00 sec)

mysql> SELECT name, name LIKE '%ns' ends_in_ns
    -> FROM department;
+----------------+------------+
| name           | ends_in_ns |
+----------------+------------+
| Operations     |          1 |
| Loans          |          1 |
| Administration |          0 |
+----------------+------------+
3 rows in set (0.00 sec)

mysql> SELECT cust_id, cust_type_cd, fed_id,
    -> fed_id REGEXP '.{3}-.{2}-.{4}' is_ss_no_format
    -> FROM customer;
+---------+--------------+-------------+-----------------+
| cust_id | cust_type_cd | fed_id      | is_ss_no_format |
+---------+--------------+-------------+-----------------+
|       1 | I            | 111-11-1111 |               1 |
|       2 | I            | 222-22-2222 |               1 |
|       3 | I            | 333-33-3333 |               1 |
|       4 | I            | 444-44-4444 |               1 |
|       5 | I            | 555-55-5555 |               1 |
|       6 | I            | 666-66-6666 |               1 |
|       7 | I            | 777-77-7777 |               1 |
|       8 | I            | 888-88-8888 |               1 |
|       9 | I            | 999-99-9999 |               1 |
|      10 | B            | 04-1111111  |               0 |
|      11 | B            | 04-2222222  |               0 |
|      12 | B            | 04-3333333  |               0 |
|      13 | B            | 04-4444444  |               0 |
+---------+--------------+-------------+-----------------+
13 rows in set (0.00 sec)

mysql> DELETE FROM string_tbl;
Query OK, 5 rows affected (0.00 sec)

mysql> INSERT INTO string_tbl (text_fld)
    -> VALUES ('This string was 29 characters');
Query OK, 1 row affected (0.00 sec)

mysql> UPDATE string_tbl
    -> SET text_fld = CONCAT(text_fld, ', but now it is longer');
Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> SELECT text_fld
    -> FROM string_tbl;
+-----------------------------------------------------+
| text_fld                                            |
+-----------------------------------------------------+
| This string was 29 characters, but now it is longer |
+-----------------------------------------------------+
1 row in set (0.00 sec)

mysql> SELECT CONCAT(fname, ' ', lname, ' has been a ',
    ->  title, ' since ', start_date) emp_narrative
    -> FROM employee
    -> WHERE title = 'Teller' OR title = 'Head Teller';
+---------------------------------------------------------+
| emp_narrative                                           |
+---------------------------------------------------------+
| Helen Fleming has been a Head Teller since 2004-03-17   |
| Chris Tucker has been a Teller since 2004-09-15         |
| Sarah Parker has been a Teller since 2002-12-02         |
| Jane Grossman has been a Teller since 2002-05-03        |
| Paula Roberts has been a Head Teller since 2002-07-27   |
| Thomas Ziegler has been a Teller since 2000-10-23       |
| Samantha Jameson has been a Teller since 2003-01-08     |
| John Blake has been a Head Teller since 2000-05-11      |
| Cindy Mason has been a Teller since 2002-08-09          |
| Frank Portman has been a Teller since 2003-04-01        |
| Theresa Markham has been a Head Teller since 2001-03-15 |
| Beth Fowler has been a Teller since 2002-06-29          |
| Rick Tulman has been a Teller since 2002-12-12          |
+---------------------------------------------------------+
13 rows in set (0.00 sec)

mysql> SELECT INSERT('goodbye world', 9, 0, 'cruel ') string;
+---------------------+
| string              |
+---------------------+
| goodbye cruel world |
+---------------------+
1 row in set (0.00 sec)

mysql> SELECT INSERT('goodbye world', 1, 7, 'hello') string;
+-------------+
| string      |
+-------------+
| hello world |
+-------------+
1 row in set (0.00 sec)

mysql> SELECT SUBSTRING('goodbye cruel world', 9, 5);
+----------------------------------------+
| SUBSTRING('goodbye cruel world', 9, 5) |
+----------------------------------------+
| cruel                                  |
+----------------------------------------+
1 row in set (0.00 sec)

mysql> SELECT (37 * 59) / (78 - (8 * 6));
+----------------------------+
| (37 * 59) / (78 - (8 * 6)) |
+----------------------------+
|                    72.7667 |
+----------------------------+
1 row in set (0.00 sec)

mysql> SELECT MOD(10, 4);
+------------+
| MOD(10, 4) |
+------------+
|          2 |
+------------+
1 row in set (0.00 sec)

mysql> SELECT MOD(22.75, 5);
+---------------+
| MOD(22.75, 5) |
+---------------+
|          2.75 |
+---------------+
1 row in set (0.00 sec)

mysql> SELECT POW(2, 8);
+-----------+
| POW(2, 8) |
+-----------+
|       256 |
+-----------+
1 row in set (0.00 sec)

mysql> SELECT POW(2, 10) kilobyte, POW(2, 20) megabyte,
    -> POW(2, 30) gigabyte, POW(2, 40) terabyte;
+----------+----------+------------+---------------+
| kilobyte | megabyte | gigabyte   | terabyte      |
+----------+----------+------------+---------------+
|     1024 |  1048576 | 1073741824 | 1099511627776 |
+----------+----------+------------+---------------+
1 row in set (0.00 sec)

mysql> SELECT CEIL(72.445), FLOOR(72.445);
+--------------+---------------+
| CEIL(72.445) | FLOOR(72.445) |
+--------------+---------------+
|           73 |            72 |
+--------------+---------------+
1 row in set (0.01 sec)

mysql> SELECT CEIL(72.000000001), FLOOR(72.00000000001);
+--------------------+-----------------------+
| CEIL(72.000000001) | FLOOR(72.00000000001) |
+--------------------+-----------------------+
|                 73 |                    72 |
+--------------------+-----------------------+
1 row in set (0.00 sec)

mysql> SELECT ROUND(72.499999), ROUND(72.5), ROUND(72.5001);
+------------------+-------------+----------------+
| ROUND(72.499999) | ROUND(72.5) | ROUND(72.5001) |
+------------------+-------------+----------------+
|               72 |          73 |             73 |
+------------------+-------------+----------------+
1 row in set (0.00 sec)

mysql> SELECT ROUND(72.0909, 1), ROUND(72.0909, 2), ROUND(72.0909, 3);
+-------------------+-------------------+-------------------+
| ROUND(72.0909, 1) | ROUND(72.0909, 2) | ROUND(72.0909, 3) |
+-------------------+-------------------+-------------------+
|              72.1 |             72.09 |            72.091 |
+-------------------+-------------------+-------------------+
1 row in set (0.00 sec)

mysql> SELECT TRUNCATE(72.0909, 1), TRUNCATE(72.0909, 2), TRUNCATE(72.0909, 3);
+----------------------+----------------------+----------------------+
| TRUNCATE(72.0909, 1) | TRUNCATE(72.0909, 2) | TRUNCATE(72.0909, 3) |
+----------------------+----------------------+----------------------+
|                 72.0 |                72.09 |               72.090 |
+----------------------+----------------------+----------------------+
1 row in set (0.00 sec)

mysql> SELECT ROUND(17, -1), TRUNCATE(17, -1);
+---------------+------------------+
| ROUND(17, -1) | TRUNCATE(17, -1) |
+---------------+------------------+
|            20 |               10 |
+---------------+------------------+
1 row in set (0.00 sec)

mysql> SELECT account_id, SIGN(avail_balance), ABS(avail_balance)
    -> FROM account;
+------------+---------------------+--------------------+
| account_id | SIGN(avail_balance) | ABS(avail_balance) |
+------------+---------------------+--------------------+
|          1 |                   1 |            1057.75 |
|          2 |                   1 |             500.00 |
|          3 |                   1 |            3000.00 |
|          4 |                   1 |            2258.02 |
|          5 |                   1 |             200.00 |
|          7 |                   1 |            1057.75 |
|          8 |                   1 |            2212.50 |
|         10 |                   1 |             534.12 |
|         11 |                   1 |             767.77 |
|         12 |                   1 |            5487.09 |
|         13 |                   1 |            2237.97 |
|         14 |                   1 |             122.37 |
|         15 |                   1 |           10000.00 |
|         17 |                   1 |            5000.00 |
|         18 |                   1 |            3487.19 |
|         19 |                   1 |             387.99 |
|         21 |                   1 |             125.67 |
|         22 |                   1 |            9345.55 |
|         23 |                   1 |            1500.00 |
|         24 |                   1 |           23575.12 |
|         25 |                   0 |               0.00 |
|         27 |                   1 |            9345.55 |
|         28 |                   1 |           38552.05 |
|         29 |                   1 |           50000.00 |
+------------+---------------------+--------------------+
24 rows in set (0.00 sec)

mysql> SELCT @@global.time_zone, @@session.time_zone;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'SELCT @@global.time_zone, @@session.time_zone' at line 1
mysql> SELECT @@global.time_zone, @@session.time_zone;
+--------------------+---------------------+
| @@global.time_zone | @@session.time_zone |
+--------------------+---------------------+
| SYSTEM             | SYSTEM              |
+--------------------+---------------------+
1 row in set (0.00 sec)

mysql> SELECT CAST('2005-03-27 15:30:00' AS DATETIME);
+-----------------------------------------+
| CAST('2005-03-27 15:30:00' AS DATETIME) |
+-----------------------------------------+
| 2005-03-27 15:30:00                     |
+-----------------------------------------+
1 row in set (0.00 sec)

mysql> SELECT CAST('2005-03-27' AS DATE) date_field,
    -> CAST('108:17:57' AS TIME) time_field;
+------------+------------+
| date_field | time_field |
+------------+------------+
| 2005-03-27 | 108:17:57  |
+------------+------------+
1 row in set (0.00 sec)

mysql> SELECT CURRENT_DATE( ), CURRENT_TIME( ), CURRENT_TIMESTAMP( );
+-----------------+-----------------+----------------------+
| CURRENT_DATE( ) | CURRENT_TIME( ) | CURRENT_TIMESTAMP( ) |
+-----------------+-----------------+----------------------+
| 2021-06-17      | 02:19:37        | 2021-06-17 02:19:37  |
+-----------------+-----------------+----------------------+
1 row in set (0.00 sec)

mysql> SELECT DATE_ADD(CURRENT_DATE( ), INTERVAL 5 DAY);
+-------------------------------------------+
| DATE_ADD(CURRENT_DATE( ), INTERVAL 5 DAY) |
+-------------------------------------------+
| 2021-06-22                                |
+-------------------------------------------+
1 row in set (0.00 sec)

mysql> SELECT LAST_DAY('2005-03-25');
+------------------------+
| LAST_DAY('2005-03-25') |
+------------------------+
| 2005-03-31             |
+------------------------+
1 row in set (0.00 sec)

mysql> SELECT CURRENT_TIMESTAMP( ) current_est,
    -> CONVERT_TZ(CURRENT_TIMESTAMP( ), 'US/Eastern', 'UTC') current_utc;
+---------------------+-------------+
| current_est         | current_utc |
+---------------------+-------------+
| 2021-06-17 02:24:02 | NULL        |
+---------------------+-------------+
1 row in set (0.00 sec)

mysql> SELECT DAYNAME('2005-03-22');
+-----------------------+
| DAYNAME('2005-03-22') |
+-----------------------+
| Tuesday               |
+-----------------------+
1 row in set (0.00 sec)

mysql> SELECT EXTRACT(YEAR FROM '2005-03-22 22:19:05');
+------------------------------------------+
| EXTRACT(YEAR FROM '2005-03-22 22:19:05') |
+------------------------------------------+
|                                     2005 |
+------------------------------------------+
1 row in set (0.00 sec)

mysql> SELECT DATEDIFF('2005-09-05', '2005-06-22');
+--------------------------------------+
| DATEDIFF('2005-09-05', '2005-06-22') |
+--------------------------------------+
|                                   75 |
+--------------------------------------+
1 row in set (0.00 sec)


mysql> SELECT DATEDIFF('2005-09-05 23:59:59', '2005-06-22 00:00:01');
+--------------------------------------------------------+
| DATEDIFF('2005-09-05 23:59:59', '2005-06-22 00:00:01') |
+--------------------------------------------------------+
|                                                     75 |
+--------------------------------------------------------+
1 row in set (0.00 sec)

mysql> SELECT DATEDIFF('2005-06-22', '2005-09-05');
+--------------------------------------+
| DATEDIFF('2005-06-22', '2005-09-05') |
+--------------------------------------+
|                                  -75 |
+--------------------------------------+
1 row in set (0.00 sec)

mysql> SELECT CAST('1456328' AS SIGNED INTEGER);
+-----------------------------------+
| CAST('1456328' AS SIGNED INTEGER) |
+-----------------------------------+
|                           1456328 |
+-----------------------------------+
1 row in set (0.00 sec)

mysql> SELECT CAST('999ABC111' AS UNSIGNED INTEGER);
+---------------------------------------+
| CAST('999ABC111' AS UNSIGNED INTEGER) |
+---------------------------------------+
|                                   999 |
+---------------------------------------+
1 row in set, 1 warning (0.00 sec)

