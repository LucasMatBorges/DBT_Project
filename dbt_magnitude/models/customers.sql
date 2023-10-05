-- Create a markup with the first customer ID for each combination of company and contact
WITH markup AS (
    SELECT *, 
        FIRST_VALUE(customer_id) OVER (
            PARTITION BY company_name, contact_name
            ORDER BY company_name
            ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS result
    FROM {{source("sources","customers")}}), 

-- Get distinct customer IDs from the markup
removed AS (
    SELECT DISTINCT result FROM markup), 

-- Filter the original data based on the distinct customer IDs
final AS (
    SELECT * FROM {{source("sources","customers")}} 
    WHERE customer_id IN (SELECT result FROM removed))

-- Return the final data
SELECT * FROM final
