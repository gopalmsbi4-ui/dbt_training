WITH orders AS (
    Select * from {{ source('snowflake_sample_data', 'orders') }}
)
, final AS (
SELECT
    o_orderkey,
    o_custkey,
    o_orderstatus,
    o_totalprice,
    o_orderdate,
    o_orderpriority,
    o_clerk,
    o_shippriority,
    o_comment
FROM orders
--LIMIT 100;
)
SELECT * FROM final