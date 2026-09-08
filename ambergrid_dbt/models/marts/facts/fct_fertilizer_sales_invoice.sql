with

invoices as (

    select * from {{ ref('stg_postgres__fertilizer_sales_invoices') }}

),

final as (

    select

        invoice_id,
        plant_id,
        customer_name,
        product_type,
        payment_status,
        quantity_tons,
        unit_price_eur,
        total_amount_eur,
        invoice_date,
        due_date,
        is_current_in_source

    from invoices

)

select * from final
