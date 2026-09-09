with

stg_postgres__plants as (

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
    from {{ ref('stg_postgres__plants') }}

)

select * from stg_postgres__plants
