SELECT * FROM company.sales;
USE company;

-- Q1: Find all orders shipped via 'Economy' mode with a total amount greater than 25k

select * from sales
where ship_mode = 'Economy' and total_amount > 25000; 

-- Q2: Retrieve all sales data for 'Technology' category in 'Ireland' made after 2020-01-01

select * from sales
where category = 'Technology' and country = 'Ireland'and order_date > '2020-01-01';

-- Q3: List the top 10 most profitable sale transactions in descending order

select * from sales
order by unit_profit desc
limit 10;          -- for showing after top 10 record use limit 10,20 to show 11 to 20 rows

-- Q4: Find all customers whose name starts with 'j' and ends with 'n'

select order_id,customer_name from sales
where customer_name like 'J%n'; 

-- Q5: Retrieve all product names that contain 'Acco' anywhere in the name

select order_id,product_name from sales
where product_name like '%Acco%';

-- Q6: Get the top 5 cities with the highest total sales amount

select city,sum(total_amount) as total_sales from sales
group by city
order by total_sales desc
limit 5;

-- Q7: Display the second set of 10 records for customer name and total amount in descending order

select customer_name, total_amount from sales
order by total_amount desc
limit 10,10;

-- Q8: Find the total revenue, average unit cost and total number of orders

select sum(total_amount) as `total revenue`, avg(unit_cost) as `average unit cost`, count(order_id) as `total orders`
from sales;

-- Q9: Count unique number of regions

select count(distinct(region)) as `Unique region` from sales;

-- Q10: Find the number of orders placed by each customer 

select customer_name as `Customer name`, count(order_id) as `Total orders` from sales
group by customer_name
order by count(order_id) desc; 

-- Q11: Rank 5 products based on total sales using Rank()

select product_name as `Product name`, sum(total_amount) as `total sales`, rank() over (order by sum(total_amount)desc) as `sale ranking` from sales
group by product_name
limit 5;