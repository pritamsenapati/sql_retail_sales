create database sql_project_01;
use sql_project_01;


drop table if EXISTS sql_project_01;
create table reatil_sales (
transactions_id int,	
sale_date date,
sale_time time,
customer_id int,
gender varchar(50),
age int,
category varchar(20),
quantiy int,
price_per_unit float,	
cogs float,
total_sale float
)

select * from reatil_sales;

select count(*) from reatil_sales;


select * from reatil_sales
where transactions_id is null;



select * from reatil_sales
where sale_date is null;


select * from reatil_sales
where sale_time is null;


## do all the  operation in one frame

-- DATA CLEANING
select * from reatil_sales
where
        transactions_id is null
        or
        sale_date is null
        or
        sale_time is null
        or customer_id is null
        or
        gender is null
        or
        age is null
        or 
        category is null
        or
        quantiy is null
        or price_per_unit is null
        or cogs is null
        or 
        total_sale is  null;
        
-- ------
SET SQL_SAFE_UPDATES = 0;
delete from reatil_sales
where
        transactions_id is null
        or
        sale_date is null
        or
        sale_time is null
        or customer_id is null
        or
        gender is null
        or
        age is null
        or 
        category is null
        or
        quantiy is null
        or price_per_unit is null
        or cogs is null
        or 
        total_sale is  null;
        SET SQL_SAFE_UPDATES = 1;
        
        
        -- DATA EXPLORATION
        -- how many sales we have
        select * from reatil_sales;
        
select count(*)  total_sales from reatil_sales;

-- how many customers
select count(distinct  customer_id) from reatil_sales;
-- category
select count(distinct  category) from reatil_sales;


-- data analysis & business key problems $ answer
-- question 1
select * from reatil_sales
where sale_date ='2022-11-05';


-- question 2
select *
from reatil_sales
where category ='Clothing'
 and 
 quantiy >=3
 and 
 date_format(sale_date, 'YYYY-MM') ='2022-11';
 
 
 -- question 3
 select category , sum(total_sale) , COUNT(*) as total_orders
 from reatil_sales
 group by 1;
 
 
 -- 4
 select avg(age) from reatil_sales where category ='Beauty';
 
 -- 5
 select * from reatil_sales
 where total_sale >1000;
 
 -- 6
 select gender,category ,count(*) from reatil_sales
 group by gender;
 
 -- 7
 select * from reatil_sales;

SELECT *
FROM (
    SELECT 
        YEAR(sale_date) AS sale_year,
        MONTH(sale_date) AS sale_month,
        AVG(total_sale) AS avg_sale,
        RANK() OVER (PARTITION BY YEAR(sale_date) 
                     ORDER BY AVG(total_sale) DESC) AS rnk
    FROM reatil_sales
    GROUP BY YEAR(sale_date), MONTH(sale_date)
) AS t1
WHERE rnk = 1;

-- 8
select 
customer_id,
sum(total_sale) as total_sales
from reatil_sales
group by 1
order by 2 desc
limit 5;

-- 9
select category, count(distinct customer_id) as uniques
from reatil_sales
group by category;

-- 10
select *,
   case
      when hour(sale_date)<12 then 'Morning'
      when hour(sale_time) between 12 and 17 then 'Afternoon'
      else 'Evening'
      end as shift
      from reatil_sales;