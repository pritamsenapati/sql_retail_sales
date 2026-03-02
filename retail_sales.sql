create database retail_sales;
use retail_sales;


select * from analysis;

-- Which category generates the highest revenue?
select category,sum(total_sale) as revenue_per_category  from analysis
group by category
order by  revenue_per_category desc;

-- What is the total revenue, total cost, total profit and profit margin?
select 
sum(total_sale) as total_revenue, 
sum(cogs) total_cost, 
sum(profit) total_profit,
sum(profit_margin) total_margin
from analysis;


-- Which category generates the most revenue?
select category, sum(total_sale) revenue, sum(profit) total_profit, sum(profit_margin) total_margin from analysis group by category order by revenue desc;


-- who speend more
select gender,count(*) number_of_pepole, sum(total_sale) revenue,avg(total_sale) average_value
from analysis group by gender;

-- top 10 customers
select customer_id,count(*) total_orders,sum(total_sale) total_spent from analysis
group by customer_id
order by total_spent desc
limit 10;

-- what is the average customer life time
SELECT 
    AVG(customer_total) AS avg_customer_value
FROM (
    SELECT customer_id, SUM(total_sale) AS customer_total
    FROM analysis
    GROUP BY customer_id
) t;

-- which age group customer spend more
select case when age< 22 then 'Under 22'
  when age between 22 and 40 then 'Under 25-40'
  when age between 41 and 60 then ' Under 41-60'
  else '60+'
  end as age_group,
  sum(total_sale) revenue,
  avg(total_sale) avg_spending
  from  analysis
  group by age_group
  order by revenue desc;
  
  -- Highest sales based on month
  select * from analysis;
  select month_name,sum(total_sale) revenue from analysis group by month_name order by revenue desc;
  
  -- which day of week has the Most Sales
  select distinct category , day_name,sum(total_sale) revenue from analysis group by category,day_name order by revenue desc;
  
-- which category has Highest Profit Margin
SELECT 
    category,
    ROUND(SUM(total_sale - cogs) / SUM(total_sale) * 100, 2) AS profit_margin_percent
FROM analysis
GROUP BY category
ORDER BY profit_margin_percent DESC;

-- are High Sales Transactions Also High Profit
SELECT 
    CASE 
        WHEN total_sale > 500 THEN 'High Sale'
        ELSE 'Low Sale'
    END AS sales_type,
    AVG(total_sale - cogs) AS avg_profit
FROM analysis
GROUP BY sales_type;

-- Which Category Performs Best for Each Gender
SELECT 
    gender,
    category,
    SUM(total_sale) AS revenue
FROM analysis
GROUP BY gender, category
ORDER BY gender, revenue DESC;