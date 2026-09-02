CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    gender VARCHAR(10),
    city VARCHAR(50),
    state VARCHAR(50)
);

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    unit_price DECIMAL(10,2)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    order_date DATE,
    customer_id INT,
    product_id INT,
    quantity INT,
    discount DECIMAL(5,2),
    payment_mode VARCHAR(30),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

INSERT INTO customers (customer_id, customer_name, gender, city, state)
VALUES
(101, 'Aarav Sharma', 'Male', 'Bengaluru', 'Karnataka'),
(102, 'Priya Patel', 'Female', 'Ahmedabad', 'Gujarat'),
(103, 'Rohan Das', 'Male', 'Bhubaneswar', 'Odisha'),
(104, 'Ananya Singh', 'Female', 'Delhi', 'Delhi'),
(105, 'Vikram Rao', 'Male', 'Hyderabad', 'Telangana'),
(106, 'Sneha Nair', 'Female', 'Kochi', 'Kerala'),
(107, 'Rahul Mehta', 'Male', 'Mumbai', 'Maharashtra'),
(108, 'Kavya Reddy', 'Female', 'Hyderabad', 'Telangana'),
(109, 'Arjun Kumar', 'Male', 'Chennai', 'Tamil Nadu'),
(110, 'Neha Gupta', 'Female', 'Pune', 'Maharashtra'),
(111, 'Aditya Mishra', 'Male', 'Lucknow', 'Uttar Pradesh'),
(112, 'Pooja Sahu', 'Female', 'Cuttack', 'Odisha'),
(113, 'Karan Verma', 'Male', 'Jaipur', 'Rajasthan'),
(114, 'Isha Roy', 'Female', 'Kolkata', 'West Bengal'),
(115, 'Manish Yadav', 'Male', 'Patna', 'Bihar'),
(116, 'Riya Joshi', 'Female', 'Surat', 'Gujarat'),
(117, 'Siddharth Jain', 'Male', 'Indore', 'Madhya Pradesh'),
(118, 'Meera Iyer', 'Female', 'Chennai', 'Tamil Nadu'),
(119, 'Nikhil Das', 'Male', 'Rourkela', 'Odisha'),
(120, 'Tanvi Kapoor', 'Female', 'Noida', 'Uttar Pradesh');


INSERT INTO products (product_id, product_name, category, unit_price)
VALUES
(201, 'Laptop', 'Electronics', 55000.00),
(202, 'Smartphone', 'Electronics', 25000.00),
(203, 'Headphones', 'Electronics', 1800.00),
(204, 'Smart Watch', 'Electronics', 4500.00),
(205, 'Bluetooth Speaker', 'Electronics', 3200.00),
(206, 'T-Shirt', 'Clothing', 799.00),
(207, 'Jeans', 'Clothing', 1499.00),
(208, 'Jacket', 'Clothing', 2499.00),
(209, 'Running Shoes', 'Footwear', 2999.00),
(210, 'Backpack', 'Accessories', 1299.00),
(211, 'Office Chair', 'Furniture', 6500.00),
(212, 'Study Table', 'Furniture', 5500.00),
(213, 'Water Bottle', 'Accessories', 599.00),
(214, 'Power Bank', 'Electronics', 1499.00),
(215, 'Keyboard', 'Electronics', 999.00);


INSERT INTO orders
(order_id, order_date, customer_id, product_id, quantity, discount, payment_mode)
VALUES
(1001, '2026-01-05', 101, 201, 1, 5.00, 'UPI'),
(1002, '2026-01-07', 102, 202, 2, 10.00, 'Credit Card'),
(1003, '2026-01-10', 103, 206, 3, 0.00, 'UPI'),
(1004, '2026-01-12', 104, 209, 1, 5.00, 'Debit Card'),
(1005, '2026-01-15', 105, 203, 2, 0.00, 'UPI'),
(1006, '2026-01-18', 106, 211, 1, 10.00, 'Credit Card'),
(1007, '2026-01-20', 107, 204, 1, 5.00, 'UPI'),
(1008, '2026-01-22', 108, 207, 2, 15.00, 'Debit Card'),
(1009, '2026-01-25', 109, 202, 1, 5.00, 'UPI'),
(1010, '2026-01-28', 110, 210, 2, 0.00, 'Cash'),

(1011, '2026-02-02', 111, 201, 1, 10.00, 'Credit Card'),
(1012, '2026-02-04', 112, 206, 2, 5.00, 'UPI'),
(1013, '2026-02-06', 113, 208, 1, 10.00, 'Debit Card'),
(1014, '2026-02-09', 114, 209, 2, 5.00, 'UPI'),
(1015, '2026-02-11', 115, 213, 3, 0.00, 'Cash'),
(1016, '2026-02-14', 116, 202, 1, 10.00, 'Credit Card'),
(1017, '2026-02-17', 117, 205, 2, 5.00, 'UPI'),
(1018, '2026-02-20', 118, 212, 1, 15.00, 'Debit Card'),
(1019, '2026-02-23', 119, 214, 2, 0.00, 'UPI'),
(1020, '2026-02-26', 120, 215, 3, 5.00, 'Credit Card'),

(1021, '2026-03-01', 101, 202, 1, 5.00, 'UPI'),
(1022, '2026-03-03', 102, 203, 2, 0.00, 'Credit Card'),
(1023, '2026-03-05', 103, 201, 1, 10.00, 'UPI'),
(1024, '2026-03-08', 104, 206, 4, 5.00, 'Debit Card'),
(1025, '2026-03-10', 105, 207, 1, 10.00, 'UPI'),
(1026, '2026-03-13', 106, 209, 2, 0.00, 'Credit Card'),
(1027, '2026-03-15', 107, 211, 1, 5.00, 'UPI'),
(1028, '2026-03-18', 108, 204, 2, 10.00, 'Debit Card'),
(1029, '2026-03-21', 109, 210, 1, 0.00, 'Cash'),
(1030, '2026-03-24', 110, 202, 2, 5.00, 'UPI'),

(1031, '2026-04-02', 111, 205, 1, 10.00, 'Credit Card'),
(1032, '2026-04-04', 112, 206, 3, 0.00, 'UPI'),
(1033, '2026-04-07', 113, 201, 1, 5.00, 'Debit Card'),
(1034, '2026-04-09', 114, 208, 2, 10.00, 'UPI'),
(1035, '2026-04-12', 115, 209, 1, 5.00, 'Cash'),
(1036, '2026-04-15', 116, 202, 2, 15.00, 'Credit Card'),
(1037, '2026-04-18', 117, 213, 3, 0.00, 'UPI'),
(1038, '2026-04-21', 118, 212, 1, 10.00, 'Debit Card'),
(1039, '2026-04-24', 119, 214, 2, 5.00, 'UPI'),
(1040, '2026-04-27', 120, 215, 2, 0.00, 'Credit Card'),

(1041, '2026-05-03', 101, 201, 1, 10.00, 'UPI'),
(1042, '2026-05-05', 102, 202, 1, 5.00, 'Credit Card'),
(1043, '2026-05-08', 103, 209, 2, 0.00, 'UPI'),
(1044, '2026-05-10', 104, 206, 3, 10.00, 'Debit Card'),
(1045, '2026-05-13', 105, 203, 1, 5.00, 'UPI'),
(1046, '2026-05-16', 106, 211, 1, 15.00, 'Credit Card'),
(1047, '2026-05-19', 107, 207, 2, 0.00, 'UPI'),
(1048, '2026-05-22', 108, 204, 1, 5.00, 'Debit Card'),
(1049, '2026-05-25', 109, 210, 2, 10.00, 'Cash'),
(1050, '2026-05-28', 110, 202, 1, 0.00, 'UPI'),

(1051, '2026-06-02', 111, 201, 1, 5.00, 'Credit Card'),
(1052, '2026-06-05', 112, 206, 2, 10.00, 'UPI'),
(1053, '2026-06-08', 113, 208, 1, 0.00, 'Debit Card'),
(1054, '2026-06-11', 114, 209, 2, 5.00, 'UPI'),
(1055, '2026-06-14', 115, 213, 4, 0.00, 'Cash'),
(1056, '2026-06-17', 116, 202, 1, 10.00, 'Credit Card'),
(1057, '2026-06-20', 117, 205, 2, 5.00, 'UPI'),
(1058, '2026-06-23', 118, 212, 1, 15.00, 'Debit Card'),
(1059, '2026-06-26', 119, 214, 2, 0.00, 'UPI'),
(1060, '2026-06-29', 120, 215, 3, 5.00, 'Credit Card');

SELECT COUNT(*) AS total_customers
FROM customers;

SELECT COUNT(*) AS total_products
FROM products;

SELECT COUNT(*) AS total_orders
FROM orders;

SELECT DISTINCT category
FROM products;

SELECT
    product_name,
    category,
    unit_price
FROM products
ORDER BY unit_price DESC;

SELECT
    product_name,
    category,
    unit_price
FROM products
ORDER BY unit_price ASC;

SELECT
    product_name,
    category,
    unit_price
FROM products
ORDER BY unit_price DESC
LIMIT 5;

SELECT SUM(quantity) AS total_quantity_sold
FROM orders;
-- SELECT SUM(quantity) AS total_quantity_sold
-- FROM orders;

-- SELECT ROUND(AVG(quantity), 2) AS average_quantity_per_order
-- FROM orders;

-- SELECT MAX(quantity) AS highest_quantity
-- FROM orders;

-- SELECT MIN(quantity) AS lowest_quantity
-- FROM orders;

-- SELECT
--     SUM(o.quantity * p.unit_price) AS gross_revenue
-- FROM orders o
-- JOIN products p
--     ON o.product_id = p.product_id;
--     
-- SELECT
--     ROUND(
--         SUM(o.quantity * p.unit_price * (1 - o.discount / 100)),
--         2
--     ) AS net_revenue
-- FROM orders o
-- JOIN products p
--     ON o.product_id = p.product_id;
--     
-- SELECT
--     product_name,
--     category,
--     unit_price
-- FROM products
-- WHERE category = 'Electronics';

-- SELECT
--     product_name,
--     category,
--     unit_price
-- FROM products
-- WHERE unit_price > 5000;

-- SELECT *
-- FROM orders
-- WHERE payment_mode = 'UPI';

-- SELECT
--     product_name,
--     category,
--     unit_price
-- FROM products
-- WHERE category = 'Electronics'
--   AND unit_price > 2000;

-- SELECT
--     product_name,
--     category,
--     unit_price
-- FROM products
-- WHERE category = 'Electronics'
--    OR category = 'Clothing';

-- SELECT
--     product_name,
--     category,
--     unit_price
-- FROM products
-- WHERE unit_price BETWEEN 1000 AND 5000;

-- SELECT
--     product_name,
--     category,
--     unit_price
-- FROM products
-- WHERE category IN ('Electronics', 'Furniture');

-- GROUP BY
-- SELECT
--     category,
--     COUNT(*) AS total_products
-- FROM products
-- GROUP BY category;

-- Category-wise average price
-- SELECT
--     category,
--     ROUND(AVG(unit_price), 2) AS average_price
-- FROM products
-- GROUP BY category;

-- Category-wise highest price
-- SELECT
--     category,
--     MAX(unit_price) AS highest_price
-- FROM products
-- GROUP BY category;

-- Category-wise lowest price
-- SELECT
--     category,
--     MIN(unit_price) AS lowest_price
-- FROM products
-- GROUP BY category;

-- Category-wise total products + average price
-- SELECT
--     category,
--     COUNT(*) AS total_products,
--     ROUND(AVG(unit_price), 2) AS average_price
-- FROM products
-- GROUP BY category;

-- Kouthi category re 2 ru adhika products achhi?
-- SELECT
--     category,
--     COUNT(*) AS total_products
-- FROM products
-- GROUP BY category
-- HAVING COUNT(*) > 2;

-- Kouthi average product price ₹3,000 ru besi?
-- SELECT
--     category,
--     ROUND(AVG(unit_price), 2) AS average_price
-- FROM products
-- GROUP BY category
-- HAVING AVG(unit_price) > 3000;

-- Payment mode-wise orders count, only >10 orders
-- SELECT
--     payment_mode,
--     COUNT(*) AS total_orders
-- FROM orders
-- GROUP BY payment_mode
-- HAVING COUNT(*) > 10;

-- Customer-wise orders, only customers with more than 2 orders
-- SELECT
--     customer_id,
--     COUNT(*) AS total_orders
-- FROM orders
-- GROUP BY customer_id
-- HAVING COUNT(*) > 2;

-- Customer-wise total quantity, only quantity >5
-- SELECT
--     customer_id,
--     SUM(quantity) AS total_quantity
-- FROM orders
-- GROUP BY customer_id
-- HAVING SUM(quantity) > 5;

-- JOIN Analysis

-- Customer name + product name + quantity
-- SELECT
--     c.customer_name,
--     p.product_name,
--     o.quantity
-- FROM orders o
-- JOIN customers c
--     ON o.customer_id = c.customer_id
-- JOIN products p
--     ON o.product_id = p.product_id;

-- Q2: Complete Order Report + Revenue
-- SELECT
--     o.order_id,
--     o.order_date,
--     c.customer_name,
--     p.product_name,
--     p.category,
--     o.quantity,
--     p.unit_price,
--     o.discount,
--     ROUND(
--         o.quantity * p.unit_price * (1 - o.discount / 100),
--         2
--     ) AS net_revenue
-- FROM orders o
-- JOIN customers c
--     ON o.customer_id = c.customer_id
-- JOIN products p
--     ON o.product_id = p.product_id;

-- Business Question
-- SELECT
--     c.customer_id,
--     c.customer_name,
--     ROUND(
--         SUM(o.quantity * p.unit_price * (1 - o.discount / 100)),
--         2
--     ) AS total_spent
-- FROM orders o
-- JOIN customers c
--     ON o.customer_id = c.customer_id
-- JOIN products p
--     ON o.product_id = p.product_id
-- GROUP BY
--     c.customer_id,
--     c.customer_name
-- ORDER BY total_spent DESC;

-- Top 5 Customers
-- SELECT
--     c.customer_id,
--     c.customer_name,
--     ROUND(
--         SUM(o.quantity * p.unit_price * (1 - o.discount / 100)),
--         2
--     ) AS total_spent
-- FROM orders o
-- JOIN customers c
--     ON o.customer_id = c.customer_id
-- JOIN products p
--     ON o.product_id = p.product_id
-- GROUP BY
--     c.customer_id,
--     c.customer_name
-- ORDER BY total_spent DESC
-- LIMIT 5;

-- Category-wise Revenue
-- SELECT
--     p.category,
--     ROUND(
--         SUM(o.quantity * p.unit_price * (1 - o.discount / 100)),
--         2
--     ) AS total_revenue
-- FROM orders o
-- JOIN products p
--     ON o.product_id = p.product_id
-- GROUP BY p.category
-- ORDER BY total_revenue DESC;

-- Monthly Sales Analysis
-- SELECT
--     MONTH(o.order_date) AS month_number,
--     ROUND(
--         SUM(o.quantity * p.unit_price * (1 - o.discount / 100)),
--         2
--     ) AS monthly_revenue
-- FROM orders o
-- JOIN products p
--     ON o.product_id = p.product_id
-- GROUP BY MONTH(o.order_date)
-- ORDER BY month_number;

-- Month-wise Order Count
-- SELECT
--     MONTH(order_date) AS month_number,
--     COUNT(*) AS total_orders
-- FROM orders
-- GROUP BY MONTH(order_date)
-- ORDER BY month_number;

-- Month-wise Quantity Sold
-- SELECT
--     MONTH(order_date) AS month_number,
--     SUM(quantity) AS total_quantity_sold
-- FROM orders
-- GROUP BY MONTH(order_date)
-- ORDER BY month_number;

-- Average Order Value (AOV)
-- SELECT
--     MONTH(o.order_date) AS month_number,
--     ROUND(
--         SUM(o.quantity * p.unit_price * (1 - o.discount / 100))
--         / COUNT(o.order_id),
--         2
--     ) AS average_order_value
-- FROM orders o
-- JOIN products p
--     ON o.product_id = p.product_id
-- GROUP BY MONTH(o.order_date)
-- ORDER BY month_number;

-- Best-Performing Month
-- SELECT
--     MONTH(o.order_date) AS month_number,
--     ROUND(
--         SUM(o.quantity * p.unit_price * (1 - o.discount / 100)),
--         2
--     ) AS monthly_revenue
-- FROM orders o
-- JOIN products p
--     ON o.product_id = p.product_id
-- GROUP BY MONTH(o.order_date)
-- ORDER BY monthly_revenue DESC
-- LIMIT 3;

-- CASE WHEN
-- SELECT
--     product_name,
--     unit_price,
--     CASE
--         WHEN unit_price < 2000 THEN 'Low'
--         WHEN unit_price BETWEEN 2000 AND 10000 THEN 'Medium'
--         ELSE 'High'
--     END AS price_segment
-- FROM products;

-- Kete Low, Medium, High-price products achhi?
-- SELECT
--     CASE
--         WHEN unit_price < 2000 THEN 'Low'
--         WHEN unit_price BETWEEN 2000 AND 10000 THEN 'Medium'
--         ELSE 'High'
--     END AS price_segment,
--     COUNT(*) AS total_products
-- FROM products
-- GROUP BY price_segment
-- ORDER BY total_products DESC;

-- Price Segment-wise Revenue
-- SELECT
--     CASE
--         WHEN p.unit_price < 2000 THEN 'Low'
--         WHEN p.unit_price BETWEEN 2000 AND 10000 THEN 'Medium'
--         ELSE 'High'
--     END AS price_segment,

--     ROUND(
--         SUM(
--             o.quantity * p.unit_price * (1 - o.discount / 100)
--         ),
--         2
--     ) AS total_revenue

-- FROM orders o
-- JOIN products p
--     ON o.product_id = p.product_id

-- GROUP BY price_segment
-- ORDER BY total_revenue DESC;

-- Customer Spending Segment
-- SELECT
--     c.customer_id,
--     c.customer_name,
--     ROUND(
--         SUM(o.quantity * p.unit_price * (1 - o.discount / 100)),
--         2
--     ) AS total_spent,

--     CASE
--         WHEN SUM(o.quantity * p.unit_price * (1 - o.discount / 100)) < 20000
--             THEN 'Low Spender'
--         WHEN SUM(o.quantity * p.unit_price * (1 - o.discount / 100)) BETWEEN 20000 AND 50000
--             THEN 'Medium Spender'
--         ELSE 'High Spender'
--     END AS customer_segment

-- FROM orders o
-- JOIN customers c
--     ON o.customer_id = c.customer_id
-- JOIN products p
--     ON o.product_id = p.product_id

-- GROUP BY
--     c.customer_id,
--     c.customer_name

-- ORDER BY total_spent DESC;

-- Customer Segment Count
-- SELECT
--     customer_segment,
--     COUNT(*) AS total_customers
-- FROM (
--     SELECT
--         c.customer_id,
--         c.customer_name,
--         CASE
--             WHEN SUM(o.quantity * p.unit_price * (1 - o.discount / 100)) < 20000
--                 THEN 'Low Spender'
--             WHEN SUM(o.quantity * p.unit_price * (1 - o.discount / 100)) BETWEEN 20000 AND 50000
--                 THEN 'Medium Spender'
--             ELSE 'High Spender'
--         END AS customer_segment
--     FROM orders o
--     JOIN customers c
--         ON o.customer_id = c.customer_id
--     JOIN products p
--         ON o.product_id = p.product_id
--     GROUP BY
--         c.customer_id,
--         c.customer_name
-- ) AS customer_segments
-- GROUP BY customer_segment
-- ORDER BY total_customers DESC;
USE Ecommerce_Analytics;
-- SUBQUERY

-- Average price thu expensive products kana
-- SELECT AVG(unit_price)
-- FROM products;

-- SELECT
--     product_name,
--     unit_price
-- FROM products
-- WHERE unit_price > (
--     SELECT AVG(unit_price)
--     FROM products
-- );

-- Customers who spent more than the average customer
-- SELECT
--     c.customer_id,
--     c.customer_name,
--     ROUND(
--         SUM(o.quantity * p.unit_price * (1 - o.discount / 100)),
--         2
--     ) AS total_spent
-- FROM orders o
-- JOIN customers c
--     ON o.customer_id = c.customer_id
-- JOIN products p
--     ON o.product_id = p.product_id
-- GROUP BY
--     c.customer_id,
--     c.customer_name
-- HAVING SUM(o.quantity * p.unit_price * (1 - o.discount / 100)) > (
--     SELECT AVG(customer_total)
--     FROM (
--         SELECT
--             SUM(o2.quantity * p2.unit_price * (1 - o2.discount / 100)) AS customer_total
--         FROM orders o2
--         JOIN products p2
--             ON o2.product_id = p2.product_id
--         GROUP BY o2.customer_id
--     ) AS customer_spending
-- )
-- ORDER BY total_spent DESC;

-- Products Above Average Price
-- SELECT
--     product_name,
--     unit_price
-- FROM products
-- WHERE unit_price > (
--     SELECT AVG(unit_price)
--     FROM products
-- )
-- ORDER BY unit_price DESC
-- LIMIT 1;

-- Customers Who Placed the Maximum Number of Orders
-- SELECT
--     c.customer_id,
--     c.customer_name,
--     COUNT(o.order_id) AS total_orders
-- FROM customers c
-- JOIN orders o
--     ON c.customer_id = o.customer_id
-- GROUP BY
--     c.customer_id,
--     c.customer_name
-- HAVING COUNT(o.order_id) = (
--     SELECT MAX(order_count)
--     FROM (
--         SELECT
--             customer_id,
--             COUNT(order_id) AS order_count
--         FROM orders
--         GROUP BY customer_id
--     ) AS customer_orders
-- )
-- ORDER BY total_orders DESC

-- Products That Have Never Been Ordered
-- SELECT
--     p.product_id,
--     p.product_name,
--     p.category,
--     p.unit_price
-- FROM products p
-- WHERE p.product_id NOT IN (
--     SELECT DISTINCT product_id
--     FROM orders
-- );

-- Window Functions
-- SELECT
--     order_id,
--     customer_id,
--     order_date,
--     ROW_NUMBER() OVER (
--         PARTITION BY customer_id
--         ORDER BY order_date DESC
--     ) AS order_rank
-- FROM orders;

-- RANK()
-- SELECT
--     product_name,
--     category,
--     unit_price,
--     RANK() OVER (
--         PARTITION BY category
--         ORDER BY unit_price DESC
--     ) AS price_rank
-- FROM products;

-- Top Product in Each Category
-- SELECT
--     product_name,
--     category,
--     unit_price,
--     RANK() OVER (
--         PARTITION BY category
--         ORDER BY unit_price DESC
--     ) AS price_rank
-- FROM products;

-- Subquery use kariba:
-- SELECT
--     product_name,
--     category,
--     unit_price
-- FROM (
--     SELECT
--         product_name,
--         category,
--         unit_price,
--         RANK() OVER (
--             PARTITION BY category
--             ORDER BY unit_price DESC
--         ) AS price_rank
--     FROM products
-- ) AS ranked_products
-- WHERE price_rank = 1;

-- DENSE_RANK()
-- SELECT
--     product_name,
--     category,
--     unit_price,
--     DENSE_RANK() OVER (
--         PARTITION BY category
--         ORDER BY unit_price DESC
--     ) AS price_rank
-- FROM products;

-- Customer-wise Running Total
-- SELECT
--     o.order_id,
--     o.customer_id,
--     o.order_date,
--     ROUND(
--         o.quantity * p.unit_price * (1 - o.discount / 100),
--         2
--     ) AS order_revenue,

--     ROUND(
--         SUM(
--             o.quantity * p.unit_price * (1 - o.discount / 100)
--         ) OVER (
--             PARTITION BY o.customer_id
--             ORDER BY o.order_date, o.order_id
--         ),
--         2
--     ) AS running_total

-- FROM orders o
-- JOIN products p
--     ON o.product_id = p.product_id

-- ORDER BY
--     o.customer_id,
--     o.order_date,
--     o.order_id;

-- Real Data Analyst Business Questions
-- Top 5 Best-Selling Products
-- SELECT
--     p.product_id,
--     p.product_name,
--     SUM(o.quantity) AS total_quantity_sold
-- FROM orders o
-- JOIN products p
--     ON o.product_id = p.product_id
-- GROUP BY
--     p.product_id,
--     p.product_name
-- ORDER BY total_quantity_sold DESC
-- LIMIT 5;

-- Top 5 Products by Revenue
-- SELECT
--     p.product_id,
--     p.product_name,
--     ROUND(
--         SUM(
--             o.quantity * p.unit_price * (1 - o.discount / 100)
--         ),
--         2
--     ) AS total_revenue
-- FROM orders o
-- JOIN products p
--     ON o.product_id = p.product_id
-- GROUP BY
--     p.product_id,
--     p.product_name
-- ORDER BY total_revenue DESC
-- LIMIT 5;

-- Lowest-Selling Products
-- SELECT
--     p.product_id,
--     p.product_name,
--     SUM(o.quantity) AS total_quantity_sold
-- FROM orders o
-- JOIN products p
--     ON o.product_id = p.product_id
-- GROUP BY
--     p.product_id,
--     p.product_name
-- ORDER BY total_quantity_sold ASC
-- LIMIT 5;

-- Top 5 Customers by Number of Orders
-- SELECT
--     c.customer_id,
--     c.customer_name,
--     COUNT(o.order_id) AS total_orders
-- FROM orders o
-- JOIN customers c
--     ON o.customer_id = c.customer_id
-- GROUP BY
--     c.customer_id,
--     c.customer_name
-- ORDER BY total_orders DESC
-- LIMIT 5;

-- Revenue by Payment Mode
-- SELECT
--     o.payment_mode,
--     ROUND(
--         SUM(
--             o.quantity * p.unit_price * (1 - o.discount / 100)
--         ),
--         2
--     ) AS total_revenue
-- FROM orders o
-- JOIN products p
--     ON o.product_id = p.product_id
-- GROUP BY o.payment_mode
-- ORDER BY total_revenue DESC;

-- Customer Retention Analysis
-- Repeat Customers
-- SELECT
--     COUNT(*) AS repeat_customers
-- FROM (
--     SELECT
--         customer_id,
--         COUNT(order_id) AS total_orders
--     FROM orders
--     GROUP BY customer_id
--     HAVING COUNT(order_id) > 1
-- ) AS customer_orders;

-- Repeat Customer Percentage kariba
-- SELECT
--     COUNT(*) AS total_customers,
--     SUM(
--         CASE
--             WHEN total_orders > 1 THEN 1
--             ELSE 0
--         END
--     ) AS repeat_customers,
--     ROUND(
--         SUM(
--             CASE
--                 WHEN total_orders > 1 THEN 1
--                 ELSE 0
--             END
--         ) * 100.0 / COUNT(*),
--         2
--     ) AS repeat_customer_percentage
-- FROM (
--     SELECT
--         customer_id,
--         COUNT(order_id) AS total_orders
--     FROM orders
--     GROUP BY customer_id
-- ) AS customer_orders;

-- Customer Order Frequency
-- SELECT
--     COUNT(DISTINCT customer_id) AS total_customers,
--     COUNT(order_id) AS total_orders,
--     ROUND(
--         COUNT(order_id) * 1.0 / COUNT(DISTINCT customer_id),
--         2
--     ) AS average_orders_per_customer
-- FROM orders;

-- Customers with Highest Order Frequency
-- SELECT
--     c.customer_id,
--     c.customer_name,
--     COUNT(o.order_id) AS total_orders
-- FROM customers c
-- JOIN orders o
--     ON c.customer_id = o.customer_id
-- GROUP BY
--     c.customer_id,
--     c.customer_name
-- ORDER BY total_orders DESC
-- LIMIT 5;

-- Average Spending of Repeat Customers
-- SELECT
--     ROUND(AVG(total_spent), 2) AS avg_spending_repeat_customers
-- FROM (
--     SELECT
--         o.customer_id,
--         SUM(
--             o.quantity * p.unit_price * (1 - o.discount / 100)
--         ) AS total_spent
--     FROM orders o
--     JOIN products p
--         ON o.product_id = p.product_id
--     GROUP BY o.customer_id
--     HAVING COUNT(o.order_id) > 1
-- ) AS repeat_customers;

-- Final Business Analysis
-- Overall Business KPI
-- SELECT
--     COUNT(DISTINCT o.order_id) AS total_orders,
--     COUNT(DISTINCT o.customer_id) AS total_customers,
--     COUNT(DISTINCT o.product_id) AS products_sold,
--     SUM(o.quantity) AS total_quantity_sold,
--     ROUND(
--         SUM(o.quantity * p.unit_price * (1 - o.discount / 100)),
--         2
--     ) AS total_revenue,
--     ROUND(
--         SUM(o.quantity * p.unit_price * (1 - o.discount / 100))
--         / COUNT(DISTINCT o.order_id),
--         2
--     ) AS average_order_value
-- FROM orders o
-- JOIN products p
--     ON o.product_id = p.product_id;

-- Best-Selling Category
-- SELECT
--     p.category,
--     SUM(o.quantity) AS total_quantity_sold
-- FROM orders o
-- JOIN products p
--     ON o.product_id = p.product_id
-- GROUP BY p.category
-- ORDER BY total_quantity_sold DESC
-- LIMIT 1;

-- Highest Revenue Category kariba.
-- SELECT
--     p.category,
--     ROUND(
--         SUM(
--             o.quantity * p.unit_price * (1 - o.discount / 100)
--         ),
--         2
--     ) AS total_revenue
-- FROM orders o
-- JOIN products p
--     ON o.product_id = p.product_id
-- GROUP BY p.category
-- ORDER BY total_revenue DESC
-- LIMIT 1;

-- Category-wise Average Order Value kariba.
-- SELECT
--     p.category,
--     ROUND(
--         SUM(
--             o.quantity * p.unit_price * (1 - o.discount / 100)
--         ) / COUNT(DISTINCT o.order_id),
--         2
--     ) AS average_order_value
-- FROM orders o
-- JOIN products p
--     ON o.product_id = p.product_id
-- GROUP BY p.category
-- ORDER BY average_order_value DESC;

-- Monthly Revenue Growth
-- WITH monthly_sales AS (
--     SELECT
--         MONTH(o.order_date) AS month_number,
--         SUM(
--             o.quantity * p.unit_price * (1 - o.discount / 100)
--         ) AS monthly_revenue
--     FROM orders o
--     JOIN products p
--         ON o.product_id = p.product_id
--     GROUP BY MONTH(o.order_date)
-- )

-- SELECT
--     month_number,
--     ROUND(monthly_revenue, 2) AS monthly_revenue,
--     ROUND(
--         monthly_revenue
--         - LAG(monthly_revenue) OVER (
--             ORDER BY month_number
--         ),
--         2
--     ) AS revenue_change
-- FROM monthly_sales
-- ORDER BY month_number;

-- REAL PORTFOLIO PROJECT
-- Customer Lifetime Value
-- SELECT
--     c.customer_id,
--     c.customer_name,
--     COUNT(DISTINCT o.order_id) AS total_orders,
--     SUM(o.quantity) AS total_items,
--     ROUND(
--         SUM(
--             o.quantity * p.unit_price * (1 - o.discount / 100)
--         ),
--         2
--     ) AS lifetime_value
-- FROM orders o
-- JOIN customers c
--     ON o.customer_id = c.customer_id
-- JOIN products p
--     ON o.product_id = p.product_id
-- GROUP BY
--     c.customer_id,
--     c.customer_name
-- ORDER BY lifetime_value DESC;

-- Customer Contribution % kariba.
-- WITH customer_sales AS (
--     SELECT
--         c.customer_id,
--         c.customer_name,
--         SUM(
--             o.quantity * p.unit_price * (1 - o.discount / 100)
--         ) AS customer_revenue
--     FROM orders o
--     JOIN customers c
--         ON o.customer_id = c.customer_id
--     JOIN products p
--         ON o.product_id = p.product_id
--     GROUP BY
--         c.customer_id,
--         c.customer_name
-- )

-- SELECT
--     customer_id,
--     customer_name,
--     ROUND(customer_revenue, 2) AS customer_revenue,
--     ROUND(
--         customer_revenue * 100.0 /
--         SUM(customer_revenue) OVER (),
--         2
--     ) AS revenue_contribution_pct
-- FROM customer_sales
-- ORDER BY revenue_contribution_pct DESC;

-- Top 20% Customers
-- WITH customer_sales AS (
--     SELECT
--         c.customer_id,
--         c.customer_name,
--         SUM(
--             o.quantity * p.unit_price * (1 - o.discount / 100)
--         ) AS customer_revenue
--     FROM orders o
--     JOIN customers c
--         ON o.customer_id = c.customer_id
--     JOIN products p
--         ON o.product_id = p.product_id
--     GROUP BY
--         c.customer_id,
--         c.customer_name
-- ),

-- ranked_customers AS (
--     SELECT
--         customer_id,
--         customer_name,
--         ROUND(customer_revenue, 2) AS customer_revenue,
--         ROW_NUMBER() OVER (
--             ORDER BY customer_revenue DESC
--         ) AS revenue_rank
--     FROM customer_sales
-- )

-- SELECT
--     customer_id,
--     customer_name,
--     customer_revenue,
--     revenue_rank
-- FROM ranked_customers
-- WHERE revenue_rank <= 4
-- ORDER BY revenue_rank;

-- Revenue Concentration
-- WITH customer_sales AS (
--     SELECT
--         c.customer_id,
--         c.customer_name,
--         SUM(
--             o.quantity * p.unit_price * (1 - o.discount / 100)
--         ) AS customer_revenue
--     FROM orders o
--     JOIN customers c
--         ON o.customer_id = c.customer_id
--     JOIN products p
--         ON o.product_id = p.product_id
--     GROUP BY
--         c.customer_id,
--         c.customer_name
-- ),

-- ranked_customers AS (
--     SELECT
--         customer_id,
--         customer_name,
--         customer_revenue,
--         ROW_NUMBER() OVER (
--             ORDER BY customer_revenue DESC
--         ) AS revenue_rank
--     FROM customer_sales
-- )

-- SELECT
--     ROUND(
--         SUM(
--             CASE
--                 WHEN revenue_rank <= 4
--                 THEN customer_revenue
--                 ELSE 0
--             END
--         ) * 100.0 / SUM(customer_revenue),
--         2
--     ) AS top_20_customer_revenue_pct
-- FROM ranked_customers;

-- Customer Revenue Ranking
-- WITH customer_sales AS (
--     SELECT
--         c.customer_id,
--         c.customer_name,
--         SUM(
--             o.quantity * p.unit_price * (1 - o.discount / 100)
--         ) AS total_revenue
--     FROM orders o
--     JOIN customers c
--         ON o.customer_id = c.customer_id
--     JOIN products p
--         ON o.product_id = p.product_id
--     GROUP BY
--         c.customer_id,
--         c.customer_name
-- )

-- SELECT
--     customer_id,
--     customer_name,
--     ROUND(total_revenue, 2) AS total_revenue,
--     RANK() OVER (
--         ORDER BY total_revenue DESC
--     ) AS revenue_rank
-- FROM customer_sales
-- ORDER BY revenue_rank;

-- Final Project Validation
 --  SELECT
--     COUNT(*) AS total_orders,
--     COUNT(DISTINCT o.customer_id) AS total_customers,
--     COUNT(DISTINCT o.product_id) AS products_ordered,
--     SUM(o.quantity) AS total_units_sold,
--     ROUND(
--         SUM(
--             o.quantity * p.unit_price * (1 - o.discount / 100)
--         ),
--         2
--     ) AS total_revenue
-- FROM orders o
-- JOIN products p
--     ON o.product_id = p.product_id;

-- Average Order Value (AOV) calculate kariba.
-- SELECT
--     ROUND(
--         SUM(o.quantity * p.unit_price * (1 - o.discount / 100))
--         / COUNT(DISTINCT o.order_id),
--         2
--     ) AS average_order_value
-- FROM orders o
-- JOIN products p
--     ON o.product_id = p.product_id;

-- Discount Impact
-- SELECT
--     ROUND(
--         SUM(o.quantity * p.unit_price),
--         2
--     ) AS gross_revenue,

--     ROUND(
--         SUM(
--             o.quantity * p.unit_price
--             * (1 - o.discount / 100)
--         ),
--         2
--     ) AS net_revenue,

--     ROUND(
--         SUM(o.quantity * p.unit_price)
--         -
--         SUM(
--             o.quantity * p.unit_price
--             * (1 - o.discount / 100)
--         ),
--         2
--     ) AS total_discount_amount
-- FROM orders o
-- JOIN products p
--     ON o.product_id = p.product_id;

-- Discount Percentage Analysis kariba.
-- SELECT
--     ROUND(AVG(o.discount), 2) AS average_discount_percentage,
--     MAX(o.discount) AS maximum_discount_percentage,
--     MIN(o.discount) AS minimum_discount_percentage
-- FROM orders o;

-- Revenue by Payment Mode
-- SELECT
--     o.payment_mode,
--     ROUND(
--         SUM(
--             o.quantity * p.unit_price * (1 - o.discount / 100)
--         ),
--         2
--     ) AS total_revenue
-- FROM orders o
-- JOIN products p
--     ON o.product_id = p.product_id
-- GROUP BY o.payment_mode
-- ORDER BY total_revenue DESC;

-- Monthly Revenue Trend
-- SELECT
--     MONTH(o.order_date) AS month_number,
--     ROUND(
--         SUM(
--             o.quantity * p.unit_price * (1 - o.discount / 100)
--         ),
--         2
--     ) AS monthly_revenue
-- FROM orders o
-- JOIN products p
--     ON o.product_id = p.product_id
-- GROUP BY MONTH(o.order_date)
-- ORDER BY monthly_revenue DESC;

-- Best-Selling Product Category by Revenue
-- SELECT
--     p.category,
--     ROUND(
--         SUM(
--             o.quantity * p.unit_price * (1 - o.discount / 100)
--         ),
--         2
--     ) AS total_revenue
-- FROM orders o
-- JOIN products p
--     ON o.product_id = p.product_id
-- GROUP BY p.category
-- ORDER BY total_revenue DESC;

-- Top Customer by Revenue
-- SELECT
--     c.customer_id,
--     c.customer_name,
--     ROUND(
--         SUM(
--             o.quantity * p.unit_price * (1 - o.discount / 100)
--         ),
--         2
--     ) AS total_revenue
-- FROM orders o
-- JOIN customers c
--     ON o.customer_id = c.customer_id
-- JOIN products p
--     ON o.product_id = p.product_id
-- GROUP BY
--     c.customer_id,
--     c.customer_name
-- ORDER BY total_revenue DESC
-- LIMIT 1;

-- Highest-Value Product
-- SELECT
--     p.product_id,
--     p.product_name,
--     p.category,
--     ROUND(
--         SUM(
--             o.quantity * p.unit_price * (1 - o.discount / 100)
--         ),
--         2
--     ) AS total_revenue
-- FROM orders o
-- JOIN products p
--     ON o.product_id = p.product_id
-- GROUP BY
--     p.product_id,
--     p.product_name,
--     p.category
-- ORDER BY total_revenue DESC
-- LIMIT 1;

-- Order Status Analysis
-- SELECT
--     order_status,
--     COUNT(order_id) AS total_orders,
--     ROUND(
--         COUNT(order_id) * 100.0 /
--         (SELECT COUNT(*) FROM orders),
--         2
--     ) AS order_percentage
-- FROM orders
-- GROUP BY order_status
-- ORDER BY total_orders DESC;
-- DESCRIBE orders;

-- Payment Mode Distribution
-- SELECT
--     payment_mode,
--     COUNT(order_id) AS total_orders,
--     ROUND(
--         COUNT(order_id) * 100.0 /
--         (SELECT COUNT(*) FROM orders),
--         2
--     ) AS order_percentage
-- FROM orders
-- GROUP BY payment_mode
-- ORDER BY total_orders DESC;

-- Final KPI Summary
-- Final Dashboard KPIs
-- SELECT
--     COUNT(DISTINCT o.order_id) AS total_orders,
--     COUNT(DISTINCT o.customer_id) AS total_customers,
--     COUNT(DISTINCT o.product_id) AS unique_products,
--     SUM(o.quantity) AS total_units_sold,
--     ROUND(
--         SUM(
--             o.quantity * p.unit_price * (1 - o.discount / 100)
--         ),
--         2
--     ) AS total_revenue,
--     ROUND(
--         SUM(
--             o.quantity * p.unit_price * (1 - o.discount / 100)
--         ) / COUNT(DISTINCT o.order_id),
--         2
--     ) AS average_order_value
-- FROM orders o
-- JOIN products p
--     ON o.product_id = p.product_id;

-- Customer Revenue Summary
-- SELECT
--     c.customer_id,
--     c.customer_name,
--     COUNT(o.order_id) AS total_orders,
--     SUM(o.quantity) AS total_units,
--     ROUND(
--         SUM(
--             o.quantity * p.unit_price * (1 - o.discount / 100)
--         ),
--         2
--     ) AS total_revenue
-- FROM customers c
-- JOIN orders o
--     ON c.customer_id = o.customer_id
-- JOIN products p
--     ON o.product_id = p.product_id
-- GROUP BY
--     c.customer_id,
--     c.customer_name
-- ORDER BY total_revenue DESC;

-- Product Performance Summary kariba.
-- SELECT
--     p.product_id,
--     p.product_name,
--     p.category,
--     SUM(o.quantity) AS total_units_sold,
--     ROUND(
--         SUM(
--             o.quantity * p.unit_price * (1 - o.discount / 100)
--         ),
--         2
--     ) AS total_revenue
-- FROM products p
-- JOIN orders o
--     ON p.product_id = o.product_id
-- GROUP BY
--     p.product_id,
--     p.product_name,
--     p.category
-- ORDER BY total_revenue DESC;

-- Category Performance Summary
-- SELECT
--     p.category,
--     SUM(o.quantity) AS total_units_sold,
--     ROUND(
--         SUM(
--             o.quantity * p.unit_price * (1 - o.discount / 100)
--         ),
--         2
--     ) AS total_revenue
-- FROM products p
-- JOIN orders o
--     ON p.product_id = o.product_id
-- GROUP BY p.category
-- ORDER BY total_revenue DESC;

-- Monthly Sales Summary
-- SELECT
--     YEAR(o.order_date) AS order_year,
--     MONTH(o.order_date) AS order_month,
--     COUNT(DISTINCT o.order_id) AS total_orders,
--     SUM(o.quantity) AS total_units_sold,
--     ROUND(
--         SUM(
--             o.quantity * p.unit_price * (1 - o.discount / 100)
--         ),
--         2
--     ) AS total_revenue
-- FROM orders o
-- JOIN products p
--     ON o.product_id = p.product_id
-- GROUP BY
--     YEAR(o.order_date),
--     MONTH(o.order_date)
-- ORDER BY
--     order_year,
--     order_month;

