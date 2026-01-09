    SELECT
        s.products_id,
        s.date_date,
        s.orders_id,
        s.revenue,
        s.quantity,
        p.purchase_price,
        (s.quantity * p.purchase_price) as purchase_cost,
        (s.revenue - (s.quantity * p.purchase_price)) as margin,
        {{ margin_percent('s.revenue', '(s.quantity * p.purchase_price)') }} AS margin_percent
    from {{ ref('stg_raw__sales') }} s
    left join {{ ref('stg_raw__product') }} p
        on s.products_id = p.products_id