-- ============================================
-- SUPERMART ANALYTICS CAPSTONE PROJECT
-- Name: Aishat Saleh Muhammad
-- Tool: PostgreSQL, pg admin 4
-- ============================================

-- ==========================================
-- SECTION A — Fundamentals
-- Topics: SELECT · WHERE · DISTINCT · ORDER BY · LIMIT
-- ==========================================

-- Question 1a
-- Customers in Lagos sorted by last name then first name
SELECT first_name, last_name, email
FROM customers
WHERE city = 'Lagos'
ORDER BY last_name ASC, first_name ASC;

-- Question 1b
-- All distinct cities SuperMart has shipped orders to
SELECT DISTINCT shipping_city
FROM orders
ORDER BY shipping_city ASC;

-- Question 1c
-- Top 10 most expensive products
SELECT product_name, category_id, unit_price
FROM products
ORDER BY unit_price DESC
LIMIT 10;

-- Question 1d
-- Employees hired on or after 1st January 2021
SELECT 
    first_name || ' ' || last_name AS full_name,
    role,
    hire_date,
    salary
FROM employees
WHERE hire_date >= '2021-01-01'
ORDER BY hire_date ASC;

-- Question 1e
-- All orders placed in December across any year
SELECT order_id, order_date, status, shipping_city
FROM orders
WHERE EXTRACT(MONTH FROM order_date) = 12
ORDER BY order_date DESC;


-- ==========================================
-- SECTION B — Aggregate Functions
-- Topics: COUNT · SUM · AVG · MIN · MAX · ROUND
-- ==========================================

-- Question 2a
-- Order count and percentage per status
SELECT 
    status,
    COUNT(*) AS count,
    ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (), 2) AS pct_of_total
FROM orders
GROUP BY status
ORDER BY count DESC;

-- Question 2b
-- Min, max, avg unit price per category
SELECT 
    c.category_name,
    MIN(p.unit_price) AS min_price,
    MAX(p.unit_price) AS max_price,
    ROUND(AVG(p.unit_price), 2) AS avg_price
FROM products p
JOIN categories c ON p.category_id = c.category_id
GROUP BY c.category_name
ORDER BY avg_price DESC;

-- Question 2c
-- Total, avg, max, min revenue across all order_items
SELECT 
    ROUND(SUM(quantity * unit_price * (1 - discount / 100.0)), 2) AS total_revenue,
    ROUND(AVG(quantity * unit_price * (1 - discount / 100.0)), 2) AS avg_line_revenue,
    ROUND(MAX(quantity * unit_price * (1 - discount / 100.0)), 2) AS max_line_revenue,
    ROUND(MIN(quantity * unit_price * (1 - discount / 100.0)), 2) AS min_line_revenue
FROM order_items;

-- Question 2d
-- Distinct ordering customers and average orders per customer
SELECT 
    COUNT(DISTINCT customer_id) AS distinct_customers,
    ROUND(COUNT(*) * 1.0 / COUNT(DISTINCT customer_id), 2) AS avg_orders_per_customer
FROM orders;


-- ==========================================
-- SECTION C — Grouping
-- Topics: GROUP BY · HAVING
-- ==========================================

-- Question 3a
-- Customer registrations per year 2018–2024
SELECT 
    EXTRACT(YEAR FROM registration_date) AS registration_year,
    COUNT(*) AS customer_count
FROM customers
WHERE EXTRACT(YEAR FROM registration_date) BETWEEN 2018 AND 2024
GROUP BY registration_year
ORDER BY registration_year ASC;

-- Question 3b
-- Shipping cities with more than 10 delivered orders
SELECT 
    shipping_city,
    COUNT(*) AS delivered_order_count
FROM orders
WHERE status = 'Delivered'
GROUP BY shipping_city
HAVING COUNT(*) > 10
ORDER BY delivered_order_count DESC;

-- Question 3c
-- Products with total quantity sold exceeding 50 units
SELECT 
    oi.product_id,
    p.product_name,
    SUM(oi.quantity) AS total_qty_sold
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
GROUP BY oi.product_id, p.product_name
HAVING SUM(oi.quantity) > 50
ORDER BY total_qty_sold DESC;

-- Question 3d
-- Employees who handled 20 or more orders
SELECT 
    e.first_name || ' ' || e.last_name AS full_name,
    COUNT(o.order_id) AS order_count
FROM employees e
JOIN orders o ON e.employee_id = o.employee_id
GROUP BY e.employee_id, e.first_name, e.last_name
HAVING COUNT(o.order_id) >= 20
ORDER BY order_count DESC;

-- Question 3e
-- Total orders and distinct customers per year 2021–2024
SELECT 
    EXTRACT(YEAR FROM order_date) AS order_year,
    COUNT(*) AS total_orders,
    COUNT(DISTINCT customer_id) AS distinct_customers
FROM orders
WHERE EXTRACT(YEAR FROM order_date) BETWEEN 2021 AND 2024
GROUP BY order_year
ORDER BY order_year ASC;
-- ==========================================
-- SECTION D — LIKE & ILIKE
-- Topics: LIKE · ILIKE · % wildcard · _ wildcard
-- ==========================================

-- Question 4a
-- Customers whose email ends with @gmail.com
SELECT first_name, last_name, email
FROM customers
WHERE email LIKE '%@gmail.com'
ORDER BY last_name ASC;

-- Question 4b
-- Products whose name includes 'set' anywhere (case-insensitive)
SELECT product_name, category_id, unit_price
FROM products
WHERE product_name ILIKE '%set%'
ORDER BY unit_price DESC;

-- Question 4c
-- Customers whose last name begins with 'Ad' (case-insensitive)
SELECT 
    first_name || ' ' || last_name AS full_name,
    city,
    registration_date
FROM customers
WHERE last_name ILIKE 'Ad%'
ORDER BY last_name ASC;

-- Question 4d
-- Products containing 'combo', 'kit', or 'pack' (case-insensitive)
SELECT product_name, category_id, unit_price
FROM products
WHERE product_name ILIKE '%combo%'
   OR product_name ILIKE '%kit%'
   OR product_name ILIKE '%pack%';

-- Question 4e
-- Customers whose city contains 'an' (case-insensitive)
SELECT first_name, last_name, city
FROM customers
WHERE city ILIKE '%an%'
ORDER BY city ASC, last_name ASC;


-- ==========================================
-- SECTION E — JOINs
-- Topics: INNER JOIN · LEFT JOIN · Multi-table JOIN
-- ==========================================

-- Question 5a
-- 50 most recent orders with customer and employee full names
SELECT 
    o.order_id,
    c.first_name || ' ' || c.last_name AS customer_name,
    e.first_name || ' ' || e.last_name AS employee_name,
    o.order_date,
    o.status,
    o.shipping_city
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
JOIN employees e ON o.employee_id = e.employee_id
ORDER BY o.order_date DESC
LIMIT 50;

-- Question 5b
-- All 800 customers with total orders placed (zero-order customers show 0)
SELECT 
    c.customer_id,
    c.first_name || ' ' || c.last_name AS full_name,
    c.city,
    COUNT(o.order_id) AS order_count
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name, c.city
ORDER BY order_count DESC, c.last_name ASC;

-- Question 5c
-- Detailed order line report with line_total calculated
SELECT 
    o.order_id,
    o.order_date,
    c.first_name || ' ' || c.last_name AS customer_name,
    p.product_name,
    oi.quantity,
    oi.unit_price,
    oi.discount,
    ROUND(oi.quantity * oi.unit_price * (1 - oi.discount / 100.0), 2) AS line_total
FROM order_items oi
JOIN orders o ON oi.order_id = o.order_id
JOIN customers c ON o.customer_id = c.customer_id
JOIN products p ON oi.product_id = p.product_id
ORDER BY o.order_id ASC, p.product_name ASC;

-- Question 5d
-- All 35 employees with region name and total orders handled (including zero)
SELECT 
    e.first_name || ' ' || e.last_name AS full_name,
    e.role,
    r.region_name,
    COUNT(o.order_id) AS total_orders
FROM employees e
LEFT JOIN orders o ON e.employee_id = o.employee_id
JOIN regions r ON e.region_id = r.region_id
GROUP BY e.employee_id, e.first_name, e.last_name, e.role, r.region_name
ORDER BY total_orders DESC, e.last_name ASC;

-- Question 5e
-- Per category: each product with distinct orders and total quantity sold
SELECT 
    c.category_name,
    p.product_name,
    COUNT(DISTINCT oi.order_id) AS times_ordered,
    SUM(oi.quantity) AS total_qty_sold
FROM categories c
JOIN products p ON c.category_id = p.category_id
JOIN order_items oi ON p.product_id = oi.product_id
GROUP BY c.category_name, p.product_name
ORDER BY c.category_name ASC, total_qty_sold DESC;


-- ==========================================
-- SECTION F — CASE Expressions
-- Topics: CASE WHEN · CASE inside aggregates
-- ==========================================

-- Question 6a
-- Price tier label for every product
SELECT 
    p.product_name,
    c.category_name,
    p.unit_price,
    CASE 
        WHEN p.unit_price < 10000 THEN 'Budget'
        WHEN p.unit_price BETWEEN 10000 AND 99999 THEN 'Mid-Range'
        WHEN p.unit_price >= 100000 THEN 'Premium'
    END AS price_tier
FROM products p
JOIN categories c ON p.category_id = c.category_id
ORDER BY p.unit_price ASC;

-- Question 6b
-- Pay band classification for all 35 employees
SELECT 
    first_name || ' ' || last_name AS full_name,
    role,
    salary,
    CASE 
        WHEN salary >= 100000 THEN 'Executive'
        WHEN salary BETWEEN 80000 AND 99999 THEN 'Senior'
        WHEN salary < 80000 THEN 'Entry Level'
    END AS pay_band
FROM employees
ORDER BY salary DESC;

-- Question 6c
-- Total order value with value category classification
SELECT 
    o.order_id,
    o.order_date,
    o.status,
    ROUND(SUM(oi.quantity * oi.unit_price * (1 - oi.discount / 100.0)), 2) AS total_order_value,
    CASE 
        WHEN SUM(oi.quantity * oi.unit_price * (1 - oi.discount / 100.0)) > 500000 THEN 'High Value'
        WHEN SUM(oi.quantity * oi.unit_price * (1 - oi.discount / 100.0)) BETWEEN 100000 AND 500000 THEN 'Medium Value'
        WHEN SUM(oi.quantity * oi.unit_price * (1 - oi.discount / 100.0)) < 100000 THEN 'Low Value'
    END AS value_category
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
GROUP BY o.order_id, o.order_date, o.status
ORDER BY total_order_value DESC;

-- Question 6d
-- Count of products per price tier per category (pivot style)
SELECT 
    c.category_name,
    COUNT(CASE WHEN p.unit_price < 10000 THEN 1 END) AS budget_count,
    COUNT(CASE WHEN p.unit_price BETWEEN 10000 AND 99999 THEN 1 END) AS mid_range_count,
    COUNT(CASE WHEN p.unit_price >= 100000 THEN 1 END) AS premium_count
FROM categories c
JOIN products p ON c.category_id = p.category_id
GROUP BY c.category_name
ORDER BY c.category_name ASC;


-- ==========================================
-- SECTION G — Subqueries
-- Topics: Scalar · IN / NOT IN · NOT EXISTS · Derived tables
-- ==========================================

-- Question 7a
-- Products above average unit price (scalar subquery)
SELECT product_name, category_id, unit_price
FROM products
WHERE unit_price > (SELECT AVG(unit_price) FROM products)
ORDER BY unit_price DESC;

-- Question 7b
-- Customers who have placed at least one order (using IN)
SELECT 
    first_name || ' ' || last_name AS full_name,
    city
FROM customers
WHERE customer_id IN (
    SELECT DISTINCT customer_id 
    FROM orders
);

-- Question 7c
-- Products that have never appeared in any order (NOT EXISTS)
SELECT product_id, product_name, category_id, unit_price
FROM products p
WHERE NOT EXISTS (
    SELECT 1 
    FROM order_items oi 
    WHERE oi.product_id = p.product_id
);

-- Question 7d
-- Top 5 customers by total lifetime revenue (derived table)
SELECT 
    full_name,
    city,
    total_revenue
FROM (
    SELECT 
        c.first_name || ' ' || c.last_name AS full_name,
        c.city,
        ROUND(SUM(oi.quantity * oi.unit_price * (1 - oi.discount / 100.0)), 2) AS total_revenue
    FROM customers c
    JOIN orders o ON c.customer_id = o.customer_id
    JOIN order_items oi ON o.order_id = oi.order_id
    GROUP BY c.customer_id, c.first_name, c.last_name, c.city
) AS customer_revenue
ORDER BY total_revenue DESC
LIMIT 5;

-- Question 7e
-- Customers whose lifetime revenue exceeds the average lifetime revenue
SELECT 
    full_name,
    city,
    total_revenue
FROM (
    SELECT 
        c.first_name || ' ' || c.last_name AS full_name,
        c.city,
        ROUND(SUM(oi.quantity * oi.unit_price * (1 - oi.discount / 100.0)), 2) AS total_revenue
    FROM customers c
    JOIN orders o ON c.customer_id = o.customer_id
    JOIN order_items oi ON o.order_id = oi.order_id
    GROUP BY c.customer_id, c.first_name, c.last_name, c.city
) AS customer_revenue
WHERE total_revenue > (
    SELECT AVG(total_rev)
    FROM (
        SELECT SUM(oi.quantity * oi.unit_price * (1 - oi.discount / 100.0)) AS total_rev
        FROM orders o
        JOIN order_items oi ON o.order_id = oi.order_id
        GROUP BY o.customer_id
    ) AS avg_calc
)
ORDER BY total_revenue DESC;


-- ==========================================
-- SECTION H — CTEs (Common Table Expressions)
-- Topics: WITH clause · Single CTE · Chained CTEs · CTE + CASE
-- ==========================================

-- Question 8a
-- Top 10 customers by total revenue using a single CTE
WITH customer_revenue AS (
    SELECT 
        c.customer_id,
        c.first_name || ' ' || c.last_name AS full_name,
        c.city,
        ROUND(SUM(oi.quantity * oi.unit_price * (1 - oi.discount / 100.0)), 2) AS total_revenue
    FROM customers c
    JOIN orders o ON c.customer_id = o.customer_id
    JOIN order_items oi ON o.order_id = oi.order_id
    GROUP BY c.customer_id, c.first_name, c.last_name, c.city
)
SELECT customer_id, full_name, city, total_revenue
FROM customer_revenue
ORDER BY total_revenue DESC
LIMIT 10;

-- Question 8b
-- Best-selling product per category by total quantity sold
WITH product_sales AS (
    SELECT 
        p.category_id,
        p.product_name,
        SUM(oi.quantity) AS total_qty_sold
    FROM products p
    JOIN order_items oi ON p.product_id = oi.product_id
    GROUP BY p.category_id, p.product_name
)
SELECT 
    c.category_name,
    ps.product_name,
    ps.total_qty_sold
FROM product_sales ps
JOIN categories c ON ps.category_id = c.category_id
WHERE ps.total_qty_sold = (
    SELECT MAX(total_qty_sold) 
    FROM product_sales ps2 
    WHERE ps2.category_id = ps.category_id
)
ORDER BY c.category_name ASC;

-- Question 8c
-- Monthly 2023 revenue vs average (chained CTEs)
WITH monthly_revenue AS (
    SELECT 
        EXTRACT(MONTH FROM o.order_date) AS month_num,
        ROUND(SUM(oi.quantity * oi.unit_price * (1 - oi.discount / 100.0)), 2) AS total_revenue
    FROM orders o
    JOIN order_items oi ON o.order_id = oi.order_id
    WHERE EXTRACT(YEAR FROM o.order_date) = 2023
    GROUP BY month_num
),
avg_revenue AS (
    SELECT AVG(total_revenue) AS avg_monthly_revenue
    FROM monthly_revenue
)
SELECT 
    mr.month_num,
    mr.total_revenue,
    CASE 
        WHEN mr.total_revenue > ar.avg_monthly_revenue THEN 'Above Average'
        ELSE 'Below Average'
    END AS vs_average
FROM monthly_revenue mr
CROSS JOIN avg_revenue ar
ORDER BY mr.month_num ASC;

-- Question 8d
-- Customer frequency segmentation report
WITH order_counts AS (
    SELECT 
        c.customer_id,
        c.first_name || ' ' || c.last_name AS full_name,
        COUNT(o.order_id) AS total_orders
    FROM customers c
    LEFT JOIN orders o ON c.customer_id = o.customer_id
    GROUP BY c.customer_id, c.first_name, c.last_name
)
SELECT 
    CASE 
        WHEN total_orders >= 8 THEN 'High Frequency'
        WHEN total_orders BETWEEN 4 AND 7 THEN 'Regular'
        WHEN total_orders BETWEEN 1 AND 3 THEN 'Occasional'
        ELSE 'Inactive'
    END AS segment,
    COUNT(*) AS customer_count
FROM order_counts
GROUP BY segment
ORDER BY customer_count DESC;

-- Question 8e
-- Year-over-year total revenue from delivered orders
WITH delivered_revenue AS (
    SELECT 
        EXTRACT(YEAR FROM o.order_date) AS order_year,
        ROUND(SUM(oi.quantity * oi.unit_price * (1 - oi.discount / 100.0)), 2) AS total_revenue
    FROM orders o
    JOIN order_items oi ON o.order_id = oi.order_id
    WHERE o.status = 'Delivered'
    GROUP BY order_year
)
SELECT order_year, total_revenue
FROM delivered_revenue
ORDER BY order_year ASC;


-- ==========================================
-- SECTION I — Capstone Challenge
-- Topics: CTEs + JOINs + GROUP BY + Aggregates + CASE
-- ==========================================

-- Question 9 — Employee Sales Performance Report
WITH OrderValues AS (
    -- CTE 1: Compute total value for every individual order
    SELECT 
        order_id,
        SUM(quantity * unit_price * (1 - discount/100.0)) AS order_revenue
    FROM order_items
    GROUP BY order_id
),
EmployeeAggregates AS (
    -- CTE 2: Aggregate metrics by operational employee
    SELECT 
        o.employee_id,
        COUNT(o.order_id) AS total_delivered_orders,
        SUM(ov.order_revenue) AS total_revenue,
        AVG(ov.order_revenue) AS avg_order_value,
        MAX(ov.order_revenue) AS best_single_order
    FROM orders o
    JOIN OrderValues ov ON o.order_id = ov.order_id
    WHERE o.status = 'Delivered'
      AND o.order_date BETWEEN '2021-01-01' AND '2024-06-30'
    GROUP BY o.employee_id
)
-- Final Select: Safely combine baseline roster via a LEFT JOIN chain
SELECT 
    CONCAT(e.first_name, ' ', e.last_name) AS employee_name,
    e.role,
    r.region_name,
    COALESCE(ea.total_delivered_orders, 0) AS total_delivered_orders,
    ROUND(COALESCE(ea.total_revenue, 0), 2) AS total_revenue,
    ROUND(COALESCE(ea.avg_order_value, 0), 2) AS avg_order_value,
    ROUND(COALESCE(ea.best_single_order, 0), 2) AS best_single_order,
    CASE 
        WHEN ea.total_revenue > 5000000 THEN 'Elite'
        WHEN ea.total_revenue BETWEEN 1000000 AND 5000000 THEN 'Strong'
        WHEN ea.total_revenue BETWEEN 100000 AND 999999 THEN 'Developing'
        ELSE 'Inactive'
    END AS performance_band
FROM employees e
JOIN regions r ON e.region_id = r.region_id
LEFT JOIN EmployeeAggregates ea ON e.employee_id = ea.employee_id
ORDER BY total_revenue DESC, employee_name ASC;

-- ==========================================
-- SECTION J 
-- ==========================================

-- Question 10 — Customer Lifetime Value Report
WITH customer_orders AS (
    SELECT 
        c.customer_id,
        c.first_name || ' ' || c.last_name AS customer_name,
        c.city,
        EXTRACT(YEAR FROM c.registration_date) AS registration_year,
        COUNT(o.order_id) AS total_orders,
        COUNT(CASE WHEN o.status = 'Delivered' THEN 1 END) AS delivered_orders,
        COUNT(CASE WHEN o.status = 'Cancelled' THEN 1 END) AS cancelled_orders,
        ROUND(SUM(
            CASE WHEN o.status = 'Delivered' 
            THEN oi.quantity * oi.unit_price * (1 - oi.discount / 100.0) 
            ELSE 0 END
        ), 2) AS lifetime_revenue
    FROM customers c
    LEFT JOIN orders o ON c.customer_id = o.customer_id
    LEFT JOIN order_items oi ON o.order_id = oi.order_id
    WHERE EXTRACT(YEAR FROM c.registration_date) < 2024
    GROUP BY c.customer_id, c.first_name, c.last_name, c.city, c.registration_date
)
SELECT 
    customer_name,
    city,
    registration_year,
    total_orders,
    delivered_orders,
    cancelled_orders,
    lifetime_revenue,
    CASE 
        WHEN delivered_orders > 0 
        THEN ROUND(lifetime_revenue / delivered_orders, 2)
        ELSE 0 
    END AS avg_order_value,
    CASE 
        WHEN lifetime_revenue > 500000 AND delivered_orders >= 5 THEN 'VIP'
        WHEN lifetime_revenue BETWEEN 100000 AND 500000 
          OR delivered_orders BETWEEN 2 AND 4 THEN 'Loyal'
        WHEN delivered_orders = 1 THEN 'One-Time Buyer'
        WHEN total_orders > 0 AND delivered_orders = 0 THEN 'No Conversions'
        ELSE 'Inactive'
    END AS customer_segment
FROM customer_orders
ORDER BY lifetime_revenue DESC, customer_name ASC;