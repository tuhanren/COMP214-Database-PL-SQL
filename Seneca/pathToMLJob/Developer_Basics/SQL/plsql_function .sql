-- ***********************
-- Name: Qiwen Yu
-- ID: 120505177
-- Date: July 17 2020
-- Purpose: Lab 6 DBS311
-- ***********************

/* Important to execute precedure and function */
SET SERVEROUTPUT ON ;

-- Question 1 – 
-- Calculate salary, annually increased, depending on years of hired and base salary 10,000
-- take employee ID as argument 
-- Q1 SOLUTION –

CREATE OR REPLACE PROCEDURE calculate_salary (emp_id IN employees.employee_id%type) AS
fname employees.first_name%type;
lname employees.last_name%type;
year_hired NUMBER;
salary NUMBER;
BEGIN
    salary := 10000;
    SELECT ROUND((sysdate - hire_date)/365, 1), first_name, last_name
    INTO year_hired, fname, lname
    FROM employees WHERE employee_id = emp_id;

    LOOP 
        year_hired := year_hired - 1;
        salary := salary*1.05;
        IF year_hired < 1 THEN 
            EXIT;
        END IF;
    END LOOP;

    DBMS_OUTPUT.PUT_LINE('First Name: '||fname);
    DBMS_OUTPUT.PUT_LINE('Last Name: '||lname);
    DBMS_OUTPUT.PUT_LINE('Salary: '|| '$'||salary);

    EXCEPTION 
        WHEN NO_DATA_FOUND
        THEN 
        DBMS_OUTPUT.PUT_LINE ('No record found!');
        WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error!');
END calculate_salary;
/

DECLARE 
   emp_idtest NUMBER := 107;
BEGIN
    calculate_salary(emp_idtest);
END;
/

-- Question 2 – 
-- Show warehouse ID, name, city and state per warehouse.
-- Do not need argument.
-- Q2 SOLUTION –
CREATE OR REPLACE PROCEDURE warehouses_report AS
ware_id warehouses.warehouse_id%type;
ware_name warehouses.warehouse_name%type;
city_name locations.city%type;
state_name locations.state%type;

BEGIN
    FOR i in 1..9 LOOP
        SELECT w.warehouse_id, w.warehouse_name, l.city, NVL(l.state, 'No State')
        INTO ware_id, ware_name, city_name, state_name
        FROM warehouses w JOIN locations l on w.location_id = l.location_id
        WHERE w.warehouse_id = i;
        DBMS_OUTPUT.PUT_LINE ('Warehouse ID: ' || ware_id);
        DBMS_OUTPUT.PUT_LINE ('Warehouse name: ' || ware_name);
        DBMS_OUTPUT.PUT_LINE ('City: ' || city_name);
        DBMS_OUTPUT.PUT_LINE ('State: ' || state_name);
        DBMS_OUTPUT.PUT_LINE ('-------------------------------');
    END LOOP;
    
    EXCEPTION
    WHEN OTHERS
    THEN DBMS_OUTPUT.PUT_LINE('Errors!');
END;

/

BEGIN
    warehouses_report();
END;


-- Question 3
-- Change output as one line per warehouse
-- Q3 Solution --

CREATE OR REPLACE PROCEDURE warehouses_report AS
ware_id warehouses.warehouse_id%type;
ware_name warehouses.warehouse_name%type;
city_name locations.city%type;
state_name locations.state%type;

BEGIN
    FOR i in 1..9 LOOP
        SELECT w.warehouse_id, w.warehouse_name, l.city, NVL(l.state, 'No State')
        INTO ware_id, ware_name, city_name, state_name
        FROM warehouses w JOIN locations l on w.location_id = l.location_id
        WHERE w.warehouse_id = i;
        DBMS_OUTPUT.PUT_LINE (' Warehouse ID: ' || ware_id ||
                             ' Warehouse name: ' || ware_name ||
                             ' City: ' || city_name ||
                             ' State: ' || state_name);
        DBMS_OUTPUT.PUT_LINE ('-------------------------------');
    END LOOP;
    
    EXCEPTION
    WHEN OTHERS
    THEN DBMS_OUTPUT.PUT_LINE('Errors!');
END;

/

BEGIN
    warehouses_report();
END;



