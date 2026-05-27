SELECT
    l_orderkey,
    l_linenumber,
    count(*) AS lineitem_count
FROM {{ ref('int_lineitems_enriched') }}
GROUP BY l_orderkey, l_linenumber
HAVING count(*) > 1