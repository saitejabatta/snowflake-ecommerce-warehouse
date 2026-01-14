-- mart layer: views

create or replace view ecom_project.mart.v_order_items_enriched as
select
f.order_id,
f.order_item_id,
f.product_id,
p.product_category_name,
f.seller_id,
f.purchase_date,
f.customer_state,
f.revenue,
f.freight_value,
f.is_delivered
from ecom_project.mart.fact_order_items f
left join ecom_project.mart.dim_product p
on f.product_id = p.product_id;

create or replace view ecom_project.mart.v_seller_time_enriched as
select
f.order_id,
f.order_item_id,
f.seller_id,
s.seller_state,
s.seller_city,
f.purchase_date,
f.customer_state,
f.revenue,
f.freight_value,
f.is_delivered
from ecom_project.mart.fact_order_items f
left join ecom_project.mart.dim_sellers s
on f.seller_id = s.seller_id;
