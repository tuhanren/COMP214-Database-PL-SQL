--Assignment 1 Subqueries

--Do assignments in group of 3 max and 2 min.
--Create an sql script to answer the following questions.
--Upload your .sql file to the Assignment 1 folder in ecentennial
--Use the database scripts included in the assignment folder

--Question 1
--List all products whose unit price is less than the average price.
--1 mark
SELECT * 
 FROM products
 WHERE unitprice < (SELECT AVG(unitprice) 
                    FROM products)
;

--Question 2
--List the shipper id, shipping company and freight cost for the order with the lowest freight charge.
--2 marks
SELECT a.shipperid, a.companyname, b.freight 
 FROM shippers a 
    LEFT JOIN orders_a b 
    ON a.shipperid = b.shipvia
 WHERE b.freight = (SELECT MIN(b.freight)
                     FROM orders_a b)
;

SELECT shipperid, companyname, freight
FROM orders_a o, shippers s
WHERE o.freight = (SELECT MIN(freight) FROM orders_a)
AND o.shipvia = s.shipperid
;

--Question 3
--List all products with their highest unit price, i.e. not discounted.
--3 marks
--Question 3 with subquery
SELECT DISTINCT(p.productid), p.productname, a.MaxUnitprice
FROM products p,(SELECT productid,MAX(unitprice) MaxUnitprice
                                   FROM orderdetails
                                   WHERE discount = 0
                                   GROUP BY productid) a
WHERE p.productid=a.productid
ORDER BY p.productid
;

--Question 3 with join
SELECT a.productid, MAX(a.unitprice) AS hight_price, b.productname
 FROM orderdetails a
    LEFT JOIN products b ON a.productid = b.productid
 GROUP BY a.productid, b.productname
 ORDER BY a.productid
;

SELECT productname, temp.m"Highest unit price"
FROM products p, (SELECT productid, MAX(unitprice)m
                    FROM orderdetails
                    GROUP BY productid)temp
                    WHERE p.productid = temp.productid
ORDER BY p.productid
;

--Question 4 (orderdetails + products + categories)
--List the average unit price for each product category and the average unit price without discounts
--4 marks

--Approach_1 Calculate Average Price(discount not applied)
SELECT categoryname, average_price "Average Price", averageprice_nodiscount "Average Price no Discounts"
FROM categories c,
     (SELECT p.categoryid categoryid, ROUND(AVG(o.unitprice*(1-o.discount)),2) average_price
       FROM products p, orderdetails o
       WHERE p.productid = o.productid
       GROUP BY p.categoryid) a,
    (SELECT categoryid,ROUND(AVG(unitprice),2) averageprice_nodiscount
     FROM categories JOIN products USING (categoryid)
     GROUP BY categoryid) b
WHERE c.categoryid = a.categoryid AND c.categoryid=b.categoryid
;

--Approach_2 Select discount = 0
SELECT a.categoryid,c.categoryname,a.avg_price,b.avg_price_no_discount
 FROM 
    (SELECT categoryid,ROUND(AVG(unitprice),2) avg_price 
      FROM products 
      GROUP BY categoryid) a
 LEFT JOIN
    (SELECT categoryid,categoryname 
      FROM categories) c 
 ON a.categoryid = c.categoryid
 LEFT JOIN
    (SELECT d.categoryid,ROUND(AVG(d.unitprice),2) avg_price_no_discount 
      FROM products d, orderdetails e
      WHERE d.productid = e.productid AND e.discount = 0
      GROUP BY d.categoryid) b 
 ON a.categoryid = b.categoryid
 ORDER BY a.categoryid, c.categoryname
;

SELECT A.categoryid, C.categoryname, A.avg_without_discount, B.avg_with_discount
FROM categories C,
    (SELECT P.categoryid, ROUND(AVG(o.unitprice),2) avg_without_discount
     FROM products P, orderdetails O
     WHERE P.productid=O.productid
     GROUP BY P.categoryid) A,
     
     (SELECT P.categoryid, ROUND(AVG(o.unitprice*(1-O.discount)),2) avg_with_discount
      FROM products P, orderdetails O
      WHERE P.productid=O.productid
      GROUP BY P.categoryid) B
      
WHERE A.categoryid = c.categoryid AND a.categoryid = b.categoryid
ORDER BY a.categoryid, C.categoryname
;
--drop all tables - copy paste and excute
select 'drop table ', table_name, 'cascade constraints;' from user_tables;

