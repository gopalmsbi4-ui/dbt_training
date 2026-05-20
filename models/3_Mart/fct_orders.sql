WITH orders AS (
    SELECT * FROM {{ref('Int_orders_with_customers')}}
)
, revenue AS (
    SELECT * FROM {{ref('int_order_revenue')}}
)
,final AS (
    SELECT 
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
        r.net_revenue
    FROM orders o
    LEFT JOIN revenue r
    ON o.o_orderkey = r.l_orderkey
)
SELECT *
FROM final