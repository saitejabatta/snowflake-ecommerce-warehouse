-- stage layer: products

create or replace table ecom_project.stage.products_stage(
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

insert into ecom_project.stage.products_stage
select
product_id,
lower(product_category_name) as category_name,
product_name_length,
product_description_length,
product_photos_qty,
product_weight_g,
product_length_cm,
product_height_cm,
product_width_cm
from ecom_project.raw.products
where product_id is not null;
