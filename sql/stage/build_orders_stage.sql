-- stage layer: orders

create or replace table ecom_project.stage.orders_stage(
order_id string,
customer_id string,
order_status string,
order_purchase_timestamp timestamp_ntz,
order_approved_at timestamp_ntz,
order_delivered_carrier_date timestamp_ntz,
order_delivered_customer_date timestamp_ntz,
order_estimated_delivery_date timestamp_ntz
);

-- transform raw -> stage (clean order_status + keep valid rows)
insert into ecom_project.stage.orders_stage
select
order_id,
customer_id,
lower(trim(order_status)) as order_status,
order_purchase_timestamp,
order_approved_at,
order_delivered_carrier_date,
order_delivered_customer_date,
order_estimated_delivery_date
from ecom_project.raw.orders_raw
where order_id is not null;
