{{
    config(
        materialized='ephemeral'
    )
}}

WITH lineitems AS (
    SELECT * FROM {{ ref('stg_lineitem') }}
),

final AS (
    SELECT
        l_orderkey,
        l_partkey,
        l_suppkey,
        l_linenumber,
        l_quantity,
        l_extendedprice,
        l_discount,
        l_tax,

        l_extendedprice AS gross_amount,
        (l_extendedprice * l_discount) AS discount_amount,
        (l_extendedprice * (1 - l_discount)) AS net_amount,
        (l_extendedprice * (1 - l_discount) * l_tax) AS tax_amount,
        (l_extendedprice * (1 - l_discount) * (1 + l_tax)) AS total_amount_after_tax
    FROM lineitems
)

SELECT * FROM final
