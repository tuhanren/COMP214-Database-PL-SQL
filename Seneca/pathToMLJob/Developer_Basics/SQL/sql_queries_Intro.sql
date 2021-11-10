/* Introductory */


/*
SELECT  DATE()   AS
FROM 
   INNER JOIN
ON
WHERE/HAVING 
GROUP BY
ORDER BY    desc

HAVING  can have aggregate functions such as count() avg() sum()

*We have a table called Shippers. Return all the fields
from all the shippers*/

SELECT * 
FROM shippers;

/*In the Categories table,
We only want to see two columns, CategoryName and Description*/

SELECT CategoryName, Description
FROM Categories;

/*We’d like to see just the FirstName, LastName, and
HireDate of all the employees with the Title of Sales
Representative*/

/*Using single quote*/
SELECT FirstName, LastName, HireDate
FROM Employees
WHERE Title = 'Sales Representative';

/*Using AND OR NOT IN NOT IN */

SELECT FirstName, LastName, HireDate
FROM Employees
WHERE Title = 'Sales Representative' AND Country = 'United States';

/*No single quote*/
SELECT OrderID, OrderDate
FROM Orders
WHERE EmployeeID = /* > < >= <=*/

/*In the Suppliers table, show the SupplierID,
ContactName, and ContactTitle for those Suppliers
whose ContactTitle is not Marketing Manager. */
SELECT SupplierID, ContactName, ContactTitle
FROM Suppliers
WHERE NOT ContactTitle = 'Marketing Manager';

/*Where ContactTitle != 'Marketing Manager'; */
/*Where ContactTitle <> 'Marketing Manager'; */


/*In the products table, we’d like to see the ProductID
and ProductName for those products where the
ProductName includes the string “queso”. */

SELECT ProductID, ProductName
FROM Products
WHERE ProductName LIKE '%queso%';  

/* This is because the default installation of SQL Server
is case insensitive, */

/*Using LIKE with wildcard
The percent sign % allows for the substitution of 0 or more characters in a field.
_ The underscore wildcard is used to match exactly one character.*/


SELECT OrderID, CustomerID, ShipCountry
FROM Orders
WHERE ShipCountry = 'France' OR ShipCountry = 'Belgium';

/*IN NOT IN */

SELECT OrderID, CustomerID, ShipCountry
FROM Orders
WHERE ShipCountry IN ('Brazil', 'Mexico', 'Argentina', 'Venezuela');

/* Order the results by BirthDate, so we have the oldest
employees first. */

SELECT FirstName, LastName, Title, BirthDate
FROM Employees
ORDER BY BirthDate;

/* By default, SQL Server sorts by ascending order
(first to last).  */
/* ORDER BY BirthDate desc */


/* Show only the date portion of the BirthDate field.*/
/*Convert Function,  DATE function 
computed/calculated column, alias*/

SELECT FirstName, LastName, Title, DATE(BirthDate) AS OnlyDateBirth
/*  SELECT FirstName, LastName, Title, OnlyDateBirth = convert(date, BirthDate)*/
FROM Employees
ORDER BY BirthDate;

/*Concat */
SELECT FirstName, LastName, concat(FirstName, ' ', LastName) AS FullName
FROM Employees;



SELECT Quantity*UnitPrice AS TotalPrice, OrderID, ProductID, UnitPrice,
Quantity
FROM OrderDetails
Order By OrderID, ProductID;

/* this time using the arithmetic operator
“*”for multiplication. 
Aggregate Function*/

SELECT count(*) AS TotalCustomers
FROM Customers;

SELECT min(OrderDate) AS FirstOrder
FROM Orders;

/* ---------------------------------------- */
/* Show a list of countries where the Northwind
company has customers. 
GROUP BY */

SELECT Country 
FROM Customers
GROUP BY Country;

SELECT ContactTitle, count(*) AS TotalContactTitle
FROM Customers
GROUP BY ContactTitle
ORDER BY count(*) desc;


SELECT Products.ProductID, Products.ProductName, Suppliers.CompanyName AS Supplier
FROM Products INNER JOIN Suppliers 
ON Products.SupplierID = Suppliers.SupplierID
ORDER BY Products.ProductID;


SELECT P.ProductID, P.ProductName, Suppliers.CompanyName AS Supplier
FROM Products P INNER JOIN Suppliers S
ON P.SupplierID = S.SupplierID
ORDER BY P.ProductID;


SELECT Orders.OrderID, DATE(Orders.OrderDate) AS OrderDate, Shippers.CompanyName AS Shipper
FROM Orders INNER JOIN Shippers
ON Orders.ShipVia = Shippers.ShipperID
WHERE Orders.OrderID < 10300
ORDER BY Orders.OrderID;








