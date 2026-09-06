-- An invoice total must equal quantity times unit price. The one cent
-- tolerance absorbs rounding in the source. Nulls fail as well, since a
-- missing value means the total cannot be reconciled at all.

select

    invoice_id,
    quantity_tons,
    unit_price_eur,
    total_amount_eur,
    round(quantity_tons * unit_price_eur, 2) as expected_total_eur

from {{ ref('stg_postgres__fertilizer_sales_invoices') }}

where
    quantity_tons is null
    or unit_price_eur is null
    or total_amount_eur is null
    or abs(total_amount_eur - round(quantity_tons * unit_price_eur, 2)) > 0.01
