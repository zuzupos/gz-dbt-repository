WITH shipping AS (
SELECT 
    logcost,
    ship_cost,
    shipping_fee,
    orders_id
FROM {{ ref('stg_raw__ship')}}
)

SELECT 
    margin.orders_id,
    margin.date_date,
    ROUND((margin.margin + shipping.shipping_fee - shipping.logcost - shipping.ship_cost),2) AS operational_margin,
    margin.revenue,
    margin.margin,
    margin.quantity,
    margin.purchase_cost
FROM {{ ref('int_orders_margin')}} AS margin
JOIN shipping
ON margin.orders_id = shipping.orders_id
ORDER BY orders_id DESC