WITH supplier AS (
    SELECT * FROM {{ source('snowflake_sample_data', 'supplier') }}
),

final AS (
    SELECT
        s_suppkey,
        s_name,
        s_address,
        s_nationkey,
        s_phone,
        s_acctbal,
        s_comment
    FROM supplier--SNOWFLAKE_SAMPLE_DATA.TPCH_SF1.SUPPLIER
--LIMIT 100;
)

SELECT * FROM final