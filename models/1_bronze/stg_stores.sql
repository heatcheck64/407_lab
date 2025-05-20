with source as (

    select * 
    from {{ source('raw_data', 'raw_stores') }}

),

renamed as (

    select
        store_id,
        region,
        store_name,
        store_type
    from source

)

select * from renamed
