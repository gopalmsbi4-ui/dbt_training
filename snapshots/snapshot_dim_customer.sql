{% snapshot snapshot_dim_customer %}

{{
    config(
        target_schema='snapshots',
        unique_key='customer_key',
        strategy='timestamp',
        updated_at='updated_at'
    )
}}

SELECT
    customer_key,
    customer_name,
    customer_address,
    customer_phone,
    account_balance,
    market_segment,
    nation_name,
    region_name,

    CURRENT_TIMESTAMP AS updated_at

FROM {{ ref('dim_customer') }}

{% endsnapshot %}