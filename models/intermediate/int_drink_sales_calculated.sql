select *, 
(old_stock + supply) as expected_total_stock,
(sold * purchased_price) as expected_cost_of_sold,
(sold * selling_price) as expected_sales_revenue,
(expected_sales_revenue - expected_cost_of_sold) as expected_profit,
(expected_total_stock - sold) as expected_new_stock,
ABS(total_old_stock - expected_total_stock) as stock_difference,
ABS(new_stock - expected_new_stock) as new_stock_difference,
ABS(total_amount_pp - expected_cost_of_sold) as cost_difference,
ABS(total_sales_amount - expected_sales_revenue) as sales_difference,
ABS(profit - expected_profit) as profit_difference,



case
    when stock_difference > 0.01
      or new_stock_difference > 0.01
      or cost_difference > 0.01
      or sales_difference > 0.01
      or profit_difference > 0.01
    then 'mismatch'
    else 'match'
end as mismatch_status,


case
    when old_stock < 0
      or supply < 0
      or sold < 0
      or new_stock < 0
    then 'invalid'
    else 'valid'
end as quantity_status,



case
    when purchased_price < 0
      or selling_price < 0
    then 'invalid'
    else 'valid'
end as price_status,



case
    when date is null
    then 'invalid'
    else 'valid'
end as date_status,



case
    when drink_name is null
    then 'invalid'
    else 'valid'
end as drinks_name_status,



case
    when quantity_status = 'invalid'
      or price_status = 'invalid'
      or date_status = 'invalid'
      or drinks_name_status = 'invalid'
    then 'invalid'
    else 'valid'
end as data_quality_status

from {{ ref('stg_bar_drinks_sales') }}


