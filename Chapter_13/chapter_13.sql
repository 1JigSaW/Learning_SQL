mysql> SELECT dept_id, name
    -> FROM department
    -> WHERE name LIKE 'A%';
+---------+----------------+
| dept_id | name           |
+---------+----------------+
|       3 | Administration |
+---------+----------------+
1 row in set (0.00 sec)

mysql> ALTER TABLE department
    -> ADD INDEX dept_name_idx (name);
Query OK, 0 rows affected (0.07 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> DESC department;
+---------+-------------------+------+-----+---------+----------------+
| Field   | Type              | Null | Key | Default | Extra          |
+---------+-------------------+------+-----+---------+----------------+
| dept_id | smallint unsigned | NO   | PRI | NULL    | auto_increment |
| name    | varchar(20)       | NO   | MUL | NULL    |                |
+---------+-------------------+------+-----+---------+----------------+
2 rows in set (0.00 sec)

mysql> SHOW INDEX FROM department \G
*************************** 1. row ***************************
        Table: department
   Non_unique: 0
     Key_name: PRIMARY
 Seq_in_index: 1
  Column_name: dept_id
    Collation: A
  Cardinality: 2
     Sub_part: NULL
       Packed: NULL
         Null: 
   Index_type: BTREE
      Comment: 
Index_comment: 
      Visible: YES
   Expression: NULL
*************************** 2. row ***************************
        Table: department
   Non_unique: 1
     Key_name: dept_name_idx
 Seq_in_index: 1
  Column_name: name
    Collation: A
  Cardinality: 3
     Sub_part: NULL
       Packed: NULL
         Null: 
   Index_type: BTREE
      Comment: 
Index_comment: 
      Visible: YES
   Expression: NULL
2 rows in set (0.01 sec)

mysql> ALTER TABLE department
    -> DROP INDEX dept_name_idx;
Query OK, 0 rows affected (0.01 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> ALTER TABLE department
    -> ADD UNIQUE dept_name_idx (name);
Query OK, 0 rows affected (0.02 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> INSERT INTO department (dept_id, name)
    -> VALUES (999, 'Operations');
ERROR 1062 (23000): Duplicate entry 'Operations' for key 'department.dept_name_idx'
mysql> ALTER TABLE employee
    -> ADD INDEX emp_names_idx (lname, fname);
Query OK, 0 rows affected (0.03 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> SELECT emp_id, fname, lname
    -> FROM employee
    -> WHERE emp_id IN (1, 3, 9, 15, 22);
+--------+---------+----------+
| emp_id | fname   | lname    |
+--------+---------+----------+
|      1 | Michael | Smith    |
|      3 | Robert  | Tyler    |
|      9 | Jane    | Grossman |
|     15 | Frank   | Portman  |
+--------+---------+----------+
4 rows in set (0.00 sec)

mysql> SELECT cust_id, SUM(avail_balance) tot_bal
    -> FROM account
    -> WHERE cust_id IN (1, 5, 9, 11)
    -> GROUP BY cust_id;
+---------+----------+
| cust_id | tot_bal  |
+---------+----------+
|       1 |  4557.75 |
|       5 |  2237.97 |
|       9 | 10971.22 |
|      11 |  9345.55 |
+---------+----------+
4 rows in set (0.00 sec)

mysql> EXPLAIN SELECT cust_id, SUM(avail_balance) tot_bal
    -> FROM account
    -> WHERE cust_id IN (1, 5, 9, 11)
    -> GROUP BY cust_id \G
*************************** 1. row ***************************
           id: 1
  select_type: SIMPLE
        table: account
   partitions: NULL
         type: range
possible_keys: fk_a_cust_id
          key: fk_a_cust_id
      key_len: 4
          ref: NULL
         rows: 8
     filtered: 100.00
        Extra: Using index condition
1 row in set, 1 warning (0.00 sec)

mysql> ALTER TABLE account
    -> ADD INDEX acc_bal_idx (cust_id, avail_balance);
Query OK, 0 rows affected (0.02 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> EXPLAIN SELECT cust_id, SUM(avail_balance) tot_bal
    -> FROM account
    -> WHERE cust_id IN (1, 5, 9, 11)
    -> GROUP BY cust_id \G
*************************** 1. row ***************************
           id: 1
  select_type: SIMPLE
        table: account
   partitions: NULL
         type: range
possible_keys: acc_bal_idx
          key: acc_bal_idx
      key_len: 4
          ref: NULL
         rows: 8
     filtered: 100.00
        Extra: Using where; Using index
1 row in set, 1 warning (0.00 sec)

mysql> SELECT product_type_cd, name
    -> FROM product_type;
+-----------------+-------------------------------+
| product_type_cd | name                          |
+-----------------+-------------------------------+
| ACCOUNT         | Customer Accounts             |
| INSURANCE       | Insurance Offerings           |
| LOAN            | Individual and Business Loans |
+-----------------+-------------------------------+
3 rows in set (0.00 sec)

mysql> SELECT product_type_cd, product_cd, name
    -> FROM product
    -> ORDER BY product_type_cd;
+-----------------+------------+-------------------------+
| product_type_cd | product_cd | name                    |
+-----------------+------------+-------------------------+
| ACCOUNT         | CD         | certificate of deposit  |
| ACCOUNT         | CHK        | checking account        |
| ACCOUNT         | MM         | money market account    |
| ACCOUNT         | SAV        | savings account         |
| LOAN            | AUT        | auto loan               |
| LOAN            | BUS        | business line of credit |
| LOAN            | MRT        | home mortgage           |
| LOAN            | SBL        | small business loan     |
+-----------------+------------+-------------------------+
8 rows in set (0.00 sec)

mysql> UPDATE product
    -> SET product_type_cd = 'XYZ'
    -> WHERE product_type_cd = 'LOAN';
ERROR 1452 (23000): Cannot add or update a child row: a foreign key constraint fails (`bank`.`product`, CONSTRAINT `fk_product_type_cd` FOREIGN KEY (`product_type_cd`) REFERENCES `product_type` (`product_type_cd`))
mysql> UPDATE product_type
    -> SET product_type_cd = 'XYZ'
    -> WHERE product_type_cd = 'LOAN';
ERROR 1451 (23000): Cannot delete or update a parent row: a foreign key constraint fails (`bank`.`product`, CONSTRAINT `fk_product_type_cd` FOREIGN KEY (`product_type_cd`) REFERENCES `product_type` (`product_type_cd`))
mysql> ALTER TABLE product
    -> DROP FOREIGN KEY fk_product_type_cd;
Query OK, 0 rows affected (0.01 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> ALTER TABLE product
    -> ADD CONSTRAINT fk_product_type_cd FOREIGN KEY (product_type_cd)
    -> REFERENCES product_type (product_type_cd)
    -> ON UPDATE CASCADE;
Query OK, 8 rows affected (0.06 sec)
Records: 8  Duplicates: 0  Warnings: 0

mysql> UPDATE product_type
    -> SET product_type_cd = 'XYZ'
    -> WHERE product_type_cd = 'LOAN';
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> SELECT product_type_cd, name
    -> FROM product_type;
+-----------------+-------------------------------+
| product_type_cd | name                          |
+-----------------+-------------------------------+
| ACCOUNT         | Customer Accounts             |
| INSURANCE       | Insurance Offerings           |
| XYZ             | Individual and Business Loans |
+-----------------+-------------------------------+
3 rows in set (0.00 sec)

mysql> SELECT product_type_cd, product_cd, name
    -> FROM product
    -> ORDER BY product_type_cd;
+-----------------+------------+-------------------------+
| product_type_cd | product_cd | name                    |
+-----------------+------------+-------------------------+
| ACCOUNT         | CD         | certificate of deposit  |
| ACCOUNT         | CHK        | checking account        |
| ACCOUNT         | MM         | money market account    |
| ACCOUNT         | SAV        | savings account         |
| XYZ             | AUT        | auto loan               |
| XYZ             | BUS        | business line of credit |
| XYZ             | MRT        | home mortgage           |
| XYZ             | SBL        | small business loan     |
+-----------------+------------+-------------------------+
8 rows in set (0.00 sec)

