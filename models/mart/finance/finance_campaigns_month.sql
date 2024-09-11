SELECT
    FORMAT_DATE("%b-%G", date_date) AS month_year,
    ROUND(SUM(ads_margin),1) AS ads_margin,
    ROUND(SUM(average_basket),1) AS average_basket,
    ROUND(SUM(operational_margin),1) AS operational_margin,
    SUM(ads_clicks) AS ads_clicks,
    SUM(ads_cost) AS ads_cost,
    SUM(ads_impression) AS ads_impression,
    ROUND(SUM(margin),1) AS margin,
    ROUND(SUM(revenue),1) AS revenue,
    ROUND(SUM(total_logcost),1) AS total_logcost,
    ROUND(SUM(total_purchase_cost),1) AS total_purchase_cost,
    ROUND(SUM(total_qty_products_sold),1) AS total_qty_products_sold,
    ROUND(SUM(total_shipping_fees),1) AS total_shipping_fees,
    SUM(nb_transactions) AS nb_transactions
FROM {{ ref('finance_campaigns_day')}}
GROUP BY month_year