-- 1. How many customers do we have in the data?

SELECT COUNT(*) FROM "customers";

-- 2. What was the city with the most profit for the company in 2015?

3.	SELECT 
4.	    o.shipping_city,
5.	    SUM(od.order_profits) AS maximum_profits
6.	 FROM orders AS o
7.	 LEFT JOIN order_details AS od
8.	 ON o.order_id = od.order_id
9.	 WHERE EXTRACT(year FROM o.order_date) = 2015
10.	 GROUP BY 1
11.	 ORDER BY 2 DESC;        
