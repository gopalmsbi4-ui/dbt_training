SELECT *
FROM {{ ref('int_lineitems_enriched') }}
WHERE l_shipdate < o_orderdate
