WITH Customer AS (
    SELECT * FROM {{ ref("int_customer_geography") }}
),

Final AS (
    SELECT
        Customer_key,
        {{ format_customer_names('customer_name') }} AS Customer_name_formatted,
        Customer_name,
        Market_segment,
        Account_balance,
        Nation_name,
        Region_name
    FROM Customer
)

SELECT * FROM Final