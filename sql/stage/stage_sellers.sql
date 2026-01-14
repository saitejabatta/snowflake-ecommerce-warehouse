-- stage layer: sellers

create or replace table ecom_project.stage.sellers_stage(
seller_id string,
seller_zip_code_prefix number(5,0),
seller_city string,
seller_state string
);

insert into ecom_project.stage.sellers_stage
select
seller_id,
seller_zip_code_prefix,
seller_city,
seller_state
from ecom_project.raw.sellers_raw
where seller_id is not null;
