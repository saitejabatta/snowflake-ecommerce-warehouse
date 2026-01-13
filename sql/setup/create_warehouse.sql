-- creating warehouse in accountadmin role
use role accountadmin;

-- small cost-efficient warehouse creation
create warehouse if not exists WH_DEV_XS
warehouse_size = 'XSMALL'
auto_suspend = 60
auto_resume = True
initially_suspend = True;

-- if warehouse already created
use warehouse WH_DEV_XS;
