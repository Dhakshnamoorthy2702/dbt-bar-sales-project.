select 
drink_key,
drink_name,
sum(total_sold) as total_unit_sold,
sum (total_sales_revenue) as total_revenue,
sum(total_cost_of_sold) as total_cost,
sum(total_profit) as total_profit,


case
when sum(total_sales_revenue)= 0 then 0
else round ((sum (total_profit) * 100) / sum (total_sales_revenue), 2 )
end as profit_margin_pct,


round(avg(total_sold), 2) as avg_units_sold_per_day



from {{ ref('fct_drink_sales') }}
group by drink_key, drink_name