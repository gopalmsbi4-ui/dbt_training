WITH lineitems AS (
    SELECT * FROM {{ ref("stg_lineitem") }}
),

orders AS (
    SELECT * FROM {{ ref("stg_orders") }}
),

parts AS (
    SELECT * FROM {{ ref("stg_part") }}
),

suppliers AS (
    SELECT * FROM {{ ref("stg_supplier") }}
),

final AS (
    SELECT
        l.l_orderkey,
        l.l_partkey,
        l.l_suppkey,
        l.l_linenumber,

        l.l_quantity,
        l.l_extendedprice,
        l.l_discount,
        l.l_tax,

        l.l_shipdate,
        l.l_commitdate,
        l.l_receiptdate,

        o.o_orderdate,
        o.o_orderpriority,
        o.o_orderstatus,

        p.p_name,
        p.p_brand,
        p.p_type,
        p.p_container,

        s.s_name AS supplier_name

    FROM lineitems AS l

    LEFT JOIN orders AS o
        ON l.l_orderkey = o.o_orderkey

    LEFT JOIN parts AS p
        ON l.l_partkey = p.p_partkey

    LEFT JOIN suppliers AS s
        ON l.l_suppkey = s.s_suppkey
)

SELECT *
FROM final
