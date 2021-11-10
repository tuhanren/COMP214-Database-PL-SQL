/* Question 1 */
SELECT  employee_id AS "Emloyee Number", 
        CONCAT(last_name || ',', first_name) AS "Full Name",
        job_title AS "Job Title",
        TO_CHAR(hire_date, 'Month ddth') || ' of ' || TO_CHAR(hire_date, 'yyyy') AS "Start Date"
FROM employees
WHERE TO_CHAR (hire_date, 'mm') = '09'
ORDER by hire_date DESC

/* Question 2*/
SELECT NVL(o.salesman_id, 0) AS "Employee Number", 
        TO_CHAR(SUM(oi.Sale), '$999,999,999.99') AS "Total Sale"
FROM orders o INNER JOIN 
        (SELECT order_id, 
                quantity*unit_price AS Sale
        FROM order_items ) oi
ON o.order_id = oi.order_id
GROUP BY o.salesman_id  
ORDER BY o.salesman_id NULLS FIRST

/* Question 3*/
SELECT cus.customer_id AS ID, 
        cus.Name AS "Name",
        NVL(o.orders,0) AS "# of Orders"
FROM customers cus 
        LEFT JOIN 
        (SELECT customer_id, count(order_id) AS orders
        FROM orders 
        GROUP BY customer_id) o
        ON cus.customer_id = o.customer_id
WHERE cus.customer_id BETWEEN 35 AND 45
ORDER BY cus.customer_id DESC

/* Question 4 */
SELECT cus.customer_id AS ID,
        cus.cusname AS NAME, 
        o.order_id AS "ORDER ID", 
        cus.Datetmp AS "DATE",
       o.total AS SHIPPED, 
       TO_CHAR(o.sales, '$999,999,999.99') AS "TOT SALES"    
FROM 
    (SELECT order_id, sum(quantity) AS total, sum(quantity * unit_price) AS sales
      FROM order_items 
      GROUP BY order_id)o 
INNER JOIN 
    (SELECT  customer_id, 
        order_id,
        Status,
        TO_CHAR(order_date, 'yy-mm-dd') AS Datetmp,
        (SELECT name 
        FROM customers
        WHERE customer_id = 44) AS cusname
     FROM orders
     WHERE customer_id = 44 AND status <> 'Canceled') cus
     ON o.order_id = cus.order_id
ORDER BY o.sales DESC


/* Question 5 */
SELECT  i.warehouse_id, 
        w.warehouse_name,
        p.category_id, 
        pc.category_name,
           min(p.standard_cost)
    FROM inventories i  
         INNER JOIN 
         products p
         ON (i.product_id = p.product_id)
         INNER JOIN warehouses w
         ON (i.warehouse_id = w.warehouse_id)
         INNER JOIN product_categories pc
         ON (p.category_id = pc.category_id)  
    GROUP BY i.warehouse_id, w.warehouse_name, p.category_id, pc.category_name
    HAVING min(p.standard_cost) < 200 OR min(p.standard_cost) > 500
ORDER BY i.warehouse_id, w.warehouse_name, p.category_id, pc.category_name

/* Question 6 */
SELECT TO_CHAR(order_date, 'Month') AS "MONTH", COUNT(order_id) AS "Number OF Orders"
FROM orders
GROUP BY TO_CHAR(order_date, 'Month'), TO_CHAR(order_date, 'MM')
ORDER BY TO_CHAR(order_date, 'MM')

/* Question 7 */
/* Question 7 */
SELECT product_id AS ID , product_name AS "Name", list_price AS "Price"
FROM products
WHERE list_price > ANY (SELECT max(p.standard_cost)
                    FROM warehouses w
                            INNER JOIN locations l
                            ON (w.location_id = l.location_id)
                            INNER JOIN inventories i
                            ON (w.warehouse_id = i.warehouse_id)
                            INNER JOIN products p
                            ON (i.product_id = p.product_id)
                    WHERE l.country_id != 'US'
                    GROUP BY w.warehouse_id )

/* Question 8 */
SELECT product_id, product_name, list_price
FROM products
WHERE list_price = (SELECT MAX(list_price) FROM products)
      OR
      list_price = (SELECT MIN(list_price) FROM products)
      
/* Question 9 */
SELECT Customer_Report AS "Customer Report"
FROM
(SELECT 'Number of customers with total purchase amount above average: ' || ( SELECT COUNT(*) FROM (
    SELECT o.customer_id, sum(oi.quantity * oi.unit_price)
    FROM orders o 
         INNER JOIN order_items oi
         ON (o.order_id = oi.order_id)
    GROUP BY o.customer_id
    HAVING sum(oi.quantity * oi.unit_price) > (SELECT AVG(quantity*unit_price)
                                                FROM order_items )  ) )        AS Customer_Report , 1 as orders                           
    FROM dual
UNION 
SELECT 'Number of customers with total purchase amount below average: ' || ( SELECT COUNT(*) FROM (
    SELECT o.customer_id, sum(oi.quantity * oi.unit_price)
    FROM orders o 
         INNER JOIN order_items oi
         ON (o.order_id = oi.order_id)
    GROUP BY o.customer_id
    HAVING sum(oi.quantity * oi.unit_price) < (SELECT AVG(quantity*unit_price)
                                                FROM order_items )  ) )       , 2 as orders                              
    FROM dual
UNION 
SELECT 'Number of customers with no orders: ' || ( SELECT COUNT(*) FROM 
                                        (SELECT DISTINCT customer_id FROM customers
                                        MINUS
                                        SELECT DISTINCT customer_id FROM orders) ) , 3 as orders
        FROM dual
UNION 
SELECT 'Total number of customers: ' || (SELECT COUNT(*) FROM customers) , 4 as orders
        FROM dual)
GROUP BY Customer_Report
ORDER BY min(orders)



/* Question 10 */
SELECT w.warehouse_name, l.address, l.postal_code, c.country_name
FROM warehouses w
     INNER JOIN locations l
     ON (w.location_id = l.location_id)
     INNER JOIN countries c
     ON (l.country_id = c.country_id)
WHERE UPPER(l.country_id) = UPPER('&TwoDigitsCountryID')
     
   
/* Question 11 */
SELECT COUNT(*) AS "Total No-order Customers"
FROM 
    (SELECT DISTINCT customer_id
    FROM customers
    MINUS
    SELECT DISTINCT customer_id
    FROM orders)
    