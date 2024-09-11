WITH finance_campaign AS (
SELECT 
    c.date_date,
    c.ads_clicks,
    c.ads_cost,
    c.ads_impression,
    f.nb_transactions,
    f.revenue,
    f.average_basket,
    f.margin,
    f.operational_margin,
    f.total_logcost,
    f.total_purchase_cost,
    f.total_qty_products_sold,
    f.total_shipping_fees
FROM {{ ref('int_campaigns_day')}} as c
JOIN {{ ref('finance_days')}} as f
ON c.date_date = f.date_date

)

SELECT
    finance_campaign.date_date,
    ROUND((operational_margin - ads_cost),1) AS ads_margin,
    average_basket,
    operational_margin,
    ads_cost,
    ads_impression,
    ads_clicks,
    revenue,
    margin,
    total_logcost,
    total_purchase_cost,
    total_qty_products_sold,
    total_shipping_fees,
    nb_transactions
FROM finance_campaign
ORDER BY date_date DESC