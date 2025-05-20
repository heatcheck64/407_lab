with sales as (

    select * from {{ ref('stg_sales') }}

),

products as (

    select * from {{ ref('stg_products') }}

),

stores as (

    select * from {{ ref('stg_stores') }}

),

joined as (

    select
        sales.id as sale_id,
        sales.sale_date,
        sales.quantity,
        sales.price_per_unit,
        sales.discount_applied,
        products.product_name,
        products.category,
        stores.region,
        stores.store_type
    from sales
    left join products on sales.product_id = products.product_id
    left join stores on sales.store_id = stores.store_id

)

select * from joined
