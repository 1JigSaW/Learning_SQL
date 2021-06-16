mysql> SELECT customer.cust_id, customer.fed_id, product.name
    -> FROM customer INNER JOIN account
    -> ON customer.cust_id = account.cust_id
    -> INnER JOIN product
    -> ON account.product_cd = product.product_cd
    -> WHERE customer.cust_type_cd = 'I';
+---------+-------------+------------------------+
| cust_id | fed_id      | name                   |
+---------+-------------+------------------------+
|       1 | 111-11-1111 | checking account       |
|       1 | 111-11-1111 | savings account        |
|       1 | 111-11-1111 | certificate of deposit |
|       2 | 222-22-2222 | checking account       |
|       2 | 222-22-2222 | savings account        |
|       3 | 333-33-3333 | checking account       |
|       3 | 333-33-3333 | money market account   |
|       4 | 444-44-4444 | checking account       |
|       4 | 444-44-4444 | savings account        |
|       4 | 444-44-4444 | money market account   |
|       5 | 555-55-5555 | checking account       |
|       6 | 666-66-6666 | checking account       |
|       6 | 666-66-6666 | certificate of deposit |
|       7 | 777-77-7777 | certificate of deposit |
|       8 | 888-88-8888 | checking account       |
|       8 | 888-88-8888 | savings account        |
|       9 | 999-99-9999 | checking account       |
|       9 | 999-99-9999 | money market account   |
|       9 | 999-99-9999 | certificate of deposit |
+---------+-------------+------------------------+
19 rows in set (0.00 sec)
