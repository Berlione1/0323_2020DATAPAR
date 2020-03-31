select max(price) , min(price)
from order_items;

select min(shipping_limit_date) , max(shipping_limit_date)
from order_items; 

select customer_state, count(customer_id)
from customers
group by customer_state
order by 2 desc
limit 3;

select customer_city, count(customer_id) as count, customer_state
from customers
where customer_state='SP'
group by customer_city
order by count desc
limit  3;

select count(distinct(business_segment))
from  closed_deals;

select distinct(business_segment), sum(declared_monthly_revenue) as total_revenue
from closed_deals
group by business_segment
order by total_revenue desc
limit 3; 

select count(distinct(review_score))
from order_reviews;

create temporary table T1 (
select distinct(review_score), review_comment_message
from order_reviews
order by review_score asc);

select review_score, count(review_score) as total
from T1
group by review_score
order by review_score

