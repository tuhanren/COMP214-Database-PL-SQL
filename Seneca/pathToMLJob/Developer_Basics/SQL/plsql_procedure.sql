-- ***********************
-- Name: Qiwen Yu
-- ID: 120505177
-- Date: 2020-07-17
-- Purpose: Lab 5 DBS311
-- ***********************

/* Important to execute precedure and function */
SET SERVEROUTPUT ON ;

-- Question 1 – Write a store procedure that get an integer number and prints
--The number is even.
--If a number is divisible by 2.
--Otherwise, it prints 
--The number is odd. 
/* A procedure take an integer as input, test whether it is an even or odd number */

-- Q1 SOLUTION –
CREATE OR REPLACE PROCEDURE test_even (test_int IN NUMBER) AS 
BEGIN 
    CASE
    WHEN MOD(TEST_INT, 2 ) = 0 THEN 
        DBMS_OUTPUT.PUT_LINE('The number is even.');
    WHEN (MOD(TEST_INT, 2 ) = 1 or MOD(TEST_INT, 2 ) = -1) THEN
        DBMS_OUTPUT.PUT_LINE('The number is odd.');
    END CASE;
    
    EXCEPTION 
    WHEN OTHERS
        THEN DBMS_OUTPUT.PUT_LINE('ERROR! PLEASE MAKE SURE AN INTEGER IS PROVIDED.');
END test_even;

/

/* RUN the procedure and test with different type of data */
DECLARE 
    test_int NUMBER := -3;
    num2 NUMBER := 4;
    num3 NUMBER := 4.4;
    num4 NUMBER := -3.4;
BEGIN 
    test_even(test_int);
    test_even(num2);
    test_even(num3);
    test_even(num4);
END;
/
-- Or code can be executed with 
-- EXEC test_even(-3) ;

-- Question 2 – 
-- Create a procedure, get employee information according to employee number.
-- Q2 Solution –
CREATE OR REPLACE PROCEDURE find_employee (emp_id IN NUMBER) AS 
fname employees.first_name%type;
lname employees.last_name%type;
emailaddr employees.email%type;
phonenum employees.phone%type;
hiredate employees.hire_date%type;
jobtitle employees.job_title%type;

BEGIN
    SELECT first_name, last_name, email, phone, hire_date, job_title
    INTO fname, lname, emailaddr, phonenum, hiredate, jobtitle
    FROM employees
    WHERE employee_id = emp_id;
    DBMS_OUTPUT.PUT_LINE ('First Name: ' || fname);
    DBMS_OUTPUT.PUT_LINE ('Last Name: ' || lname);
    DBMS_OUTPUT.PUT_LINE ('Email: ' || emailaddr);
    DBMS_OUTPUT.PUT_LINE ('Phone: ' || phonenum);
    DBMS_OUTPUT.PUT_LINE ('Hire date: ' || hiredate);
    DBMS_OUTPUT.PUT_LINE ('Job title: ' || jobtitle);
    
    EXCEPTION 
    WHEN TOO_MANY_ROWS
    THEN 
      DBMS_OUTPUT.PUT_LINE ('More than one results, too many!');
    WHEN NO_DATA_FOUND
    THEN 
      DBMS_OUTPUT.PUT_LINE ('No record found!');
END find_employee;
/

/* Run and test with employee id 107*/
DECLARE 
   emp_idtest NUMBER := 107;
BEGIN
    find_employee (emp_idtest);
END;
/

-- Question 3 – 
-- A procedure to update price (list_price) per category, return the number of rows updated
-- Q3 Solution –
CREATE OR REPLACE PROCEDURE update_price_by_cat (cat_id IN products.category_id%type, 
                                                 add_amount IN products.list_price%type ) AS 
rows_updated NUMBER;
BEGIN
    UPDATE products SET list_price = list_price + add_amount
    WHERE category_id = cat_id AND list_price > 0;
    /* Using update and sql%rowcount to count rows*/
    rows_updated := sql%rowcount;
    IF rows_updated = 0 THEN
    DBMS_OUTPUT.PUT_LINE('Category does not exist. No products have been updated!') ;
    ELSE
    DBMS_OUTPUT.PUT_LINE ('Price of ' || rows_updated || ' products have been updated!');
    END IF;
    
    EXCEPTION 
    WHEN OTHERS
    THEN DBMS_OUTPUT.PUT_LINE('Error!');
END update_price_by_cat;
/
-- run 
DECLARE 
   cat_idtest products.category_id%type := 5;
   cat_idtest2 products.category_id%type := 20;
   amount products.list_price%type := 5.0;
BEGIN
    update_price_by_cat (cat_idtest, amount);
    update_price_by_cat (cat_idtest2, amount);
END;
/


-- Question 4 – 
-- increase the price of products 
-- whose price is less than the average price (aggregation, subquery)
-- of all products by 1%. (list_price * 1.01)
-- do not use any parameter 
-- return number of rows updated
-- Q4 Solution –

CREATE OR REPLACE PROCEDURE update_price_under_avg AS
average_price products.list_price%type;
rows_updated NUMBER;
BEGIN 
    SELECT AVG(list_price)
    INTO average_price
    FROM products;
    IF average_price <= 1000 THEN
        UPDATE products SET list_price = list_price * 1.02
        WHERE list_price < average_price;
    ELSE 
        UPDATE products SET list_price = list_price * 1.01
        WHERE list_price < average_price;
    END IF;
    rows_updated := sql%rowcount;
        DBMS_OUTPUT.PUT_LINE(rows_updated|| ' products have been updated.');
    EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('ERRORS!');
END update_price_under_avg;
/
BEGIN
    update_price_under_avg();
END;

/
-- Question 5-
-- Find the number of products in each price category, cheap, fair, expensive
-- Q5 Solution
CREATE OR REPLACE PROCEDURE product_price_report AS
avg_price products.list_price%type;
min_price products.list_price%type;
max_price products.list_price%type;
cheap_count NUMBER;
fair_count NUMBER;
exp_count NUMBER;
BEGIN 
    -- Find average, min, max list_price
    SELECT AVG(list_price)
    INTO avg_price
    FROM products;
    SELECT MIN(list_price)
    INTO min_price
    FROM products;
    SELECT MAX(list_price)
    INTO max_price
    FROM products;
    -- Count based on the price range
    SELECT COUNT(*)
    INTO cheap_count
    FROM products
    WHERE list_price < (avg_price - min_price) / 2;

    SELECT COUNT(*)
    INTO exp_count
    FROM products
    WHERE list_price > (max_price - avg_price) / 2;

    SELECT COUNT(*)
    INTO fair_count
    FROM products
    WHERE list_price BETWEEN (avg_price - min_price) / 2 AND
                    (max_price - avg_price) / 2;

    DBMS_OUTPUT.PUT_LINE('Cheap: '||cheap_count);
    DBMS_OUTPUT.PUT_LINE('Fair: '||fair_count);
    DBMS_OUTPUT.PUT_LINE('Expensive: '||exp_count);

    EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('ERRORS!');
END product_price_report;
/
BEGIN
    product_price_report();
END;