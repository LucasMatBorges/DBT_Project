-- Retrieve records from the 'joins' reference where the year of the order_date is 2020
SELECT * 
FROM {{ref("joins")}}
WHERE EXTRACT(YEAR FROM order_date) = 2021
