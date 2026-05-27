WITH region AS (
    SELECT * FROM {{ source('snowflake_sample_data', 'region') }}
),

final AS (
    SELECT
        r_regionkey,
        r_name,
        r_comment
    FROM region
)

SELECT * FROM final
