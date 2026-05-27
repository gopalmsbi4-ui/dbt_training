WITH lineitems AS (
    SELECT * FROM {{ ref("stg_lineitem") }}
),

final AS (

    SELECT
        l.l_orderkey,

        SUM(l.l_extendedprice) AS gross_revenue,

        SUM(l.l_extendedprice * l.l_discount) AS discount_amount,

        SUM(
            l.l_extendedprice * (1 - l.l_discount)
        ) AS net_revenue,

        SUM(
            l.l_extendedprice * (1 - l.l_discount) * (1 + l.l_tax)
        ) AS total_revenue_after_tax

    FROM lineitems AS l
    GROUP BY l.l_orderkey
)

SELECT * FROM final