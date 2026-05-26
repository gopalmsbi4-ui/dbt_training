{% snapshot snapshot_dim_customer_timestamp %}

{{
    config(
        target_schema='snapshots',
        unique_key='customer_key',
        strategy='timestamp',
        updated_at='updated_at'
    )
}}

SELECT
   * ,

    CURRENT_TIMESTAMP AS updated_at

FROM {{ ref('dim_customer') }}

{% endsnapshot %}