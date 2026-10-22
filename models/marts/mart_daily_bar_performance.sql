select 
date,
sum(total_sold) as daily_total_sold,
sum (total_sales_revenue) as daily_total_revenue,
sum(total_cost_of_sold) as daily_total_cost,
sum(total_profit) as daily_total_profit


from {{ ref('fct_drink_sales') }}


group by date