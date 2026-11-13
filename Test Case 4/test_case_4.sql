CREATE DATABASE data_cleansing;
USE data_cleansing;

CREATE TABLE sales_source (
    sale_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    product_name VARCHAR(100),
    quantity INT,
    unit_price DECIMAL(10,2),
    total_amount DECIMAL(10,2),
    sale_date DATE,
    city VARCHAR(100)
);

INSERT INTO sales_source
(sale_id, customer_name, product_name, quantity,
 unit_price, total_amount, sale_date, city)
VALUES
(1, 'Rahul Sharma', 'Laptop', 2, 55000, 110000, '2026-01-10', 'Pune'),

(2, 'Priya Patel', 'Mouse', 3, 500, 1500, '2026-01-12', 'Mumbai'),

(3, 'Amit Verma', 'Keyboard', -2, 1200, -2400, '2026-01-15', 'Delhi'),

(4, NULL, 'Monitor', 1, 12000, 12000, '2026-01-18', 'Pune'),

(5, 'Sneha Joshi', 'Headphones', 2, -1500, -3000, '2026-01-20', 'Mumbai'),

(6, 'Karan Mehta', NULL, 1, 25000, 25000, '2026-01-22', 'Delhi'),

(7, 'Neha Singh', 'Printer', NULL, 8000, 8000, '2026-01-25', 'Pune'),

(8, 'Rohit Kumar', 'Tablet', 2, 15000, 25000, '2026-01-27', 'Mumbai'),

(9, 'Anjali Desai', 'Smartphone', 1, 30000, 30000, NULL, 'Pune'),

(10, 'Vikas Rao', 'Laptop', 1, 55000, 55000, '2026-01-30', NULL),

(11, 'Pooja Shah', 'Mouse', 0, 500, 0, '2026-02-02', 'Delhi'),

(12, 'Arjun Nair', 'Keyboard', 2, NULL, 2400, '2026-02-05', 'Mumbai'),

(13, 'Meera Kulkarni', 'Monitor', 1, 12000, NULL, '2026-02-08', 'Pune'),

(14, '  Ramesh Patil  ', 'Headphones', 2, 1500, 3000, '2026-02-10', ' Pune '),

(15, 'Sahil Gupta', 'Laptop', 1, 55000, 55000, '2026-02-15', 'Mumbai');


SELECT DATABASE();

DESCRIBE sales_source;

SELECT * FROM sales_source;