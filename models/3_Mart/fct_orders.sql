{{
    config(
        materialized = 'incremental',
        unique_key = 'order_surrogate_key'  
     )
}}
WITH orders AS (
    SELECT * FROM {{ref('Int_orders_with_customers')}}

    {%  if is_incremental() %}
        WHERE o_orderdate >= (SELECT MAX(o_orderdate) FROM {{ this }})
    {% endif %}
)
, revenue AS (
    SELECT * FROM {{ref('int_order_revenue')}}
)
,final AS (
    SELECT 
        {{ generate_order_surrogate_key('o.o_orderkey', 'o.c_custkey') }} AS order_surrogate_key,
        o.o_orderkey,
        o.o_orderdate,
        o.o_orderstatus,
        o.o_totalprice,
        o.o_orderpriority,
        o.o_shippriority,

        o.c_custkey,
        o.c_name,
        o.c_nationkey,
        o.c_mktsegment,
        o.c_acctbal,
        r.total_revenue_after_tax,
        r.gross_revenue,
        r.discount_amount,
        r.net_revenue,
        case 
            when o.o_totalprice >= {{ var("high_price_threshold") }} then 'High Value'
            else 'Regular Value'
            end as order_value_category
    FROM orders o
    LEFT JOIN revenue r
    ON o.o_orderkey = r.l_orderkey
)
SELECT *
FROM final
WHERE o_orderdate >= {{ var("cut_off_date") }}
--ORDER BY O_totalprice ASC
