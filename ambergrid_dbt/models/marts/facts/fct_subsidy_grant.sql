with

grants as (

    select * from {{ ref('stg_google_sheets__subsidy_grants') }}

),

final as (

    select

        grant_id,
        plant_id,
        subsidy_type,
        granting_authority,
        officer_name,
        approval_status,
        amount_eur,
        grant_date,
        is_current_in_source

    from grants

)

select * from final
