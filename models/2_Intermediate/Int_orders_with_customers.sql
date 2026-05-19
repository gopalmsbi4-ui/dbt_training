WITH orders as (
    Select * from {{ref("stg_orders")}}
)
,
customers as (
    Select * from {{ref("stg_customers")}}
),
final as (
SELECT
    o.o_orderkey,
    o.o_orderdate,
    o.o_orderstatus,
    o.o_totalprice,
    o.o_orderpriority,
    o.o_shippriority,

    c.c_custkey,
    c.c_name,
    c.c_nationkey,
    c.c_mktsegment,
    c.c_acctbal

FROM orders o
LEFT JOIN customers c
    ON o.o_custkey = c.c_custkey
) 
SELECT * FROM final