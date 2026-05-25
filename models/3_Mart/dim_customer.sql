{{
    config(
        materialized = 'view'
     )
}}
WITH Customer as (
    select * from {{ref("int_customer_geography")}}
),
final as (
    select
        customer_key,
        {{ format_customer_names('customer_name') }} as customer_name_formatted,
        customer_name,
        market_segment,
        account_balance,
        nation_name,
        region_name
    from Customer
)
select * from final