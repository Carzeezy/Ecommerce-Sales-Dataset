SELECT * FROM ecommerce_db.ecommerce_sales;

-- Which product and category brings in the highest total revenue?
SELECT product, category, max(total) as total_revenue
FROM ecommerce_db.ecommerce_sales
group by product, category
LIMIT 1
;

-- Which customers spend the most and place the most orders?
select customer_name, COUNT(order_id) AS total_orders
from ecommerce_db.ecommerce_sales
group by customer_name
order by total_orders;

select customer_name, total
from ecommerce_db.ecommerce_sales
order by total desc
limit 5;

-- What payment methods are used most often?
select payment_method, count(payment_method) as times_used
from ecommerce_db.ecommerce_sales
group by payment_method;

-- What percentage of orders are delivered, pending, or canceled?
select status, count(*) as number_of_orders, ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (), 2) AS percentage_of_orders
from ecommerce_db.ecommerce_sales
group by status
ORDER BY percentage_of_orders DESC;
;

-- Which products have the highest quantities sold?
select product, quantity
from ecommerce_db.ecommerce_sales
order by quantity desc
limit 5;

-- What is the average (total) by category?
select category, round(avg(total),2) as avg_total
from ecommerce_db.ecommerce_sales
group by category
limit 5;