-- raw layer: orders

-- stage for orders
create stage ecom_project.raw.orders_raw_stage;

-- file format for orders csv
create or replace file format ecom_project.raw.csv_orders_ff
    type = csv
    skip_header = 1
    field_delimiter = ','
    field_optionally_enclosed_by = '"'
    null_if = ('','null','null','nan', 'nan');

-- optional: check files in stage
list @ecom_project.raw.orders_raw_stage;

-- optional: infer schema
select *
from table(
  infer_schema(
    location => '@ecom_project.raw.orders_raw_stage',
    file_format => 'ecom_project.raw.csv_orders_ff'
  )
);

-- optional: preview rows
select $1,$2,$3,$4
from @ecom_project.raw.orders_raw_stage
(file_format => ecom_project.raw.csv_orders_ff)
limit 20;

-- raw table for orders
create or replace table ecom_project.raw.orders_raw(
order_id string,
customer_id string,
order_status string,
order_purchase_timestamp timestamp_ntz,
order_approved_at timestamp_ntz,
order_delivered_carrier_date timestamp_ntz,
order_delivered_customer_date timestamp_ntz,
order_estimated_delivery_date timestamp_ntz
);

-- load data from stage to raw table
copy into ecom_project.raw.orders_raw
from @ecom_project.raw.orders_raw_stage
file_format = (format_name = ecom_project.raw.csv_orders_ff)
on_error = 'continue';

-- quick check
select * from ecom_project.raw.orders_raw;
