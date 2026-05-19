with suppliers as (
    select * from {{ref("stg_supplier")}}
),
nations as (
    select * from {{ref("stg_nation")}}
),
regions as (
    select * from {{ref("stg_region")}}
),
final as (
SELECT
    s.s_suppkey,
    s.s_name,
    s.s_acctbal,

    n.n_name AS nation_name,
    r.r_name AS region_name

FROM suppliers s

LEFT JOIN nations n
    ON s.s_nationkey = n.n_nationkey

LEFT JOIN regions r
    ON n.n_regionkey = r.r_regionkey
)
SELECT * FROM final    