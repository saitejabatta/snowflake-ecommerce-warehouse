-- kpis: order_items

-- total revenue
select sum(revenue) as total_revenue
from ecom_project.mart.fact_order_items;

-- revenue by day
select purchase_date, sum(revenue) as daily_revenue
from ecom_project.mart.fact_order_items
group by purchase_date
order by purchase_date;

-- top states by revenue
select customer_state, sum(revenue) as revenue
from ecom_project.mart.fact_order_items
group by customer_state
order by revenue desc;
