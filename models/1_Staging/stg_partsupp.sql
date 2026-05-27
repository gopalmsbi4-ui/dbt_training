WITH partsupp AS (
    SELECT * FROM {{ source('snowflake_sample_data', 'partsupp') }}
),

final AS (
    SELECT
        ps_partkey,
        ps_suppkey,
        ps_availqty,
        ps_supplycost,
        ps_comment
    FROM partsupp--SNOWFLAKE_SAMPLE_DATA.TPCH_SF1.PARTSUPP
--LIMIT 100;
)

SELECT * FROM final