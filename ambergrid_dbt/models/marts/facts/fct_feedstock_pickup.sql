with

stg_postgres__fleet_logistics_logs as (

    select
        pickup_id,
        supplier_id,
        plant_id,
        waste_type,
        pickup_status,
        driver_name,
        vehicle_plate,
        quantity_tons,
        distance_km,
        pickup_datetime,
        is_current_in_source
    from {{ ref('stg_postgres__fleet_logistics_logs') }}

),

final as (

    select

        pickup_id,
        supplier_id,
        plant_id,
        waste_type,
        pickup_status,
        driver_name,
        vehicle_plate,
        quantity_tons,
        distance_km,
        pickup_datetime,

        -- The source only carries a timestamp. dim_date joins on a date, so
        -- derive one rather than make every consumer cast it themselves.
        date(pickup_datetime) as pickup_date,

        is_current_in_source

    from stg_postgres__fleet_logistics_logs

)

select * from final
