WITH Customer as (
    select * from {{ref("int_customer_geography")}}
),
final as (
    select
        customer_key,
        customer_name,
        market_segment,
        account_balance,
        nation_name,
        region_name
    from Customer
)
select * from final