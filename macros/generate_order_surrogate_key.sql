{% macro generate_order_surrogate_key(order_key, customer_key) %}

MD5(
    CONCAT(
        COALESCE(CAST({{ order_key }} AS STRING), ''),
        '-',
        COALESCE(CAST({{ customer_key }} AS STRING), '')
    )
)

{% endmacro %}