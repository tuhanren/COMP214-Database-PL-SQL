CREATE OR REPLACE PROCEDURE TAX_PRO 
    (subtotal IN NUMBER, 
     shopper_state IN VARCHAR2) AS
tax_amount number;
bbstate bb_tax.state%type;
bbtaxrate NUMBER;
BEGIN
    SELECT STATE, TAXRATE 
    INTO bbstate, bbtaxrate
    FROM BB_TAX;
    
    IF shopper_state NOT IN (bbstate) THEN tax_amount := 0;
    ELSE tax_amount := subtotal * bbtaxrate;
    END IF;
    
    DBMS_OUTPUT.PUT_LINE(tax_amount);
END;
/

SET SERVEROUTPUT ON
BEGIN
    TAX_PRO(100, 'VA');
END;