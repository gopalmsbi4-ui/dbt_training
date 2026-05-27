{{
    config(
        materialized='table'
    )
}}

WITH source_customer AS (
    SELECT *
    FROM {{ source('snowflake_sample_data', 'customer') }}
),

final AS (
    SELECT
        c_custkey,
        c_name,
        c_address,
        c_nationkey,
        c_phone,
        c_acctbal,
        c_mktsegment,
        c_comment
    FROM source_customer
)

SELECT * FROM final