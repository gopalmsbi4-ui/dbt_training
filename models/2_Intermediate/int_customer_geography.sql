WITH customers as (
    select * from {{ref("stg_customers")}}
)
,nations as (
    select * from {{ref("stg_nation")}}
),
regions as (
    select * from {{ref("stg_region")}}
),
final as (

SELECT
    c.c_custkey,
    c.c_name,
    c.c_mktsegment,
    c.c_acctbal,

    n.n_name AS nation_name,
    r.r_name AS region_name

FROM customers c

LEFT JOIN nations n
    ON c.c_nationkey = n.n_nationkey

LEFT JOIN regions r
    ON n.n_regionkey = r.r_regionkey
)
SELECT * FROM final