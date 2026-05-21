SELECT 
l_orderkey,
l_linenumber,
count(*) as lineitem_count
FROM {{ ref('int_lineitems_enriched') }}
group by l_orderkey, l_linenumber
having count(*) > 1