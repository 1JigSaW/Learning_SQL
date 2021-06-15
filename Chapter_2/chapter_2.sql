mysql> select now();
+---------------------+
| now()               |
+---------------------+
| 2021-06-15 21:16:00 |
+---------------------+
1 row in set (0.00 sec)

mysql> SELECT now( )
    -> FROM dual;
+---------------------+
| now( )              |
+---------------------+
| 2021-06-15 21:20:38 |
+---------------------+
1 row in set (0.00 sec)

mysql> SHOW CHARACTER SET;
+----------+---------------------------------+---------------------+--------+
| Charset  | Description                     | Default collation   | Maxlen |
+----------+---------------------------------+---------------------+--------+
| armscii8 | ARMSCII-8 Armenian              | armscii8_general_ci |      1 |
| ascii    | US ASCII                        | ascii_general_ci    |      1 |
| big5     | Big5 Traditional Chinese        | big5_chinese_ci     |      2 |
| binary   | Binary pseudo charset           | binary              |      1 |
| cp1250   | Windows Central European        | cp1250_general_ci   |      1 |
| cp1251   | Windows Cyrillic                | cp1251_general_ci   |      1 |
| cp1256   | Windows Arabic                  | cp1256_general_ci   |      1 |
| cp1257   | Windows Baltic                  | cp1257_general_ci   |      1 |
| cp850    | DOS West European               | cp850_general_ci    |      1 |
| cp852    | DOS Central European            | cp852_general_ci    |      1 |
| cp866    | DOS Russian                     | cp866_general_ci    |      1 |
| cp932    | SJIS for Windows Japanese       | cp932_japanese_ci   |      2 |
| dec8     | DEC West European               | dec8_swedish_ci     |      1 |
| eucjpms  | UJIS for Windows Japanese       | eucjpms_japanese_ci |      3 |
| euckr    | EUC-KR Korean                   | euckr_korean_ci     |      2 |
| gb18030  | China National Standard GB18030 | gb18030_chinese_ci  |      4 |
| gb2312   | GB2312 Simplified Chinese       | gb2312_chinese_ci   |      2 |
| gbk      | GBK Simplified Chinese          | gbk_chinese_ci      |      2 |
| geostd8  | GEOSTD8 Georgian                | geostd8_general_ci  |      1 |
| greek    | ISO 8859-7 Greek                | greek_general_ci    |      1 |
| hebrew   | ISO 8859-8 Hebrew               | hebrew_general_ci   |      1 |
| hp8      | HP West European                | hp8_english_ci      |      1 |
| keybcs2  | DOS Kamenicky Czech-Slovak      | keybcs2_general_ci  |      1 |
| koi8r    | KOI8-R Relcom Russian           | koi8r_general_ci    |      1 |
| koi8u    | KOI8-U Ukrainian                | koi8u_general_ci    |      1 |
| latin1   | cp1252 West European            | latin1_swedish_ci   |      1 |
| latin2   | ISO 8859-2 Central European     | latin2_general_ci   |      1 |
| latin5   | ISO 8859-9 Turkish              | latin5_turkish_ci   |      1 |
| latin7   | ISO 8859-13 Baltic              | latin7_general_ci   |      1 |
| macce    | Mac Central European            | macce_general_ci    |      1 |
| macroman | Mac West European               | macroman_general_ci |      1 |
| sjis     | Shift-JIS Japanese              | sjis_japanese_ci    |      2 |
| swe7     | 7bit Swedish                    | swe7_swedish_ci     |      1 |
| tis620   | TIS620 Thai                     | tis620_thai_ci      |      1 |
| ucs2     | UCS-2 Unicode                   | ucs2_general_ci     |      2 |
| ujis     | EUC-JP Japanese                 | ujis_japanese_ci    |      3 |
| utf16    | UTF-16 Unicode                  | utf16_general_ci    |      4 |
| utf16le  | UTF-16LE Unicode                | utf16le_general_ci  |      4 |
| utf32    | UTF-32 Unicode                  | utf32_general_ci    |      4 |
| utf8     | UTF-8 Unicode                   | utf8_general_ci     |      3 |
| utf8mb4  | UTF-8 Unicode                   | utf8mb4_0900_ai_ci  |      4 |
+----------+---------------------------------+---------------------+--------+
41 rows in set (0.00 sec)

mysql> CREATE DATABASE foreign_sales CHARACTER SET utf8;
Query OK, 1 row affected, 1 warning (0.01 sec)

mysql> CREATE TABLE person 
    -> (person_id SMALLINT UNSIGNED,
    -> fname VARCHAR(20),
    -> lname VARCHAR(20),
    -> gender CHAR(1),
    -> birth_date DATE,
    -> street VARCHAR(30),
    -> city VARCHAR(20),
    -> state VARCHAR(20),
    -> country VARCHAR(20),
    -> postal_code VARCHAR(20),
    -> CONSTRAINT pk_person PRIMARY KEY (person_id)
    -> );
ERROR 1046 (3D000): No database selected
mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| bank               |
| foreign_sales      |
| information_schema |
| mysql              |
| performance_schema |
| sys                |
+--------------------+
6 rows in set (0.00 sec)

mysql> CREATE DATABASE human;
Query OK, 1 row affected (0.01 sec)

mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| bank               |
| foreign_sales      |
| human              |
| information_schema |
| mysql              |
| performance_schema |
| sys                |
+--------------------+
7 rows in set (0.00 sec)

mysql> use human;
Database changed

mysql> DROP TABLE person;
Query OK, 0 rows affected (0.02 sec)

mysql> CREATE TABLE person 
    -> (person_id SMALLINT UNSIGNED,
    -> fname VARCHAR(20),
    -> lname VARCHAR(20),
    -> gender ENUM('M', 'F'),
    -> birth_date DATE,
    -> street VARCHAR(30),
    -> city VARCHAR(20),
    -> state VARCHAR(20),
    -> country VARCHAR(20),
    -> postal_code VARCHAR(20),
    -> CONSTRAINT pk_person PRIMARY KEY (person_id)
    -> );
Query OK, 0 rows affected (0.02 sec)

mysql> DESC person;
+-------------+-------------------+------+-----+---------+-------+
| Field       | Type              | Null | Key | Default | Extra |
+-------------+-------------------+------+-----+---------+-------+
| person_id   | smallint unsigned | NO   | PRI | NULL    |       |
| fname       | varchar(20)       | YES  |     | NULL    |       |
| lname       | varchar(20)       | YES  |     | NULL    |       |
| gender      | enum('M','F')     | YES  |     | NULL    |       |
| birth_date  | date              | YES  |     | NULL    |       |
| street      | varchar(30)       | YES  |     | NULL    |       |
| city        | varchar(20)       | YES  |     | NULL    |       |
| state       | varchar(20)       | YES  |     | NULL    |       |
| country     | varchar(20)       | YES  |     | NULL    |       |
| postal_code | varchar(20)       | YES  |     | NULL    |       |
+-------------+-------------------+------+-----+---------+-------+
10 rows in set (0.00 sec)

mysql> CREATE TABLE favorite_food
    -> (person_id SMALLINT UNSIGNED,
    -> food VARCHAR(20),
    -> CONSTRAINT pk_favorite_food PRIMARY KEY (person_id, food),
    -> CONSTRAINT fk_person_id FOREIGN KEY (person_id)
    -> REFERENCES person (person_id)
    -> );
Query OK, 0 rows affected (0.02 sec)

mysql> DESC favorite_food;
+-----------+-------------------+------+-----+---------+-------+
| Field     | Type              | Null | Key | Default | Extra |
+-----------+-------------------+------+-----+---------+-------+
| person_id | smallint unsigned | NO   | PRI | NULL    |       |
| food      | varchar(20)       | NO   | PRI | NULL    |       |
+-----------+-------------------+------+-----+---------+-------+
2 rows in set (0.00 sec)

mysql> ALTER TABLE person MODIFY person_id SMALLINT UNSIGNED AUTO_INCREMENT;
ERROR 1833 (HY000): Cannot change column 'person_id': used in a foreign key constraint 'fk_person_id' of table 'human.favorite_food'
mysql> SET foreign_key_checks=0;
Query OK, 0 rows affected (0.00 sec)

mysql> ALTER TABLE person MODIFY person_id SMALLINT UNSIGNED AUTO_INCREMENT;
Query OK, 0 rows affected (0.05 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> SET foreign_key_checks=1;
Query OK, 0 rows affected (0.00 sec)

mysql> DESC person;
+-------------+-------------------+------+-----+---------+----------------+
| Field       | Type              | Null | Key | Default | Extra          |
+-------------+-------------------+------+-----+---------+----------------+
| person_id   | smallint unsigned | NO   | PRI | NULL    | auto_increment |
| fname       | varchar(20)       | YES  |     | NULL    |                |
| lname       | varchar(20)       | YES  |     | NULL    |                |
| gender      | enum('M','F')     | YES  |     | NULL    |                |
| birth_date  | date              | YES  |     | NULL    |                |
| street      | varchar(30)       | YES  |     | NULL    |                |
| city        | varchar(20)       | YES  |     | NULL    |                |
| state       | varchar(20)       | YES  |     | NULL    |                |
| country     | varchar(20)       | YES  |     | NULL    |                |
| postal_code | varchar(20)       | YES  |     | NULL    |                |
+-------------+-------------------+------+-----+---------+----------------+
10 rows in set (0.00 sec)

mysql> INSERT INTO person 
    -> (person_id, fname, lname, gender, birth_date)
    -> VALUES (null, 'William', 'Turner', 'M', '1972-05-27');
Query OK, 1 row affected (0.00 sec)

mysql> SELECT person_id, fname, lname, birth_date
    -> FROM person;
+-----------+---------+--------+------------+
| person_id | fname   | lname  | birth_date |
+-----------+---------+--------+------------+
|         1 | William | Turner | 1972-05-27 |
+-----------+---------+--------+------------+
1 row in set (0.00 sec)

mysql> SELECT person_id, fname, lname, birth_date
    -> FROM person
    -> WHERE person_id = 1;
+-----------+---------+--------+------------+
| person_id | fname   | lname  | birth_date |
+-----------+---------+--------+------------+
|         1 | William | Turner | 1972-05-27 |
+-----------+---------+--------+------------+
1 row in set (0.00 sec)

mysql> SELECT person_id, fname, lname, birth_date
    -> FROM person
    -> WHERE lname = 'Turner';
+-----------+---------+--------+------------+
| person_id | fname   | lname  | birth_date |
+-----------+---------+--------+------------+
|         1 | William | Turner | 1972-05-27 |
+-----------+---------+--------+------------+
1 row in set (0.00 sec)

mysql> INSERT INTO favorite_food (person_id, food)
    -> VALUES (1, 'pizza');
Query OK, 1 row affected (0.00 sec)

mysql> INSERT INTO favorite_food (person_id, food)
    -> VALUES (1, 'cookies');
Query OK, 1 row affected (0.00 sec)

mysql> INSERT INTO favorite_food (person_id, food)
    -> VALUES (1, 'nachos');
Query OK, 1 row affected (0.00 sec)

mysql> SELECT food
    -> FROM favorite_food
    -> WHERE person_id = 1
    -> ORDER BY food;
+---------+
| food    |
+---------+
| cookies |
| nachos  |
| pizza   |
+---------+
3 rows in set (0.00 sec)

mysql> INSERT INTO person 
    -> (person_id, fname, lname, gender, birth_date,
    -> street, city, state, country, postal_code)
    -> VALUES (null, 'Susan', 'Smith', 'F', '1975-11-02',
    -> '23 Maple St.', 'Arlington', 'VA', 'USA', '20220');
Query OK, 1 row affected (0.00 sec)

mysql> SELECT person_id, fname, lname, birth_date
    -> FROM person;
+-----------+---------+--------+------------+
| person_id | fname   | lname  | birth_date |
+-----------+---------+--------+------------+
|         1 | William | Turner | 1972-05-27 |
|         2 | Susan   | Smith  | 1975-11-02 |
+-----------+---------+--------+------------+
2 rows in set (0.00 sec)

mysql> SELECT *
    -> FROM person;
+-----------+---------+--------+--------+------------+--------------+-----------+-------+---------+-------------+
| person_id | fname   | lname  | gender | birth_date | street       | city      | state | country | postal_code |
+-----------+---------+--------+--------+------------+--------------+-----------+-------+---------+-------------+
|         1 | William | Turner | M      | 1972-05-27 | NULL         | NULL      | NULL  | NULL    | NULL        |
|         2 | Susan   | Smith  | F      | 1975-11-02 | 23 Maple St. | Arlington | VA    | USA     | 20220       |
+-----------+---------+--------+--------+------------+--------------+-----------+-------+---------+-------------+
2 rows in set (0.00 sec)

mysql> UPDATE person
    -> SET street = '1225 Tremont St.',
    -> city = 'Boston',
    -> state = 'MA',
    -> country = 'USA',
    -> postal_code = '02138'
    -> WHERE person_id = 1;
Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> DELETE FROM person
    -> WHERE person_id = 2;
Query OK, 1 row affected (0.00 sec)

mysql> INSERT INTO person 
    -> (person_id, fname, lname, gender, birth_date)
    -> VALUES (1, 'Charles', 'Fulton', 'M', '1968-01-15');
ERROR 1062 (23000): Duplicate entry '1' for key 'person.PRIMARY'
mysql> INSERT INTO favorite_food (person_id, food)
    -> VALUES (999, 'lasagna');
ERROR 1452 (23000): Cannot add or update a child row: a foreign key constraint fails (`human`.`favorite_food`, CONSTRAINT `fk_person_id` FOREIGN KEY (`person_id`) REFERENCES `person` (`person_id`))
mysql> UPDATE person
    -> SET gender = 'Z'
    -> WHERE person_id = 1;
ERROR 1265 (01000): Data truncated for column 'gender' at row 1
mysql> UPDATE person 
    -> SET birth_date = 'DEC-21-1980'
    -> WHERE person_id = 1;
ERROR 1292 (22007): Incorrect date value: 'DEC-21-1980' for column 'birth_date' at row 1
mysql> SELECT birth_date
    -> FROM person
    -> WHERE person_id = 1;
+------------+
| birth_date |
+------------+
| 1972-05-27 |
+------------+
1 row in set (0.00 sec)

mysql> show tables;
+-----------------+
| Tables_in_human |
+-----------------+
| favorite_food   |
| person          |
+-----------------+
2 rows in set (0.00 sec)

mysql> source D:\Learning_SQL\Chapter_2\LearningSQLExample.sql
Query OK, 0 rows affected (0.02 sec)

Query OK, 0 rows affected (0.02 sec)

Query OK, 0 rows affected (0.04 sec)

Query OK, 0 rows affected (0.02 sec)

Query OK, 0 rows affected (0.03 sec)

Query OK, 0 rows affected (0.02 sec)

Query OK, 0 rows affected (0.02 sec)

Query OK, 0 rows affected (0.02 sec)

Query OK, 0 rows affected (0.03 sec)

Query OK, 0 rows affected, 2 warnings (0.04 sec)

Query OK, 0 rows affected, 1 warning (0.04 sec)

Query OK, 1 row affected (0.00 sec)

Query OK, 1 row affected (0.00 sec)

Query OK, 1 row affected (0.00 sec)

Query OK, 1 row affected (0.00 sec)

Query OK, 1 row affected (0.00 sec)

Query OK, 1 row affected (0.00 sec)

Query OK, 1 row affected (0.00 sec)

Query OK, 1 row affected (0.00 sec)

Query OK, 1 row affected (0.00 sec)

Query OK, 1 row affected (0.00 sec)

Query OK, 1 row affected (0.00 sec)

Query OK, 1 row affected (0.00 sec)

Query OK, 1 row affected (0.00 sec)

Query OK, 1 row affected (0.00 sec)

Query OK, 1 row affected (0.00 sec)

Query OK, 1 row affected (0.00 sec)

Query OK, 1 row affected (0.00 sec)

Query OK, 1 row affected (0.00 sec)

Query OK, 1 row affected (0.00 sec)

Query OK, 1 row affected (0.00 sec)

Query OK, 1 row affected (0.00 sec)

Query OK, 1 row affected (0.00 sec)

Query OK, 1 row affected (0.00 sec)

Query OK, 1 row affected (0.00 sec)

Query OK, 1 row affected (0.00 sec)

Query OK, 18 rows affected (0.00 sec)
Records: 18  Duplicates: 0  Warnings: 0

Query OK, 2 rows affected (0.00 sec)
Rows matched: 2  Changed: 2  Warnings: 0

Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

Query OK, 5 rows affected (0.00 sec)
Rows matched: 5  Changed: 5  Warnings: 0

Query OK, 3 rows affected (0.00 sec)
Rows matched: 3  Changed: 3  Warnings: 0

Query OK, 2 rows affected (0.00 sec)
Rows matched: 2  Changed: 2  Warnings: 0

Query OK, 2 rows affected (0.00 sec)
Rows matched: 2  Changed: 2  Warnings: 0

Query OK, 2 rows affected (0.00 sec)
Rows matched: 2  Changed: 2  Warnings: 0

Query OK, 0 rows affected (0.00 sec)

Query OK, 1 row affected (0.00 sec)

Query OK, 1 row affected (0.00 sec)

Query OK, 1 row affected (0.00 sec)

Query OK, 1 row affected (0.00 sec)

Query OK, 1 row affected (0.00 sec)

Query OK, 1 row affected (0.00 sec)

Query OK, 1 row affected (0.00 sec)

Query OK, 1 row affected (0.00 sec)

Query OK, 1 row affected (0.00 sec)

Query OK, 1 row affected (0.00 sec)

Query OK, 1 row affected (0.00 sec)

Query OK, 1 row affected (0.00 sec)

Query OK, 1 row affected (0.00 sec)
Records: 1  Duplicates: 0  Warnings: 0

Query OK, 1 row affected (0.00 sec)

Query OK, 1 row affected (0.00 sec)
Records: 1  Duplicates: 0  Warnings: 0

Query OK, 1 row affected (0.00 sec)

Query OK, 1 row affected (0.00 sec)
Records: 1  Duplicates: 0  Warnings: 0

Query OK, 1 row affected (0.00 sec)

Query OK, 1 row affected (0.00 sec)
Records: 1  Duplicates: 0  Warnings: 0

Query OK, 1 row affected (0.00 sec)

Query OK, 1 row affected (0.00 sec)
Records: 1  Duplicates: 0  Warnings: 0

Query OK, 1 row affected (0.00 sec)

Query OK, 1 row affected (0.00 sec)
Records: 1  Duplicates: 0  Warnings: 0

Query OK, 1 row affected (0.00 sec)

Query OK, 1 row affected (0.00 sec)
Records: 1  Duplicates: 0  Warnings: 0

Query OK, 1 row affected (0.00 sec)

Query OK, 1 row affected (0.00 sec)
Records: 1  Duplicates: 0  Warnings: 0

Query OK, 1 row affected (0.00 sec)

Query OK, 1 row affected (0.00 sec)
Records: 1  Duplicates: 0  Warnings: 0

Query OK, 1 row affected (0.00 sec)

Query OK, 1 row affected (0.00 sec)
Records: 1  Duplicates: 0  Warnings: 0

Query OK, 1 row affected (0.00 sec)
Records: 1  Duplicates: 0  Warnings: 0

Query OK, 1 row affected (0.00 sec)

Query OK, 1 row affected (0.00 sec)
Records: 1  Duplicates: 0  Warnings: 0

Query OK, 1 row affected (0.00 sec)
Records: 1  Duplicates: 0  Warnings: 0

Query OK, 1 row affected (0.00 sec)

Query OK, 1 row affected (0.00 sec)
Records: 1  Duplicates: 0  Warnings: 0

Query OK, 1 row affected (0.00 sec)
Records: 1  Duplicates: 0  Warnings: 0

Query OK, 1 row affected (0.00 sec)

Query OK, 1 row affected (0.00 sec)
Records: 1  Duplicates: 0  Warnings: 0

Query OK, 1 row affected (0.00 sec)
Records: 1  Duplicates: 0  Warnings: 0

Query OK, 3 rows affected (0.00 sec)
Records: 3  Duplicates: 0  Warnings: 0

Query OK, 2 rows affected (0.00 sec)
Records: 2  Duplicates: 0  Warnings: 0

Query OK, 2 rows affected (0.00 sec)
Records: 2  Duplicates: 0  Warnings: 0

Query OK, 3 rows affected (0.00 sec)
Records: 3  Duplicates: 0  Warnings: 0

Query OK, 1 row affected (0.00 sec)
Records: 1  Duplicates: 0  Warnings: 0

Query OK, 2 rows affected (0.00 sec)
Records: 2  Duplicates: 0  Warnings: 0

Query OK, 1 row affected (0.00 sec)
Records: 1  Duplicates: 0  Warnings: 0

Query OK, 2 rows affected (0.00 sec)
Records: 2  Duplicates: 0  Warnings: 0

Query OK, 3 rows affected (0.00 sec)
Records: 3  Duplicates: 0  Warnings: 0

Query OK, 2 rows affected (0.00 sec)
Records: 2  Duplicates: 0  Warnings: 0

Query OK, 1 row affected (0.00 sec)
Records: 1  Duplicates: 0  Warnings: 0

Query OK, 1 row affected (0.00 sec)
Records: 1  Duplicates: 0  Warnings: 0

Query OK, 1 row affected (0.00 sec)
Records: 1  Duplicates: 0  Warnings: 0

Query OK, 21 rows affected (0.00 sec)
Records: 21  Duplicates: 0  Warnings: 0

mysql> show databases
    -> ;
+--------------------+
| Database           |
+--------------------+
| bank               |
| foreign_sales      |
| human              |
| information_schema |
| mysql              |
| performance_schema |
| sys                |
+--------------------+
7 rows in set (0.00 sec)

mysql> use bank;
Database changed
mysql> show tables;
+----------------+
| Tables_in_bank |
+----------------+
| account        |
| branch         |
| business       |
| customer       |
| department     |
| employee       |
| individual     |
| officer        |
| product        |
| product_type   |
| transaction    |
+----------------+
11 rows in set (0.00 sec)

mysql> DESC customer;
+--------------+---------------+------+-----+---------+----------------+
| Field        | Type          | Null | Key | Default | Extra          |
+--------------+---------------+------+-----+---------+----------------+
| cust_id      | int unsigned  | NO   | PRI | NULL    | auto_increment |
| fed_id       | varchar(12)   | NO   |     | NULL    |                |
| cust_type_cd | enum('I','B') | NO   |     | NULL    |                |
| address      | varchar(30)   | YES  |     | NULL    |                |
| city         | varchar(20)   | YES  |     | NULL    |                |
| state        | varchar(20)   | YES  |     | NULL    |                |
| postal_code  | varchar(10)   | YES  |     | NULL    |                |
+--------------+---------------+------+-----+---------+----------------+
7 rows in set (0.00 sec)

