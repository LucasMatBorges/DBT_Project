-- Retrieve product information along with their categories and suppliers
WITH prod AS (
    SELECT 
        ct.category_name, 
        sp.company_name AS suppliers, 
        pd.product_name,
        pd.unit_price, 
        pd.product_id
    FROM {{source("sources","products")}} pd
    LEFT JOIN {{source("sources","suppliers")}} sp ON (pd.supplier_id = sp.supplier_id)
    LEFT JOIN {{source("sources","categories")}} ct ON (pd.category_id = ct.category_id)
), 

-- Fetch order details and join them with the products
orddetai AS (
    SELECT 
        pd.*, 
        od.order_id, 
        od.quantity, 
        od.discount
    FROM {{ref("orderdetails")}} od
    LEFT JOIN prod pd ON (od.product_id = pd.product_id)
),

-- Retrieve order data and associated customers, employees, and shippers
ordrs AS (
    SELECT 
        ord.order_date, 
        ord.order_id, 
        cs.company_name AS customer, 
        em.name AS employee, 
        em.age, 
        em.lenghtofservice
    FROM {{source("sources","orders")}} ord
    LEFT JOIN {{ref("customers")}} cs ON (ord.customer_id = cs.customer_id)
    LEFT JOIN {{ref("employees")}} em ON (ord.employee_id = em.employee_id)
    LEFT JOIN {{source("sources","shippers")}} sh ON (ord.ship_via = sh.shipper_id)
),

-- Combine the order details with the orders
finaljoin AS (
   SELECT 
       od.*, 
       ord.order_date, 
       ord.customer, 
       ord.employee, 
       ord.age, 
       ord.lenghtofservice
   FROM orddetai od
   INNER JOIN ordrs ord ON (od.order_id = ord.order_id)
)

-- Return the final consolidated data
SELECT * FROM finaljoin
