with

pickups as (

    select * from {{ ref('stg_postgres__fleet_logistics_logs') }}

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
        date(pickup_datetime) as pickup_date,
        is_current_in_source

    from pickups

)

select * from final
