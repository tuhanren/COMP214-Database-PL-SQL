/*
GROUP 3-Assignment2
GROUP WORK ACKNOWLEDGMENT
We, Hanren Tu, Xiaojing Li, Zekun Zhang, declare that the attached assignment 
is our own work in accordance with the Centennial Academic Policy.  
No part of this assignment has been copied manually or electronically from 
any other source (including web sites) or distributed to other students.

Specify below what each member has done towards the completion of this work:
	Name	    Task(s)
1- Hanren Tu	Q1-Q6	
2- Xiaojing Li	Q1-Q6	
3- Zekun Zhang	Q1-Q6
*/

/*////////////////////////////////////////////////////////////////////////////////////*/
/* Q1 
Display productId, Name and list Price of those products that belong to category PRODUCE
and that cost less than $100. Sort by Id ascending. Headings should be called ProdId,
Product Name and UPrice.
*/

/*Solution*/
--Approach 1
SELECT productid "ProdId", productname "Product Name", unitprice "UPrice"
FROM   products
WHERE  categoryid = (SELECT categoryid
                     FROM categories
                     WHERE categoryname = 'Produce')
AND    unitprice <100
ORDER BY productid
;
--Approach 2
SELECT a.productid as ProdId, a.productname as Product_Name, a.unitprice as UPrice
    FROM products a
LEFT JOIN categories b
    ON a.categoryid = b.categoryid
        WHERE b.categoryname = 'Produce' AND a.unitprice < 100
ORDER BY a.productid
;
/* Output:
ProdId	Product Name	                UPrice
7	    Uncle Bob's Organic Dried Pears	30
14	    Tofu	                        23.25
28	    R�ssle Sauerkraut	            45.6
51	    Manjimup Dried Apples	        53
74	    Longlife Tofu	                10
*/


/*////////////////////////////////////////////////////////////////////////////////////*/
/* Q2
Display product Id, Name and list Price of those products that belong to category
starting on C or V and that cost less than $100. Sort by Id ascending. 
Headings should be called ProdId, Product Name and LPrice.
*/

/*Solution*/
--Approach 1
SELECT productid "ProdId", productname "Product Name", unitprice "LPrice"
FROM products 
WHERE categoryid IN (SELECT categoryid
                    FROM categories 
                     WHERE categoryname LIKE 'C%' OR categoryname LIKE 'V%')
      AND unitprice <100
ORDER BY productid
;
--Approach 2
SELECT a.productid as ProdId, a.productname as Product_Name, a.unitprice as LPrice
    FROM products a
LEFT JOIN categories b
    ON a.categoryid = b.categoryid
        WHERE b.categoryname LIKE 'C%' 
                OR b.categoryname LIKE 'V%' 
                AND a.unitprice < 100
ORDER BY a.productid
;
/* Output
ProdId	Product Name	                LPrice
3	    Aniseed Syrup	                10
4	    Chef Anton's Cajun Seasoning	22
5	    Chef Anton's Gumbo Mix	        21.35
6	    Grandma's Boysenberry Spread	25
8	    Northwoods Cranberry Sauce	    40
15	    Genen Shouyu	                15.5
16	    Pavlova	                        17.45
19	    Teatime Chocolate Biscuits	    9.2
20	    Sir Rodney's Marmalade	        81
21	    Sir Rodney's Scones	            10
25	    NuNuCa Nu�-Nougat-Creme	        14
26	    Gumb�r Gummib�rchen	            31.23
27	    Schoggi Schokolade	            43.9
44	    Gula Malacca	                19.45
47	    Zaanse koeken	                9.5
48	    Chocolade	                    12.75
49	    Maxilaku	                    20
50	    Valkoinen suklaa	            16.25
61	    Sirop d'�rable	                28.5
62	    Tarte au sucre	                49.3
63	    Vegie-spread	                43.9
65	    Louisiana Fiery Hot Pepper Sauce21.05
66	    Louisiana Hot Spiced Okra	    17
68	    Scottish Longbreads	            12.5
77	    Original Frankfurter gr�ne So�e	13
*/


/*////////////////////////////////////////////////////////////////////////////////////*/
/*Q3
Display full name of an employee (like Jones, Larry), job title and hire date, 
if they were hired After the last hired Sales Manager. Sort the output by earlier hire dates.
Headings should be called Full Name, Job and Hire Date.
*/

/*Solution*/
--Approach 1
SELECT lastname||','|| firstname "Full Name", title "Job", hiredate "Hire Date"
FROM employees_a
WHERE hiredate > (SELECT MAX(hiredate)
                  FROM employees_a
                  WHERE title = 'Sales Manager'
                  GROUP BY title)
ORDER BY hiredate
;
--Approach 2
SELECT firstname||','|| lastname AS Full_Name, title as Job, hiredate as Hire_Date
FROM employees_a
WHERE hiredate > (SELECT hiredate 
                    FROM employees_a 
                    WHERE title = 'Sales Manager' 
                    AND hiredate < SYSDATE
                    ORDER BY hiredate DESC
                    FETCH FIRST 1 ROWS ONLY)
ORDER BY hiredate
;
/* Output
Full Name	    Job	Hire                    Date
King,Robert	    Sales Representative	    02-JAN-94
Callahan,Laura	Inside Sales Coordinator	05-MAR-94
Dodsworth,Anne	Sales Representative	    15-NOV-94
*/


/*////////////////////////////////////////////////////////////////////////////////////*/
/* Q4
Create a view named as min_price_category. In the view Display Lowest list Price for each category. 
Sort the output by the Price descending.
*/

/*Solution*/
--reset view before running
DROP VIEW min_price_category;
--Approach 1
CREATE VIEW min_price_category
AS SELECT categoryname "Category Name", MIN(unitprice) "Lowest price"
   FROM categories JOIN products USING (categoryid)
   GROUP BY categoryname
   ORDER BY "Lowest price" DESC
WITH READ ONLY
;

SELECT * FROM min_price_category;

--reset view before running
DROP VIEW min_price_category;
--Approach 2
CREATE VIEW min_price_category AS
    SELECT b.categoryname AS Category_Name, MIN(a.unitprice) AS Lowest_Price 
    FROM products a
    LEFT JOIN categories b
    ON a.categoryid = b.categoryid
    GROUP BY a.categoryid, b.categoryname
    ORDER BY Lowest_Price DESC
WITH READ ONLY
;

SELECT * FROM min_price_category;

/*Output
Category Name	Lowest price
Condiments	    10
Produce	        10
Confections	    9.2
Meat/Poultry	7.45
Grains/Cereals	7
Seafood	        6
Beverages	    4.5
Dairy Products	2.5
*/


/*////////////////////////////////////////////////////////////////////////////////////*/
/* Q5.   
The Following flowchart determines whether a customer is rated high, mid, 
or low based on his or her total purchases. 
The block needs to determine the rating and then display the results on the screen. 
The code rates the customer high if total purchases are greater than $200, 
mid if greater than $100, and low if $100 or lower. */

/*Solution*/
SET SERVEROUTPUT ON
DECLARE 
    lv_amount NUMBER(9,2):= &amount;
    lv_rating VARCHAR2(4);
BEGIN
    IF lv_amount > 200 THEN
    lv_rating := 'HIGH';
    ELSIF lv_amount > 100 AND lv_amount <= 200 THEN
    lv_rating := 'MID';
    ELSE
    lv_rating := 'LOW';
    END IF;
    DBMS_OUTPUT.PUT_LINE('************ RESULT ***********');
    DBMS_OUTPUT.PUT_LINE('Customer is rated: '|| lv_rating);
    DBMS_OUTPUT.PUT_LINE('*******************************');
END;

/*Output
testing when entered value is 150, 
the output is below:
************ RESULT ***********
Customer is rated: MID
*******************************
*/


/*////////////////////////////////////////////////////////////////////////////////////*/
/* Q6
Create a block using a CASE statement to perform the actions described in the above flowchart.
Use a scalar variable for the total purchase amount and 
initialize this variable to different values to test your block.
*/
/*Solution*/
SET SERVEROUTPUT ON
DECLARE 
    lv_amount NUMBER(9,2):= &amount;
    lv_rating VARCHAR2(4);
BEGIN
   CASE 
       WHEN  lv_amount > 200 THEN
       lv_rating := 'HIGH';
       WHEN lv_amount > 100 AND lv_amount <= 200 THEN
       lv_rating := 'MID';
       ELSE
       lv_rating := 'LOW';  
    END CASE;
    DBMS_OUTPUT.PUT_LINE('************ RESULT ***********');
    DBMS_OUTPUT.PUT_LINE('Customer is rated:'|| lv_rating);
    DBMS_OUTPUT.PUT_LINE('*******************************');
END;

/*Output
testing when entered value is 300, 
the output is below:
************ RESULT ***********
Customer is rated: HIGH
*******************************
*/

       





