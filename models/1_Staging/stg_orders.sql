-- CTE to extract raw orders data from the Snowflake source table
WITH orders AS (
    Select * from {{ source('snowflake_sample_data', 'orders') }}
)
-- CTE to select specific order columns for the final output
, final AS (
SELECT
    o_orderkey,        -- Unique order identifier
    o_custkey,         -- Customer key/ID
    o_orderstatus,     -- Status of the order (Pending, Shipped, etc.)
    o_totalprice,      -- Total price of the order
    o_orderdate,       -- Date the order was placed
    o_orderpriority,   -- Priority level of the order
    o_clerk,           -- Clerk handling the order
    o_shippriority,    -- Shipping priority flag
    o_comment          -- Additional order comments
FROM orders
--LIMIT 100;        -- Comment out to limit results during testing
)
-- Final SELECT to return all staging columns
SELECT * FROM final