with source as (

    select * 
    from {{ source('raw_data', 'raw_products') }}

),

renamed as (

    select
        product_id,
        brand,
        category,
        product_name,
        cast(launch_date as date) as launch_date
    from source

)

select * from renamed
