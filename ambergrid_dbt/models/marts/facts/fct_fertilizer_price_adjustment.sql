with

adjustments as (

    select * from {{ ref('stg_google_sheets__fertilizer_price_adjustments') }}

),

final as (

    select

        adjustment_id,
        product_type,
        adjustment_reason,
        approved_by,
        old_price_eur,
        new_price_eur,
        effective_date,
        is_current_in_source

    from adjustments

)

select * from final
