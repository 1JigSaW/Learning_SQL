mysql> SELECT txn_id
    -> FROM transaction
    -> WHERE account_id IN (101,103) AND NOT (txn_type_cd = 'DBT' OR amount > 100);
Empty set (0.00 sec)
