# Bar Sales Analytics Project

## Project Overview

This project uses **dbt, SQL, and Databricks** to transform raw bar inventory and sales data into clean, validated, and reporting-ready datasets.

The main goal is to analyze drink sales, stock levels, revenue, costs, and profit.

## Technologies Used

- SQL
- dbt Cloud
- Databricks
- GitHub

## Data Pipeline

The project follows the **Bronze → Silver → Gold** architecture.

- **Bronze Layer:** Raw bar inventory and sales data stored in Databricks.
- **Silver Layer:** Data cleaning, standardization, business calculations, and data quality validation.
- **Gold Layer:** Fact, dimension, and reporting models used for business analysis.

## dbt Models Created

| Model | Description |
|---|---|
| stg_bar_drinks_sales | Cleans raw data and standardizes column names and drink names |
| int_drink_sales_calculated | Calculates stock, revenue, cost, and profit and checks data quality |
| dim_drink | Creates unique drink identifiers |
| fct_drink_sales | Summarizes sales information by drink and date |
| mart_daily_bar_performance | Calculates daily sales, revenue, cost, and profit |
| mart_drink_performance | Analyzes individual drink performance and profit margins |

## Business Calculations

- Expected Total Stock = Old Stock + Supply
- Expected Remaining Stock = Total Stock − Sold
- Expected Cost = Sold × Purchase Price
- Expected Revenue = Sold × Selling Price
- Expected Profit = Revenue − Cost
- Profit Margin (%) = Profit / Revenue × 100

## Data Quality Checks

SQL validation rules were implemented to identify:

- Negative stock quantities
- Negative prices
- Missing drink names
- Missing dates
- Incorrect stock calculations
- Revenue, cost, and profit mismatches

A `data_quality_status` column identifies valid and invalid records. Invalid records are retained for auditing and excluded from trusted reporting.

## Project Outcome

Successfully created and ran six dbt transformation models.

The final reporting models provide information about daily sales, drink performance, revenue, costs, profit, and inventory changes.

## Conclusion

This project demonstrates how dbt and Databricks can be used to transform raw business data into structured, validated, and reporting-ready datasets.
