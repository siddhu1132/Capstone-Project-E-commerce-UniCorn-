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

The following questions have been answered in the ``Data Exploration SQL/data_exploration.sql``

1. _How many customers do we have in the data?_

2. _What was the city with the most profit for the company in 2015?_

3. _In 2015, what was the most profitable city's profit?_

4. _How many different cities do we have in the data?_

5. _Show the total spent by customers from low to high._

6. _What is the most profitable city in the State of Tennessee?_

7. _What’s the average annual profit for that city across all years?_

8. _What is the distribution of customer types in the data?_

9. _What’s the most profitable product category on average in Iowa across all years?_

10. _What is the most popular product in that category across all states in 2016?_
 
 11. _Which customer got the most discount in the data? (in total amount)_
 
12. _How widely did monthly profits vary in 2018?_

13. _Which order was the highest in 2015?_

14. _What was the rank of each city in the East region in 2015 in quantity?_

15. _Display customer names for customers who are in the segment ‘Consumer’ or ‘Corporate.’ How many customers are there in total?_

17. _Calculate the percent of products that are within the category ‘Furniture.’_

18. _Display the number of product manufacturers with more than 1 product in the product table._

19. _Show the product_subcategory and the total number of products in the subcategory. Show the order from most to least products and then by product_subcategory name ascending._

20. _Show the product_id(s), the sum of quantities, where the total sum of its product quantities is greater than or equal to 100._

# PART 2: Data Cleaning and Analysis with Spreadsheet

In the second part of the project, the task is to answer the following questions by querying the dataset using spreadsheet software.
Explore a unified dataset (.csv file) in a spreadsheet software. Use your data analysis skills to visualize the data and uncover interesting insights.

The following questions have been answered in the ``Data_Cleaning_and_Analysis_with_Spreadsheet/Copy of data Spreadsheet.xslx`` and ``Data_Cleaning_and_Analysis_with_Spreadsheet/new copy.xslx``

1. _What was the city with the highest sales?_

2. _What is the average discount given for all orders?_

3. _What is the most popular product among customers in the "Consumer" segment?_

4. _What is the total profit made for the "Office Supplies" category?_

5. _Who is the customer who has made the most purchases?_

6. _What state made the most profit?_

7. _How many orders were shipped via "Standard Class" ship mode?_

8. _Which region had the highest sales in the month of June?_

9. _Calculate the price per unit of each product (before discounts), and put it in a separate column. What's the most expensive product?_

10. _Create a pivot table that shows the total sales for each manufacturer and category combination. In the "Technology" category, which manufacturer had the second highest sales?_

11. _Create a new column that calculates the profit margin for each order_

12. _Use a VLOOKUP function to create a new column that shows the product sub-category for each product based on the separate sub-category sheet. What is the subcategory of “Xerox 1887”?_

13. _Create a new column that calculates the number of days between the order date and the ship date for each order. Create a conditional formatting “color scale” for this column, from greenish to reddish. What is the number of days for order id - “CA-2015-100363”?_

14. _Use the INDEX and MATCH functions to create a new column that shows the shipping cost for each order based on the separate shipping prices sheet. Assume that quantity or weight doesn’t matter. What is the shipping price for order id “CA-2015-100678”?_

15. _Create a new column that concatenates the customer name, city, and state into a single string for each order. Select the correct result for CA-2015-100090?_

16. _Use the IFS function to create a new column that categorizes each order as "High," "Low," or "Loss" based on profit and sales criteria._
```
"High" consider as:
  
   - If sales are above 200 and profit is above 20

    - If profit is above 40.

       Else:
 
 If the profit is equal or below 0 this is categorized as “Loss”
Any other case this is categorized as "Low"
```
_Use conditional formatting to color the columns with the values “High” in green and the value “Loss” in red.** 
How many “Loss” do you have?_

17. _In a new sheet, create a dropdown of category and product which returns the price for a unit (which you previously solved in exercise 9._

# PART 3: Getting Insights using Tableau

For task 3, the objective is to utilize Tableau software to conduct exploratory data analysis and extract distinctive insights from the dataset. The next step is to create an interactive dashboard that will present the findings in a dynamic way. This will enable us to analyze and interpret the data more effectively, identify trends and patterns, and make data-driven decisions.

The Following questions has been answered in ``Getting Insights using Tableau/Capstone_Project_Insights.twbx``

1. _What is the most profitable city in the State of Tennessee?_

2. _What is the average annual profit for that city across all years in that city?_

3. _What is the most profitable product category on average in Iowa across all years?_

4. _What is the most popular product in that category across all states in 2016?_

5. _What was the most profitable month in 2018 overall?_

6. _How widely did monthly profits vary in 2018?_

7. _Which regions have the highest sales volume on Unicorn, and how has this changed over time (2015-2018)?_

8. _What is the profit for different regions in each year?_

9. _Are there any regional sales differences in product category on Unicorn?

10. _What are the top-selling products in each region and each year for different product category?

The dashboard link for this insights is : ![Dashboard](https://public.tableau.com/authoring/Capstone_project_Insights/Dashboard1#1).`
