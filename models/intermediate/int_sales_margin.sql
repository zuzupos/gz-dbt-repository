WITH margin AS (
    SELECT 
        date_date,
        orders_id,
        products_id,
        revenue,
        quantity
    FROM {{ ref('stg_raw__sales')}}
),
purch_cost AS (
    SELECT 
        purchase_price,
        products_id
    FROM {{ ref('stg_raw__product')}}
)
SELECT 
    margin.orders_id,
    margin.date_date,
    margin.revenue,
    margin.quantity,
    margin.quantity * purch_cost.purchase_price AS purchase_cost,
    margin.revenue - (margin.quantity * purch_cost.purchase_price) AS margin
FROM margin
JOIN purch_cost
ON margin.products_id = purch_cost.products_id
