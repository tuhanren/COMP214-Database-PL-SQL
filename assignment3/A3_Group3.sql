-- ***********************
-- Name: Li Xiaojing
-- ID: 301144319
-- Name: Zhang Zekun
-- ID: 301163111
-- Name: Tu Hanren
-- ID: 301061529
-- Date: Nov 9th, 2021
-- Purpose: Assignment 3
-- ***********************
/*
GROUP 3-Assignment3
GROUP WORK ACKNOWLEDGMENT
We, Hanren Tu, Xiaojing Li, Zekun Zhang, declare that the attached assignment 
is our own work in accordance with the Centennial Academic Policy.  
No part of this assignment has been copied manually or electronically from 
any other source (including web sites) or distributed to other students.

Specify below what each member has done towards the completion of this work:
	Name	    Task(s)
1- Hanren Tu	Q1-Q5	
2- Xiaojing Li	Q1-Q5	
3- Zekun Zhang	Q1-Q5
*/
/*////////////////////////////////////////////////////////////////////////////////////*/
/*
-- Question 1 -
Write a store procedure that get an integer number and prints
The number is even.
If a number is divisible by 2.
Otherwise, it prints 
The number is odd.
*/
-- Q1 Solution -
CREATE OR REPLACE PROCEDURE spEvenOdd(input IN NUMBER) AS
BEGIN
    IF MOD(input,2) = 0 THEN
        DBMS_OUTPUT.PUT_LINE ('--------------------------------');
        DBMS_OUTPUT.PUT_LINE ('The number '|| input ||' is even');
        DBMS_OUTPUT.PUT_LINE ('--------------------------------');
    ELSE
        DBMS_OUTPUT.PUT_LINE ('--------------------------------');
        DBMS_OUTPUT.PUT_LINE ('The number '|| input ||' is odd');
        DBMS_OUTPUT.PUT_LINE ('--------------------------------');
    END IF;

EXCEPTION
    WHEN OTHERS
    THEN DBMS_OUTPUT.PUT_LINE ('ERROR!');
END spEvenOdd;
/
SET SERVEROUTPUT ON
BEGIN
    spEvenOdd(6);
    spEvenOdd(23);
    spEvenOdd(0);
    spEvenOdd(1);
END;
/
/*
-- Question 2 -
Create a stored procedure named find_employee. 
This procedure gets an employee number and prints the following employee information:
*/
-- Q2 Solution
CREATE OR REPLACE PROCEDURE spFind_Employee
    (empId IN EMPLOYEES_A.EMPLOYEEID%TYPE,
    fname OUT EMPLOYEES_A.FIRSTNAME%TYPE,
    lname OUT EMPLOYEES_A.LASTNAME%TYPE,
    hdate OUT EMPLOYEES_A.HIREDATE%TYPE,
    jtitle OUT EMPLOYEES_A.TITLE%TYPE) AS
BEGIN
    SELECT FIRSTNAME, LASTNAME, HIREDATE, TITLE
    INTO fname, lname, hdate, jtitle
    FROM EMPLOYEES_A
    WHERE empId = EMPLOYEES_A.EMPLOYEEID;
    DBMS_OUTPUT.PUT_LINE ('First Name: ' || fname);
    DBMS_OUTPUT.PUT_LINE ('Last Name: ' || lname);
    DBMS_OUTPUT.PUT_LINE ('Hire Date: ' || hdate);
    DBMS_OUTPUT.PUT_LINE ('Job Title: ' || jtitle);

EXCEPTION
    WHEN OTHERS
    THEN DBMS_OUTPUT.PUT_LINE ('ERROR!');
END spFind_Employee;
/
SET SERVEROUTPUT ON
DECLARE
t_id EMPLOYEES_A.EMPLOYEEID%TYPE;
t_fname EMPLOYEES_A.FIRSTNAME%TYPE;
t_lname EMPLOYEES_A.LASTNAME%TYPE;
t_hdate EMPLOYEES_A.HIREDATE%TYPE;
t_jtitle EMPLOYEES_A.TITLE%TYPE;
BEGIN
    spFind_Employee(6, t_fname, t_lname, t_hdate, t_jtitle);
END;
/
/*
-- Question 3 - Every year, the company increases the price of all products in one category. 
For example, the company wants to increase the price (Unitprice) of products in category 1 by $5. 
Write a procedure named update_price_by_cat to update the price of all products in a given category 
and the given amount to be added to the current price if the price is greater than 0. 
The procedure shows the number of updated rows if the update is successful.
*/
-- Q3 Solution
CREATE OR REPLACE PROCEDURE update_price_by_cat
    (category_id IN PRODUCTS.CATEGORYID%TYPE,
     amount IN PRODUCTS.UNITPRICE%TYPE) AS

rows_updated NUMBER;
BEGIN
    UPDATE PRODUCTS SET UNITPRICE = UNITPRICE + amount
    WHERE CATEGORYID = category_id;

    rows_updated := sql%rowcount;
    IF rows_updated > 0 THEN
        DBMS_OUTPUT.PUT_LINE(rows_updated || ' items has been affected.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Invalid ID, No items has been affected.');
    END IF;

EXCEPTION 
    WHEN OTHERS
    THEN DBMS_OUTPUT.PUT_LINE('Error!');
END;
/
SET SERVEROUTPUT ON
DECLARE
    t_catid NUMBER;
    t_amount NUMBER;
BEGIN
    update_price_by_cat(2,1.00);
END;
/
ROLLBACK;
/
/*
--Question 4 - 
increase the price of products whose price is less than the average price
price of all products by 1%. (Unitprice * 1.01)
do not have any parameters
displays the number of updated rows
*/

CREATE OR REPLACE PROCEDURE update_price_under_avg AS
avg_price PRODUCTS.UNITPRICE%TYPE;
rows_updated NUMBER;
BEGIN
    SELECT AVG(UNITPRICE) INTO avg_price 
    FROM PRODUCTS;
    IF avg_price <= 1000 THEN
        UPDATE PRODUCTS SET UNITPRICE = UNITPRICE * 1.02
        WHERE UNITPRICE < avg_price;
    ELSE
        UPDATE PRODUCTS SET UNITPRICE = UNITPRICE * 1.01
        WHERE UNITPRICE < avg_price;
    END IF;

    rows_updated := sql%rowcount;
    IF rows_updated > 0 THEN
        DBMS_OUTPUT.PUT_LINE(rows_updated || ' items has been affected.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Invalid ID, No items has been affected.');
    END IF;

EXCEPTION 
    WHEN OTHERS
    THEN DBMS_OUTPUT.PUT_LINE('Error!');
END update_price_under_avg;
/
SET SERVEROUTPUT ON
BEGIN
    update_price_under_avg();
END;
/
ROLLBACK;
/
/*
-- Question 5 - 
The company needs a report that shows three category of products 
based their prices. The company needs to know if the product price 
is cheap, fair, or expensive. 
*/
-- Q5 Solution -
-- Approach 1
CREATE OR REPLACE PROCEDURE product_price_report AS
avg_price PRODUCTS.UNITPRICE%TYPE;
max_price PRODUCTS.UNITPRICE%TYPE;
min_price PRODUCTS.UNITPRICE%TYPE;
cheap_count NUMBER;
fair_count NUMBER;
exp_count NUMBER;

BEGIN
    SELECT AVG(UNITPRICE) INTO avg_price FROM PRODUCTS;
    SELECT MAX(UNITPRICE) INTO max_price FROM PRODUCTS;
    SELECT MIN(UNITPRICE) INTO min_price FROM PRODUCTS;

    SELECT COUNT(UNITPRICE) INTO cheap_count FROM PRODUCTS
    WHERE UNITPRICE < (avg_price - min_price) / 2;
    SELECT COUNT(UNITPRICE) INTO exp_count FROM PRODUCTS
    WHERE UNITPRICE > (max_price - avg_price) / 2;
    SELECT COUNT(UNITPRICE) INTO fair_count FROM PRODUCTS
    WHERE UNITPRICE BETWEEN (avg_price - min_price) / 2
                    AND (max_price - avg_price) / 2;

    DBMS_OUTPUT.PUT_LINE('Cheap: '||cheap_count);
    DBMS_OUTPUT.PUT_LINE('Fair: '||fair_count);
    DBMS_OUTPUT.PUT_LINE('Expensive: '||exp_count);

EXCEPTION 
    WHEN OTHERS
    THEN DBMS_OUTPUT.PUT_LINE('Error!');
END product_price_report;
/
SET SERVEROUTPUT ON
BEGIN
    product_price_report();
END;
/
-- Approach 2 FOR LOOP
CREATE OR REPLACE PROCEDURE product_price_report AS
avg_price PRODUCTS.UNITPRICE%TYPE;
max_price PRODUCTS.UNITPRICE%TYPE;
min_price PRODUCTS.UNITPRICE%TYPE;
cheap_count NUMBER := 0;
fair_count NUMBER := 0;
exp_count NUMBER := 0;

BEGIN
    SELECT AVG(UNITPRICE) INTO avg_price FROM PRODUCTS;
    SELECT MAX(UNITPRICE) INTO max_price FROM PRODUCTS;
    SELECT MIN(UNITPRICE) INTO min_price FROM PRODUCTS;
    
    FOR item IN (SELECT UNITPRICE FROM PRODUCTS) LOOP
        IF item.UNITPRICE < (avg_price - min_price) / 2 THEN
            cheap_count := cheap_count + 1;
        ELSIF item.UNITPRICE > (max_price - avg_price) / 2 THEN
            exp_count := exp_count + 1;
        ELSIF item.UNITPRICE BETWEEN (avg_price - min_price) / 2
                                AND (max_price - avg_price) / 2 THEN
            fair_count := fair_count + 1;
        END IF;
    END LOOP;

    DBMS_OUTPUT.PUT_LINE('Cheap: '||cheap_count);
    DBMS_OUTPUT.PUT_LINE('Fair: '||fair_count);
    DBMS_OUTPUT.PUT_LINE('Expensive: '||exp_count);

EXCEPTION 
    WHEN OTHERS
    THEN DBMS_OUTPUT.PUT_LINE('Error!');
END product_price_report;
/
SET SERVEROUTPUT ON
BEGIN
    product_price_report();
END;
/
