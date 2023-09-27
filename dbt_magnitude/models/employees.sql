WITH calc_employees AS (
    SELECT 
        EXTRACT(YEAR FROM CURRENT_DATE) - EXTRACT(YEAR FROM birth_date) AS age,
        EXTRACT(YEAR FROM CURRENT_DATE) - EXTRACT(YEAR FROM hire_date) AS lenghtofservice,
        first_name || ' ' || last_name AS name, 
        *
    FROM employees
)
SELECT * FROM calc_employees
