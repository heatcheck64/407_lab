with sales_details as (
    select * from {{ ref('sales_with_details') }}
),
daily_summary as (
    select
        sale_date,
        region,
        count(distinct sale_id) as total_sales,
        sum(quantity * price_per_unit * (1 - discount_applied / 100.0)) as revenue,
        avg(quantity) as avg_quantity_per_sale
    from sales_details
    group by sale_date, region
)
select * from daily_summary