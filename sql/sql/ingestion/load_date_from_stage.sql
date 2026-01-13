use role accountadmin;
use warehouse WH_DEV_XS;


-- i have used snowflakes COPY INTO feature, it loads data from stage to raw tables
-- optional: verify the files are in stages
-- list @ecom_project.raw.orders_raw_stage;
-- list @ecom_project.raw.customers_raw_stage;

-- in order to load data from stage to raw table, there must be a table present in the database with same no of columns and headers
-- orders table
create or replace table ecom_project.raw.orders_raw(
order_id string,
customer_id string,
order_status string,
order_purchase_timestamp timestamp_ntz,
order_approved_at timestamp_ntz,
order_delivered_carrier_date timestamp_ntz,
order_delivered_customer_date timestamp_ntz,
order_estimated_delivery_date timestamp_ntz);

-- customer table
create or replace table ecom_project.raw.customers_raw(
customer_id string,
customer_unique_id string,
customer_zip_code_prefix number(5,0),
customer_city string,
customer_state string
);


-- load data from stage to tables
--orders table
copy into ecom_project.raw.orders_raw
from @ecom_project.raw.orders_raw_stage
file_format = (format_name = ecom_project.raw.csv_orders_ff)
on_error = 'continue';


-- customers table
copy into ecom_project.raw.customers_raw
from @ecom_project.raw.customers_raw_stage
file_format = (format_name = ecom_project.raw.csv_customers_ff)
on_error = 'continue';

