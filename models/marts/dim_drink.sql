select distinct
    md5(lower(trim(drink_name))) as drink_key,
    drink_name

from {{ ref('int_drink_sales_calculated') }}

where drink_name is not null
