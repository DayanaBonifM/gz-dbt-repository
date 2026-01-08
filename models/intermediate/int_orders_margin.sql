    select
        orders_id,
        MAX(date_date) as date_date,
        SUM(revenue) as revenue,
        SUM(quantity) as quantity,
        SUM(purchase_cost) as purchase_cost,
        SUM(margin) as margin
    from {{ ref('int_sales_margin') }}
    group by orders_id