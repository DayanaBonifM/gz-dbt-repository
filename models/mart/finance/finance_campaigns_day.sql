WITH finance AS (
    SELECT
        date_date,
        revenue,
        margin,
        operational_margin,
        purchase_cost,
        shipping_fee,
        log_cost,
        ship_cost,
        quantity,
        average_basket
    FROM {{ ref('finance_days') }}
),

campaigns AS (
    SELECT
        date_date,
        SUM(total_ads_cost) AS ads_cost,
        SUM(total_impressions) AS ads_impression,
        SUM(total_clicks) AS ads_clicks
    FROM {{ ref('int_campaigns_day') }}
    GROUP BY date_date
)

SELECT
    f.date_date AS date,
    (f.operational_margin - c.ads_cost) AS ads_margin,
    f.average_basket,
    f.operational_margin,
    c.ads_cost,
    c.ads_impression,
    c.ads_clicks,
    f.quantity,
    f.revenue,
    f.purchase_cost,
    f.margin,
    f.shipping_fee,
    f.log_cost,
    f.ship_cost
FROM finance f
LEFT JOIN campaigns c
    ON f.date_date = c.date_date
ORDER BY date DESC