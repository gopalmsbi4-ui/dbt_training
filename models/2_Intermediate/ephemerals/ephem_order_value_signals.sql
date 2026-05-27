{{
    config(
        materialized='ephemeral'
    )
}}

WITH orders AS (
    SELECT * FROM {{ ref('stg_orders') }}
),

final AS (
    SELECT
        o_orderkey,
        o_custkey,
        o_orderstatus,
        o_totalprice,
        o_orderpriority,
        o_orderdate,

        CASE
            WHEN o_totalprice >= {{ var('high_price_threshold') }} THEN 'High Value'
            WHEN o_totalprice >= {{ var('high_price_threshold') }} * 0.50 THEN 'Medium Value'
            ELSE 'Low Value'
        END AS order_value_band,

        CASE
            WHEN o_orderpriority IN ('1-URGENT', '2-HIGH') THEN 'Priority'
            ELSE 'Standard'
        END AS priority_group,

        CASE
            WHEN o_orderstatus = 'O' THEN 1
            ELSE 0
        END AS is_open_order
    FROM orders
)

SELECT * FROM final
