WITH src AS (
    SELECT * FROM {{ref('ephem_customer_geography')}}
)
Select * from src
