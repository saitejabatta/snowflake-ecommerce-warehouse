-- kpis: sellers

-- top 20 sellers by revenue
select seller_id, sum(revenue) as revenue
from ecom_project.mart.v_seller_time_enriched
group by seller_id
order by revenue desc
limit 20;

-- seller delivery rate
select seller_id,
avg(case when is_delivered then 1 else 0 end) as delivery_rate
from ecom_project.mart.v_seller_time_enriched
group by seller_id
order by delivery_rate desc;

-- average freight per seller
select seller_id,
avg(freight_value) as average_freight_value
from ecom_project.mart.v_seller_time_enriched
group by seller_id
order by average_freight_value desc;

-- revenue by seller state
select seller_state,
sum(revenue) as revenue
from ecom_project.mart.v_seller_time_enriched
group by seller_state
order by revenue desc;
