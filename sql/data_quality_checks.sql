-- data quality checks

-- orders: duplicate order_id
select order_id, count(*) as cnt
from ecom_project.mart.fact_order
group by order_id
having count(*) > 1;

-- customers: duplicate customer_id in dim
select customer_id, count(*) as cnt
from ecom_project.mart.dim_customer
group by customer_id
having count(*) > 1;

-- order_items: duplicate grain (order_id, order_item_id)
select order_id, order_item_id, count(*) as cnt
from ecom_project.mart.fact_order_items
group by order_id, order_item_id
having count(*) > 1;

-- negative revenue / freight check
select count(*) as bad_rows
from ecom_project.mart.fact_order_items
where revenue < 0 or freight_value < 0;

-- relationship check: order_items without matching order
select count(*) as missing_orders
from ecom_project.mart.fact_order_items
where purchase_date is null;

-- relationship check: product dimension coverage
select count(*) as missing_products
from ecom_project.mart.v_order_items_enriched
where product_category_name is null;

-- relationship check: seller dimension coverage
select count(*) as missing_sellers
from ecom_project.mart.v_seller_time_enriched
where seller_state is null;
