DDL : CREATE, DROP, ALTER and TRUNCATE 
DML : INSERT, UPDATE, DELETE and MERGE
DCL : GRANT, REVOKE
TCL : COMMIT, ROLLBACK and SAVEPOINT

Truncate is DDL, deletes all rows, no commit required
Delete is DML, deletes some/all rows, commit required

Query Execution Order 
Select , From , Where, Group by, Having, Order by, Limit

=> 
From, Where, Group By, Having, Select( window functions ), Order by, Limit 


Relationships
-------------
One to one 

Geography Code = Geography Name

Many to One

Table : Customers ( Referenced Entity)
customer_id
first_name
last_name
email

Table : Orders (Referencing Entity)
order_id
order_date
amount
*customer_id (forieign key) 



Example of Many to one -
 
 CREATE TABLE customers (
    id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(50)
);
 
CREATE TABLE orders (
    id INT PRIMARY KEY AUTO_INCREMENT,
    order_date DATE,
    amount DECIMAL(8,2),
    customer_id INT,
    FOREIGN KEY (customer_id) REFERENCES customers(id) ON DELETE CASCADE
);

-----
On delete cascade says actually also deletes the records referenced to the record of referenced entity
otherwise it will prevent deletion 
-----
 
INSERT INTO customers (first_name, last_name, email) 
VALUES ('Boy', 'George', 'george@gmail.com'),
       ('George', 'Michael', 'gm@gmail.com'),
       ('David', 'Bowie', 'david@gmail.com'),
       ('Blue', 'Steele', 'blue@gmail.com'),
       ('Bette', 'Davis', 'bette@aol.com');
       
       
INSERT INTO orders (order_date, amount, customer_id)
VALUES ('2016-02-10', 99.99, 1),
       ('2017-11-11', 35.50, 1),
       ('2014-12-12', 800.67, 2),
       ('2015-01-03', 12.50, 2),
       ('1999-04-11', 450.25, 5);

Many to Many 

