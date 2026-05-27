WITH src AS (
    SELECT * FROM {{ ref('ephem_customer_geography') }}
)

SELECT * FROM src
