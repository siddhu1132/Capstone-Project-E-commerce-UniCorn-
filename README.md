# Data Analyst Capstone Project :  E-Commerce (UniCorn)
## Project Background :

The online sector has been slowly eating up market share in the past two decades. E-commerce platforms like Unicorn allow people to buy products online: from books, toys, clothes, and shoes to food, furniture, and other household items. The following dataset includes Unicorn sales data from the years 2015-2018.

Let's suppose that the Unicorn is a family business and is owned by 2 stakeholders who are very invested in their business. They already have a small data analytics team but want to expand it significantly over the next few months. They see us  as a candidate for a DA position and provide us with a sample dataset from their sales data.

Our task is to analyze the data, find interesting insights and identify weak areas and opportunities for Unicorn to boost its business growth.

## Project Intoduction :

The project includes three main parts, each with their own subtasks:

1. Data Exploration SQL
2. Data Cleaning and Analysis with Spreadsheet
3. Getting Insights using Tableau

![](https://github.com/siddhu1132/Capstone-Project-E-commerce-UniCorn-/blob/main/schema.png)

# PART 1 : Data Exploration SQL

In the first part of the project, the task is to answer the following questions utilizing SQL queries. This task is done individually.

1. _How many customers do we have in the data?_

```sql
SELECT COUNT(*) FROM "customers";
```

2. _What was the city with the most profit for the company in 2015?_

```sql
3.	SELECT 
4.	    o.shipping_city,
5.	    SUM(od.order_profits) AS maximum_profits
6.	 FROM orders AS o
7.	 LEFT JOIN order_details AS od
8.	 ON o.order_id = od.order_id
9.	 WHERE EXTRACT(year FROM o.order_date) = 2015
10.	 GROUP BY 1
11.	 ORDER BY 2 DESC;        
```

3. _In 2015, what was the most profitable city's profit?_

```sql
12.	SELECT 
13.	    o.shipping_city,
14.	    SUM(od.order_profits) AS maximum_profits
15.	 FROM orders AS o
16.	 LEFT JOIN order_details AS od
17.	 ON o.order_id = od.order_id
18.	 WHERE EXTRACT(year FROM o.order_date) = 2015
19.	 GROUP BY 1
20.	 ORDER BY 2 DESC;
```

4. _How many different cities do we have in the data?_

```sql
SELECT COUNT(DISTINCT shipping_city) FROM  orders;
```

5. _Show the total spent by customers from low to high._

```sql
6.	SELECT o.customer_id, SUM(od.order_sales) AS total_spent
7.	FROM orders AS o
8.	 LEFT JOIN order_details AS od
9.	 ON o.order_id = od.order_id
10.	 GROUP BY 1
11.	 ORDER BY 2;
```

6. _What is the most profitable city in the State of Tennessee?_

```sql
SELECT 
    o.shipping_city,
    SUM(od.order_profits) AS maximum_profits
 FROM orders AS o
 LEFT JOIN order_details AS od
 ON o.order_id = od.order_id
 WHERE o.shipping_state = 'Tennessee'
 GROUP BY 1
 ORDER BY 2 DESC;
```

7. _What’s the average annual profit for that city across all years?_

```sql
SELECT 
    o.shipping_city,
    AVG(od.order_profits) AS AVG_profits
FROM orders AS o
LEFT JOIN order_details AS od
ON o.order_id = od.order_id
WHERE o.shipping_city = ‘Lebanon’
 GROUP BY 1
 ORDER BY 2 DESC;
```

8. _What is the distribution of customer types in the data?_

```sql
SELECT customer_segment, 
COUNT(DISTINCT customers) AS distribution 
FROM customers
GROUP BY customer_segment;
```

9. _What’s the most profitable product category on average in Iowa across all years?_

```sql
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
```

10. _What is the most popular product in that category across all states in 2016?_

```sql
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
 ```
 
 11. _Which customer got the most discount in the data? (in total amount)_
 
 ```sql
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
```

12. _How widely did monthly profits vary in 2018?_

```sql
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
```

13. _Which order was the highest in 2015?_

```sql
SELECT od.order_id, SUM(od.order_sales) AS highest_sales
FROM order_details AS od
INNER JOIN orders AS o
ON o.order_id = od.order_id
WHERE EXTRACT(year FROM o.order_date) = 2015
GROUP BY 1
ORDER BY 2 DESC;
```

14. _What was the rank of each city in the East region in 2015 in quantity?_

```sql
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
```

15. _Display customer names for customers who are in the segment ‘Consumer’ or ‘Corporate.’ How many customers are there in total?_

```sql
SELECT COUNT(*) AS total_customers
FROM customers c
WHERE customer_segment IN ('Consumer','Corporate')
```

16. _Calculate the difference between the largest and smallest order quantities for product id ‘100.’_

```sql
SELECT MAX(od.quantity)-MIN(od.quantity) AS diff
FROM order_details AS od
WHERE od.product_id = '100'
```

17. _Calculate the percent of products that are within the category ‘Furniture.’_

```sql
SELECT (SELECT count(*) from product WHERE product_category = 'Furniture') AS furniture_count,
        (SELECT count(*) from product) AS total_count,
        ((SELECT count(*) from product WHERE product_category = 'Furniture') * 100/ (SELECT count(*) from product) :: float ) AS percent
FROM product p
GROUP BY 1;
```

18. _Display the number of product manufacturers with more than 1 product in the product table. _

```sql
SELECT DISTINCT p.product_manufacturer, 
COUNT(p.product_id) AS dupliate_items
FROM product p
GROUP BY 1
ORDER BY 2 DESC;
```

19. _Show the product_subcategory and the total number of products in the subcategory.
Show the order from most to least products and then by product_subcategory name ascending. _

```sql
SELECT product_subcategory, COUNT(product_subcategory) AS total_products
FROM product
GROUP BY 1
ORDER BY 2 DESC, 1;
```

20. _Show the product_id(s), the sum of quantities, where the total sum of its product quantities is greater than or equal to 100._

```sql
SELECT p.product_id, SUM(od.quantity) AS total_quantity
FROM product p
INNER JOIN order_details od
ON od.product_id = p.product_id
GROUP BY p.product_id
HAVING SUM(od.quantity) >= 100
```
