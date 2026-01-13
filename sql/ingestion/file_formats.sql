use role accountadmin;
use warehouse WH_DEV_XS;

-- identifying the file formats for orders raw
create or replace file format ecom_project.raw.csv_orders_ff
    type = csv
    skip_header = 1
    field_delimiter = ','
    field_optionally_enclosed_by = '"'
    null_if = ('','NULL','null','Nan', 'nan');


-- identifying the file formats for customer raw
create or replace file format ecom_project.raw.csv_customers_ff
    type = csv
    skip_header = 1
    field_delimiter = ','
    field_optionally_enclosed_by = '"'
    null_if = ('','NULL','null','Nan', 'nan');
