select 
md5(lower(trim (drink_name))) as drink_key,
drink_name,
date,
sum(sold) as total_sold,
sum(supply) as total_supply,
(sum(supply) - sum(sold)) as net_stock_change,
sum(expected_sales_revenue) as total_sales_revenue,
sum(expected_cost_of_sold) as total_cost_of_sold,
sum(expected_profit) as total_profit


from {{ ref('int_drink_sales_calculated') }}

where data_quality_status = 'valid'
group by drink_name, date

