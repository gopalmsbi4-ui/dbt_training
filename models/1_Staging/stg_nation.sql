WITH nation AS (
    Select * from {{ source('snowflake_sample_data', 'nation') }}
)
, final AS (
SELECT
    n_nationkey,
    n_name,
    n_regionkey,
    n_comment
FROM nation
) 
SELECT * FROM final