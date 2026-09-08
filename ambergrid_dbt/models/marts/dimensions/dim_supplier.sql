with

suppliers as (

    select * from {{ ref('stg_postgres__suppliers') }}

),

final as (

    select

        supplier_id,
        company_name,
        supplier_type,
        contact_name,
        contact_email,
        contact_phone,
        city,
        country,
        is_current_in_source

    from suppliers

)

select * from final
