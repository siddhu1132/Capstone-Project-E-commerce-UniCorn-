-- 1. How many customers do we have in the data?

SELECT COUNT(*) FROM "customers";

-- 2. What was the city with the most profit for the company in 2015?

SELECT 
	    o.shipping_city,
	    SUM(od.order_profits) AS maximum_profits
FROM orders AS o
LEFT JOIN order_details AS od
ON o.order_id = od.order_id
WHERE EXTRACT(year FROM o.order_date) = 2015
GROUP BY 1
ORDER BY 2 DESC; 

-- 3.	In 2015, what was the most profitable city's profit?

SELECT 
    o.shipping_city,
    SUM(od.order_profits) AS maximum_profits
FROM orders AS o
LEFT JOIN order_details AS od
ON o.order_id = od.order_id
WHERE EXTRACT(year FROM o.order_date) = 2015
GROUP BY 1
ORDER BY 2 DESC;

-- 4.	How many different cities do we have in the data?

SELECT COUNT(DISTINCT shipping_city) FROM  orders;

-- 5.	Show the total spent by customers from low to high.

SELECT o.customer_id, SUM(od.order_sales) AS total_spent
FROM orders AS o
LEFT JOIN order_details AS od
ON o.order_id = od.order_id
GROUP BY 1
ORDER BY 2;

-- 6.	What is the most profitable city in the State of Tennessee?

SELECT 
    o.shipping_city,
    SUM(od.order_profits) AS maximum_profits
FROM orders AS o
LEFT JOIN order_details AS od
ON o.order_id = od.order_id
WHERE o.shipping_state = 'Tennessee'
GROUP BY 1
ORDER BY 2 DESC;

-- 7. What’s the average annual profit for that city across all years?

SELECT 
    o.shipping_city,
    AVG(od.order_profits) AS AVG_profits
FROM orders AS o
LEFT JOIN order_details AS od
ON o.order_id = od.order_id
WHERE o.shipping_city = ‘Lebanon’
 GROUP BY 1
 ORDER BY 2 DESC;

-- 8.	What is the distribution of customer types in the data?

SELECT customer_segment, 
COUNT(DISTINCT customers) AS distribution 
FROM customers
GROUP BY customer_segment;


-- 9.	What’s the most profitable product category on average in Iowa across all years?

 SELECT 
    p.product_category AS product_category,
    AVG(od.order_profits) AS AVG_profits
 FROM orders AS o
 LEFT JOIN order_details AS od
 ON o.order_id = od.order_id
 LEFT JOIN product AS p
 ON p.product_id = od.product_id
 WHERE o.shipping_state = 'Iowa'
 GROUP BY 1
 ORDER BY 2 DESC;


-- 10. What is the most popular product in that category across all states in 2016?

SELECT 
    p.product_name AS product_name,
    --p.product_category AS product_category,
    SUM(od.quantity) AS num_of_items
 FROM orders AS o
 LEFT JOIN order_details AS od
 ON o.order_id = od.order_id
 LEFT JOIN product AS p
 ON p.product_id = od.product_id
 WHERE EXTRACT(year FROM o.order_date) = 2016
 AND p.product_category = 'Furniture'
 GROUP BY 1
 ORDER BY 2 DESC;
 
 -- 11. Which customer got the most discount in the data? (in total amount)
 
 SELECT c.customer_id AS customer_id,
        c.customer_name AS customer_name,
        o.order_id,
        SUM(od.order_discount * od.order_sales) AS total_discount
FROM customers AS c
INNER JOIN orders AS o
ON o.customer_id = c.customer_id
INNER JOIN order_details AS od
ON od.order_id = o.order_id
GROUP BY 1, 2, 3
ORDER BY 4 DESC;


-- 12. How widely did monthly profits vary in 2018?

WITH month_totals AS (
    SELECT to_char(order_date, 'MM-YYYY') AS month
        ,SUM(od.order_profits) AS month_total
FROM orders AS o
INNER JOIN order_details AS od
ON od.order_id = o.order_id
WHERE EXTRACT(year FROM o.order_date) = 2018
GROUP BY 1
)
SELECT month, 
        month_total,
        --LAG(month_total,1) OVER (
        --ORDER BY month
    --) previous_month_sales,
    COALESCE(month_total - LAG(month_total,1) OVER (
        ORDER BY month), month_total) AS moth_diff
FROM month_totals;

-- 13. Which order was the highest in 2015?

SELECT od.order_id, SUM(od.order_sales) AS highest_sales
FROM order_details AS od
INNER JOIN orders AS o
ON o.order_id = od.order_id
WHERE EXTRACT(year FROM o.order_date) = 2015
GROUP BY 1
ORDER BY 2 DESC;


-- 14. What was the rank of each city in the East region in 2015?

SELECT o.shipping_city AS city,
        SUM(od.quantity) AS amount_of_orders,
        rank() OVER (order by SUM(od.quantity) desc) AS rank
FROM orders AS o
LEFT JOIN order_details AS od
ON od.order_id = o.order_id
WHERE o.shipping_region = 'East'
AND EXTRACT(year FROM o.order_date) = 2015
GROUP BY 1
ORDER BY 3;


-- 15. Display customer names for customers who are in the segment ‘Consumer’ or ‘Corporate.’ How many customers are there in total?

SELECT COUNT(*) AS total_customers
FROM customers c
WHERE customer_segment IN ('Consumer','Corporate')


-- 16. Calculate the difference between the largest and smallest order quantities for product id ‘100.’

SELECT MAX(od.quantity)-MIN(od.quantity) AS diff
FROM order_details AS od
WHERE od.product_id = '100'


-- 17. Calculate the percent of products that have ‘Furniture’ as their category.

SELECT (SELECT count(*) from product WHERE product_category = 'Furniture') AS furniture_count,
        (SELECT count(*) from product) AS total_count,
        ((SELECT count(*) from product WHERE product_category = 'Furniture') * 100/ (SELECT count(*) from product) :: float ) AS percent
FROM product p
GROUP BY 1;

-- 18. Display the number of duplicate products based on their product manufacturer.

SELECT DISTINCT p.product_manufacturer, 
COUNT(p.product_id) AS dupliate_items
FROM product p
GROUP BY 1
ORDER BY 2 DESC;


-- 19. Show the product_subcategory and the total number of products in the subcategory. Show the order from most to least products and then by product_subcategory name ascending.

SELECT product_subcategory, COUNT(product_subcategory) AS total_products
FROM product
GROUP BY 1
ORDER BY 2 DESC, 1;


-- 20. Show the product_id(s), the sum of quantities, where for each sale of product quantities is greater than or equal to 100.

SELECT p.product_id, SUM(od.quantity) AS total_quantity
FROM product p
INNER JOIN order_details od
ON od.product_id = p.product_id
GROUP BY p.product_id
HAVING SUM(od.quantity) >= 100




