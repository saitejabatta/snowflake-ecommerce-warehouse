-- raw layer: products

create or replace stage ecom_project.raw.products_stage;

create or replace file format ecom_project.raw.csv_products_ff
    type = csv
    skip_header = 1
    field_delimiter = ','
    field_optionally_enclosed_by = '"'
    null_if = ('','null','null','nan', 'nan');

select $1,$2,$3,$4
from @ecom_project.raw.products_stage
(file_format => ecom_project.raw.csv_products_ff)
limit 20;

select *
from table(
  infer_schema(
    location => '@ecom_project.raw.products_stage',
    file_format => 'ecom_project.raw.csv_products_ff'
  )
);

create or replace table ecom_project.raw.products(
product_id string,
product_category_name string,
product_name_length number(10,2),
product_description_length number(10,2),
product_photos_qty number(10,2),
product_weight_g number(10,2),
product_length_cm number(10,2),
product_height_cm number(10,2),
product_width_cm number(10,2)
);

copy into ecom_project.raw.products
from @ecom_project.raw.products_stage
file_format = (format_name = ecom_project.raw.csv_products_ff)
on_error = 'continue';
