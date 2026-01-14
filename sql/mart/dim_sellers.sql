-- mart layer: dim_sellers

create or replace table ecom_project.mart.dim_sellers as
select
seller_id,
seller_zip_code_prefix,
seller_city,
seller_state
from ecom_project.stage.sellers_stage
where seller_id is not null;
