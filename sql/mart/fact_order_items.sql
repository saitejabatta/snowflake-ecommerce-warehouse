-- mart layer: fact_order_items

create or replace table ecom_project.mart.fact_order_items as
select
oi.order_id,
oi.order_item_id,
oi.product_id,
oi.seller_id,
o.purchase_date,
o.customer_state,

oi.price as revenue,
oi.freight_value,

case when o.is_delivered then true
else false end as is_delivered
from ecom_project.stage.order_items_stage oi
left join ecom_project.mart.fact_order o
on oi.order_id = o.order_id;
