WITH suppliers AS (
    SELECT * FROM {{ ref("stg_supplier") }}
),

nations AS (
    SELECT * FROM {{ ref("stg_nation") }}
),

regions AS (
    SELECT * FROM {{ ref("stg_region") }}
),

final AS (
    SELECT
        s.s_suppkey AS supplier_key,
        s.s_name AS supplier_name,
        s.s_acctbal AS account_balance,
        n.n_name AS nation_name,
        r.r_name AS region_name

    FROM suppliers AS s

    LEFT JOIN nations AS n
        ON s.s_nationkey = n.n_nationkey

    LEFT JOIN regions AS r
        ON n.n_regionkey = r.r_regionkey
)

SELECT * FROM final