
WITH finance AS (
    SELECT 
        s.logcost,
        s.shipping_fee,
        op.orders_id,
        op.date_date,
        op.revenue,
        op.margin,
        op.operational_margin,
        op.purchase_cost,
        op.quantity
    FROM {{ ref('stg_raw__ship')}} AS s
    JOIN {{ ref('int_orders_operational')}} AS op
    ON s.orders_id = op.orders_id
)


SELECT 
    finance.date_date,
    COUNT(finance.orders_id) AS nb_transactions,
    ROUND(SUM(finance.revenue),1) AS revenue,
    ROUND(AVG(finance.revenue),1) AS average_basket,
    ROUND(SUM(finance.margin),1) AS margin,
    ROUND(SUM(finance.operational_margin),1) AS operational_margin,
    ROUND(SUM(finance.purchase_cost),1) AS total_purchase_cost,
    ROUND(SUM(finance.shipping_fee),1) AS total_shipping_fees,
    ROUND(SUM(finance.logcost),1) AS total_logcost,
    ROUND(SUM(finance.quantity),1) AS total_qty_products_sold
FROM finance
GROUP BY date_date
ORDER BY date_date DESC