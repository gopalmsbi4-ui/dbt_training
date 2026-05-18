WITH part AS (
    SELECT * FROM {{ source('snowflake_sample_data', 'part') }}
), 
final AS (
SELECT
    p_partkey,
    p_name,
    p_mfgr,
    p_brand,
    p_type,
    p_size,
    p_container,
    p_retailprice,
    p_comment
FROM part --SNOWFLAKE_SAMPLE_DATA.TPCH_SF1.PART
--LIMIT 100;
)
SELECT * FROM final