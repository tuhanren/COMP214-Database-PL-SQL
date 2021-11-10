SELECT * FROM countries;
SELECT * FROM customers;  
SELECT * FROM orders;
SELECT * FROM employees;

ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD';


/* Self Join */
SELECT e.employee_id, e.first_name, e.last_name, e.manager_id, m.first_name, m.last_name
FROM employees e
INNER JOIN employees m
ON e.manager_id = m.employee_id
WHERE e.employee_id = 101;

/* Subquery */
SELECT employee_id, first_name, last_name 
FROM employees
WHERE employee_id =  (SELECT manager_id FROM employees WHERE  employee_id = 101)


DESCRIBE countries;
/* Practice */
set serveroutput on;
accept x char prompt 'Please enter the first letter of the country name: '
declare 
  init_c varchar2(1);
begin
  init_c := '&x';   -- for a substitution variable of char data type 
dbms_output.put_line('The letter is: ' || init_c || '%'); 
End;

--Create table temp (name varchar2(10);

SELECT * FROM countries;
/* Question 1 */
SELECT *
FROM countries
WHERE country_name LIKE '&EnterFirstLetter%';

--Instruction: user must enter a lower case g
--If 'g' then return nothing

/* Question 2 */
SELECT * FROM countries 
WHERE UPPER(country_name) LIKE UPPER('&EnterLetter%');

SELECT * FROM countries 
WHERE LOWER(country_name) LIKE LOWER('&EnterLetter%');

/* Question 3*/
SELECT location_id, city
FROM locations
WHERE location_id in 
(SELECT location_id
FROM locations
MINUS 
SELECT location_id
FROM warehouses )

/* Question 4*/
SELECT category_id, CATEGORY_NAME, TO_NUMBER(NULL) as product_count
FROM product_categories
WHERE category_id <>  3 and category_id <> 4
UNION
SELECT category_id, TO_CHAR(NULL), COUNT(product_id) 
FROM products
WHERE category_id <> 3 and category_id <> 4
GROUP BY category_id 
ORDER BY product_count DESC

-- ORDER BY product_count 

/* Question 6*/
SELECT sysdate - 10 
FROM dual;

/* Question 7*/
SELECT REPLACE(COUNTRY_NAME, 'a','o') as Country_Nome
FROM countries;

/* Question 8*/
SELECT location_id, state, TO_CHAR(NULL)AS warehouse_name
FROM locations
WHERE state is not NULL
UNION
SELECT location_id, TO_CHAR(NULL), warehouse_name
FROM warehouses



/* Question 9*/
SELECT product_id
FROM order_items
INTERSECT
SELECT product_id
FROM inventories
WHERE quantity > 5

