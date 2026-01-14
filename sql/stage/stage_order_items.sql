-- stage layer: order_items

create or replace table ecom_project.stage.order_items_stage as
select
order_id,
order_item_id,
product_id,
seller_id,
shipping_limit_date,
price,
freight_value
from ecom_project.raw.order_items_raw
where order_id is not null
and order_item_id is not null
and price >= 0;
