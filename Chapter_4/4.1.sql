mysql> SELECT txn_id
    -> FROM transaction
    -> WHERE txn_date < '2005-02-26' AND (txn_type_cd = 'DBT' OR amount > 100);
Empty set (0.00 sec)

