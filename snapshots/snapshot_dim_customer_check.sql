{% snapshot snapshot_dim_customer_check %}

{{
    config(
        target_schema='snapshots',
        unique_key='customer_key',

        strategy='check',

        check_cols=[
            'account_balance',
            'market_segment',
            'region_name'
        ]
    )
}}

SELECT *
FROM {{ ref('dim_customer') }}

{% endsnapshot %}