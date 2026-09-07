with

injections as (

    select * from {{ ref('stg_postgres__gas_grid_injection_daily') }}

),

final as (

    select

        record_id,
        plant_id,
        injection_date,
        biomethane_volume_nm3,
        injection_pressure_bar,
        revenue_eur,
        is_current_in_source

    from injections

)

select * from final
