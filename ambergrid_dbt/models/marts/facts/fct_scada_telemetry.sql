with

readings as (

    select * from {{ ref('stg_scada__telemetry') }}

),

final as (

    select

        event_id,
        plant_id,
        bioreactor_id,
        firmware_version,
        sensor_status,
        methane_purity_pct,
        digestate_temperature_celsius,
        pressure_level_bar,
        ambient_gas_leak_ppm,
        is_gas_leak_alarm_triggered,
        reading_at,
        reading_date

    from readings

)

select * from final
