WITH customers AS (
    SELECT * FROM {{ ref("stg_customers") }}
),

nations AS (
    SELECT * FROM {{ ref("stg_nation") }}
),

regions AS (
    SELECT * FROM {{ ref("stg_region") }}
),

final AS (

    SELECT
        c.c_custkey AS customer_key,
        c.c_name AS customer_name,
        c.c_mktsegment AS market_segment,
        c.c_acctbal AS account_balance,
        n.n_name AS nation_name,
        r.r_name AS region_name

    FROM customers AS c

    LEFT JOIN nations AS n
        ON c.c_nationkey = n.n_nationkey

    LEFT JOIN regions AS r
        ON n.n_regionkey = r.r_regionkey
)

SELECT * FROM final