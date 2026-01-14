-- kpis: products

-- top 20 products by revenue
select product_id, sum(revenue) as revenue
from ecom_project.mart.v_order_items_enriched
group by product_id
order by revenue desc
limit 20;

-- top categories by revenue
select product_category_name, sum(revenue) as revenue
from ecom_project.mart.v_order_items_enriched
group by product_category_name
order by revenue desc
limit 20;

-- category revenue trend over time (monthly)
select date_trunc('month', purchase_date) as month,
product_category_name,
sum(revenue) as revenue
from ecom_project.mart.v_order_items_enriched
group by month, product_category_name
order by month, revenue desc;

-- average order value
with order_totals as (
select order_id,
sum(revenue) as order_revenue
from ecom_project.mart.v_order_items_enriched
group by order_id
)
select avg(order_revenue) as averge_order_value
from order_totals;
