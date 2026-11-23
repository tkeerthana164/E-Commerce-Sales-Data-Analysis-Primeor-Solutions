CREATE DATABASE primeor_ecommerce;
USE primeor_ecommerce;
SHOW TABLES;
SELECT COUNT(*)
FROM ecommerce_sales;
SELECT *
FROM ecommerce_sales;
DESCRIBE ecommerce_sales;

-- Top 10 Profitable Products
SELECT
    product_name,
    SUM(profit) AS total_profit
FROM ecommerce_sales
GROUP BY product_name
ORDER BY total_profit DESC
LIMIT 10;

-- Top 10 Customers by Sales
SELECT
customer_name, SUM(sales) AS total_sales
 FROM ecommerce_sales
 GROUP BY customer_name
 ORDER BY total_sales DESC
 LIMIT 10;
 
 -- Region wise total sales
 SELECT
 region,SUM(sales) AS total_sales
  FROM ecommerce_sales
  GROUP BY region
  ORDER BY total_sales DESC;
  
 -- Category-wise Average Profit
 SELECT
    category,
    AVG(profit) AS average_profit
FROM ecommerce_sales
GROUP BY category
ORDER BY average_profit DESC;

-- Highest Discount Category
SELECT
    category,
    AVG(
        CAST(REPLACE(discount, '%', '') AS DECIMAL(10,2))
    ) AS average_discount
FROM ecommerce_sales
GROUP BY category
ORDER BY average_discount DESC
LIMIT 1;

--  Orders with Negative Profit
SELECT
    order_id,
    order_date,
    customer_name,
    product_name,
    category,
    sales,
    profit
FROM ecommerce_sales
WHERE profit < 0
ORDER BY profit ASC;

-- Monthly Sales Trend
SELECT
    YEAR(order_date) AS year,
    MONTH(order_date) AS month,
    MONTHNAME(order_date) AS month_name,
    SUM(sales) AS total_sales
FROM ecommerce_sales
GROUP BY
    YEAR(order_date),
    MONTH(order_date),
    MONTHNAME(order_date)
ORDER BY
    year,
    month;
    
    -- Market-wise Revenue Analysis
    SELECT
    market,
    SUM(sales) AS total_revenue
FROM ecommerce_sales
GROUP BY market
ORDER BY total_revenue DESC;

-- Top-performing Sub-categories
SELECT
    sub_category,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit
FROM ecommerce_sales
GROUP BY sub_category
ORDER BY total_sales DESC
LIMIT 10;

--  Ship Mode Usage Analysis
SELECT
    ship_mode,
    COUNT(*) AS total_records,
    SUM(sales) AS total_sales
FROM ecommerce_sales
GROUP BY ship_mode
ORDER BY total_records DESC;




 