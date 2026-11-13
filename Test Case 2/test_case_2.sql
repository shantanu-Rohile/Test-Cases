create database test_case_2;


use test_case_2;

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    city VARCHAR(100),
    email VARCHAR(100)
);

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(100),
    price DECIMAL(10,2)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,

    FOREIGN KEY (customer_id)
        REFERENCES customers(customer_id)
);

CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,

    FOREIGN KEY (order_id)
        REFERENCES orders(order_id),

    FOREIGN KEY (product_id)
        REFERENCES products(product_id)
);



INSERT INTO customers VALUES
(1, 'Rahul', 'Pune', 'rahul@gmail.com'),
(2, 'Amit', 'Mumbai', 'amit@gmail.com'),
(3, 'Priya', 'Delhi', 'priya@gmail.com'),
(4, 'Sneha', 'Pune', 'sneha@gmail.com'),
(5, 'Rohan', 'Bangalore', 'rohan@gmail.com');


INSERT INTO products VALUES
(101, 'Laptop', 'Electronics', 50000),
(102, 'Mouse', 'Accessories', 500),
(103, 'Keyboard', 'Accessories', 1500),
(104, 'Monitor', 'Electronics', 15000),
(105, 'Headphones', 'Electronics', 3000);




INSERT INTO orders VALUES
(1001, 1, '2026-11-08'),
(1002, 2, '2026-11-09'),
(1003, 3, '2026-11-09'),
(1004, 1, '2026-11-10'),
(1005, 4, '2026-11-10'),
(1006, 5, '2026-11-11');

INSERT INTO order_items VALUES
(1, 1001, 101, 1),
(2, 1001, 102, 2),
(3, 1002, 103, 1),
(4, 1003, 104, 2),
(5, 1003, 105, 1),
(6, 1004, 102, 3),
(7, 1005, 101, 1),
(8, 1005, 103, 2),
(9, 1006, 105, 2);

SELECT
    o.order_id,
    c.customer_name,
    c.city,
    p.product_name,
    p.category,
    p.price,
    oi.quantity,
    (p.price * oi.quantity) AS total_amount,
    o.order_date

FROM orders o

JOIN customers c
    ON o.customer_id = c.customer_id

JOIN order_items oi
    ON o.order_id = oi.order_id

JOIN products p
    ON oi.product_id = p.product_id;
    

create database test_case_2_dw;

use test_case_2_dw;

CREATE TABLE stagging_customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    city VARCHAR(100),
    email VARCHAR(100)
);

CREATE TABLE stagging_products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(100),
    price DECIMAL(10,2)
);

CREATE TABLE stagging_orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,

    FOREIGN KEY (customer_id)
        REFERENCES stagging_customers(customer_id)
);

CREATE TABLE stagging_order_items (
    order_item_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,

    FOREIGN KEY (order_id)
        REFERENCES stagging_orders(order_id),

    FOREIGN KEY (product_id)
        REFERENCES stagging_products(product_id)
);



create table customer_dim (customer_key int auto_increment primary key, customer_id  int, customer_name varchar(500),city varchar(100), email varchar(100));

create table order_dim (order_key int auto_increment primary key,order_id int,order_date DATE); 

create table product_dim (product_key int auto_increment primary key, product_id int, product_name varchar(100),category varchar(100)); 

create table fact_total_sale
 (order_key int, product_key int, customer_key int, price DECIMAL(10,2), quantity int, total_sale DECIMAL(12,2),
 foreign key(order_key) references order_dim(order_key),foreign key(product_key) references product_dim(product_key),
 foreign key (customer_key) references customer_dim(customer_key));
 
 SELECT o.order_key,p.product_key,c.customer_key,pr.price,soi.quantity,pr.price*soi.quantity as total_sale
 FROM stagging_order_items soi
 JOIN stagging_orders so
	on so.order_id = soi.order_id 
JOIN order_dim o
	on o.order_id=so.order_id
JOIN customer_dim c
	on so.customer_id = c.customer_id
JOIN  product_dim p
	on soi.product_id = p.product_id
JOIN stagging_products pr
    on soi.product_id =pr.product_id;

select * from order_dim;


-- Clear previous data (child tables first)
SET FOREIGN_KEY_CHECKS = 0;

TRUNCATE TABLE order_items;
TRUNCATE TABLE orders;
TRUNCATE TABLE products;
TRUNCATE TABLE customers;

SET FOREIGN_KEY_CHECKS = 1;


-- 1. Customers
INSERT INTO customers
(customer_id, customer_name, city, email)
VALUES
(1, 'Rahul', 'Pune', 'rahul@gmail.com'),
(2, 'Amit', 'Mumbai', 'amit@gmail.com'),
(3, 'Priya', 'Delhi', 'priya@gmail.com'),
(4, 'Sneha', 'Pune', 'sneha@gmail.com'),
(5, 'Rohan', 'Bangalore', 'rohan@gmail.com');


-- 2. Products
INSERT INTO products
(product_id, product_name, category, price)
VALUES
(101, 'Laptop', 'Electronics', 50000.00),
(102, 'Mouse', 'Accessories', 500.00),
(103, 'Keyboard', 'Accessories', 1500.00),
(104, 'Monitor', 'Electronics', 15000.00),
(105, 'Headphones', 'Electronics', 3000.00);


-- 3. Orders
INSERT INTO orders
(order_id, customer_id, order_date)
VALUES
(1001, 1, '2026-11-08'),
(1002, 2, '2026-11-09'),
(1003, 3, '2026-11-09'),
(1004, 1, '2026-11-10'),
(1005, 4, '2026-11-10'),
(1006, 5, '2026-11-11');


-- 4. Order Items
INSERT INTO order_items
(order_item_id, order_id, product_id, quantity)
VALUES
(1, 1001, 101, 1),
(2, 1001, 102, 2),
(3, 1002, 103, 1),
(4, 1003, 104, 2),
(5, 1003, 105, 1),
(6, 1004, 102, 3),
(7, 1005, 101, 1),
(8, 1005, 103, 2),
(9, 1006, 105, 2);


select * from customer_dim;