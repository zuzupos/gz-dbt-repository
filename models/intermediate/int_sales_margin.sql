WITH margin AS (
    SELECT 
        date_date,
        orders_id,
        products_id,
        revenue,
        quantity,
       
    FROM {{ ref('stg_raw__sales')}}
),

purch_cost AS (
    SELECT 
        purchase_price,
        products_id
    FROM {{ ref('stg_raw__product')}}
),

sales_margin AS (
SELECT 
    margin.orders_id,
    margin.date_date,
    CAST(margin.revenue AS FLOAT64) AS revenue,
    margin.quantity,
    margin.quantity * purch_cost.purchase_price AS purchase_cost,
    CAST(margin.revenue - (margin.quantity * purch_cost.purchase_price) AS FLOAT64) AS margin,
FROM margin
JOIN purch_cost
ON margin.products_id = purch_cost.products_id
)

SELECT 
    *,
    {{ margin_percent("margin", "revenue") }} AS margin_percent
FROM sales_margin