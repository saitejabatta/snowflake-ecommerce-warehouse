-- raw layer: customers

-- stage for customers
create stage ecom_project.raw.customers_raw_stage;

-- file format for customers csv
create or replace file format ecom_project.raw.csv_customers_ff
    type = csv
    skip_header = 1
    field_delimiter = ','
    field_optionally_enclosed_by = '"'
    null_if = ('','null','null','nan', 'nan');

-- optional: list files
list @ecom_project.raw.customers_raw_stage;

-- optional: infer schema
select *
from table(
  infer_schema(
    location => '@ecom_project.raw.customers_raw_stage',
    file_format => 'ecom_project.raw.csv_customers_ff'
  )
);

-- raw table for customers
create or replace table ecom_project.raw.customers_raw(
customer_id string,
customer_unique_id string,
customer_zip_code_prefix number(5,0),
customer_city string,
customer_state string
);

-- load data to raw
copy into ecom_project.raw.customers_raw
from @ecom_project.raw.customers_raw_stage
file_format = (format_name = ecom_project.raw.csv_customers_ff)
on_error = 'continue';

-- quick check
select * from ecom_project.raw.customers_raw;
