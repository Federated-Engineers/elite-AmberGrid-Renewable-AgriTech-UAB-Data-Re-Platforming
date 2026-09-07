with

plants as (

    select * from {{ ref('stg_postgres__plants') }}

),

final as (

    select

        plant_id,
        plant_name,
        plant_type,
        city,
        country,
        capacity_tons_per_day,
        num_bioreactors,
        commissioned_date,
        is_current_in_source

    from plants

)

select * from final
