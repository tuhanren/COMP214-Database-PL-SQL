/*
GROUP WORK ACKNOWLEDGMENT
We, Zekun Zhang/Xiaojing Li/Hanren Tu, declare that the attached assignment is our own work in accordance with the 
Centennial Academic Policy.  No part of this assignment has been copied manually or electronically from any other 
source (including web sites) or distributed to other students.
	Name	        Task(s)
1-	Zekun Zhang	    Q5-Q6
2-	Hanren Tu  	    Q3-Q4
3-	Xiaojing Li     Q1-Q2
*/

/* Q1
Display productId, Name and list Price of those products that belong to category PRODUCE
and that cost less than $100. Sort by Id ascending. Headings should be called ProdId,
Product Name and UPrice.
*/
/*Approach 1*/
SELECT productid "ProdId", productname "Product Name", unitprice "UPrice"
FROM products
WHERE categoryid = (SELECT categoryid
                   FROM categories
                   WHERE categoryname = 'Produce')
      AND unitprice <100
ORDER BY productid
;
/*Approach 2*/
SELECT a.productid as ProdId, a.productname as Product_Name, a.unitprice as UPrice
    FROM products a
LEFT JOIN categories b
    ON a.categoryid = b.categoryid
        WHERE b.categoryname = 'Produce' AND a.unitprice < 100
ORDER BY a.productid
;
/* Q2
Display product Id, Name and list Price of those products that belong to category
starting on C or V and that cost less than $100. Sort by Id ascending. 
Headings should be called ProdId, Product Name and LPrice.
*/
/*Approach 1*/
SELECT productid "ProdId", productname "Product Name", unitprice "UPrice"
FROM products 
WHERE categoryid IN (SELECT categoryid
                    FROM categories 
                     WHERE categoryname LIKE 'C%' OR categoryname LIKE 'V%')
      AND unitprice <100
ORDER BY productid
;
/*Approach 2*/
SELECT a.productid as ProdId, a.productname as Product_Name, a.unitprice as UPrice
    FROM products a
LEFT JOIN categories b
    ON a.categoryid = b.categoryid
        WHERE b.categoryname LIKE 'C%' 
                OR b.categoryname LIKE 'V%' 
                AND a.unitprice < 100
ORDER BY a.productid
;
/*Q3
Display full name of an employee (like Jones, Larry), job title and hire date, 
if they were hired After the last hired Sales Manager. Sort the output by earlier hire dates.
Headings should be called Full Name, Job and Hire Date.
*/
/*Approach 1*/
SELECT lastname||','|| firstname "Full Name", title "Job", hiredate "Hire Date"
FROM employees_a
WHERE hiredate > (SELECT MAX(hiredate)
                  FROM employees_a
                  WHERE title = 'Sales Manager'
                  GROUP BY title)
ORDER BY hiredate;
/*Approach 2*/
SELECT firstname||','|| lastname AS Full_Name, title as Job, hiredate as Hire_Date
FROM employees_a
WHERE hiredate > (SELECT hiredate 
                    FROM employees_a 
                    WHERE title = 'Sales Manager' 
                    AND hiredate < SYSDATE
                    ORDER BY hiredate DESC
                    FETCH FIRST 1 ROWS ONLY)
ORDER BY hiredate;

/* Q4
Create a view named as min_price_category. In the view Display Lowest list Price for each category. 
Sort the output by the Price descending.
*/
/*Approach 1*/
CREATE VIEW min_price_category
AS SELECT categoryname "Category Name", MIN(unitprice) "Lowest price"
   FROM categories JOIN products USING (categoryid)
   GROUP BY categoryname
   ORDER BY "Lowest price" DESC
WITH READ ONLY
;

SELECT *
FROM min_price_category;

/*Approach 2*/
CREATE VIEW min_price_category_2 AS
    SELECT b.categoryname AS Category_Name, MIN(a.unitprice) AS Lowest_Price 
    FROM products a
    LEFT JOIN categories b
    ON a.categoryid = b.categoryid
    GROUP BY a.categoryid, b.categoryname
    ORDER BY Lowest_Price DESC
WITH READ ONLY
;

SELECT * FROM min_price_category_2;

/* Q5.   
The Following flowchart determines whether a customer is rated high, mid, 
or low based on his or her total purchases. 
The block needs to determine the rating and then display the results on the screen. 
The code rates the customer high if total purchases are greater than $200, 
mid if greater than $100, and low if $100 or lower. */
SET SERVEROUTPUT ON
DECLARE 
    lv_amount NUMBER(9,2):=&amount;
    lv_rating VARCHAR2(4);
BEGIN
    IF lv_amount > 200 THEN
    lv_rating := 'HIGH';
    ELSIF lv_amount > 100 THEN
    lv_rating := 'MID';
    ELSE
    lv_rating := 'LOW';
    END IF;
    DBMS_OUTPUT.PUT_LINE('Customer is rated '|| lv_rating);
END;

/* Q6
Create a block using a CASE statement to perform the actions described in the above flowchart.
Use a scalar variable for the total purchase amount and 
initialize this variable to different values to test your block.
*/
SET SERVEROUTPUT ON
DECLARE 
    lv_amount NUMBER(9,2):=&amount;
    lv_rating VARCHAR2(4);
BEGIN
   CASE 
       WHEN  lv_amount >200 THEN
       lv_rating := 'HIGH';
       WHEN lv_amount > 100 AND lv_amount < 200 THEN
       lv_rating := 'MID';
       ELSE
       lv_rating := 'LOW';  
    END CASE;
    DBMS_OUTPUT.PUT_LINE('Customer is rated '|| lv_rating);
END;
       





