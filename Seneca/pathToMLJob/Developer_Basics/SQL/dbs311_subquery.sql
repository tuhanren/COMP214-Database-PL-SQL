/* Learn Subquery */
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD';

SELECT SYSDATE FROM dual;

SELECT DUMP(hire_date) FROM employees;

SELECT * FROM employees;
SELECT * FROM customers;
SELECT * FROM contacts;


/* Question 1 */

SELECT last_name, hire_date FROM employees 
WHERE hire_date < (SELECT hire_date FROM employees where employee_id = 107)
ORDER BY hire_date

/* Question 2 */
SELECT customer_name, credit_limit
FROM (SELECT first_name||' '||last_name as customer_name, credit_limit
      FROM contacts  INNER JOIN customers ON contacts.customer_ID = customers.customer_ID)
WHERE credit_limit = (SELECT MIN(credit_limit) FROM customers)
ORDER BY customer_name

/* */
SELECT * FROM  product_categories;

/* Question 3 */
SELECT category_id, product_id, product_name, list_price 
FROM products
WHERE (category_id, list_price) IN  (SELECT category_id, MAX(list_price) 
                                     FROM products 
                                     GROUP BY category_id)
ORDER BY category_id;

/* Question 4*/
SELECT c.category_name, c.category_id, p.product_id, p.product_name, p.list_price 
FROM products p INNER JOIN product_categories c ON p.category_id = c.category_id
WHERE list_price =   (SELECT MAX(list_price) 
                            FROM products )

/* Question 5 */
SELECT category_id, product_id, product_name, list_price 
FROM products
WHERE list_price < ANY (SELECT MIN(list_price) 
                         FROM products 
                         GROUP BY category_id)
     AND category_id = 1
ORDER BY list_price, product_name;

/* Question 6 */
SELECT category_id, product_id, product_name, list_price
FROM products
WHERE list_price = (SELECT MIN(list_price) FROM products)

/* Question 7 */
SELECT TO_CHAR(SYSDATE + 1, 'Month ddth') || ' of year ' || TO_CHAR(SYSDATE + 1, 'YYYY')   as "Next Day"
FROM dual

/* Question 8 */

SELECT city, country_id, NVL(state, 'State Unkown')
FROM locations
WHERE city LIKE 's%' AND length(city) >= 8