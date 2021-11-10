/*Use the same scripts used in Assignment1

 *The submission should be in the form of an sql script.

 *Use comments for the question numbers and the / to separate code blocks.

 *There should be no syntax errors when running the script.*/

---------------------------------------------------------------------------------------------
/*Question 1 (2 marks)

 *Retrieving Order Totals:

 *Create a PL/SQL block that retrieves and displays information for all products in a given  *order based on the order id.

 *Display the  following on a single row of output:

 *product ID, product name, number of products sold and unit price.


 *Underneath display the following:

 *sub-total

 *taxes=13/100* (sub-total)

 *total payment= (sub-total) + taxes.

 *This should work for any order id.*/
 

----------------------------------------------------------------------------------------------
/*Question 2 (3 marks)*/

/*Adding an Order

 *Create a PL/SQL block to handle adding a new order. Create and use a sequence named ORDERID_SEQ to handle generating and populating the order ID. The first number issued by this sequence should be 11080, and no caching should be used. Use a record variable to handle the data to be added. Data for the new row should be the following: 

 *Customerid: a valid customer id from the customer table

 *employeeid: a valid employee id from the employees table

 *territoryid: a valid territory id from the territories table

 *Orderdate: today's date

 *Any columns not addressed in the data list are currently unknown.*/




/*Question 3 (2 marks)*/

--Retrieving and Displaying Sales Data

--Create a PL/SQL block to retrieve and display data for all sales made in a specified month. One row of output should be displayed for each territory. Include the following in each row of output:

--Territory ID, Territory description and total sales

--Sorted by total sales




/*Question 4 (3 marks)*/

--Retrieving a Specific Employee

--Create a PL/SQL block to retrieve and display information for a all employees. Display the employee ID, manager ID,  date of hire,
--and  if any of the employee territories is in the region "Southern".

