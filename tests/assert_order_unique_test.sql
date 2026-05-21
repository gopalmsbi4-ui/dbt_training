SELECT 
o_orderkey,
count(*) as order_count
FROM 
{{ ref('fct_orders') }}
GROUP BY o_orderkey
HAVING count(*) >1
