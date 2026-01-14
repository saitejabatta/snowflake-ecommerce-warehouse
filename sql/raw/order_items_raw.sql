-- raw layer: order_items

create or replace stage ecom_project.raw.order_items_raw_stage;

create or replace file format ecom_project.raw.csv_order_items_ff
    type = csv
    skip_header = 1
    field_delimiter = ','
    field_optionally_enclosed_by = '"'
    null_if = ('','null','null','nan', 'nan');

list @ecom_project.raw.order_items_raw_stage;

select *
from table(
  infer_schema(
    location => '@ecom_project.raw.order_items_raw_stage',
    file_format => 'ecom_project.raw.csv_order_items_ff'
  )
);

select $1,$2,$3,$4
from @ecom_project.raw.order_items_raw_stage
(file_format => ecom_project.raw.csv_order_items_ff)
limit 20;

create or replace table ecom_project.raw.order_items_raw(
order_id string,
order_item_id integer,
product_id string,
seller_id string,
shipping_limit_date timestamp_ntz,
price number(10,2),
freight_value number(10,2)
);

copy into ecom_project.raw.order_items_raw
from @ecom_project.raw.order_items_raw_stage
file_format = (format_name = ecom_project.raw.csv_order_items_ff)
on_error = 'continue';
