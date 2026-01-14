-- mart layer: dim_customer

create or replace table ecom_project.mart.dim_customer as
select
customer_id,
customer_unique_id,
customer_zip_code_prefix,
customer_city,
customer_state
from ecom_project.stage.customers_stage
where customer_id is not null;
