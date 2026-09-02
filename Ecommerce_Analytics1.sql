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
SELECT
    o.order_id,
    o.order_date,
    c.customer_name,
    p.product_name,
    p.category,
    o.quantity,
    p.unit_price,
    o.discount,
    ROUND(
        o.quantity * p.unit_price * (1 - o.discount / 100),
        2
    ) AS net_revenue
FROM orders o
JOIN customers c
    ON o.customer_id = c.customer_id
JOIN products p
    ON o.product_id = p.product_id;

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

-- SUBQUERY

