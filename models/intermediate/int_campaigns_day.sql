SELECT
  date_date,
  paid_source,
  COUNT(DISTINCT campaign_key) AS total_campaigns,
  SUM(ads_cost) AS total_ads_cost,
  SUM(impressions) AS total_impressions,
  SUM(clicks) AS total_clicks
FROM {{ ref('int_campaigns') }}
GROUP BY date_date, paid_source
ORDER BY date_date DESC, paid_source