-- mart layer: fact_order (orders enriched with customer info + delivery metrics)

create or replace table ecom_project.mart.fact_order as
select
o.order_id,
o.customer_id,
o.order_status,
o.order_purchase_timestamp,
cast(o.order_purchase_timestamp as date) as purchase_date,
o.order_approved_at,
o.order_delivered_customer_date,
o.order_estimated_delivery_date,

case when o.order_delivered_customer_date is not null then true else false end as is_delivered,

case
when o.order_delivered_customer_date is not null
and o.order_estimated_delivery_date is not null
and o.order_delivered_customer_date <= o.order_estimated_delivery_date
then true else false
end as is_on_time,

case
when o.order_delivered_customer_date is not null
and o.order_approved_at is not null
then datediff('day', o.order_approved_at, o.order_delivered_customer_date) else null
end as delivery_days,

c.customer_city,
c.customer_state
from ecom_project.stage.orders_stage o
left join ecom_project.mart.dim_customer c
on o.customer_id = c.customer_id
where o.order_id is not null;
