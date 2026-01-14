-- raw layer: sellers

create or replace stage ecom_project.raw.sellers_raw_stage;

create or replace file format ecom_project.raw.csv_sellers_ff
    type = csv
    skip_header = 1
    field_delimiter = ','
    field_optionally_enclosed_by = '"'
    null_if = ('','null','null','nan', 'nan');

select * from
table(
infer_schema(
location => '@ecom_project.raw.sellers_raw_stage',
file_format => 'ecom_project.raw.csv_sellers_ff'
)
);

create or replace table ecom_project.raw.sellers_raw(
seller_id string,
seller_zip_code_prefix number(5,0),
seller_city string,
seller_state string
);

copy into ecom_project.raw.sellers_raw
from @ecom_project.raw.sellers_raw_stage
file_format = (format_name = ecom_project.raw.csv_sellers_ff)
on_error = 'continue';
