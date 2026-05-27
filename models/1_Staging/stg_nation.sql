WITH nation AS (
    SELECT * FROM {{ source('snowflake_sample_data', 'nation') }}
),

final AS (
    SELECT
        n_nationkey,
        n_name,
        n_regionkey,
        n_comment
    FROM nation
)

SELECT * FROM final