# Retail Sales Analysis SQL Project

## Project Overview

**Project Title**: Retail Sales Analysis  
**Level**: Beginner  
**Database**: `p1_retail_db`

This project is designed to demonstrate SQL skills and techniques typically used by data analysts to explore, clean, and analyze retail sales data. The project involves setting up a retail sales database, performing exploratory data analysis (EDA), and answering specific business questions through SQL queries. This project is ideal for those who are starting their journey in data analysis and want to build a solid foundation in SQL.

## Objectives

1. **Set up a retail sales database**: Create and populate a retail sales database with the provided sales data.
2. **Data Cleaning**: Identify and remove any records with missing or null values.
3. **Exploratory Data Analysis (EDA)**: Perform basic exploratory data analysis to understand the dataset.
4. **Business Analysis**: Use SQL to answer specific business questions and derive insights from the sales data.

## Project Structure

### 1. Database Setup

- **Database Creation**: The project starts by creating a database named `p1_retail_db`.
- **Table Creation**: A table named `retail_sales` is created to store the sales data. The table structure includes columns for transaction ID, sale date, sale time, customer ID, gender, age, product category, quantity sold, price per unit, cost of goods sold (COGS), and total sale amount.

```sql
CREATE DATABASE p1_retail_db;

-- Create Table
CREATE TABLE retail_sales
(
    transactions_id INT PRIMARY KEY,
    sale_date DATE,	
    sale_time TIME,
    customer_id INT,	
    gender VARCHAR(10),
    age INT,
    category VARCHAR(35),
    quantity INT,
    price_per_unit FLOAT,	
    cogs FLOAT,
    total_sale FLOAT
);
2. Data Exploration & Cleaning
Record Count: Determine the total number of records in the dataset.

Customer Count: Find out how many unique customers are in the dataset.

Category Count: Identify all unique product categories in the dataset.

Null Value Check: Check for any null values in the dataset and delete records with missing data.

sql
SELECT COUNT(*) FROM retail_sales;
SELECT COUNT(DISTINCT customer_id) FROM retail_sales;
SELECT DISTINCT category FROM retail_sales;

SELECT * FROM retail_sales
WHERE 
    sale_date IS NULL OR sale_time IS NULL OR customer_id IS NULL OR 
    gender IS NULL OR age IS NULL OR category IS NULL OR 
    quantity IS NULL OR price_per_unit IS NULL OR cogs IS NULL;

DELETE FROM retail_sales
WHERE 
    sale_date IS NULL OR sale_time IS NULL OR customer_id IS NULL OR 
    gender IS NULL OR age IS NULL OR category IS NULL OR 
    quantity IS NULL OR price_per_unit IS NULL OR cogs IS NULL;
3. Data Analysis & Findings
The following SQL queries were developed to answer specific business questions:

Write a SQL query to retrieve all columns for sales made on '2022-11-05':

sql
SELECT *
FROM retail_sales
WHERE sale_date = '2022-11-05';
Write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 4 in the month of Nov-2022:

sql
SELECT 
  *
FROM retail_sales
WHERE 
    category = 'Clothing'
    AND 
    TO_CHAR(sale_date, 'YYYY-MM') = '2022-11'
    AND
    quantity >= 4;
Write a SQL query to calculate the total sales (total_sale) for each category.:

sql
SELECT 
    category,
    SUM(total_sale) as net_sale,
    COUNT(*) as total_orders
FROM retail_sales
GROUP BY 1;
Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.:

sql
SELECT
    ROUND(AVG(age), 2) as avg_age
FROM retail_sales
WHERE category = 'Beauty';
Write a SQL query to find all transactions where the total_sale is greater than 1000.:

sql
SELECT * FROM retail_sales
WHERE total_sale > 1000;
Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category.:

sql
SELECT 
    category,
    gender,
    COUNT(*) as total_trans
FROM retail_sales
GROUP 
    BY 
    category,
    gender
ORDER BY 1;
Write a SQL query to calculate the average sale for each month. Find out best selling month in each year:

sql
SELECT 
       year,
       month,
    avg_sale
FROM 
(    
SELECT 
    EXTRACT(YEAR FROM sale_date) as year,
    EXTRACT(MONTH FROM sale_date) as month,
    AVG(total_sale) as avg_sale,
    RANK() OVER(PARTITION BY EXTRACT(YEAR FROM sale_date) ORDER BY AVG(total_sale) DESC) as rank
FROM retail_sales
GROUP BY 1, 2
) as t1
WHERE rank = 1;
Write a SQL query to find the top 5 customers based on the highest total sales:

sql
SELECT 
    customer_id,
    SUM(total_sale) as total_sales
FROM retail_sales
GROUP BY 1
ORDER BY 2 DESC
LIMIT 5;
Write a SQL query to find the number of unique customers who purchased items from each category.:

sql
SELECT 
    category,    
    COUNT(DISTINCT customer_id) as cnt_unique_cs
FROM retail_sales
GROUP BY category;
Write a SQL query to create each shift and number of orders (Example Morning <12, Afternoon Between 12 & 17, Evening >17):

sql
WITH hourly_sale
AS
(
SELECT *,
    CASE
        WHEN EXTRACT(HOUR FROM sale_time) < 12 THEN 'Morning'
        WHEN EXTRACT(HOUR FROM sale_time) BETWEEN 12 AND 17 THEN 'Afternoon'
        ELSE 'Evening'
    END as shift
FROM retail_sales
)
SELECT 
    shift,
    COUNT(*) as total_orders    
FROM hourly_sale
GROUP BY shift;
Which category generates the highest revenue:

sql
SELECT category, SUM(total_sale) AS revenue_per_category  
FROM analysis
GROUP BY category
ORDER BY revenue_per_category DESC;
What is the total revenue, total cost, total profit and profit margin:

sql
SELECT 
    SUM(total_sale) AS total_revenue, 
    SUM(cogs) AS total_cost, 
    SUM(profit) AS total_profit,
    SUM(profit_margin) AS total_margin
FROM analysis;
Who spends more? (by gender):

sql
SELECT 
    gender,
    COUNT(*) AS number_of_people, 
    SUM(total_sale) AS revenue,
    AVG(total_sale) AS average_value
FROM analysis 
GROUP BY gender;
Top 10 customers:

sql
SELECT 
    customer_id,
    COUNT(*) AS total_orders,
    SUM(total_sale) AS total_spent 
FROM analysis
GROUP BY customer_id
ORDER BY total_spent DESC
LIMIT 10;
What is the average customer lifetime value:

sql
SELECT 
    AVG(customer_total) AS avg_customer_value
FROM (
    SELECT customer_id, SUM(total_sale) AS customer_total
    FROM analysis
    GROUP BY customer_id
) t;
Which age group spends more:

sql
SELECT 
    CASE 
        WHEN age < 22 THEN 'Under 22'
        WHEN age BETWEEN 22 AND 40 THEN '25-40'
        WHEN age BETWEEN 41 AND 60 THEN '41-60'
        ELSE '60+'
    END AS age_group,
    SUM(total_sale) AS revenue,
    AVG(total_sale) AS avg_spending
FROM analysis
GROUP BY age_group
ORDER BY revenue DESC;
Highest sales based on month:

sql
SELECT 
    month_name,
    SUM(total_sale) AS revenue 
FROM analysis 
GROUP BY month_name 
ORDER BY revenue DESC;
Which day of week has the most sales:

sql
SELECT 
    category, 
    day_name,
    SUM(total_sale) AS revenue 
FROM analysis 
GROUP BY category, day_name 
ORDER BY revenue DESC;
Which category has the highest profit margin:

sql
SELECT 
    category,
    ROUND(SUM(total_sale - cogs) / SUM(total_sale) * 100, 2) AS profit_margin_percent
FROM analysis
GROUP BY category
ORDER BY profit_margin_percent DESC;
Are high sales transactions also high profit:

sql
SELECT 
    CASE 
        WHEN total_sale > 500 THEN 'High Sale'
        ELSE 'Low Sale'
    END AS sales_type,
    AVG(total_sale - cogs) AS avg_profit
FROM analysis
GROUP BY sales_type;
Which category performs best for each gender?:

sql
SELECT 
    gender,
    category,
    SUM(total_sale) AS revenue
FROM analysis
GROUP BY gender, category
ORDER BY gender, revenue DESC;
Which product category drives the most profit?:

sql
SELECT 
    category,
    SUM(total_sale) AS total_revenue,
    SUM(profit) AS total_profit,
    ROUND(SUM(profit) / SUM(total_sale) * 100, 2) AS profit_margin_pct
FROM analysis
GROUP BY category
ORDER BY total_profit DESC;
Is revenue growing year-over-year?:

sql
SELECT 
    year,
    SUM(total_sale) AS total_revenue,
    SUM(profit) AS total_profit,
    ROUND(SUM(profit)/SUM(total_sale)*100,2) AS profit_margin_pct
FROM analysis
GROUP BY year
ORDER BY year;
Which month has the highest profit margin?:

sql
SELECT 
    month_name,
    SUM(total_sale) AS revenue,
    SUM(profit) AS profit,
    ROUND(SUM(profit)/SUM(total_sale)*100,2) AS profit_margin_pct
FROM analysis
GROUP BY month_name
ORDER BY profit_margin_pct DESC;
Which customers are at risk of churn? (only one purchase):

sql
SELECT 
    customer_id,
    COUNT(*) AS total_orders,
    SUM(total_sale) AS total_spent
FROM analysis
GROUP BY customer_id
HAVING COUNT(*) = 1;
Which category has the highest repeat purchase behavior?:

sql
SELECT 
    category,
    COUNT(DISTINCT customer_id) AS unique_customers,
    COUNT(*) AS total_transactions,
    ROUND(COUNT(*) / COUNT(DISTINCT customer_id),2) AS avg_orders_per_customer
FROM analysis
GROUP BY category
ORDER BY avg_orders_per_customer DESC;
Are older customers more profitable than younger customers?:

sql
SELECT 
    CASE 
        WHEN age < 30 THEN 'Under 30'
        WHEN age BETWEEN 30 AND 50 THEN '30-50'
        ELSE '50+'
    END AS age_group,
    SUM(total_sale) AS revenue,
    SUM(profit) AS profit,
    ROUND(SUM(profit)/SUM(total_sale)*100,2) AS profit_margin_pct
FROM analysis
GROUP BY age_group
ORDER BY profit_margin_pct DESC;
Which day has the highest profit efficiency?:

sql
SELECT 
    day_name,
    SUM(total_sale) AS revenue,
    SUM(profit) AS profit,
    ROUND(SUM(profit)/SUM(total_sale)*100,2) AS profit_margin_pct
FROM analysis
GROUP BY day_name
ORDER BY profit_margin_pct DESC;
Is there price sensitivity by category?:

sql
SELECT 
    category,
    AVG(price_per_unit) AS avg_price,
    AVG(quantity) AS avg_quantity
FROM analysis
GROUP BY category;
Which category has the highest revenue volatility?:

sql
SELECT 
    category,
    STDDEV(total_sale) AS revenue_volatility
FROM analysis
GROUP BY category
ORDER BY revenue_volatility DESC;
Which customers are high revenue but low margin?:

sql
SELECT 
    customer_id,
    SUM(total_sale) AS revenue,
    SUM(profit) AS profit,
    ROUND(SUM(profit)/SUM(total_sale)*100,2) AS margin_pct
FROM analysis
GROUP BY customer_id
ORDER BY margin_pct ASC
LIMIT 10;
What percentage of revenue comes from high-value transactions ( >500)?:

sql
SELECT 
    SUM(CASE WHEN total_sale > 500 THEN total_sale ELSE 0 END) 
    / SUM(total_sale) * 100 AS high_value_revenue_pct
FROM analysis;
Additional Table Schema: analysis
The queries from 11 to 32 reference an analysis table. Based on your input, this table contains the following columns (likely derived or enhanced from the original retail_sales data):

Column Name	Data Type	Description
transactions_id	INT	Unique transaction identifier
sale_date	DATE	Date of sale
sale_time	TIME	Time of sale
customer_id	INT	Customer identifier
gender	VARCHAR	Customer gender
age	INT	Customer age
category	VARCHAR	Product category
quantity	INT	Quantity sold
price_per_unit	FLOAT	Price per unit
cogs	FLOAT	Cost of goods sold
total_sale	FLOAT	Total sale amount
Year	INT	Extracted year from sale_date
Month	INT	Extracted month number from sale_date
month_name	VARCHAR	Full month name
Day	INT	Extracted day of month from sale_date
day_name	VARCHAR	Day of week name
quarter	INT	Quarter number (1-4)
profit	FLOAT	Calculated as total_sale - cogs
profit_margin	FLOAT	Calculated as profit / total_sale * 100
high_value	BOOLEAN	Flag for total_sale > 1000 (or >500 in some queries)
Quarter_Label	VARCHAR	Label like 'Q1 2022'
You can create this table by enriching the original retail_sales data with the calculated columns above.

Findings
Customer Demographics: The dataset includes customers from various age groups, with sales distributed across different categories such as Clothing and Beauty.

High-Value Transactions: Several transactions had a total sale amount greater than 1000, indicating premium purchases.

Sales Trends: Monthly analysis shows variations in sales, helping identify peak seasons.

Customer Insights: The analysis identifies the top-spending customers and the most popular product categories.

Reports
Sales Summary: A detailed report summarizing total sales, customer demographics, and category performance.

Trend Analysis: Insights into sales trends across different months and shifts.

Customer Insights: Reports on top customers and unique customer counts per category.

Conclusion
This project serves as a comprehensive introduction to SQL for data analysts, covering database setup, data cleaning, exploratory data analysis, and business-driven SQL queries. The findings from this project can help drive business decisions by understanding sales patterns, customer behavior, and product performance.
