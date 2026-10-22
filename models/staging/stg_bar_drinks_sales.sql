select

    nullif(trim(`DRINKS`), '') as drink_name,

    cast(`DATE` as date) as date,

    `OLD STOCK` as old_stock,
    `SUPPLY ` as supply,
    `TOTAL OLD STOCK` as total_old_stock,
    `NEW STOCK` as new_stock,
    `SOLD` as sold,

    `PURCHASED PRICE` as purchased_price,
    `SELLING PRICE` as selling_price,

    `TOTAL AMOUNT  P.P` as total_amount_pp,
    `TOTAL AMOUNT S.P` as total_sales_amount,

    `PROFIT` as profit

from {{ source('barlist', 'bottles') }}