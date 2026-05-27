WITH supplier AS (
    SELECT * FROM {{ ref("int_supplier_geography") }}
),

final AS (
    SELECT
        supplier_key,
        supplier_name,
        account_balance,
        nation_name,
        region_name
    FROM supplier
)

SELECT * FROM final