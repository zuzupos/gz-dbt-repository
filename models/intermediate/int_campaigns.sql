SELECT *
FROM {{ ref('stg_raw__adwords')}}
UNION ALL
SELECT *
FROM {{ ref('stg_raw__bing')}}
UNION ALL
SELECT *
FROM {{ ref('stg_raw__criteo')}}
UNION ALL
SELECT *
FROM {{ ref('stg_raw__facebook')}}