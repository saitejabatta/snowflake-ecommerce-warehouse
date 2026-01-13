use role accountadmin;
use warehouse WH_DEV_XS;


-- Internal stages: controlled "loading docks" for files before COPY INTO
use database ecom_project;
use schema raw;

create stage if not exists orders_raw_stage;
create stage if not exists customers_raw_stage;
