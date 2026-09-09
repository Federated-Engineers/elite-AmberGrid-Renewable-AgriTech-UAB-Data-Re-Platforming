with

batches as (

    select * from {{ ref('stg_google_sheets__npk_lab_batches') }}

),

final as (

    select

        batch_id,
        plant_id,
        batch_status,
        technician_name,
        notes,
        nitrogen_pct,
        phosphorus_pct,
        potassium_pct,
        sample_date,
        is_current_in_source

    from batches

)

select * from final
