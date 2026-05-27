{{
    config(
        materialized='ephemeral'
    )
}}

WITH orders_with_customers AS (
    SELECT * FROM {{ ref('Int_orders_with_customers') }}
),

final AS (
    SELECT
        c_custkey,
        c_name,
        c_mktsegment,

        count(*) AS total_orders,
        sum(o_totalprice) AS total_order_value,
        avg(o_totalprice) AS avg_order_value,
        min(o_orderdate) AS first_order_date,
        max(o_orderdate) AS latest_order_date,

        sum(
            CASE
                WHEN o_totalprice >= {{ var('high_price_threshold') }} THEN 1
                ELSE 0
            END
        ) AS high_value_order_count
    FROM orders_with_customers
    GROUP BY 1, 2, 3
)

SELECT * FROM final
