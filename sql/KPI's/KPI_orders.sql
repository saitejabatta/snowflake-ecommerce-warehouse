-- kpis: orders

-- order volume by day
select purchase_date, count(*) as total_orders
from ecom_project.mart.fact_order
group by purchase_date
order by purchase_date;

-- average delivery days
select avg(delivery_days) as avg_delivery_days
from ecom_project.mart.fact_order
where is_delivered = true;

-- on time delivery rate by state
select customer_state,
avg(case when is_on_time then 1 else 0 end) as on_time_rate
from ecom_project.mart.fact_order
where is_delivered = true
group by customer_state
order by on_time_rate desc;
