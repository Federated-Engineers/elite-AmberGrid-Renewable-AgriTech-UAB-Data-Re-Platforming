with

contracts as (

    select * from {{ ref('stg_postgres__supplier_contracts') }}

),

final as (

    select

        contract_id,
        supplier_id,
        plant_id,
        waste_type,
        contract_status,
        price_per_ton_eur,
        contract_start_date,
        contract_end_date,
        is_current_in_source

    from contracts

)

select * from final
