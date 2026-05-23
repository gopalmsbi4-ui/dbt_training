{% macro format_customer_names(column_name) %}

UPPER(TRIM({{ column_name }}))

{% endmacro %}