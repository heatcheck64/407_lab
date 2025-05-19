with source as (

    select * 
    from {{ source('raw_data', 'raw_sales') }}

),

renamed as (

    select
        sale_id as id,
        product_id,
        store_id,
        cast(sale_date as date) as sale_date,
        cast(quantity as integer) as quantity,
        cast(price_per_unit as numeric(10,2)) as price_per_unit,
        discount_applied
    from source

)

select * from renamed
