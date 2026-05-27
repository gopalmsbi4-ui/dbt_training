WITH partsupplier AS (
    SELECT * FROM {{ ref("stg_partsupp") }}
),

parts AS (
    SELECT * FROM {{ ref("stg_part") }}
),

suppliers AS (
    SELECT * FROM {{ ref("stg_supplier") }}
),

final AS (
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

    FROM partsupplier AS ps

    LEFT JOIN parts AS p
        ON ps.ps_partkey = p.p_partkey

    LEFT JOIN suppliers AS s
        ON ps.ps_suppkey = s.s_suppkey
)

SELECT * FROM final