-- SQL File Organize
-- New Query Tab
-- ============================================
-- E-COMMERCE SALES & CUSTOMER ANALYTICS
-- SQL PROJECT
-- ============================================

USE ecommerce;

-- ============================================
-- 1. BASIC SALES ANALYSIS
-- ============================================

-- Q1. Total Orders
SELECT COUNT(*) AS total_orders
FROM orders;

-- Q2. Total Customers
SELECT COUNT(DISTINCT customer_id) AS total_customers
FROM orders;

-- Q3. Total Units Sold
SELECT SUM(quantity) AS total_units_sold
FROM orders;

-- Part 2
-- ============================================
-- 2. PRODUCT ANALYSIS
-- ============================================

-- Q4. Top 5 Best-Selling Products
SELECT
    p.product_id,
    p.product_name,
    SUM(o.quantity) AS total_quantity_sold
FROM orders o
JOIN products p
    ON o.product_id = p.product_id
GROUP BY
    p.product_id,
    p.product_name
ORDER BY total_quantity_sold DESC
LIMIT 5;


-- Q5. Top 5 Products by Revenue
SELECT
    p.product_id,
    p.product_name,
    ROUND(
        SUM(
            o.quantity * p.unit_price * (1 - o.discount / 100)
        ),
        2
    ) AS total_revenue
FROM orders o
JOIN products p
    ON o.product_id = p.product_id
GROUP BY
    p.product_id,
    p.product_name
ORDER BY total_revenue DESC
LIMIT 5;


-- Q6. Lowest-Selling Products
SELECT
    p.product_id,
    p.product_name,
    SUM(o.quantity) AS total_quantity_sold
FROM orders o
JOIN products p
    ON o.product_id = p.product_id
GROUP BY
    p.product_id,
    p.product_name
ORDER BY total_quantity_sold ASC
LIMIT 5;

-- Part-3
-- ============================================
-- 3. CUSTOMER ANALYSIS
-- ============================================

-- Q7. Top 5 Customers by Number of Orders
SELECT
    c.customer_id,
    c.customer_name,
    COUNT(o.order_id) AS total_orders
FROM orders o
JOIN customers c
    ON o.customer_id = c.customer_id
GROUP BY
    c.customer_id,
    c.customer_name
ORDER BY total_orders DESC
LIMIT 5;


-- Q8. Customer-wise Revenue
SELECT
    c.customer_id,
    c.customer_name,
    COUNT(o.order_id) AS total_orders,
    SUM(o.quantity) AS total_units,
    ROUND(
        SUM(
            o.quantity * p.unit_price * (1 - o.discount / 100)
        ),
        2
    ) AS total_revenue
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
JOIN products p
    ON o.product_id = p.product_id
GROUP BY
    c.customer_id,
    c.customer_name
ORDER BY total_revenue DESC;


-- Q9. Repeat Customers
SELECT
    COUNT(*) AS repeat_customers
FROM (
    SELECT
        customer_id,
        COUNT(order_id) AS total_orders
    FROM orders
    GROUP BY customer_id
    HAVING COUNT(order_id) > 1
) AS customer_orders;


-- Q10. Average Orders per Customer
SELECT
    COUNT(DISTINCT customer_id) AS total_customers,
    COUNT(order_id) AS total_orders,
    ROUND(
        COUNT(order_id) * 1.0 /
        COUNT(DISTINCT customer_id),
        2
    ) AS average_orders_per_customer
FROM orders;

-- Part 4
-- ============================================
-- 4. REVENUE & SALES ANALYSIS
-- ============================================

-- Q11. Total Revenue
SELECT
    ROUND(
        SUM(
            o.quantity * p.unit_price * (1 - o.discount / 100)
        ),
        2
    ) AS total_revenue
FROM orders o
JOIN products p
    ON o.product_id = p.product_id;


-- Q12. Average Order Value
SELECT
    ROUND(
        SUM(
            o.quantity * p.unit_price * (1 - o.discount / 100)
        ) / COUNT(DISTINCT o.order_id),
        2
    ) AS average_order_value
FROM orders o
JOIN products p
    ON o.product_id = p.product_id;


-- Q13. Revenue by Payment Mode
SELECT
    o.payment_mode,
    ROUND(
        SUM(
            o.quantity * p.unit_price * (1 - o.discount / 100)
        ),
        2
    ) AS total_revenue
FROM orders o
JOIN products p
    ON o.product_id = p.product_id
GROUP BY o.payment_mode
ORDER BY total_revenue DESC;


-- Q14. Revenue by Category
SELECT
    p.category,
    ROUND(
        SUM(
            o.quantity * p.unit_price * (1 - o.discount / 100)
        ),
        2
    ) AS total_revenue
FROM orders o
JOIN products p
    ON o.product_id = p.product_id
GROUP BY p.category
ORDER BY total_revenue DESC;


-- Q15. Monthly Revenue
SELECT
    YEAR(o.order_date) AS order_year,
    MONTH(o.order_date) AS order_month,
    ROUND(
        SUM(
            o.quantity * p.unit_price * (1 - o.discount / 100)
        ),
        2
    ) AS monthly_revenue
FROM orders o
JOIN products p
    ON o.product_id = p.product_id
GROUP BY
    YEAR(o.order_date),
    MONTH(o.order_date)
ORDER BY
    order_year,
    order_month;
    
-- Advanced SQL Analysis
-- ============================================
-- 5. ADVANCED SQL ANALYSIS
-- ============================================

-- Q16. Customer Revenue Contribution
WITH customer_sales AS (
    SELECT
        c.customer_id,
        c.customer_name,
        SUM(
            o.quantity * p.unit_price * (1 - o.discount / 100)
        ) AS customer_revenue
    FROM orders o
    JOIN customers c
        ON o.customer_id = c.customer_id
    JOIN products p
        ON o.product_id = p.product_id
    GROUP BY
        c.customer_id,
        c.customer_name
)
SELECT
    customer_id,
    customer_name,
    ROUND(customer_revenue, 2) AS customer_revenue,
    ROUND(
        customer_revenue * 100.0 /
        SUM(customer_revenue) OVER (),
        2
    ) AS revenue_contribution_pct
FROM customer_sales
ORDER BY revenue_contribution_pct DESC;


-- Q17. Customer Revenue Ranking
WITH customer_sales AS (
    SELECT
        c.customer_id,
        c.customer_name,
        SUM(
            o.quantity * p.unit_price * (1 - o.discount / 100)
        ) AS total_revenue
    FROM orders o
    JOIN customers c
        ON o.customer_id = c.customer_id
    JOIN products p
        ON o.product_id = p.product_id
    GROUP BY
        c.customer_id,
        c.customer_name
)
SELECT
    customer_id,
    customer_name,
    ROUND(total_revenue, 2) AS total_revenue,
    RANK() OVER (
        ORDER BY total_revenue DESC
    ) AS revenue_rank
FROM customer_sales
ORDER BY revenue_rank;


-- Q18. Monthly Revenue Change
WITH monthly_sales AS (
    SELECT
        YEAR(o.order_date) AS order_year,
        MONTH(o.order_date) AS order_month,
        SUM(
            o.quantity * p.unit_price * (1 - o.discount / 100)
        ) AS monthly_revenue
    FROM orders o
    JOIN products p
        ON o.product_id = p.product_id
    GROUP BY
        YEAR(o.order_date),
        MONTH(o.order_date)
)
SELECT
    order_year,
    order_month,
    ROUND(monthly_revenue, 2) AS monthly_revenue,
    ROUND(
        monthly_revenue
        - LAG(monthly_revenue) OVER (
            ORDER BY order_year, order_month
        ),
        2
    ) AS revenue_change
FROM monthly_sales
ORDER BY
    order_year,
    order_month;


-- Q19. Top 5 Customers by Revenue
WITH customer_sales AS (
    SELECT
        c.customer_id,
        c.customer_name,
        SUM(
            o.quantity * p.unit_price * (1 - o.discount / 100)
        ) AS total_revenue
    FROM orders o
    JOIN customers c
        ON o.customer_id = c.customer_id
    JOIN products p
        ON o.product_id = p.product_id
    GROUP BY
        c.customer_id,
        c.customer_name
)
SELECT
    customer_id,
    customer_name,
    ROUND(total_revenue, 2) AS total_revenue
FROM customer_sales
ORDER BY total_revenue DESC
LIMIT 5;

-- Discount Analysis
-- ============================================
-- 6. DISCOUNT ANALYSIS
-- ============================================

-- Q20. Discount Summary
SELECT
    ROUND(AVG(discount), 2) AS average_discount,
    MAX(discount) AS maximum_discount,
    MIN(discount) AS minimum_discount
FROM orders;


-- Q21. Gross Revenue vs Net Revenue
SELECT
    ROUND(
        SUM(o.quantity * p.unit_price),
        2
    ) AS gross_revenue,

    ROUND(
        SUM(
            o.quantity * p.unit_price
            * (1 - o.discount / 100)
        ),
        2
    ) AS net_revenue,

    ROUND(
        SUM(o.quantity * p.unit_price)
        -
        SUM(
            o.quantity * p.unit_price
            * (1 - o.discount / 100)
        ),
        2
    ) AS discount_amount
FROM orders o
JOIN products p
    ON o.product_id = p.product_id;


-- Q22. Revenue by Payment Mode
SELECT
    o.payment_mode,
    COUNT(o.order_id) AS total_orders,
    ROUND(
        SUM(
            o.quantity * p.unit_price
            * (1 - o.discount / 100)
        ),
        2
    ) AS total_revenue
FROM orders o
JOIN products p
    ON o.product_id = p.product_id
GROUP BY o.payment_mode
ORDER BY total_revenue DESC;

-- Window Functions + Advanced Customer Analysis
-- ============================================
-- 7. WINDOW FUNCTION ANALYSIS
-- ============================================

-- Q23. Customer-wise Order Ranking
SELECT
    o.order_id,
    o.customer_id,
    o.order_date,
    ROW_NUMBER() OVER (
        PARTITION BY o.customer_id
        ORDER BY o.order_date DESC, o.order_id DESC
    ) AS order_rank
FROM orders o;


-- Q24. Product Price Ranking by Category
SELECT
    p.product_id,
    p.product_name,
    p.category,
    p.unit_price,
    RANK() OVER (
        PARTITION BY p.category
        ORDER BY p.unit_price DESC
    ) AS price_rank
FROM products p;


-- Q25. Top Product from Each Category
SELECT
    product_name,
    category,
    unit_price
FROM (
    SELECT
        product_name,
        category,
        unit_price,
        RANK() OVER (
            PARTITION BY category
            ORDER BY unit_price DESC
        ) AS price_rank
    FROM products
) AS ranked_products
WHERE price_rank = 1;


-- Q26. Customer Running Revenue
SELECT
    o.order_id,
    o.customer_id,
    o.order_date,
    ROUND(
        o.quantity * p.unit_price
        * (1 - o.discount / 100),
        2
    ) AS order_revenue,
    ROUND(
        SUM(
            o.quantity * p.unit_price
            * (1 - o.discount / 100)
        ) OVER (
            PARTITION BY o.customer_id
            ORDER BY o.order_date, o.order_id
        ),
        2
    ) AS running_total
FROM orders o
JOIN products p
    ON o.product_id = p.product_id;


-- Q27. Dense Rank of Products by Price
SELECT
    p.product_name,
    p.category,
    p.unit_price,
    DENSE_RANK() OVER (
        PARTITION BY p.category
        ORDER BY p.unit_price DESC
    ) AS price_rank
FROM products p;

