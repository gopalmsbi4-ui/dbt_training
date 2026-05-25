{{
    config(
        materialized='ephemeral'
    )
}}

with orders_with_customers as (
    select * from {{ ref('Int_orders_with_customers') }}
),
final as (
    select
        c_custkey,
        c_name,
        c_mktsegment,

        count(*) as total_orders,
        sum(o_totalprice) as total_order_value,
        avg(o_totalprice) as avg_order_value,
        min(o_orderdate) as first_order_date,
        max(o_orderdate) as latest_order_date,

        sum(
            case
                when o_totalprice >= {{ var('high_price_threshold') }} then 1
                else 0
            end
        ) as high_value_order_count
    from orders_with_customers
    group by 1, 2, 3
)
select * from final
