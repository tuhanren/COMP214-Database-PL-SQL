--test update_inventory_quantity
update
	orderitem
set
	quantity = 1
where
	productid = 104;
--test update_product_status
update
	inventory
set
	quantity = 50
where
	productid = 100;
--test valid_code
declare
available boolean;
begin
	valid_code('strategy', 'AclnsKi6C0', available);
	dbms_output.put_line(case available when true then 'true' else 'false' end);
end;
/
--test after_discount
declare
result number;
begin
	after_discount(100, 20, result);
	dbms_output.put_line(result);
end;
/
--test order_payment
begin
	dbms_output.put_line(order_payment(105, 'strategy', 'AclnsKi6C0'));
end;