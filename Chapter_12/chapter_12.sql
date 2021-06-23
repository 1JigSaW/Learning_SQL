mysql> SHOW TABLE STATUS LIKE 'transaction' \G
*************************** 1. row ***************************
           Name: transaction
         Engine: InnoDB
        Version: 10
     Row_format: Dynamic
           Rows: 21
 Avg_row_length: 780
    Data_length: 16384
Max_data_length: 0
   Index_length: 49152
      Data_free: 0
 Auto_increment: 32
    Create_time: 2021-06-15 20:14:11
    Update_time: 2021-06-15 20:14:11
     Check_time: NULL
      Collation: utf8mb4_0900_ai_ci
       Checksum: NULL
 Create_options: 
        Comment: 
1 row in set (0.04 sec)

mysql> START TRANSACTION;
Query OK, 0 rows affected (0.00 sec)

mysql> UPDATE product
    -> SET date_retired = CURRENT_TIMESTAMP( )
    -> WHERE product_cd = 'XYZ';
Query OK, 0 rows affected (0.00 sec)
Rows matched: 0  Changed: 0  Warnings: 0

mysql> SAVEPOINT before_close_accounts;
Query OK, 0 rows affected (0.00 sec)

mysql> UPDATE account
    -> SET status = 'CLOSED', close_date = CURRENT_TIMESTAMP( ),
    -> last_activity_date = CURRENT_TIMESTAMP( )
    -> WHERE product_cd = 'XYZ';
Query OK, 0 rows affected (0.00 sec)
Rows matched: 0  Changed: 0  Warnings: 0

mysql> ROLLBACK TO SAVEPOINT before_close_accounts;
Query OK, 0 rows affected (0.00 sec)

mysql> COMMIT;
Query OK, 0 rows affected (0.00 sec)

