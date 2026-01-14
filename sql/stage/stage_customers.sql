-- stage layer: customers

create or replace table ecom_project.stage.customers_stage(
customer_id string,
customer_unique_id string,
customer_zip_code_prefix number(5,0),
customer_city string,
customer_state string
);

-- transform raw -> stage (lower city, filter valid)
insert into ecom_project.stage.customers_stage
select
customer_id,
customer_unique_id,
customer_zip_code_prefix,
lower(trim(customer_city)),
customer_state
from ecom_project.raw.customers_raw
where customer_unique_id is not null;

-- quick check
select * from ecom_project.stage.customers_stage;
