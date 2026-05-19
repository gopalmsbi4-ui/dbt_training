with partsupplier as (
    select * from {{ref("stg_partsupp")}}
),
parts as (
    select * from {{ref("stg_part")}}
),
suppliers as (
    select * from {{ref("stg_supplier")}}
),
final as (
SELECT
    ps.ps_partkey,
    p.p_name,
    p.p_brand,
    p.p_type,

    ps.ps_suppkey,
    s.s_name AS supplier_name,

    ps.ps_availqty,
    ps.ps_supplycost,

    (ps.ps_availqty * ps.ps_supplycost) AS inventory_value

FROM partsupplier ps

LEFT JOIN parts p
    ON ps.ps_partkey = p.p_partkey

LEFT JOIN suppliers s
    ON ps.ps_suppkey = s.s_suppkey
)
select * from final    